require './test/test_helper'
require 'exercism/code'

class CodeTest < Minitest::Test

  def setup
    super
    @ruby = Language.create(name: "ruby",
                            code_extension: "rb",
                            test_extension: "rb")

    @python = Language.create(name: "python",
                              code_extension: "py",
                              test_extension: "py")
  end

  def test_extension
    code = Code.new('/path/to/file.rb')
    assert_equal 'rb', code.extension
  end

  def test_filename
    code = Code.new('/path/to/file.rb')
    assert_equal 'file.rb', code.filename
  end

  def test_language
    code = Code.new('/path/to/file.py')
    assert_equal @python, code.language
  end

  def test_unknown_language
    assert_raises Exercism::UnknownLanguage do
      code = Code.new('/path/to/file.cpp')
      code.language
    end
  end

  def test_slug
    code = Code.new('/path/to/file.py')
    assert_equal 'to', code.slug
  end
end
