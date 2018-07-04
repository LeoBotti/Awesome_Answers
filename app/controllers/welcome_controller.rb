class WelcomeController < ApplicationController

  # we call methods inside controller classes: actions
  # so here we have the `index` action
  def index
    # by default (convetion) actions will render view files
    # within a folder that matches the controller name
    # so it will look into the folder called app/views/welcome
    # the view file name should match the action name
    # it will also include the `format` and `templating systenm`
    # so the full file name will be something like
    # action.format.templating_system
    # so if the format is `html` and the templating system is `erb` the file name will be:
    # index.html.erb
  end
end
