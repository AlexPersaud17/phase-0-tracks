console.log("script test");

function minimize(event){
	event.target.width = "200";
	event.target.height = "200";
	var h1_tag = document.createElement("h1");
	var h1_text = document.createTextNode("It's a-ME!");
	h1_tag.appendChild(h1_text);
	console.log(h1_tag);
	document.body.appendChild(h1_tag);     
}
var photo = document.getElementById("mario");
photo.addEventListener("click", minimize);
