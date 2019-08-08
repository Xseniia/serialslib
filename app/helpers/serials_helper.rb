# frozen_string_literal: true

module SerialsHelper # :nodoc:
  def user_view_status
    status = ViewStatus.where(serial_id: @serial.id, user_id: current_user.id)[0]
    return status.status unless status.nil?

    "You didn't mention your view status on this serial yet."
  end
end
