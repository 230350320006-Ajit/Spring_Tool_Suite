/*Validation*/

function validate() {
	const spcregex = /[`!@#$%^&*()_+\-=\[\]{};\\|,.<>\/?~]/;
	const mobregex = /^[6-9]{1}[0-9]{9}$/;
	const passregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

	if (checkInputs("iflat", "errmsgflat",
		"Flat Number must be selected")) {

		if (checkInputs("iname", "errmsgname1",
			"Name should not be Null")) {
			if (document.getElementById("iname").value.length >= 2
				&& document.getElementById("iname").value.length <= 30) {
				if (!document.getElementById("iname").value
					.match(spcregex)) {
					document.getElementById("iname").style.border = "2px solid green";
					document.getElementById("errmsgname1").style.display = "none";
					if (checkInputs("iemail", "errmsgemail",
						"Email Address should not be null")) {
						if (checkEmail("iemail", "errmsgemail")) {
							if (checkInputs("imob", "errmsgmob",
								"Mobile Number should not be null")) {
								if (document.getElementById("imob").value.length == 10) {
									if (document.getElementById("imob").value
										.match(mobregex)) {
										if (checkInputs("imem",
											"errmsgmem",
											"Members field should not be Null")) {
											if (checkInputs("ipass",
												"errmsgpass",
												"Please Enter Password")) {
												if (document
													.getElementById("ipass").value
													.match(passregex)) {
													document
														.getElementById("ipass").style.borderborder = "2px solid green";
													document
														.getElementById("errmsgpass").style.display = "none";
													return true;
												} else {
													document
														.getElementById("ipass").style.borderborder = "2px solid red";
													document
														.getElementById("errmsgpass").innerText = "Password between 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character";
													document
														.getElementById("errmsgpass").style.display = "block";
												}
											}
										}
									} else {
										document.getElementById("imob").style.borderborder = "2px solid red";
										document
											.getElementById("errmsgmob").innerText = "Enter valid mobile number";
										document
											.getElementById("errmsgmob").style.display = "block";
									}

								} else {
									document.getElementById("imob").style.borderborder = "2px solid red";
									document
										.getElementById("errmsgmob").innerText = "Mobile Number length must be 10";
									document
										.getElementById("errmsgmob").style.display = "block";
								}
							}
						}
					}
				} else {
					document.getElementById("iname").style.borderborder = "2px solid red";
					document.getElementById("errmsgname1").innerText = "Name Should not contain special Character";
					document.getElementById("errmsgname1").style.display = "block";
				}

			} else {
				document.getElementById("iname").style.borderborder = "2px solid red";
				document.getElementById("errmsgname1").innerText = "Name range must be in between 2 to 30 characters";
				document.getElementById("errmsgname1").style.display = "block";
			}

		}
	}
	return false;

}

function checkInputs(fieldId, errorId, msg) {
	const val = document.getElementById(fieldId).value.trim();
	if (val === "") {
		document.getElementById(fieldId).style.border = "2px solid red";
		document.getElementById(errorId).innerText = msg;
		document.getElementById(errorId).style.display = "block";
		return false;
	} else {
		document.getElementById(fieldId).style.borderborder = "2px solid green";
		document.getElementById(errorId).style.display = "none";
		return true;
	}
}

function checkEmail(textId, errorId) {
	const email = document.getElementById(textId).value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(email)) {
		document.getElementById(textId).style.border = "2px solid green";
		document.getElementById(errorId).style.display = "none";

		return true
	} else {
		document.getElementById(textId).style.border = "2px solid red";
		document.getElementById(errorId).innerText = "Enter Valid Email";
		document.getElementById(errorId).style.display = "block";
		return false;
	}

}



function flatValidate() {
	if (checkInputs("iflatno", "errmsgflat", "Flat no field cannot be null")) {
		if(document.getElementById("iflatno").value <= 0)
		{
			document.getElementById("iflatno").style.border = "2px solid red";
			document.getElementById("errmsgflat").innerText = "Flat number should be greater than 0";
			document.getElementById("errmsgflat").style.display = "block";
			return false;
		}else{
			document.getElementById("iflatno").style.border = "2px solid green";
			document.getElementById("errmsgflat").style.display = "none";
			return true;
		}
		
	}
	return false;
}

function isInputIsEmpty() {

}