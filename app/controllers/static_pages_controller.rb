class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def hello
  	render html: "Hello, world!"
  end
end
