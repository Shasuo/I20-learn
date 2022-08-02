<?php require ('connect.php');

$count = mysqli_query($dbconnect,"SELECT COUNT(pc.ID_category) as Ccount, c.ID_category, c.category_IMG, c.name 
FROM productcategory pc
join category c on c.ID_category = pc.ID_category
GROUP BY c.ID_category
ORDER BY Ccount DESC");
?>

<!doctype html>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport"
          content = "width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <meta http-equiv = "X-UA-Compatible" content = "ie=edge">
    <link rel = "stylesheet" href = "assets/css/style.css">
    <title>Document</title>
<body onunload="">
<section class="category__list-container">
    <div class="category__list">
        <?php
        while ($info = mysqli_fetch_assoc($count)){
        ?>
        <div class="category__list-blockArea">
            <a href="productList.php?id=<?php echo $info['ID_category']; ?>" class="category__list-block ">
                <div style="background-image: url('<?php echo $info['category_IMG']; ?>')" class="category__list-block-bg bg-opt"></div>
                <div class="category__list-block__headline"><?php echo $info['name'] ?></div>
            </a>
            <div class="productCount">Количество: <span class="productCount-span"><?php echo $info['Ccount'] ?></span></div>
        </div>
        <?php
        }
        ?>
    </div>
</section>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="assets/hrefSlow.js"></script>
</html>