import ballerina/http;
import ballerina/log;

service clone on new http:Listener(9090) {

    http:Client client1 = new("http://localhost:8601/hello");
    http:Client client2 = new("http://localhost:8602/hello");

    @http:ResourceConfig {
        body: "payload"
    }
    resource function aggregate(http:Caller caller, http:Request req, json payload) {
        json[] aggregatedResponse = cloneAndAggregate(payload, self.client1, self.client2);
        var res3 = caller->respond(untaint aggregatedResponse);
    }
}