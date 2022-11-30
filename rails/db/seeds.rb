5.times do |i|
  Video.create(uri: "http://google.com", 
               name: "Video ##{i}", 
               length: i,
               image_uri: "https://www.akc.org/wp-content/uploads/2017/11/Golden-Retriever-Puppy.jpg",
               iframe: nil,
               tags: "test, dev",
               actor: nil,
               vid: i,
               category: nil,
               mode: "sd"
  )
end