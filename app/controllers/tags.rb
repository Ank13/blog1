#tags controller 
post '/tag' do
  @selected_tag = Tag.find_by_name(params[:tagname])
  @selected_posts = @selected_tag.posts.order("created_at DESC")
  erb :this_tag
end


