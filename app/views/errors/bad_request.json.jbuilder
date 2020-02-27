json.set!(:meta) do
  json.set!(:status, @status)
  json.set!(:message, @message) if @message.present?
end

json.set!(:errors, Array(@errors)) do |error|
  json.set!(:title, error.title)
  json.set!(:detail, error.detail)
end

json.set!(:links) do
  Array(@links).each do |link|
    json.set!(link.rel, link.href)
  end
end
