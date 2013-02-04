# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spin"
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jesse Storimer"]
  s.date = "2012-07-27"
  s.description = "Spin preloads your Rails environment to speed up your autotest(ish) workflow.\n\nBy preloading your Rails environment for testing you don't load the same code over and over and over... Spin works best for an autotest(ish) workflow."
  s.email = ["jstorimer@gmail.com"]
  s.executables = ["spin"]
  s.files = ["bin/spin"]
  s.homepage = "http://jstorimer.github.com/spin"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Spin preloads your Rails environment to speed up your autotest(ish) workflow."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
