<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="main.Model.EmployeeRefDocuments" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .category {
      margin-bottom: 20px;
    }

    .category-title {
      font-weight: bold;
      font-size: 20px;
      margin-bottom: 10px;
    }

    .document {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .document-name {
      margin-right: 10px;
    }

    .document-link {
      color: blue;
      text-decoration: underline;
      cursor: pointer;
    }
    
    .category-select {
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <h1>Reference Documents</h1>
	 <% 
	 List<EmployeeRefDocuments> er = ( List<EmployeeRefDocuments> ) request.getAttribute("document");
	 String imagePath = request.getContextPath() + "/";%> 
	 
<div class="category-select">
  <label for="category">Select Category:</label>
  <select id="category" name="category" onchange="filterDocumentsByCategory()">
    <option value="all">All Categories</option>
    <option value="employee-handbook">Employee Handbook</option>
    <option value="code-of-conduct">Code of Conduct</option>
    <!-- Add more category options here -->
  </select>
</div>

<div class="category" id="employee-handbook">
  <div class="category-title">Employee Handbook</div>
   <%String m = "Employee Handbook";
for(EmployeeRefDocuments doc : er) {
    if(doc.getCategory().equals(m)) {%>
    <div class="document">
      <%= doc.getDocName() %>&nbsp;&nbsp;
      <div class="document-link" onclick="openDocument('<%= doc.getDocName() %>')">View</div>&nbsp;&nbsp;
      <div class="document-link" onclick="deleteDocument('<%= doc.getId() %>')">Delete</div>
    </div>
  <% }} %>
</div>

<div class="category" id="code-of-conduct">
  <div class="category-title">Code of Conduct</div>
 <%String n = "Code of Conduct";
for(EmployeeRefDocuments doc : er) {
    if(doc.getCategory().equals(n)) {%>
    <div class="document">
      <%= doc.getDocName() %>&nbsp;&nbsp;
      <div class="document-link" onclick="openDocument('<%= doc.getDocName() %>')">View</div>&nbsp;&nbsp;
      <div class="document-link" onclick="deleteDocument('<%= doc.getId() %>')">Delete</div>
    </div>
  <% }} %>
</div>

  <div class="add-button">
    <a href="addReferenceDocument">Add Document</a>
  </div>
  
  <script>
  function filterDocumentsByCategory() {
	  var category = document.getElementById("category").value;
	  
	  // Show/hide the corresponding categories based on the selected option
	  if (category === "all") {
	    document.getElementById("code-of-conduct").style.display = "block";
	    document.getElementById("employee-handbook").style.display = "block";
	    // Add more category elements here if needed
	  } else if (category === "employee-handbook") {
	    document.getElementById("code-of-conduct").style.display = "none";
	    document.getElementById("employee-handbook").style.display = "block";
	    // Hide other category elements if needed
	  } else if (category === "code-of-conduct") {
	    document.getElementById("code-of-conduct").style.display = "block";
	    document.getElementById("employee-handbook").style.display = "none";
	    // Hide other category elements if needed
	  }
	  // Add more category conditions here if needed
	}

    function openDocument(documentPath) {
    	  // Replace with your logic to open the document
    	  console.log('Opening document:', documentPath);
    	  window.location.href = '<%= imagePath %>' + documentPath;
    	}

    function deleteDocument(documentId) {
    	  // Perform an AJAX request to delete the document
    	  // Replace 'your-delete-endpoint' with the actual endpoint URL for deleting a document
    	  // You may need to include additional logic or parameters based on your backend implementation

    	  fetch('/deleteReferenceDocument', {
    	    method: 'GET',
    	    headers: {
    	      'Content-Type': 'application/json',
    	    },
    	    body: JSON.stringify({ documentId: documentId }),
    	  })
    	    .then((response) => response.json())
    	    .then((data) => {
    	      // Handle the response after deleting the document
    	     // you can show a success message, update the UI, or refresh the document list
    	      console.log('Document deleted:', data);
    	      showMessage('Document deleted successfully.');
    	      updateUI(documentId); 
    	    })
    	    .catch((error) => {
    	      console.error('Error deleting document:', error); // Handle any errors that occur during the deletion process
    	      showMessage('Error deleting document. Please try again.');
    	    });
    	}
    function showMessage(message) {
    	  // Assuming you have a message element in your HTML, e.g., <div id="message"></div>
    	  const messageElement = document.getElementById('message');
    	  messageElement.textContent = message;
    	  messageElement.style.display = 'block';
    	}
    function updateUI(documentId) {
    	const documentElement = document.getElementById(documentId);// Find the document element to be removed
        if (documentElement) {
          documentElement.remove();    // Remove the document element from the DOM
          refreshPage();
        }
    	}
    function refreshPage() {	
  	  location.reload();  // Reload the current page
  	}

  </script>
</body>
</html>
