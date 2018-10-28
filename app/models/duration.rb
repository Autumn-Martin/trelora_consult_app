class Duration 
  
  attr_reader :controller,
              :action

  def initialize(controller, action)
    @controller = controller
    @action = action
  end
  
  def start_prepare_time
    if on_prepare
      prepare_start_time = Time.current
    end
  end
  
  def on_prepare 
    return true if controller == "prepare" && action == "show"
  end
end