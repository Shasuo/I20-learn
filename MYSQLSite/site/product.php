<?php require ('connect.php');

$productID = $_GET['id'];
$cat = $_GET['cat'];
$pagesCount = $_GET['pCount'];
$productsInfo = mysqli_query($dbconnect,"SELECT 
       p.name as prductName,
       p.price,
       p.price_discount,
       price_promo,
       pc.description as pcDescription,
       c.name,
       pc.ID_category as pcCategory,
       p.main_IMG,
       pi.ID_IMG,
       p.ID_product,
       link
FROM products p
join productimg pi on pi.ID_product = p.ID_product
join img i on i.ID_IMG = pi.ID_IMG
join productcategory pc on pc.ID_product = p.ID_product
join category c on c.ID_category = pc.ID_category    
WHERE p.ID_product = $productID
AND pc.ID_category = $cat");
$productsInfoCat = mysqli_query($dbconnect,"SELECT 
c.name,
pc.ID_category
from productcategory pc 
join category c on c.ID_category = pc.ID_category
where pc.ID_product = $productID ");
while ($Info = mysqli_fetch_assoc($productsInfo)) {
    if ($Info['main_IMG'] == $Info['ID_IMG']){
        $mainIMG = $Info['link'];
    }
}
mysqli_data_seek($productsInfo,0);
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
<section class="productZone">
    <a href="productList.php?id=<?php echo $cat?>&noShow=0&pCount=<?php echo $pagesCount?>" class="productZone__link">К другим товарам</a>
    <div class="productZone-product">
        <div class="productZone-product__sliderZone">
        <div class="productZone-product__slider">
            <div class="productZone-product__slider-tape">
                <div style="background-image: url('<?php echo $mainIMG?>')" class="productZone-product__IMG bg-opt"></div>
                <?php
                while ($Info = mysqli_fetch_assoc($productsInfo))
                {
                ?>
            <div style="background-image: url('<?php echo $Info['link']?>')" class="productZone-product__IMG bg-opt"></div>
                <?php
                }
                mysqli_data_seek($productsInfo,0);
                $Info = mysqli_fetch_assoc($productsInfo);
                ?>
            </div>
        </div>
            <div class="productZone-product__sliderZone-arrows">
                <img src="assets/img/leftArrow-slider.svg" class="productSliderArrow productSliderArrow-left">
                <img src="assets/img/rightArrow-slider.svg" class="productSliderArrow productSliderArrow-right">
            </div>
        </div>
        <div class="productZone-product__info">

            <div class="productZone-product__infoZone">
                <div class="productZone-product__infoZone__headline">Имя</div>
                <div class="productText productZone-product__infoZone__productHeadline"><?php echo $Info['prductName']?></div>
            </div>

            <div class="productZone-product__infoZone productZone-product__infoZone__mg">
                <div class="productZone-product__infoZone__headline">Цена</div>
                <div class="productText productZone-product__infoZone__productHeadline"><?php echo $Info['price']?>р.</div>
            </div>

            <div class="productZone-product__infoZone productZone-product__infoZone__mg">
                <div class="productZone-product__infoZone__headline">Цена без скидки</div>
                <div class="productText productZone-product__infoZone__productHeadline"><?php echo $Info['price_discount']?>р.</div>
            </div>

            <div class="productZone-product__infoZone productZone-product__infoZone__mg">
                <div class="productZone-product__infoZone__headline">Цена по промокоду</div>
                <div class="productText productZone-product__infoZone__productHeadline"><?php echo $Info['price_promo']?>р.</div>
            </div>

            <div class="productZone-product__infoZone productZone-product__infoZone__mg">
                <div class="productZone-product__infoZone__headline">Категории</div>
                <div class="productText productZone-product__infoZone__productHeadline">
                    <?php while ($InfoCat = mysqli_fetch_assoc($productsInfoCat))
                    {
                     ?><a class="productText productZone-product__infoZone__productHeadline" href="productList.php?id=<?php echo $InfoCat['ID_category']; ?>&noShow=0"><?php echo $InfoCat['name']; ?></a>
               <?php
               }
               ?>
                </div>
            </div>

            <div class="productZone-product__infoZone productZone-product__infoZone__mg">
                <div class="productZone-product__infoZone__headline">Описание товара</div>
                <div class="productText productZone-product__infoZone__productHeadline" style="line-height: 130%"><?php echo $Info['pcDescription']?></div>
            </div>

        </div>

    </div>
</section>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="assets/productSlider.js"></script>
<script src="assets/hrefSlow.js"></script>
</html>
