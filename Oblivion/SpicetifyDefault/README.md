# dracula-for-spotify
A simple Dracula-*inspired* [spicetify-cli](https://github.com/khanhas/spicetify-cli)/[spicetify](https://github.com/khanhas/spicetify) skin. Made for my own use.

![Browse](https://i.imgur.com/MAjsCVm.png)
![Album](https://i.imgur.com/z7thIss.png)
![Playlist](https://i.imgur.com/OXm7N6y.png)

## Instructions (for spicetify-cli, I haven't used spicetify)
1. Install [spicetify-cli](https://github.com/khanhas/spicetify-cli) and run setup instructions.
2. Clone this repository and copy the files to the corresponding directories (creating them if they don't already exist):

Windows: `%userprofile%\.spicetify\Themes\SpicetifyDefault`

Linux: `~/.spicetify/Themes/SpicetifyDefault`

MacOS: `~/spicetify_data/Themes/SpicetifyDefault`

3. Run `spicetify apply`. The changes should be applied in your Spotify client.

## Note for Windows and Linux users
The font "Helvetica Neue" is used by default, which isn't available on typical Windows and Linux machines. To fix this, replace "Helvetica Neue" with the font of your choice in the `user.css` file. After making any changes, run `spicetify apply`.
