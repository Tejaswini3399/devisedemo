json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :emp_id, :location, :email
  json.url employee_url(employee, format: :json)
end
