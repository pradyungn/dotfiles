use std::io::Write;

mod constructor;
mod playlist;
mod songs;
mod options;

fn main() {
    let mut rofi = constructor::main().spawn().unwrap();

    rofi.stdin.as_mut()
               .ok_or("Child process stdin has not been captured!")
               .unwrap()
               .write_all(b"Playlist Selection|Song Selection|Options")
               .unwrap();

    let output = String::from_utf8(rofi.wait_with_output()
                                       .unwrap()
                                       .stdout).unwrap();

    if output == "Playlist Selection\n" {playlist::main(constructor::main)}
    else if output == "Song Selection\n" {songs::main(constructor::main)}
    else if output == "Options\n" {options::main(constructor::main)}
}
