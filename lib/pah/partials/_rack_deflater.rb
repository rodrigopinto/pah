
in_root do
  file = 'config/application.rb'
  inject = "\n\n    config.middleware.use Rack::Deflater"
  options = { after: /config\.i18n\.locale = :".*"/, verbose: false }

  inject_into_file file, inject, options
end

git add: 'config/application.rb'
git_commit 'Add Rack::Deflater middleware.'