if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path "/home/citysexx/.cargo/bin"
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
function fish_greeting
    echo Hello $USER!
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end
