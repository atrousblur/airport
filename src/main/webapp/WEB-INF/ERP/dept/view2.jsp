<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
#left ul.nav {
	margin-bottom: 2px;
	font-size: 12px; /* to change font-size, please change instead .lbl */
}

#left ul.nav ul, #left ul.nav ul li {
	list-style: none !important;
	list-style-type: none !important;
	margin-top: 1px;
	margin-bottom: 1px;
}

#left ul.nav ul {
	padding-left: 0;
	width: auto;
}

#left ul.nav ul.children {
	padding-left: 12px;
	width: auto;
}

#left ul.nav ul.children li {
	margin-left: 0px;
}

#left ul.nav li a:hover {
	text-decoration: none;
}

#left ul.nav li a:hover .lbl {
	color: #999 !important;
}

#left ul.nav li.current>a .lbl {
	background-color: #999;
	color: #fff !important;
}

/* parent item */
#left ul.nav li.parent a {
	padding: 0px;
	color: #ccc;
}

#left ul.nav>li.parent>a {
	border: solid 1px #999;
	text-transform: uppercase;
}

#left ul.nav li.parent a:hover {
	background-color: #fff;
	-webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	-moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
}

/* link tag (a)*/
#left ul.nav li.parent ul li a {
	color: #222;
	border: none;
	display: block;
	padding-left: 5px;
}

#left ul.nav li.parent ul li a:hover {
	background-color: #fff;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

/* sign for parent item */
#left ul.nav li .sign {
	display: inline-block;
	width: 14px;
	padding: 5px 8px;
	background-color: transparent;
	color: #fff;
}

#left ul.nav li.parent>a>.sign {
	margin-left: 0px;
	background-color: #999;
}

/* label */
#left ul.nav li .lbl {
	padding: 5px 12px;
	display: inline-block;
}

#left ul.nav li.current>a>.lbl {
	color: #fff;
}

#left ul.nav  li a .lbl {
	font-size: 12px;
}

/* THEMATIQUE
------------------------- */
/* theme 1 */
#left ul.nav>li.item-1.parent>a {
	border: solid 1px #ff6307;
}

#left ul.nav>li.item-1.parent>a>.sign, #left ul.nav>li.item-1 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ff6307;
}

#left ul.nav>li.item-1 .lbl {
	color: #ff6307;
}

#left ul.nav>li.item-1 li.current>a .lbl {
	background-color: #ff6307;
	color: #fff !important;
}

/* theme 2 */
#left ul.nav>li.item-8.parent>a {
	border: solid 1px #51c3eb;
}

#left ul.nav>li.item-8.parent>a>.sign, #left ul.nav>li.item-8 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #51c3eb;
}

#left ul.nav>li.item-8 .lbl {
	color: #51c3eb;
}

#left ul.nav>li.item-8 li.current>a .lbl {
	background-color: #51c3eb;
	color: #fff !important;
}

/* theme 3 */
#left ul.nav>li.item-15.parent>a {
	border: solid 1px #94cf00;
}

#left ul.nav>li.item-15.parent>a>.sign, #left ul.nav>li.item-15 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #94cf00;
}

#left ul.nav>li.item-15 .lbl {
	color: #94cf00;
}

#left ul.nav>li.item-15 li.current>a .lbl {
	background-color: #94cf00;
	color: #fff !important;
}

/* theme 4 */
#left ul.nav>li.item-22.parent>a {
	border: solid 1px #ef409c;
}

#left ul.nav>li.item-22.parent>a>.sign, #left ul.nav>li.item-22 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ef409c;
}

#left ul.nav>li.item-22 .lbl {
	color: #ef409c;
}

#left ul.nav>li.item-22 li.current>a .lbl {
	background-color: #ef409c;
	color: #fff !important;
}
</style>
<script type="text/javascript">
	!function($) {

		// Le left-menu sign
		/* for older jquery version
		$('#left ul.nav li.parent > a > span.sign').click(function () {
		    $(this).find('i:first').toggleClass("icon-minus");
		}); */

		$(document).on("click", "#left ul.nav li.parent > a > span.sign",
				function() {
					$(this).find('i:first').toggleClass("icon-minus");
				});

		// Open Le current menu
		$("#left ul.nav li.parent.active > a > span.sign").find('i:first')
				.addClass("icon-minus");
		$("#left ul.nav li.current").parents('ul.children').addClass("in");

	}(window.jQuery);
</script>
</head>
<body>
<div class="content">
	<div class="row">
		<div id="left" class="span3">
            <ul id="menu-group-1" class="nav menu">  
                <li class="item-1 deeper parent active">
                    <a class="" href="#">
                        <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-1" class="sign"><i class="icon-plus icon-white"></i></span>
                        <span class="lbl">Menu Group i</span>                      
                    </a>
                    <ul class="children nav-child unstyled small collapse" id="sub-item-1">
                        <li class="item-2 deeper parent active">
                            <a class="" href="#">
                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-2" class="sign"><i class="icon-plus icon-white"></i></span>
                                <span class="lbl">Menu 1</span> 
                            </a>
                            <ul class="children nav-child unstyled small collapse" id="sub-item-2">
                                <li class="item-3 current active">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 1.1</span> (current menu)
                                    </a>
                                </li>
                                <li class="item-4">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 1.2</span> 
                                    </a>
                                </li>                                
                            </ul>
                        </li>
                        <li class="item-5 deeper parent">
                            <a class="" href="#">
                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-5" class="sign"><i class="icon-plus icon-white"></i></span>
                                <span class="lbl">Menu 2</span> 
                            </a>
                            <ul class="children nav-child unstyled small collapse" id="sub-item-5">
                                <li class="item-6">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 2.1</span>                                    
                                    </a>
                                </li>
                                <li class="item-7">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 2.2</span>                                    
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li class="item-8 deeper parent">
                    <a class="" href="#">
                        <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-8" class="sign"><i class="icon-plus icon-white"></i></span>
                        <span class="lbl">Menu Group ii</span>                      
                    </a>
                    <ul class="children nav-child unstyled small collapse" id="sub-item-8">
                        <li class="item-9 deeper parent">
                            <a class="" href="#">
                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-9" class="sign"><i class="icon-plus icon-white"></i></span>
                                <span class="lbl">Menu 1</span> 
                            </a>
                            <ul class="children nav-child unstyled small collapse" id="sub-item-9">
                                <li class="item-10">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 1.1</span>
                                    </a>
                                </li>
                                <li class="item-11">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 1.2</span> 
                                    </a>
                                </li>                                
                            </ul>
                        </li>
                        <li class="item-12 deeper parent">
                            <a class="" href="#">
                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-12" class="sign"><i class="icon-plus icon-white"></i></span>
                                <span class="lbl">Menu 2</span> 
                            </a>
                            <ul class="children nav-child unstyled small collapse" id="sub-item-12">
                                <li class="item-13">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 2.1</span>                                    
                                    </a>
                                </li>
                                <li class="item-14">
                                    <a class="" href="#">
                                        <span class="sign"><i class="icon-play"></i></span>
                                        <span class="lbl">Menu 2.2</span>                                    
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>    			
            </ul>          
		</div>
	</div>
</div>
</body>
</html>