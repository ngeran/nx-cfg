{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      # Inserts a blank line between shell prompts
      add_newline = true;

      # Define the prompt order (the NixOS version will not be as detailed, you can adjust as needed)
      format = ''
        $os$hostname$directory$git_branch$git_status$package$golang$python$nodejs$rust$java$docker_context$memory_usage$cmd_duration$time$line_break$status$character
      '';

      # OS Module Configuration
      os = {
        format = "[ $symbol ]($style)";
        style = "gruvbox-blue bold";
        symbols.Linux = "󰻀";
        symbols.Ubuntu = "󰕈";
        symbols.Debian = "󰣚";
        symbols.Arch = "󰣇";
        symbols.Windows = "󰍲";
        symbols.Macos = "󰀵";
      };

      # Hostname Configuration
      hostname = {
        format = "[$hostname]($style) ";
        style = "gruvbox-bight-orange bold";
        trim_at = ".";
        ssh_only = false;
      };

      # Directory Configuration
      directory = {
        style = "gruvbox-bright-blue bold";
        format = "[ 󰉖 $path ]($style)";
        truncation_length = 4;
        truncate_to_repo = true;
        read_only_style = "gruvbox-bright-red";
        read_only = " 󰌾";
      };

      # Git Branch Configuration
      git_branch = {
        symbol = "󰘬";
        format = "[ $symbol $branch ]($style)";
        style = "gruvbox-bright-purple bold";
      };

      # Git Status Configuration
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "gruvbox-bright-yellow bold";
        conflicted = "󰞇";
        ahead = "󰁝 $count";
        behind = "󰁅 $count";
        diverged = "󰹹 $ahead_count $behind_count";
        untracked = "󰘓 $count";
        stashed = "󰏗 $count";
        modified = "󰙀 $count";
        staged = "[󰗅 $count](gruvbox-bright-green)";
        renamed = "󰑕 $count";
        deleted = "󰍷 $count";
      };

      # Package Configuration
      package = {
        symbol = "󰏗";
        format = "[ $symbol $version ]($style)";
        style = "gruvbox-bright-orange bold";
      };

      # Golang Configuration
      golang = {
        symbol = "󰟠";
        format = "[ $symbol ($version) ]($style)";
        style = "gruvbox-bright-aqua bold";
      };

      # Python Configuration
      python = {
        symbol = "";
        format = "[ $symbol ($version )]($style)";
        style = "gruvbox-yellow bold";
        pyenv_version_name = true;
      };

      # Node.js Configuration
      nodejs = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "gruvbox-bright-green bold";
      };

      # Rust Configuration
      rust = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "gruvbox-bright-orange bold";
      };

      # Java Configuration
      java = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "gruvbox-bright-red bold";
      };

      # Docker Context Configuration
      docker_context = {
        symbol = "󰡨";
        format = "[ $symbol $context ]($style)";
        style = "gruvbox-bright-blue bold";
        only_with_files = false;
      };

      # Memory Usage Configuration (disabled)
      memory_usage = {
        disabled = true;
        show_percentage = true;
        threshold = 75;
        symbol = "󰍛";
        format = "[$symbol($ram_pct)]($style)";
        style = "gruvbox-bright-aqua";
      };

      # Command Duration Configuration
      cmd_duration = {
        min_time = 1000;
        format = "[ 󱑁 $duration ]($style)";
        style = "gruvbox-gray italic";
      };

      # Time Configuration
      time = {
        disabled = false;
        format = "[ 󱑆 $time ]($style)";
        time_format = "%T";
        style = "gruvbox-bright-green";
        utc_time_offset = "local";
      };

      # Status Configuration
      status = {
        symbol = "";
        style = "gruvbox-bright-red";
        success_symbol = "";
        format = "[$symbol]($style)";
      };

      # Character Configuration
      character = {
        success_symbol = "[❯](gruvbox-bright-green)";
        error_symbol = "[❯](gruvbox-bright-red)";
        vimcmd_symbol = "[❮](gruvbox-bright-green)";
        vimcmd_replace_one_symbol = "[❮](gruvbox-bright-purple)";
        vimcmd_replace_symbol = "[❮](gruvbox-bright-purple)";
        vimcmd_visual_symbol = "[❮](gruvbox-bright-yellow)";
      };
    };
  };
}
