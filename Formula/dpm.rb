class Dpm < Formula
  desc "Generate code libraries tailored to specific datasets"
  homepage "https://www.dpm.sh/"
  license "MIT"
  url "https://github.com/patch-tech/dpm.git",
    tag: "v0.2.0",
    revision: "275b74b151ebabebf854871a4e5f6f3214fcefdb"
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
