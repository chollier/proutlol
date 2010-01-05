# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def guess_page_title
    blogname = "Ouagadoudou"
    case controller_name
    when "posts"      
      case controller.action_name
      when "show"
        return "#{Post.find_by_permalink(params[:id]).title} | #{blogname}"
      when "index"
        return blogname
      end
    else
    end
  end
  
end
