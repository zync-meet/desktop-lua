local http_client = {}

function http_client.request(url, method, body, headers)
    -- Simple request mockup returning stubs
    print("HTTP Request to " .. url)
    return { status = 200, body = "{}" }
end

return http_client
