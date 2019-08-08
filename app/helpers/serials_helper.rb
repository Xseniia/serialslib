# frozen_string_literal: true

module SerialsHelper # :nodoc:

  def user_view_status
    status = ViewStatus.where(serial_id: @serial.id, user_id: current_user.id)[0]
    return status.status unless status.nil?

    "You didn't mention your view status on this serial yet."
  end

  def fav_button
    if current_user
      return link_to 'Remove from favourites', serial_favourite_path(@serial, current_user), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-light' unless Favourite.where(user_id: current_user.id, serial_id: @serial.id).empty?

      link_to 'Add to favourites', serial_favourites_path(@serial), method: :create, class: 'btn btn-light'
    end
  end

  def country_of_origin
    return 'Wasn\'t mentioned.' if @serial.country_id.blank?

    Country.where(id: @serial.country_id)[0].country_name
  end

  def tag_links(tag)
    link_to tag.tag_name, tag_path(tag.tag_name), class: 'badge badge-light', id: "#{tag.tag_name} tag"
  end
end
