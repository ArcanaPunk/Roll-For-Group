<?php
	session_start();

	$username = "";
	$email = "";
	$first_name = "";
	$last_name = "";
	$address = "";
	$city = "";
	$state = "";
	$zip = "";
	$country = "";
	$errors = array();

	//Connect to the database
	$db = mysqli_connect('localhost', 'root', 'P@55w0rd', 'rollforgroup') or die($db);

	//if the submit button is clicked
	if(isset($_POST['submit'])) {
		$username = mysqli_real_escape_string($db, $_POST['username']);
		$email = mysqli_real_escape_string($db, $_POST['email']);
		$password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
		$password_2 = mysqli_real_escape_string($db, $_POST['password_2']);
		$first_name = mysqli_real_escape_string($db, $_POST['first_name']);
		$last_name = mysqli_real_escape_string($db, $_POST['last_name']);
		$address = mysqli_real_escape_string($db, $_POST['address']);
		$city = mysqli_real_escape_string($db, $_POST['city']);
		$state = mysqli_real_escape_string($db, $_POST['state']);
		$zip = mysqli_real_escape_string($db, $_POST['zip']);
		$country = mysqli_real_escape_string($db, $_POST['country']);

		//validate all fields
		if (empty($username)) {
			array_push($errors, "Username is required");
		}
		if (empty($email)) {
			array_push($errors, "Email is required");
		}
		if (empty($first_name)) {
			array_push($errors, "First Name is required");
		}
		if (empty($last_name)) {
			array_push($errors, "Last Name is required");
		}
		if (empty($password_1)) {
			array_push($errors, "Passowrd is required");
		}
		//password confirmation check
		if ($password_1 != $password_2) {
			array_push($errors, "the two passwords do not match");
		}

		//if there are no erors, then push the data to the db
		if (count($errors) == 0) {
			//hash the password to store the hashed value
			$password = hash('sha256', $password_1);
			$sql = "INSERT INTO User (Username, Email, Password, FirstName, LastName, Address, City, State, Zip, Country) VALUES ('$username', '$email', '$password', '$first_name', '$last_name', '$address', '$city', '$state', '$zip', '$country')";
			mysqli_query($db, $sql);
			$_SESSION['username'] = $username;
			$_Session['success'] = "Welcome back!";
			header('location: home.php'); //Take to home page after login
		}
	}

	//login from login.php
	if (isset($_POST['login'])) {
		$username = mysqli_real_escape_string($db, $_POST['username']);
		$password = mysqli_real_escape_string($db, $_POST['password']);
		

		//validate all fields
		if (empty($username)) {
			array_push($errors, "Username is required");
		}
		if (empty($password)) {
			array_push($errors, "Passoword is required");
		}
		if (count($errors) == 0 ) {
			$password = hash('sha256', $password); //encrypt password before comparing with that from database
			$query = "SELECT * FROM User WHERE Username='$username' AND Password = '$password'";
			$result = mysqli_query($db, $query);
			if (mysqli_num_rows($result) == 1) {
				//log user in
				$_SESSION['username'] = $username;
				$_Session['success'] = "Welcome back!";
				header('location: home.php'); //Take to home page after login
			}
			else {
				array_push($errors, "Incorrect Username and/or Password");
			}
		}
	}

	//logging out
	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['username']);
		header('location: login.php');
	}

?>