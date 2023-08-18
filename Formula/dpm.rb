class Dpm < Formula
  desc "Generate code libraries tailored to specific datasets"
  homepage "https://www.dpm.sh/"
  license "MIT"
  url "https://github.com/patch-tech/dpm.git",
    tag: "v0.0.1",
    revision: "7811d4bfea4ff3415371ad5b0a001bd99283741b"
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
