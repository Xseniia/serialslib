# frozen_string_literal: true

module SerialsHelper # :nodoc:
  def tag_links(tag)
    link_to tag.tag_name, tag_path(tag.tag_name), class: 'badge badge-light', id: "#{tag.tag_name} tag"
  end
end
