json.set!(:status, error.status.to_s) if error.status
json.set!(:title, error.title) if error.title
json.set!(:detail, error.detail) if error.detail

if error.source?
  json.set!(:source) do
    json.set!(:pointer, error.source.pointer) if error.source.pointer?
    json.set!(:parameter, error.source.parameter) if error.source.parameter?
  end
end
