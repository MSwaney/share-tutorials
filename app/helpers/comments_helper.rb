module CommentsHelper
  def comment_link_helper(tutorial)
    if tutorial.comments.count > 0
      link_to(pluralize(tutorial.comments.count, "comment"), tutorial_path(tutorial.id))
    else
      link_to "Leave the first comment!", tutorial_path(tutorial.id)
    end
  end
end
