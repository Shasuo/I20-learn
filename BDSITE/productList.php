<?php require ('connect.php');
$categoryID = $_GET['id'];
$productsInfo = mysqli_query($dbconnect,"SELECT   p.name, pc.ID_product, i.link, c.name as categoryName, c.category_IMG
FROM productcategory pc
join products p on p.ID_product = pc.ID_product
join img i on i.ID_IMG = p.main_IMG
join category c on c.ID_category = pc.ID_category
WHERE pc.ID_category = $categoryID");
$Info = mysqli_fetch_assoc($productsInfo);


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
<section class="productList">
    <div class="productList__head">
        <a href="index.php" class="productList__head-link">Другие разделы</a>
        <div style="background-image: url('<?php echo $Info['category_IMG']; ?>')" class="productList__head-IMG bg-opt"></div>
        <div class="productList__head-headline"><?php echo $Info['categoryName']; ?></div>
    </div>
    <div class="productList__products">
        <?php
        mysqli_data_seek($productsInfo,0);
        while ($Info = mysqli_fetch_assoc($productsInfo))
        {
            ?>
            <a  href="product.php?id=<?php echo $Info['ID_product']?>&cat=<?php echo $_GET['id']?>" class="productList__productBlock">
                <div style="background-image: url('<?php echo $Info['link']?>')" class="productList__productBlock-IMG bg-opt"></div>
                <div class="productList__productBlock-headline"><?php echo $Info['name']?></div>
                <div class="productList__productBlock-subtitleCategory"><?php echo $Info['categoryName']; ?></div>
            </a>
            <?php
        }
        ?>
    </div>
</section>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="assets/hrefSlow.js"></script>
