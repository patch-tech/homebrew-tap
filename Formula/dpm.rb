class Dpm < Formula
  desc "Generate code libraries tailored to specific datasets"
  homepage "https://www.dpm.sh/"
  license "MIT"
  url "https://github.com/patch-tech/dpm.git",
    tag: "v0.3.0",
    revision: "1bd20b948e34a0d1aa3fc7340798ebb81e0068e0"
  head "https://github.com/patch-tech/dpm.git",
    branch: "main"

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/dpm source list 2>&1", 0)
    assert_match /Not logged in/, output, "Tested failed. Please file in issue!"
  end
end
