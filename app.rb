require 'cuba'

Cuba.define do
  on get do
    on root do
      res.write "Starting point"
    end
  end
end
