class ApplicationController < ActionController::Base
  require 'themoviedb-api'
  Tmdb::Api.key("05fe299182c31d92180f6f45dafaf8f1")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

end
