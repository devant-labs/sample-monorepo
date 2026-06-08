import ballerina/http;

listener http:Listener httpDefaultListener1 = new(9090);

service /wso2 on httpDefaultListener1 {
    resource function get .() returns json|error {
        do {
            return {
                "msg": "WSO2"
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}


listener http:Listener httpDefaultListener2 = new(9091);

service /health on httpDefaultListener2 {
    resource function get .() returns json|error {
        do {
            return {
                "health": "OK"
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}