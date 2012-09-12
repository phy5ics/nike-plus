# -*- encoding: utf-8 -*-
require 'spec_helper'

describe NikePlus do
  after do
    NikePlus.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      NikePlus.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should be a NikePlus::Client" do
      NikePlus.new.should be_a NikePlus::Client
    end
  end
end