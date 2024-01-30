import ballerinax/health.fhir.r4.international401 as i4;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

configurable string HOST = ?;
configurable string USERNAME = ?;
configurable string PASSWORD = ?;
configurable string DATABASE = ?;
configurable int PORT = ?;

//The Patient record to interact with the database.
public type Patient record {
    string id;
    string gender;
    boolean active;

    string addressUse;
    string addressType?;
    string addressLine?;
    string city?;
    string district?;
    string state?;
    string postalCode?;
    string country?;
    string periodStart?;
    string periodEnd?;

    string nameUse?;
    string nameText?;
    string nameFamily?;
    string nameGiven?;
    string prefix?;
    string suffix?;
    string middleName?;

    string contactSystem?;
    string contactValue?;
    string contactUse?;
    string rank?;

    string identifierUse?;
    string identifierCode?;
    string identifierSystem?;
    string identifierValue?;
};

final mysql:Client dbClient = check new (
    HOST,
    USERNAME,
    PASSWORD,
    DATABASE,
    PORT
);

isolated function transform(Patient patient) returns i4:Patient => {
    active: patient.active

}