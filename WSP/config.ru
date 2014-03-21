use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run lambda { |env|
    currentpage=env['REQUEST_PATH']
    if currentpage == '/' 
        currentpage= 'index.html'
      end
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/' + currentpage, File::RDONLY)
  ]
} 