class ContactController < ApplicationController
  def index
  end

  def create
    # all paramters from HTTP or URL come in the a Hash called `params`
    # params is Hash with indiffernt access meaning that you can access values
    # using string or symbol keys so I can do
    # params[:full_name] or params['full_name'] (added feature by Rail, not 
    # a standard Ruby feature)
    # When we define instance variable in actions such as `@name` we can
    # access them in the associated view file
    @name = params[:full_name]
  end
end
