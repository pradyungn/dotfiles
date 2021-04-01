use std::process::{Command, Stdio};
use std::io::Write;

pub fn main(rofi: fn() -> Command) {
    let curr = Command::new("mpc").arg("playlist").output();

    let output = match curr {
        Ok(o) => {String::from_utf8(o.stdout).unwrap()}
        Err(err) => { panic!("Exited with the following: {}", err) }
    };

    if output != "" {
        let playlist = output.lines();
        let mut output = output.replace("\n", "|");
        output.truncate(output.len() - 1);

        let mut child = rofi().spawn().unwrap();

        child.stdin.as_mut()
                   .ok_or("Child process stdin has not been captured!")
                   .unwrap()
                   .write_all(format!("{}", output).as_bytes()) .unwrap();

        let mut op2 = String::from_utf8(child.wait_with_output()
                                       .unwrap()
                                       .stdout).unwrap();

        if op2 != "" {
            op2.truncate(op2.len() - 1);

            let mut i = 0;
            for c in playlist {
                i += 1;
                if c == op2 {
                    break
                }
            }

            let cmd = Command::new("mpc")
                .stdout(Stdio::null())
                .arg("play")
                .arg(format!("{}", i))
                .status();

            match cmd {
                Ok(_) => {}
                Err(e) => {panic!("Something went wrong: {}", e)}
            }
        }
    }
}
