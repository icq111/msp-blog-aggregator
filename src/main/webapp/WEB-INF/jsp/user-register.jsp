<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<c:if test="${param.success eq true}">
	<div class="alert alert-success">REGISTERED SUCCESSFULLY</div>
</c:if>

<form:form commandName="user"
	cssClass="form-horizontal registrationForm">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label"> Name: </label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" />
			<form:errors path="name" />
		</div>
	</div>

	<div class="form-group">
		<label for="email" class="col-sm-2 control-label"> Email: </label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email" />
		</div>
	</div>

	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">
			Password: </label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" />
			<form:errors path="password" />
		</div>
	</div>
		<div class="form-group">
		<label for="password" class="col-sm-2 control-label">
			Repeat password: </label>
		<div class="col-sm-10">
			<input type="password" name="repeatPassword" id="repeatPassword" class="form-control" />
			
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-2">
			<input type="submit" value="Zapisz" class="btn btn-lg btn-primary" />
		</div>
	</div>
</form:form>
<script type="text/javascript">
	$(document).ready(function() {
		$(".registrationForm").validate({
			rules : {
				name : {
					required : true,
					minlength : 3,
					remote : {
						url: "<spring:url value = '/register/available.html' />",
						type : "get",
						data : {
							username: function() {
								return $("#name").val();
							}
						}
					}
				},
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 3
				},
				repeatPassword : {
					required : true,
					minlength : 3,
					equalTo : "#password"
				}
			},
			highlight: function(element) {
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
			}, 
			messages : {
				name : {
					remote : "Such user exist in DB now!"
				}
			}
		});
	});
</script>


