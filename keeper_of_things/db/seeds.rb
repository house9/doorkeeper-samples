Doorkeeper::Application.create!({"name"=>"Acme Widgets", "uid"=>"c026583573542925c0383079b6db146b59ac7dfb16b5eceaed5db68424688394", "secret"=>"3f1d8c7ec68ee166276063d140a20075551e7a2875bb3f23bc42cee96841e931", "redirect_uri"=>"http://localhost:3010/auth/keeper/callback"})
Doorkeeper::Application.create!({"name"=>"Oauth User Agent Flow", "uid"=>"7479263ef0b98e9b31ec71d7c29f19eda42531e65656d6f9500e07c84c4b5b37", "secret"=>"55a3cc734ea1e769fd651bc05a353e569b6efd0f18b6912e2927cae712bd83c9", "redirect_uri"=>"http://localhost:3000/oauth_user_agent.html"})
Doorkeeper::Application.create!({"name"=>"JSO 2", "uid"=>"68d256793f4eb5f8492c340d40f88ecf8d28db034d405c9394b23b84b052b45b", "secret"=>"367bd820414a0ce835c2df4966c0af12f4f347bd6fd68beca5d83231add747c6", "redirect_uri"=>"http://localhost:3000/jso2.html"})

["test-1@example.com", "test-2@example.com"].each do |email|
  user = User.new
  user.email = email
  user.password = "11122211"
  user.password_confirmation = "11122211"
  user.save!

  (1..3).each do |index|
    Item.create!(owner: user, name: "#{SecureRandom.uuid.split('-')[0]} Something #{index}")
  end
end
