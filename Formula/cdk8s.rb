require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.56.tgz"
  sha256 "6c123368bf34a0a1328b8f579951ced02288d957e678765178f9c006c0e7cf62"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "33a4e82f8eebb2d5c4fb02b33396512a622ee7df212eecfe686bb7a6bab7fcb3"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
