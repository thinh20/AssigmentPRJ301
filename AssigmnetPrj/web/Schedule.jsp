<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Time Table</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
          <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <img height="50px" src="data:image/png;base64,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">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="WeeklyTimeTable">Schedule </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GroupStudent">Display Group</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <form method="get" action="WeeklyTimeTable" class="viewTimeTable">
                <div> Campus: 
                    <select name="campus" required>
                        <c:forEach var="c" items="${clist}" >
                            <option value="${c}">${c}</option>
                        </c:forEach>
                    </select><br>
                </div>
                <div>
                    Lecture: <input type="text" name="lecture" required value="${SearchLecture}">
                    
                    <input type="submit" value="View">
                </div>
                
            </form>
            <div class="row">
                <table class="table table-bordered ">
                    <thead class="bg-primary">
                        <tr>
                            <th>Slot</th>
                            <th>Date </th>
                            <th>Group</th>
                            <th>Subject </th>
                            <th>Room</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${slist}">
                            <tr>
                                <td style="width: 10%;">Slot${s.getSlot()}</td>
                                <td style="width: 16%;">${s.getDate()}</td>
                                <td style="width: 16%; ">${s.getGroup().getCode()}</td>
                                <td style="width: 16%;">${s.getGroup().getSubject().getCode()}</td>
                                <td style="width: 16%;">${s.getRoom().getCode()}</td>
                                <td style="width: 16%;">${s.isStatus()?"<p style='color:green;'>Attend</p>":"<p style='color:red;'>Not yet</p>"}</td>
                                <c:if test="${s.isStatus()}">
                                    <th><a href="CheckAttend?sid=${s.getId()}&status=${s.isStatus()}">View</a></th>
                                </c:if>
                                <c:if test="${!s.isStatus()}">
                                    <th><a href="CheckAttend?sid=${s.getId()}&status=${s.isStatus()}">Check</a></th>

                                </c:if>
                            </tr>
                        </c:forEach>



                    </tbody>
                </table>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>
</html>