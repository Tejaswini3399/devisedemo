json.array!(@projects) do |project|
  json.extract! project, :id, :title, :income, :expenses, :project_desc, :employee_id
  json.url project_url(project, format: :json)
end
