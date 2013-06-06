#posts controller

get '/create' do
  @author ||= nil
  @title ||= nil 
  @body ||= "" 
  @tags ||= [] 
  @id ||= "NEW"
  erb :create
end

get '/view_all' do
  erb :view_all
end

post '/create' do
  # if params[:id].nil?  #then create the post
    post = Post.create(title: params[:title], author: params[:author], body: params[:body])
    params[:tags].split(" ").each do |tag| 
      if Tag.find_by_name(tag).nil?
        this_tag = Tag.create(name: tag)
      else
        this_tag = Tag.find_by_name(tag)
      end 
      Join.create(post_id: post.id, tag_id: this_tag.id)
    end
  # else #update the post
  #   post = Post.find(params[:id])
  #   post.update(title: params[:title], author: params[:author], body: params[:body])
  # end
  redirect 'view_all'
end


post '/edit' do
  post = Post.find(params[:post_id])
  @author = post.author
  @title = post.title
  @body = post.body
  @tags = []
  @id = post.id
  post.tags.each {|tag| @tags << tag.name}
  erb :create
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :this_post
end
