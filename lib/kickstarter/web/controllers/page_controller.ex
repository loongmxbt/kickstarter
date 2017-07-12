defmodule Kickstarter.Web.PageController do
  use Kickstarter.Web, :controller

  # pages that need special treatment get their own matched function
  # all others simply render the template of the same name
  def action(conn, _) do
  	case action_name(conn) do
  		:home  -> home(conn, conn.params)
  		:course -> course(conn, conn.params)
  		:showcase  -> showcase(conn, conn.params)
  		:tutor -> tutor(conn, conn.params)
  		# :train -> train(conn, conn.params)
  		# :join -> join(conn, conn.params)

  		name  -> render(conn, name)
  	end
  end


  def home(conn, _params) do
    posts = nil
    render(conn, :home, posts: posts)
  end

  def course(conn, _params) do
  	courses = nil
  	render(conn, :course, courses: courses)
  end

  def showcase(conn, _params) do
  	showcases = nil
  	render(conn, :showcase, showcases: showcases)
  end

  def tutor(conn, _params) do
  	tutors = nil
  	render(conn, :tutor, tutors: tutors)
  end

end
