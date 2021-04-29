//  ____  _   _ 
// |  _ \| \ | | Pradyun Narkadamilli
// | |_) |  \| | https://pradyungn.tech
// |  __/| |\  | MIT License
// |_|   |_| \_| Copyright 2021 Pradyun Narkadamilli

// This thing basically does all the work in terms of extracting/formatting the data from
// Spotify/MPD
use mpris::PlayerFinder;
use reqwest::blocking::get;
use std::env;
use std::fs::{copy, File};
use std::io::Write;
use std::path::Path;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() == 1 {
        print_metadata(None);
    } else if args.len() == 2 {
        print_metadata(Some(&args[1]));
    } else if args.len() == 3 {
        let data = print_metadata(Some(&args[1]));
        match data {
            Some(x) => notify(x),
            None => abortify(),
        }
    }
}

fn print_metadata(name: Option<&str>) -> Option<[String; 3]> {
    let player_finder = PlayerFinder::new().unwrap();

    let name = match name {
        Some(x) => x,
        None => "",
    };

    for player in player_finder.find_all().unwrap() {
        if player.identity() == name {
            let mut title: String;
            let mut singstr: String;
            let displaydur: String;

            let metadata = player.get_metadata().unwrap();

            if name == "Spotify" {
                title = metadata.title().unwrap().to_string();

                if title.chars().count() > 25 as usize {
                    let mut newtitle = String::new();
                    for (i, chara) in title.chars().into_iter().enumerate() {
                        if i > 22 {
                            break;
                        }
                        newtitle.push(chara);
                    }
                    newtitle.push_str("...");
                    title = newtitle;
                }

                println!("{}", title);

                singstr = String::new();
                for singer in metadata.artists().unwrap() {
                    &mut singstr.push_str(singer);
                    &mut singstr.push_str(",");
                }
                singstr.pop();

                if singstr.chars().count() > 35 as usize {
                    let mut newsingers = String::new();
                    for (i, chara) in singstr.chars().into_iter().enumerate() {
                        if i > 32 {
                            break;
                        }
                        newsingers.push(chara);
                    }
                    newsingers.push_str("...");
                    singstr = newsingers;
                }

                let mut file =
                    File::create("/home/pradyungn/.config/eww/artist.txt").expect("create failed");
                file.write(singstr.as_bytes()).expect("write failed");
            } else {
                singstr = std::fs::read_to_string("/home/pradyungn/.config/eww/data/mpartist")
                    .expect("Oopsies!!!");

                title = std::fs::read_to_string("/home/pradyungn/.config/eww/data/mptitle")
                    .expect("Oopsies!!!");

                if singstr.chars().count() > 35 as usize {
                    let mut newsingers = String::new();
                    for (i, chara) in singstr.chars().into_iter().enumerate() {
                        if i > 32 {
                            break;
                        }
                        newsingers.push(chara);
                    }
                    newsingers.push_str("...");
                    singstr = newsingers;
                }

                let mut file =
                    File::create("/home/pradyungn/.config/eww/artist.txt").expect("create failed");
                file.write(singstr.as_bytes()).expect("write failed");

                if title.chars().count() > 25 as usize {
                    let mut newtitle = String::new();
                    for (i, chara) in title.chars().into_iter().enumerate() {
                        if i > 22 {
                            break;
                        }
                        newtitle.push(chara);
                    }
                    newtitle.push_str("...");
                    title = newtitle;
                }
                println!("{}", title);
            }

            let duration = metadata.length().unwrap().as_secs();

            let mut file =
                File::create("/home/pradyungn/.config/eww/data/duration").expect("create failed");
            file.write(format!("{}", duration).as_bytes())
                .expect("write failed");

            let position = player.get_position().unwrap().as_secs();
            file =
                File::create("/home/pradyungn/.config/eww/data/position").expect("create failed");
            file.write(format!("{}", &position).as_bytes())
                .expect("write failed");

            file = File::create("/home/pradyungn/.config/eww/data/displayduration")
                .expect("create failed");
            let seconds = duration % 60;
            if seconds < 10 {
                displaydur = format!("{}:0{}", duration / 60, seconds);
            } else {
                displaydur = format!("{}:{}", duration / 60, seconds);
            }
            file.write(format!("{}", displaydur).as_bytes())
                .expect("write failed");

            file =
                File::create("/home/pradyungn/.config/eww/data/displaypos").expect("create failed");
            let seconds = &position % 60;
            let displsec: String;
            if seconds < 10 {
                displsec = format!("0{}", seconds);
            } else {
                displsec = format!("{}", seconds)
            }
            file.write(format!("{}:{}", &position / 60, displsec).as_bytes())
                .expect("write failed");

            let status = format!("{:#?}", player.get_playback_status().unwrap());
            file = File::create("/home/pradyungn/.config/eww/data/status").expect("create failed");
            file.write(status.as_bytes()).expect("write failed");

            if name == "Music Player Daemon" {
                let url = match metadata.art_url() {
                    Some(x) => &x[7..],
                    None => "/home/pradyungn/Pictures/forest.jpg",
                };

                let _ = copy(
                    Path::new(url),
                    Path::new("/home/pradyungn/.config/eww/temp.jpg"),
                );
            } else {
                let url = metadata.art_url().unwrap();
                let mut finurl = String::from("https://i.scdn.co/");
                finurl.push_str(&url[25..]);

                let res = get(&finurl).unwrap().bytes().unwrap();
                let mut file =
                    File::create("/home/pradyungn/.config/eww/temp.jpg").expect("create failed");
                file.write(&res).expect("write failed");
            }

            return Some([title, singstr, displaydur]);
        }
    }
    let mut file = File::create("/home/pradyungn/.config/eww/artist.txt").expect("create failed");
    file.write(b"").expect("write failed");

    file = File::create("/home/pradyungn/.config/eww/title.txt").expect("create failed");
    file.write(b"Nothing playing right now...")
        .expect("write failed");

    file = File::create("/home/pradyungn/.config/eww/data/duration").expect("create failed");
    file.write(b"").expect("write failed");

    file = File::create("/home/pradyungn/.config/eww/data/position").expect("create failed");
    file.write(b"").expect("write failed");

    file = File::create("/home/pradyungn/.config/eww/data/displayduration").expect("create failed");
    file.write(b"").expect("write failed");

    file = File::create("/home/pradyungn/.config/eww/data/displaypos").expect("create failed");
    file.write(b"").expect("write failed");
    return None;
}

fn notify(data: [String; 3]) {
    let _ = Command::new("notify-send")
        .arg("-i")
        .arg("/home/pradyungn/.config/eww/temp.jpg")
        .arg("Now Playing ♫")
        .arg(format!("{}\n{} // {}", data[0], data[1], data[2]))
        .spawn();
}

fn abortify() {
    let _ = Command::new("notify-send")
        .arg("Issues Fetching Data Ya Boomer")
        .spawn();
}
