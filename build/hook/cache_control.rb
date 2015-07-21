r = Nginx::Request.new

cache_sec = case r.filename
  when %r[\.(?:gif|jpeg|png)$]
    60*60*24*7
  when %r[\.(?:css|js)$]
    60*10
  when %r[\.(?:html|htm)$]
    0
end

r.headers_out['Cache-Control'] = "max-age=#{cache_sec}"

if r.filename.match %r[\.(?:html|htm)$]
  r.headers_out['Expires'] = 'Mon, 26 Jul 1997 05:00:00 GMT'
end

Nginx.return Nginx::DECLINED
