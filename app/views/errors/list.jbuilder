json.errors(@errors) do |error|
  json.status(error.status.to_s) if error.status
  json.title(error.title) if error.title
  json.detail(error.detail) if error.detail

  if error.source?
    json.source do
      json.pointer(error.source.pointer) if error.source.pointer?
      json.parameter(error.source.parameter) if error.source.parameter?
    end
  end
end
