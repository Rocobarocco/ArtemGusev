<?php
function compile_template($template, $teamlate_data) {
        if (!file_exists( 'templates/' . $template)) {
            ob_start();
            extract($teamlate_data);
            require_once('teamplates/' . $template);


            return ob_get_clean();

        }else {
                return '';
        }
}
$is_auth = rand(0, 1);

$user_name = 'Rocobarocco'; // укажите здесь ваше имя

$arr = [
    "boards" => "Доски и лыжи",
    "fastenings" => "Крепления",
    "boots" => "Ботинки",
    "clothes" => "Одежда",
    "Miscellaneous" => "Разное",
];
$advertisement = [
    [
        "name"=>  "2014 Rossignol District Snowboard",
        "category"=> "boards and skies",
        "price"=> "10999",
        "Image URL" =>"img/lot-1.jpg"
    ],

    [
        "name"=>  "DC Ply Mens 2016/2017 Snowboard",
        "category"=> "boards and skis",
        "price"=> "159999",
        "Image URL" =>"img/lot-2.jpg"
    ],
    [
        "name"=>  "Крепления Union Contact Pro 2015 года размер L/XL",
        "category"=> "fastenings",
        "price"=> "8000",
        "Image URL" =>"img/lot-3.jpg"
    ],
    [
        "name"=>  "Ботинки для сноуборда DC Mutiny Charocal",
        "category"=> "boots",
        "price"=> "10999",
        "Image URL" =>"img/lot-4.jpg"
    ],
    [
        "name"=>  "Куртка для сноуборда DC Mutiny Charocal",
        "category"=> "clothes",
        "price"=> "7500",
        "Image URL" =>"img/lot-5.jpg"
    ],
    [
        "name"=>  "Маска Oakley Canopy",
        "category"=> "Miscellaneous",
        "price"=> "5400",
        "Image URL" =>"img/lot-6.jpg"
    ],
];
function sum_format($number, $withRubleElem = true)
{
    $number = ceil($number);

    if ($number >= 1000) {
        $price = number_format($number, 0, ',', ' ');
    } else {
        $price = $number;
    }

    if ($withRubleElem) {
        return $price . "<b class=\"rub\">р</b>";
    } else {
        return $price;
    }
}

?>