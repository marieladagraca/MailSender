class ApplicationController < ActionController::Base
  
  protected 
  
  def render_422(exception)
    render_error(:unprocessable_entity, 'Unprocessable Entity', exception.message)
  end

  def render_error(status_code, title, detail = nil)
    render json: {
      errors: [
        {
          title: title,
          detail: detail
        }.compact
      ]
    }, status: status_code
  end
end
