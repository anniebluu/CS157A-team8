<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="test.css">
</head>

<body>
    <header class="header">
        <a href="#" class="logo"><i class="fas fa-paw"></i> Pet Query</a>
        <div class="icons" onclick="location.href='http://localhost:8080/CS157A-team8/userLogin.jsp'">
            <div class="fas fa-user"></div>
        </div>
    </header>

    <div class="container">
        <div class="content">
            <h2>Add A New Pet</h2>

            <!-- check alert msg -->
            <%
                String alert = (String) request.getAttribute("alert");
                if (alert != null) {
            %>
                <div class="alert alert-danger" role="alert">
                    <%= alert %>
                </div>
            <%
                }
            %>

            <form action="AddPet" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="petID" class="form-label">Pet ID</label>
                    <input type="text" class="form-control" id="petID" name="petID" placeholder="Enter New Pet ID (xxx-xxxx-xxx)" required>
                </div>

                <div class="mb-3">
                    <label for="petName" class="form-label">Pet Name</label>
                    <input type="text" class="form-control" id="petName" name="petName" placeholder="Enter Pet Name" required>
                </div>

                <div class="mb-3">
                    <label for="age" class="form-label">Age</label>
                    <input type="text" class="form-control" id="age" name="age" placeholder="Enter Pet Age (years, months)" required>
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" class="form-control" id="category" name="category" placeholder="Enter Category: Dog & Puppies, Cat & Kittens, Rabbits, etc." required>
                </div>

                <div class="mb-3">
                    <label for="image" class="form-label">Upload Pet Image</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                </div>
                                
                <div class="button">
                    <button type="submit" class="btn1">Add Pet</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
