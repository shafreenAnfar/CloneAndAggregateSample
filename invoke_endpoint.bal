function invokeEndpoint(http:Client clientEP, json outboundPayload) returns json {
    var inboundResponse = clientEP->post("/", outboundPayload);
    if (inboundResponse is http:Response) {
        var inboundPayload = inboundResponse.getJsonPayload();
        if (inboundPayload is json) {
            return inboundPayload;
        } 
    } 
    return {message: "error couldn't get the payload"};
}