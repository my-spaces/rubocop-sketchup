# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::SketchupRequirements::LanguageHandlerGlobals do

  subject(:cop) { described_class.new }

  described_class::LH_GLOBALS.each do |var|

    it "registers an offense when using #{var}" do
      expect_offense(<<-RUBY.strip_indent)
        #{var} = LanguageHandler.new('example.strings')
        #{'^' * var.size} Avoid globals in general, but especially these which are known to be in use.
      RUBY
    end

  end

  it 'does not register an offense when not using other globals' do
    expect_no_offenses(<<-RUBY.strip_indent)
      $hello = 456
    RUBY
  end

end
