module ApplicationHelper
 def get_genre(genre_ids)
		return if genre_ids.empty?
		genres = []

		genre_ids.each do |genre_id|
			# genres = Tmdb::Genre.movie_list.select{ |m| m.id == genre_id }.first[:name]
			genre_value = Tmdb::Resource.new("/genre/#{genre_id}").get
			genres << genre_value['name']
		end

		genres.join(', ').to_s
 end

 def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

end
