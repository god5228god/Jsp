/*
function actionShow()
{
	let menu = document.getElementById("menuTable");

	menu.style.display = "block";
}

function actionHide()
{
	let menu = document.getElementById("menuTable");

	menu.style.display ="none";
	
}*/

function myMenu(status){
	
	// alert(status);
	let menu = document.getElementById("menuTable");

	if(status ==1){
		menu.style.display = "block";
		
	}else{
		menu.style.display ="none";
	}
}