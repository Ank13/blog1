get '/create' do
  @author ||= nil
  @title ||= nil 
  @body ||= "" 
  @tags ||= [] 
  @id ||= nil
  erb :create
end

get '/view_all' do
  erb :view_all
end

post '/create' do
  # params[:post_id].inspect
  id = params[:post_id]
  if id.empty?  #then create the post
    post = Post.create(title: params[:title], author: params[:author], body: params[:body])
    params[:tags].split(" ").each do |tag| 
      Tag.find_by_name(tag).nil? ? this_tag = Tag.create(name: tag) : this_tag = Tag.find_by_name(tag)
      Join.create(post_id: post.id, tag_id: this_tag.id)
    end
  else #update the post
    Post.update(id, title: params[:title], author: params[:author], body: params[:body])
  end
  redirect '/'
end

post '/edit' do
  post = Post.find(params[:post_id])
  @author = post.author
  @title = post.title
  @body = post.body
  @tags = []
  @id = post.id
  post.tags.each {|tag| @tags << tag.name}
  # @id.inspect
  erb :create
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :this_post
end

post '/delete' do
  post = Post.find(params[:post_id])
  post.destroy
  redirect '/'
end
