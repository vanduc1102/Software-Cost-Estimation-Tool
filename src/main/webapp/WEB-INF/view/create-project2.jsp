<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
		<title>Welcome</title>
 <!-- Bootstrap Core CSS -->
 <link rel="stylesheet"
	href='<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>'>

    <!-- MetisMenu CSS -->
    <link rel="stylesheet"
	href='<c:url value="/resources/vendor/metisMenu/metisMenu.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/sb-admin-2.css"/>'>
    <!-- Custom CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/morrisjs/morris.css"/>'>
    <!-- Morris Charts CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.min.css"/>'>
	<link rel="stylesheet"
	href='<c:url value="/resources/css/jquery.sweet-modal.min.css"/>'>
    <!-- Custom Fonts -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap Date-Picker Plugin -->
</head>
	<script type="text/javascript">
		function showNFR(){
			$("#nfr").show();
			$("#fr").hide();
			$("#sc").hide();
		}
		function showFR(){
			$("#fr").show();
			$("#nfr").hide();
			$("#sc").hide();
		}
		function showSC(){
			$("#sc").show();
			$("#fr").hide();
			$("#nfr").hide();
		}
	</script>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
           <jsp:include page="header.jsp"/>
            <!-- /.navbar-top-links -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/softwaretool/dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#" onclick="showNFR();"><i class="fa fa-edit fa-fw"></i> Non-Functional Requirement</a>
                        </li>
                        <li>
                            <a href="#" onclick="showFR();"><i class="fa fa-edit fa-fw" onclick="showFR(fr);"></i> Functional Requirement</a>
                        </li>
			<li>
                            <a href="#" onclick="showSC();"><i class="fa fa-edit fa-fw" onclick="return showSC();"></i> System Constrain</a>
                        </li>
            
                        
                     
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
           <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Create Project</h4>
                    <c:if test="${not empty success}">
	                    <div class="alert alert-success">
	                    	${success}
	                    </div>
                    </c:if>
                     <c:if test="${not empty error}">
	                    <div class="alert alert-danger">
	                    	${error}
	                    </div>
                    </c:if>
                    <div class="row">
                    			<div class="col-lg-4 pull-right">
	                    			<a href="/softwaretool/dashboard" class="btn btn-primary">Back to Dashboard</a>
	                    			 <a class="btn btn-danger" onclick="return deleteProject(${project.id})">Delete Project</a>
	                    			<br>
                    			</div>
                                <div class="col-lg-6">
                                    <form>
                                        <div class="form-group">
                                        	<textarea class="form-control" rows="1">${project.name}</textarea>
                                        </div>
                                        <div class="row">
                                			<div class="col-lg-6">
		                                        <div class="form-group">
		                                            <label>Start Date</label>
		                                            <fmt:formatDate value="${project.startDate}" var="startDate" pattern="MM/dd/yyyy" />
		                                            <input class="form-control date" id="start" name="start"  type="text" value="${startDate}"/>
		                                        </div>
		                                     </div>
                                			<div class="col-lg-6">
		                                        <div class="form-group">
		                                            <label>End Date</label>
		                                            <fmt:formatDate value="${project.endDate}" var="endDate" pattern="MM/dd/yyyy" />
		                                            <input class="form-control date" id="end" name="end" type="text" value="${endDate}"/>
		                                        </div>
		                                     </div>
		                                     <div class="col-lg-12">
		                                        <div class="form-group">
		                                            <label>Description</label>
		                                            <textarea class="form-control" rows="2">${project.description}</textarea>
		                                        </div>
		                                     </div>
		                                </div>
                                  	</form>
                                  </div>
                     </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row" id="nfr">
                <div class="col-lg-12">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            Non-functional Requirement
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form modelAttribute="nonFunctionalReq" method="POST" action="save-step-2">
                                        <input type="hidden" value="${nonFunctionalReq.project.id}" name="projectId"/>
                                        <form:hidden path="id" value="${nonFunctionalReq.id}" id="nonFunctionalReqId"/>
                                        <form:hidden path="counter" value="${nonFunctionalReq.counter}"/>
                                        <form:hidden path="key" value="${nonFunctionalReq.key}"/>
                                        <div class="form-group">
                                            <label>Quality Attribute</label>
                                            <form:select class="form-control" path="qualityAttribute">
                                                <form:option  value="AVAILABILITY" >AVAILABILITY</form:option>
                                                <form:option  value="SECURITY" >SECURITY</form:option>
                                                <form:option  value="PERFORMANCE" >PERFORMANCE</form:option>
                                                <form:option  value="MODIFIABILITY" >MODIFIABILITY</form:option>
                                                <form:option  value="TESTABILITY" >TESTABILITY</form:option>
                                                <form:option  value="USABILITY" >USABILITY</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Source</label>
                                            <form:select class="form-control" path="source">
                                                <form:option value="Internal to system">Internal to system</form:option>
                                                <form:option value="External to system">External to system</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Stimulus</label>
                                            <form:select class="form-control" path="stimulus">
                                                <form:option value="Crash">Crash</form:option>
                                                <form:option value="Omission">Omission</form:option>
                                                <form:option value="Timing">Timing</form:option>
                                                <form:option value="No response">No response</form:option>
                                                <form:option value="Incorrect response">Incorrect response</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Environment</label>
                                            <form:select class="form-control" path="environment">
                                                <form:option value="Normal operation">Normal operation</form:option>
                                                <form:option value="Startup">Startup</form:option>
                                                <form:option value="Shutdown">Shutdown</form:option>
                                                <form:option value="Repair mode">Repair mode</form:option>
                                                <form:option value="Degraded (failsafe) mode">Degraded (failsafe) mode</form:option>
                                                <form:option value="Overloaded operation">Overloaded operation</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Response</label>
                                            <form:select class="form-control" path="response">
                                                <form:option value="Prevent the failure">Prevent the failure</form:option>
                                                <form:option value="Log the failure">Log the failure</form:option>
                                                <form:option value="Notify users / operators">Notify users / operators</form:option>
                                                <form:option value="Disable source of failure">Disable source of failure</form:option>
                                                <form:option value="Temporarily unavailable">Temporarily unavailable</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Measure</label>
                                            <form:select class="form-control" path="measure">
                                                <form:option value="Time interval available">Time interval available</form:option>
                                                <form:option value="Availability %">Availability %</form:option>
                                                <form:option value="Detection time">Detection time</form:option>
                                                <form:option value="Repair time">Repair time</form:option>
                                                <form:option value="Degraded mode time interval">Degraded mode time interval</form:option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Description if/any</label>
                                            <form:textarea class="form-control" rows="2" path="description"></form:textarea>
                                        </div>
                                        <form:button type="submit" class="btn btn-primary">Save</form:button>
                                        <form:button type="reset" class="btn btn-default">Reset</form:button>
										<button id="deleteNonFunReq" class="btn btn-danger" disabled onclick="return deleteNFR()">Delete non-functional requirement</button>
                                    </form:form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                             <div class="col-lg-4 pull-right">
                             	<div class="panel panel-default">
		                        <div class="panel-heading">
		                           List of NFR
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <div class="list-group">
		                            	<c:forEach items="${nonFunctionalReqs}" var="nonFunctionalReq" >
		                            		<a class="list-group-item" onclick="return editNonFunctionalReq(${nonFunctionalReq.id})">
		                                    	${nonFunctionalReq.qualityAttribute}
		                                	</a>
		                            	</c:forEach>
		                            </div>
		                            <!-- /.list-group -->
<!-- 		                            <a href="#" class="btn btn-default btn-block">View All NFR</a> -->
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
                            </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        <div class="row" id="fr" style="display: none;">
                <div class="col-lg-12">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            Functional Requirement
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form modelAttribute="functionalReq" action="save-functional-req" method="POST" >
                                    	<input type="hidden" value="${functionalReq.project.id}" name="projectId"/>
                                    	 <form:hidden path="id" value="${nonFunctionalReq.id}" id="functionalReqId"/>
                                        <form:hidden path="counter" value="${nonFunctionalReq.counter}"/>
                                        <form:hidden path="key" value="${nonFunctionalReq.key}"/>
                                    	<div class="form-group">
                                            <label>Name of Requirement</label>
                                            <form:textarea path="name" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <form:textarea path="description" class="form-control" rows="3"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>References</label>
                                            <form:textarea path="references" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Prerequisites</label>
                                            <form:textarea path="prerequisites" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Relation to Non functional requirement</label>
                                            <form:select path="nonFunctionalReq" class="form-control">
                                            		<form:option value="" label="--Please Select"/>
                                            		<c:forEach items="${nonFunctionalReqs}" var="nonFunctionalReq">
											            <option <c:if test="${nonFunctionalReq.id eq functionalReq.nonFunctionalReq.id}">selected="selected"</c:if>    value="${nonFunctionalReq.id}">${nonFunctionalReq.qualityAttribute} </option>
											        </c:forEach>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Relation to Functional requirement</label>
                                            <select name="relatedFunctionalReq">
                                            	<option value="0" label="--- Select ---"/>
                                            	 <c:forEach items="${functionalReqs}" var="functionalReq">
                                            	 	<option value="${functionalReq.id}" label="${functionalReq.name}"/>
				                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Type of requirement</label>
                                            <form:select path="typeOfReq" class="form-control">
                                                <form:option value="Functional">Functional</form:option>
                                                <form:option value="User Interface">User Interface</form:option>
                                                <form:option value="Other">Other</form:option>
                                            </form:select>
                                        </div>
                                        <form:button type="submit" class="btn btn-primary">Save</form:button>
                                        <form:button type="reset" class="btn btn-default">Reset</form:button>
										<button id="deleteFunReq" class="btn btn-danger" disabled>Delete functional requirement</button>
                                    </form:form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-4 pull-right">
                             	<div class="panel panel-default">
		                        <div class="panel-heading">
		                           List of FR
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <div class="list-group">
		                                <c:forEach items="${functionalReqs}" var="functionalReq">
		                            		<a class="list-group-item" onclick="return editFunctionalReq(${functionalReq.id})">
		                                    	${functionalReq.name}
		                                	</a>
		                            	</c:forEach>
		                            </div>
		                            <!-- /.list-group -->
<!-- 		                            <a href="#" class="btn btn-default btn-block">View All NFR</a> -->
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
                            </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row" id="sc" style="display: none;">
                <div class="col-lg-12">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            System Constrain
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form modelAttribute="systemConstrain" action="save-system-constrain" method="POST">
                                    <input type="hidden" value="${functionalReq.project.id}" name="projectId"/>
                                    	<div class="form-group">
                                            <label>Software Requirement</label>
                                            <form:textarea path="softwareRequirement" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Hardware Requirement</label>
                                            <form:textarea path="hardwareRequirement" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Network Requirement</label>
                                            <form:textarea path="networkRequirement" class="form-control" rows="1"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Any other requirement</label>
                                            <form:textarea path="otherRequirement" class="form-control" rows="1"></form:textarea>
                                        </div>
                                       
                                        <form:button type="submit" class="btn btn-primary">Save</form:button>
                                        <form:button type="reset" class="btn btn-default">Reset</form:button>
										<button type="submit" class="btn btn-danger">Delete</button>
                                    </form:form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-4 pull-right">
                             	<div class="panel panel-default">
		                        <div class="panel-heading">
		                           List of SC
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <div class="list-group">
		                                 <c:forEach items="${systemConstrains}" var="systemConstrain">
		                            		<a href="#" class="list-group-item">
		                                    	${systemConstrain.id}
		                                	</a>
		                            	</c:forEach>
		                            </div>
		                            <!-- /.list-group -->
<!-- 		                            <a href="#" class="btn btn-default btn-block">View All NFR</a> -->
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
                            </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
    </div>
   </div>
   <script type="text/javascript">
	 function editNonFunctionalReq(id){
	 $.ajax({
		    url : '/softwaretool/project/getNonFunctionalReq/'+id,
		    type : 'GET',
		    dataType:'json',
		    success : function(data) {         
		    	$('#nonFunctionalReqId').val(data.id);
		    	$('[name="counter"]').val(data.counter);
		    	$('[name="key"]').val(data.key);
		        $('[name="qualityAttribute"]').val(data.qualityAttribute);
		        $('[name="source"]').val(data.source);
		        $('[name="stimulus"]').val(data.stimulus);
		        $('[name="environment"]').val(data.environment);
		        $('[name="response"]').val(data.response);
		        $('[name="measure"]').val(data.measure);
		        $('[name="description"]').val(data.description);
		        $("#deleteNonFunReq").removeAttr('disabled');
		    },
		    error : function(request,error)
		    {
		        console.log("Request: "+JSON.stringify(request));
		    }
		});
	 }

	 function editFunctionalReq(id){
		 $.ajax({
			    url : '/softwaretool/project/getFunctionalReq/'+id,
			    type : 'GET',
			    dataType:'json',
			    success : function(data) {         
			    	$('#functionalReqId').val(data.id);
			        $('[name="counter"]').val(data.counter);
			    	$('[name="key"]').val(data.key);
			        $('[name="name"]').val(data.name);
			        $('[name="description"]').val(data.description);
			        $('[name="references"]').val(data.references);
			        $('[name="prerequisites"]').val(data.prerequisites);
			       // $('[name="nonFunctionalReq"]').val(data.nonFunctionalReq.qualityAttribute);
			        $('[name="typeOfReq"]').val(data.typeOfReq);
			        $("#deleteFunReq").removeAttr('disabled');
			    },
			    error : function(request,error){
			        console.log("Request: "+JSON.stringify(request));
			    }
			});
		 }
		function deleteProject(id){
			$.sweetModal.confirm('Delete the project?', 'Are you sure you want to delete this project?', function() {
				$.ajax({
				    url : '/softwaretool/project/delete/'+id,
				    type : 'PUT',
				    success : function(data) {  
					    if(data=="success"){    
					    	$.sweetModal('Project is deactivated! you can activate later!!'); 
				    		window.location.href = '/softwaretool/project/list'; 
					    }else{
					    	$.sweetModal("error, try again!");	
							
						 }
				    },
				    error : function(request,error){
				        console.log("Request: "+JSON.stringify(request));
				    }
				});
			}, function() {
				//$.sweetModal('You declined. That\'s okay!');
			});
		}
		function deleteNFR(){
			var id = $('#nonFunctionalReqId').val();
			$.sweetModal.confirm('Delete the non functional requirement?', 'Are you sure you want to delete this requirement?', function() {
				$.ajax({
				    url : '/softwaretool/project/deleteNonFR/'+id,
				    type : 'PUT',
				    success : function(data) {  
					    if(data=="success"){    
				    		window.location.href = '/softwaretool/project/list'; 
					    }else{
					    	$.sweetModal("error,"+data);	
							
						 }
				    },
				    error : function(request,error){
				        console.log("Request: "+JSON.stringify(request));
				    }
				});
			}, function() {
				//$.sweetModal('You declined. That\'s okay!');
			});
			
			}
   </script>
    <!-- /#wrapper -->
<jsp:include page="footer.jsp"/>]
</body>

</html>