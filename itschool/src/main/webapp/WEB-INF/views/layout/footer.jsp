<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<section class="footer">		
			<footer>
				<div class="container">	
					<div class="row">
						<div class="col-sm-8 col-xs-9">
							<p class="right-color">&copy; Copyright 2016. All rights reserved by <a href="http://gaedak.tistory.com/" target="_blank">gaeDak</a></p>
						</div>
						<div class="col-sm-4 col-xs-3" align="right">
							<a href="#" id="back-to-top" class="top text-right" >TOP <i class="fa fa-angle-up" aria-hidden="true"></i> </a>
						</div>
					</div>
				</div>											
			</footer>
		</section>
				<!--  ===== Scroll to Top ====  -->
	    <script>
			if ($('#back-to-top').length) {
			    $('#back-to-top').on('click', function (e) {
			        e.preventDefault();
			        $('html,body').animate({
			            scrollTop: 0
			        }, 700);
			    });
			}
		</script>
</body>
</html>