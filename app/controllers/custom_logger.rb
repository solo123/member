class CustomLogger
  def before(controller) 
    @start = Time.now
  end

  def after(controller)   
    log = ActionLog.new 
    log.start_time = @start 
    log.end_time = Time.now 
    log.total = log.end_time.to_f - @start.to_f
    log.controller = controller.controller_name 
    log.action = controller.action_name
    #log.paraid = params[:id]
    puts "==> " << controller.request.env["SERVER_ADDR"]
    #log.userid = (session && session[:member_id]) ? session[:member_id] : 0 
    log.save 
  end
end