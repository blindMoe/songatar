if @message.presence
  json.set!(:meta) do
    json.set!(:message, @message)
  end
end

json.errors(@errors, partial: 'api/v3/errors/error', as: :error)

json.set!(:links) do
  Array(@links).each do |link|
    json.set!(link.rel, link.href)
  end
end
