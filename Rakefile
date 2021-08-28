require 'rake'

desc "install the dot files into user's home directory"
task :install do |t, args|
  replace_all = (ENV["FORCE"] == 'true') || false
  install_homebrew
  link_neovim
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE id_dsa.pub robbykim.itermcolors].include? file

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

  puts
  puts "======================================"
  puts "Updating Homebrew"
  puts "======================================"
  system %Q{brew update}
  puts
  puts "======================================"
  puts "Installing Brew Packages"
  puts "======================================"
  system %Q{brew install gh neovim the_silver_searcher zsh}
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
