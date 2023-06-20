<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student</title>
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies

    // Redirect to login page if the user is not logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("StuLogin.jsp");
    }
%>
<br>Welcome ${username}
<br><br><img src="abes.jpg" alt="ABES College"></br></br>

<!-- Basic event listing -->
<h2>Upcoming Events:</h2>
<table>
    <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Location</th>
            <th>Description</th>
            <th>Register</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Event Date 1</td>
            <td>Event Time 1</td>
            <td>Event Location 1</td>
            <td>Event Description 1</td>
            <td>
                <form action="EventRegistration" method="post">
                    <input type="hidden" name="eventId" value="1">
                    <input type="submit" value="Register">
                </form>
            </td>
        </tr>
        <tr>
            <td>Event Date 2</td>
            <td>Event Time 2</td>
            <td>Event Location 2</td>
            <td>Event Description 2</td>
            <td>
                <form action="EventRegistration" method="post">
                    <input type="hidden" name="eventId" value="2">
                    <input type="submit" value="Register">
                </form>
            </td>
        </tr>
        <!-- Add more event rows as needed -->
    </tbody>
</table>

<!-- Event registration form -->
<h2>Event Registration:</h2>
<form action="EventRegistration" method="post">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required><br>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required><br>
    <input type="hidden" name="eventId" value="0"><!-- Update the value with the actual event ID -->
    <input type="submit" value="Register">
</form>

<!-- Event attendance tracking -->
<h2>Event Attendance:</h2>
<table>
    <thead>
        <tr>
            <th>Event</th>
            <th>Student</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Event 1</td>
            <td>Student 1</td>
            <td>Attended</td>
        </tr>
        <tr>
            <td>Event 2</td>
            <td>Student 2</td>
            <td>Not Attended</td>
        </tr>
        <!-- Add more attendance rows as needed -->
    </tbody>
</table>

<!-- Event feedback -->
<h2>Event Feedback:</h2>
<form action="EventFeedback" method="post">
    <label for="event">Event:</label>
    <select name="event" id="event" required>
        <option value="">Select an event</option>
        <option value="1">Event 1</option>
        <option value="2">Event 2</option>
        <!-- Add more event options as needed -->
    </select><br>
    <label for="feedback">Feedback:</label><br>
    <textarea name="feedback" id="feedback" rows="4" cols="50"></textarea><br>
    <input type="submit" value="Submit Feedback">
</form>

<!-- Logout button -->
<form action="Logout" method="post">
    <input type="submit" value="Logout">
</form>

</body>
</html>
