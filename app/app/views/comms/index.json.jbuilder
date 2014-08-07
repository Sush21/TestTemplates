json.array!(@comms) do |comm|
  json.extract! comm, :id
  json.url comm_url(comm, format: :json)
end
