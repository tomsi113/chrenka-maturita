<div class="header">
	<div class="logo">
		<a href="<?php echo BASE_URL .'admin/posts.php' ?>">
			<h1>KORN - Admin</h1>
		</a>
	</div>
	<div class="user-info">
				<span><?php echo $_SESSION['user']['username'] ?></span> &nbsp; &nbsp;
				<a href="<?php echo BASE_URL . '/logout.php'; ?>" class="logout-btn">logout</a>
			</div>
</div>