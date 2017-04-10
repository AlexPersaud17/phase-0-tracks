$(document).ready(function(){
        $(document).keydown(function(key) {
        switch(key.which) {
			// Left Arrow
			case 37:
				$('#mario').animate({left: "-=50px"}, 30);
				break;
			// Up Arrow
			case 38:
				$('#mario').animate({top: "-=50px"}, 30);
				break;
			// Right Arrow
			case 39:
				$('#mario').animate({left: "+=50px"}, 30);
				break;
			// Down Arrow
			case 40:
				$('#mario').animate({top: "+=50px"}, 30);
				break;
		}
	});
});
