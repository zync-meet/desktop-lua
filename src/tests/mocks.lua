local mocks = {}

function mocks.create_http_client()
    local client = {
        should_fail = false,
        response_status = 200,
        response_body = "{}",
        calls = {}
    }

    function client.request(url, method, body, headers)
        table.insert(client.calls, { url = url, method = method, body = body, headers = headers })
        if client.should_fail then
            return { status = 500, body = "Error" }
        else
            return { status = client.response_status, body = client.response_body }
        end
    end

    return client
end

return mocks
