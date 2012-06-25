require 'formula'

class Hrv < Formula
  homepage 'http://www.physionet.org/tutorials/hrv-toolkit/'
  head 'http://physionet.org/tutorials/hrv-toolkit/HRV.src.tar.gz', :using => :curl

  depends_on 'wfdb'

  def install
    inreplace "Makefile", "BINDIR=/usr/bin", "BINDIR=#{prefix}/bin"
    system "mkdir #{prefix}/bin"
    system "make install"
  end
end