class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :sort_column, :sort_direction

  
  def authenticate_user!
    redirect_to root_url, :alert => "Please sign in to continue" if !current_user
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def sort_column(model, name)
    col_names = "#{model}".camelize.constantize.column_names
    col_names.include?(params[:sort]) ? params[:sort] : "#{name}"
  end

  def sort_direction
     %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  private :current_user, :sort_column, :sort_direction

  private
    # To load all the valid computers
    def load_computers
      @computers = Computer.valid_computers
    end
    # To load all the active devices
    def load_devices
      @devices = Device.active
    end
    # To load all the active employees
    def load_employees
      @employees = Employee.active_employees.order(:name)
    end
    # To load all the active vendors
    def load_vendors
      @vendors = Vendor.active_vendors
    end
end
