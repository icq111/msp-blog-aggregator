<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>


<h1>${user.name}</h1>

<c:forEach items="${user.blogs}" var="blog">
	<h2>${blog.name}</h2>
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Nazwa</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${blog.items}" var="item">
				<tr>
					<td>${item.name}</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>

</c:forEach>