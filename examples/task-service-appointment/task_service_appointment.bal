import ballerina/log;
import ballerina/task;

// The [`task:AppointmentConfiguration`](https://ballerina.io/swan-lake/learn/api-docs/ballerina/task/records/AppointmentConfiguration.html) record of the Task Listener.
// Task Appointment can either have a CRON expression (`string`) or an
// `AppointmentData` record for the `appointmentData` field. Optionally, a
// `noOfRecurrences` can be provided to limit the number of executions.
task:AppointmentConfiguration appointmentConfiguration = {
    // This cron expression will schedule the appointment every second.
    appointmentDetails: "* * * * * ?",
    // Number of recurrences will limit the number of times the timer runs.
    noOfRecurrences: 10

};

// Initialize the listener using pre defined configurations.
listener task:Listener appointment = new (appointmentConfiguration);

int count = 0;

// Creating a service on the task Listener.
service appointmentService on appointment {
    // This resource triggers when the appointment is due.
    resource function onTrigger() {
        log:printInfo("Cleaning up...");
        log:printInfo(count.toString());
        count = count + 1;
    }

}
