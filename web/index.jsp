<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Balance Search</title>
        <link href="component/component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="component/component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <h1 style="text-align: center;color:blue;">Bank Account Balance</h1>

        <div class="col-sm-4">
            <form action="" id="formAccount"> 
                <div align="left">  
                    <label>Account No</label>
                    <input type="text" class="form-control" id="accno" name="accno" size="30px" required />
                </div>

                <div align="left">  
                    <label>Holder Name</label>
                    <input type="text" class="form-control" id="accname" name="accname" size="30px" required />
                </div>  

                <div align="left">  
                    <label>Balance</label>
                    <input type="text" class="form-control" id="balance" name="balance" size="30px" required />
                </div> 
                <br/>
                <div align="left">  
                    <button type="button" class="btn btn-info" id="save" onclick="search()">Search</button>
                </div> 
            </form>
        </div>
        <script src="component/component/jquery/jquery.js" type="text/javascript"></script>
        <script src="component/component/jquery/jquery.min.js" type="text/javascript"></script>
        
        <script>
            
            function search()
            {
                
                $.ajax({
                    
                    type: 'post',
                    url:'search.jsp',
                    data: {"ano": $("#accno").val()},
                    
                    success: function(msg)
                    {
                        var obj = JSON.parse(msg);
                        $("#accname").val(obj[0].name);
                        $("#balance").val(obj[0].balance);
                        
                    },
                    
                    error: function(xhr)
                    {
                        alert("error");
                    }
                });
            }
            
        </script>
        
    </body>
</html>
