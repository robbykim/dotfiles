require 'rake'

desc "install the dot files into user's home directory"
task :install do |t, args|
  replace_all = (ENV["FORCE"] == 'true') || false
  install_homebrew
  link_neovim
  setup_zsh

  Dir['*'].each do |file|
    next if %w[Rakefile Brewfile README.md install.sh LICENSE id_dsa.pub robbykim.itermcolors].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def install_homebrew
  system %Q{which brew}
  unless $?.success?
    puts "======================================"
    puts "Installing Homebrew"
    puts "======================================"
    system %Q{bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"}
  end

  system %Q{which brew}
  unless $?.success?
    puts
    puts "======================================"
    puts "Adding Homebrew to PATH"
    puts "======================================"
    system %Q{echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile}
    system %Q{eval "$(/opt/homebrew/bin/brew shellenv)"}
  end

  puts
  puts "======================================"
  puts "Updating Homebrew"
  puts "======================================"
  system %Q{brew update}
  puts
  puts "======================================"
  puts "Installing Brew Packages"
  puts "======================================"
  system %Q{brew bundle}
end

def link_neovim
  base_dir = ".config"
  base_path = File.join(ENV["HOME"], base_dir)
  init_file_path = File.join(base_path, "nvim", "init.vim")

  system %Q{mkdir #{base_path}} unless directory_exists?(base_path)
  system %Q{mkdir #{base_path}/nvim} unless directory_exists?("#{base_path}/nvim")
  unless File.exist?(init_file_path)
    system %Q{echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > #{init_file_path}}
  end

  puts
  puts "======================================"
  puts "Don't forget to :PlugInstall"
  puts "======================================"
end

def setup_zsh
  puts
  puts "======================================"
  puts "Installing oh-my-zsh"
  puts "======================================"
  system %Q{sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"}

  # TODO: Add powerlevel10k installation and configuration
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def directory_exists?(directory)
  !Dir[directory].empty?
end
