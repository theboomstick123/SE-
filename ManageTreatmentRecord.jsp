<%-- 
    Document   : Medrec
    Created on : 03 1, 23, 8:47:48 PM
    Author     : Goldworth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Treatment Record</title>
        
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}

            /* The Modal (background) */
            .modal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 1; /* Sit on top */
              padding-top: 100px; /* Location of the box */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              overflow: auto; /* Enable scroll if needed */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
              background-color: #fefefe;
              margin: auto;
              padding: 20px;
              border: 1px solid #888;
              width: 80%;
            }

            /* The Close Button */
            .close {
              color: #aaaaaa;
              float: right;
              font-size: 28px;
              font-weight: bold;
            }

            .close:hover,
            .close:focus {
              color: #000;
              text-decoration: none;
              cursor: pointer;
            }
            
            button{
                width: 5%;
                padding: 0.5em;
		margin-bottom: 1em;
		border-radius: 5px;
		border: 1px solid gray;
                background-color: lightgray;
            }
            .divButtons{
                text-align:center;
            }
            h1 {
			text-align: center;
		}

		form {
			width: 50%;
			margin: 0 auto;
			text-align: left;
			padding: 1em;
			border: 1px solid gray;
			border-radius: 10px;
		}
		label {
			width: 20%;
			display: inline-block;
			margin-bottom: 1em;
			font-weight: bold;
		}
		input[type="text"], input[type="submit"] {
			width: 60%;
			padding: 0.5em;
			margin-bottom: 1em;
			border-radius: 5px;
			border: 1px solid gray;
		}
		input[type="submit"] {
			width: auto;
			background-color: lightgray;
			cursor: pointer;
		}
                
                button[type="button"] {
			width: 60%;
			padding: 0.5em;
			margin-bottom: 1em;
			border-radius: 5px;
			border: 1px solid gray;
                        background-color: lightgray;
		}
                
                table {
                    border-collapse: collapse;
                    text-align: center;
                    
                }
        </style>

    </head>
    <body>
        <input type="submit" value="back"/>
        <br> <br> <br>
        
        
        <h1>Treatment Records</h1>
        
        <table class="list" id="patientList" align="center" style="width: 75%;">
            <thead>
                <tr>
                    <th><pre>Date</pre></th>
                    <th><pre>Tooth No./s</pre></th>
                    <th><pre>Procedure</pre></th>
                    <th><pre>Dentist/s</pre></th>
                    <th><pre>Amount Charged</pre></th>
                    <th><pre>Amount Paid</pre></th>
                    <th><pre>Balance</pre></th>
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <!-- where added info will be placed-->
            </tbody>
            
        </table> 
        
        <div class="divButtons">
            <button id="openModal" >Add row</button>
            <input type="submit" id="saveDoc" value="save"/>
        </div>
        
        <!-- Modal Block for Creating-->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                    <form onsubmit="event.preventDefault();onFormSubmit();" autocomplete="off">
                        <div class="modal-body">
                            <div>
                                <label>Date</label>
                                <input type="text" name="opDate" id="opDate">
                            </div>
                            <div>
                                <label>Tooth no./s</label>
                                <input type="text" name="teeth" id="teeth">
                            </div>
                            <div>
                                <label>Procedure</label>
                                <input type="text" name="procede" id="procede">
                            </div>
                            <div>
                                <label>Dentists</label>
                                <input type="text" name="dentist" id="dentist">
                            </div>
                            <div>
                                <label>Amount Charged</label>
                                <input type="text" name="AMC" id="AMC">
                            </div>
                            <div>
                                <label>Amount Paid</label>
                                <input type="text" name="AMP" id="AMP">
                            </div>
                            <div>
                                <label>Balance</label>
                                <input type="text" name="bal" id="bal">
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class ="form-action-buttons">
                                <input type="submit" value="submit">
                            </div>
                        </div>
                    </form>
            </div>
        </div>
        
        
         <!--modal create Script-->
        <script>
            <!-- get ID of Modal -->
           var modal = document.getElementById("myModal");
           
           <!--Get button to open Modal-->
           var btn = document.getElementById("openModal");
           
           var span = document.getElementsByClassName("close")[0];
            
            btn.onclick = function(){
                modal.style.display ="block";
            }
            
            span.onclick = function(){
                modal.style.display ="none";    
            }
            
            window.onclick = function(event){
                if (event.target == modal){
                    modal.style.display ="none";
                }
            }
           
        </script>
        
        
        <script>
            var selectedRow = null;
            function onFormSubmit(){
                var formData = readFormData();
                
                if (selectedRow == null){
                    insertNewRecord(formData);
                }
                else{
                    updateRecord(formData);
                }
            }
            
            

            function readFormData() {
                var formData = {};
                formData["opDate"] = document.getElementById("opDate").value;
                formData["teeth"] = document.getElementById("teeth").value;
                formData["procede"] = document.getElementById("procede").value;
                formData["dentist"] = document.getElementById("dentist").value;
                formData["AMC"] = document.getElementById("AMC").value;
                formData["AMP"] = document.getElementById("AMP").value;
                formData["bal"] = document.getElementById("bal").value;
                return formData;
            }
            
            //Inserts record into the row
            function insertNewRecord(data) {
                var table = document.getElementById("patientList").getElementsByTagName('tbody')[0];
                var newRow = table.insertRow(table.length);
                cell1 = newRow.insertCell(0);
                cell1.innerHTML = data.opDate;
                cell2 = newRow.insertCell(1);
                cell2.innerHTML = data.teeth;
                cell3 = newRow.insertCell(2);
                cell3.innerHTML = data.procede;
                cell4 = newRow.insertCell(3);
                cell4.innerHTML = data.dentist;
                cell5 = newRow.insertCell(4);
                cell5.innerHTML = data.AMC;
                cell6 = newRow.insertCell(5);
                cell6.innerHTML = data.AMP;
                cell7 = newRow.insertCell(6);
                cell7.innerHTML = data.bal;
                cell8 = newRow.insertCell(7);
                cell8.innerHTML = '<button id ="openEditModal" type="button" onclick="onEdit(this);">Edit</button>';
                cell9 = newRow.insertCell(8);
                cell9.innerHTML = '<input type="submit" value ="Delete" onclick="onDelete(this);">';
            }
            
            //Read selected row to put into edit text boxes
            function onEdit(td){
                selectedRow=td.parentElement.parentElement;
                document.getElementById("opDate").value = selectedRow.cells[0].innerHTML;
                document.getElementById("teeth").value = selectedRow.cells[1].innerHTML;
                document.getElementById("procede").value = selectedRow.cells[2].innerHTML;
                document.getElementById("dentist").value = selectedRow.cells[3].innerHTML;
                document.getElementById("AMC").value = selectedRow.cells[4].innerHTML;
                document.getElementById("AMP").value = selectedRow.cells[5].innerHTML;
                document.getElementById("bal").value = selectedRow.cells[6].innerHTML;
                
                openModal();
                closeModal();
            }
            
            function updateRecord(formData){
                selectedRow.cells[0].innerHTML = formData.opDate;
                selectedRow.cells[1].innerHTML = formData.teeth;
                selectedRow.cells[2].innerHTML = formData.procede;
                selectedRow.cells[3].innerHTML = formData.dentist;
                selectedRow.cells[4].innerHTML = formData.AMC;
                selectedRow.cells[5].innerHTML = formData.AMP;
                selectedRow.cells[6].innerHTML = formData.bal;
            }
            
            //open edit modal
            function openModal() {
                //document.getElementById("backdrop").style.display = "block"
                document.getElementById("myModal").style.display = "block";
                document.getElementById("myModal").classList.add("show");
            }
            
            function onDelete(td){
            if(confirm('Delete this record?'))
                {
                    row = td.parentElement.parentElement;
                    document.getElementbyId("patientList").deleteRow(row.rowIndex);
                }
            }

        </script>
    </body>
</html>
