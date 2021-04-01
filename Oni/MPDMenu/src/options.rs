use std::process::{Command, Stdio};
use std::io::Write;

pub fn main(rofi: fn() -> Command) {
    let curr = Command::new("mpc").arg("status").output();

    let output = match curr {
        Ok(o) => {String::from_utf8(o.stdout).unwrap()}
        Err(err) => { panic!("Exited with the following: {}", err) }
    };

    let output = output.lines();

    let mut out = "".to_string();
    for i in output {
        if i.starts_with("volume") {
            out= i.replace('o', "O");
            break
        }
    }

    if out == "" {
        panic!("Could not retrieve options from MPD")
    }

    let mut output: Vec<&str> = out.split("   ").collect();

    for i in 1..4 {
        let mut stat = output[i].split(": ");
        stat.next();
        output[i] = match stat.next() {
            Some(c) => {c}
            None => { panic!("Failed to parse MPC output") }
        };
    }

    let mut child = rofi().spawn().unwrap();

    child.stdin.as_mut()
               .ok_or("Child process stdin has not been captured!")
               .unwrap()
               .write_all(format!("Toggle Repeat ({})|Toggle Single ({})|Toggle Random ({})"
                                  , output[1]
                                  , output[2]
                                  , output[3]).as_bytes()) .unwrap();

    let output = String::from_utf8(child.wait_with_output()
                                       .unwrap()
                                       .stdout).unwrap();

    let cmd;

    if output.contains("Repeat") {
        cmd = Command::new("mpc")
            .stdout(Stdio::null())
            .arg("repeat")
            .status();
    } else if output.contains("Single") {
        cmd = Command::new("mpc")
            .stdout(Stdio::null())
            .arg("single")
            .status();
    } else if output.contains("Random") {
        cmd = Command::new("mpc")
            .stdout(Stdio::null())
            .arg("random")
            .status();
    } else {
        return
    }

    match cmd {
        Ok(_) => {}
        Err(e) => {panic!("Error when calling option: {}", e)}
    }
}
