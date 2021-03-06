require 'formula'

class Jsmin < Formula
  url 'https://github.com/douglascrockford/JSMin/tarball/8f62fe05856935ddcd49e364502ed98c4cf555b8'
  homepage 'http://www.crockford.com/javascript/jsmin.html'
  sha1 'b2a620042c97a8d9cc0be18b86ff9e62e8405806'
  version '2008-08-03'

  def install
    system 'cc jsmin.c -o jsmin'
    bin.install 'jsmin'
  end
end
