class Wgrib2 < Formula
  desc "Utility to read and write grib2 files"
  homepage "https://www.cpc.ncep.noaa.gov/products/wesley/wgrib2/"
  url "https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz.v2.0.8"
  sha256 "5e6a0d6807591aa2a190d35401606f7e903d5485719655aea1c4866cc2828160"

  depends_on "gcc" => :build

  def install
    ENV.deparallelize
    system "make", "CC=/usr/local/bin/gcc-9", "FC=/usr/local/bin/gfortran"
    bin.install "wgrib2/wgrib2"
  end

  test do
    output = `#{bin}/wgrib2 --version`
    assert output.include? version
    assert_equal 8, $CHILD_STATUS.exitstatus
  end
end
