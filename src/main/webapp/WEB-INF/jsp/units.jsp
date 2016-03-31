<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
	data-target="#myModal">Add new unit</button>

<br>
<c:if test="${success eq true}">
<br>
	<div class="alert alert-success">UNIT ADDED SUCCESSFULLY</div>
</c:if>
<form:form commandName="unit" cssClass="form-horizontal">

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New unit</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="shortName" class="col-sm-2 control-label">Code:</label>
						<div class="col-sm-10">
							<form:input path="shortName" cssClass="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name:</label>
						<div class="col-sm-10">
							<form:input path="name" cssClass="form-control" />
						</div>
					</div>
					
										<div class="form-group">
						<label for="converter" class="col-sm-2 control-label">Converter:</label>
						<div class="col-sm-10">
							<form:input path="converter" cssClass="form-control" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" value="Save" class="btn btn-lg btn-primary" />
				</div>
			</div>
		</div>
	</div>

</form:form>


<br />
<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Kod</th>
			<th>Nazwa</th>
			<th>przelicznik</th>
			<th>Data dodania</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${units}" var="unit">
			<tr>
				<td>${unit.shortName}</td>
				<td>${unit.name}</td>
				<td>${unit.converter}</td>
				<td>${unit.insertDate}</td>

			</tr>

		</c:forEach>
	</tbody>
</table>