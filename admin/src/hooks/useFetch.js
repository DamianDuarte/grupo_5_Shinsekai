const useFetch = async (endpoint, method='GET', data) => {
    const apiUrlBase = process.env.REACT_APP_API_URL_BASE; 
    const url = `${apiUrlBase}/${endpoint}`;
    let response;

    if(method == 'GET')
        response = await fetch(url);
    else if(method == 'POST')
        response = await fetch(url, { method, body: JSON.stringify(data), headers: { 'Content-Type': 'application/json' } });

    let result = await response.json();

    return result;
}

const useFetchWithToken = async (endpoint, method='GET', token, data) => {
    const apiUrlBase = process.env.REACT_APP_API_URL_BASE; 
    const url = `${apiUrlBase}/${endpoint}`;
    let response;

    if(method == 'GET')
        response = await fetch(url, { method, headers: { Authorization: token }});
    else if(method == 'POST')
        response = await fetch(url, { method, body: JSON.stringify(data), 
            headers: { 'Content-Type': 'application/json', Authorization: token } });

    let result = await response.json();

    return result;
}

export { useFetch, useFetchWithToken }