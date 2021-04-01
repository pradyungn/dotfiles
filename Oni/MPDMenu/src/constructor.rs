use std::process::{Command, Stdio};
use std::fs::read_to_string;

pub fn main() -> Command {
    let height = read_to_string("/home/pradyungn/.config/polybar/height");

    let height = match height {
        Ok(s) => {s}
        Err(err) => { panic!("Exited with the following: {}", err)}
    };

    let mut cmd = Command::new("rofi");
    cmd.arg("-sep");
    cmd.arg("|");
    cmd.arg("-dmenu");
    cmd.arg("-i");
    cmd.arg("-p");
    cmd.arg("");
    cmd.arg("-columns");
    cmd.arg("1");
    cmd.arg("-yoffset");
    cmd.arg(&height);
    cmd.arg("-location");
    cmd.arg("2");
    cmd.arg("-width");
    cmd.arg("15");
    cmd.arg("-lines");
    cmd.arg("3");

    cmd.stdin(Stdio::piped());
    cmd.stderr(Stdio::piped());
    cmd.stdout(Stdio::piped());

    cmd
}
