use std::process::{Command, Stdio};
use std::io::Write;

pub fn main(rofi: fn() -> Command) {
    let curr = Command::new("mpc").arg("lsplaylists").output();

    let output = match curr {
        Ok(o) => {String::from_utf8(o.stdout).unwrap()}
        Err(err) => { panic!("Exited with the following: {}", err) }
    };

    if output != "" {
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


            let cmd = Command::new("mpc")
                .stdout(Stdio::null())
                .arg("clear")
                .status();

            match cmd {
                Ok(_) => {}
                Err(e) => {panic!("Something went wrong: {}", e)}
            }


            let cmd = Command::new("mpc")
                .stdout(Stdio::null())
                .arg("load")
                .arg(format!("{}", op2))
                .status();

            match cmd {
                Ok(_) => {}
                Err(e) => {panic!("Something went wrong: {}", e)}
            }


            let cmd = Command::new("mpc")
                .stdout(Stdio::null())
                .arg("play")
                .status();

            match cmd {
                Ok(_) => {}
                Err(e) => {panic!("Something went wrong: {}", e)}
            }
        }
    }
}
