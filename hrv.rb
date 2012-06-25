require 'formula'

class Hrv < Formula
  homepage 'http://www.physionet.org/tutorials/hrv-toolkit/'
  url 'http://physionet.org/tutorials/hrv-toolkit/HRV.src.tar.gz'

  def install
    inreplace "Makefile", "BINDIR=/usr/bin", "BINDIR=#{prefix}/bin"
    system "mkdir #{prefix}/bin"
    system "make install"
  end
end