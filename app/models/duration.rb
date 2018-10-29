class Duration 
  
  attr_reader :controller,
              :action

  def initialize(controller, action)
    @controller = controller
    @action = action
  end
  
  def prepare_start_time
    if on_prepare
      start_prepare_time = Time.current
    end
  end
  
  def prepare_end_time
    if left_prepare
      end_prepare_time = Time.current
    end
  end
  
  def total_prepare_time
    prepare_end_time - prepare_start_time
  end
  
  def on_prepare 
    return true if controller == "prepare" && action == "show"
  end
  
  def left_prepare
    return true if controller != "prepare"
  end
end