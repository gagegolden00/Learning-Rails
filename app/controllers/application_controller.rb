class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def turbo_response(frame, partial, locals = {})
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          frame,
          partial:,
          locals:
        )
      end
    end
  end
end
