# Archives: http://www.physionet.org/physiotools/archives/wfdb-10.5/
class Wfdb < Formula
  homepage 'http://www.physionet.org/physiotools/wfdb.shtml'
  url 'http://www.physionet.org/physiotools/archives/wfdb-10.5.13.tar.gz'
  md5 'e08da98ae61400efced69f01529b8c0a'

  def install
    inreplace "conf/darwin.def", "-arch ppc", ""
    inreplace "conf/darwin-slib.def", "-arch ppc", ""

    system "./configure", "", "--prefix=#{prefix}", "-m32", "--mandir=#{man}"
    system "make install"
  end

  def test
    system "make check"
  end
end