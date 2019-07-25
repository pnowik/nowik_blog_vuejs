module PostsHelper

  def comment_publish(comment, post)
    if((current_user.try(:admin?) || current_user.try(:mod?)) && !comment.publish? && comment.user.try(:standard?))
      content_tag(:small, link_to("Publish", publish_post_comment_path(post, comment), method: :put))
    elsif((current_user.try(:admin?) || current_user.try(:mod?)) && comment.publish? && comment.user.try(:standard?))
      content_tag(:small, link_to("Unpublish", unpublish_post_comment_path(post, comment), method: :put))
    end
  end

  def comment_edit(comment, post)
    if current_user.try(:admin?) || current_user.try(:mod?) || comment.user_id.to_s == current_user.id.to_s
      content_tag(:small, link_to("Edit", edit_post_comment_path(post, comment), method: :get))
    end
  end

  def comment_delete(comment, post)
    if current_user.try(:admin?) || current_user.try(:mod?) || comment.user_id.to_s == current_user.id.to_s
      content_tag(:small, link_to("Delete", post_comment_path(post, comment), method: :delete, data: {confirm: "Are you sure you want to delete this permanently?"}))
    end
  end

end
