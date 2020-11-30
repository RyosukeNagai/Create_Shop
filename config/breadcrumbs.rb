crumb :root do
  link "HOME", root_path
end

crumb :about do
  link "ABOUT", top_about_path
  parent :root
end

crumb :index do
  link "マイページ", users_path
  parent :root
end

crumb :show do
  link "アカウント情報", user_path(current_user)
  parent :index
end

crumb :edit do
  link "アカウント情報編集", user_path(current_user)
  parent :show
end

crumb :delete do
  link "退会", user_path(current_user)
  parent :index
end

crumb :shipping do
  link "配送先一覧・登録", shippings_path
  parent :index
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).