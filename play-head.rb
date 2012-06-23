require 'formula'

class PlayHead < Formula
  homepage 'http://www.playframework.org/'
  url 'https://github.com/playframework/Play20.git'

  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
    
    cd libexec/"framework" do
      system "./build", "build-repository"
    end
  end
end