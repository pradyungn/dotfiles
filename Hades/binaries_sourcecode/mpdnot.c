//  ____  _   _ 
// |  _ \| \ | | Pradyun Narkadamilli
// | |_) |  \| | https://pradyun.tech
// |  __/| |\  | MIT License
// |_|   |_| \_| Copyright 2021 Pradyun Narkadamilli

// This thing basically writes the current MPD artist(s) and song title to a file for EWW to read
// It also sends a notification to signify what song's playing
// Compile with libmpd

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <libmpd.h>
#include <debug_printf.h>
#define RED "\x1b[31;01m"
#define DARKRED "\x1b[31;06m"
#define RESET "\x1b[0m"
#define GREEN "\x1b[32;06m"
#define YELLOW "\x1b[33;06m"

void status_changed(MpdObj *mi, ChangedStatusType what)
{
        if(what&MPD_CST_SONGID)
        {
                mpd_Song *song = mpd_playlist_get_current_song(mi);
                if(song)
                {
                        printf(GREEN"Song:"RESET" %s - %s\n", song->artist, song->title);

                        FILE *fp;
                        fp = fopen("/home/pradyungn/.config/eww/data/mptitle", "w");
                        fprintf(fp, "%s", song->title);
                        fclose(fp);
                        
                        fp = fopen("/home/pradyungn/.config/eww/data/mpartist", "w");
                        fprintf(fp, "%s", song->artist);
                        fclose(fp);

                        system("/home/pradyungn/.config/eww/scripts/mpris_data 'Music Player Daemon' notify");
                }
        }

}

int main()
{

        int run = 1, iport = 6600;
        char *hostname = getenv("MPD_HOST");
        char *port = getenv("MPD_PORT");
        char *password = getenv("MPD_PASSWORD");
        MpdObj *obj = NULL;


        if(!hostname) {
                hostname = "localhost";
        }
        if(port){
                iport = atoi(port);
        }

        obj = mpd_new(hostname, iport,password);

        mpd_signal_connect_status_changed(obj,(StatusChangedCallback)status_changed, NULL);
        mpd_set_connection_timeout(obj, 10);

        if(!mpd_connect(obj))
        {
                mpd_send_password(obj);
                do{
                       

                        mpd_status_update(obj);
                }while(!usleep(100000) &&  run);
        }
        return 1;
}
