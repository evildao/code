<?php
header("content-type:image/jpeg");
$nowtime=strtotime(date("Y-m-d H:i:s"));//当前时间
$oneyear=31557600;//每年的秒数
$oldtime=strtotime("1991-10-23 00:00:00");//出生日期
$runyear=60;//活的年限
$sttime=$oneyear*$runyear+$oldtime;
$time3=ceil($sttime-$nowtime);

//echo $time3.'<br/>';
//echo date("y年m月d日 H时i分s秒",mktime(0,0,$time3,0,0,0));


$im=imagecreate(500,150); //创建600*100画布
imagecolorallocate($im,34,34,34);//画布颜色
$textcolor=imagecolorallocate($im,0,128,0);//字体颜色
$motto=iconv("gb2312","utf-8","        生命倒计时\n".date(" y年m月d天 H时i分s秒",mktime(0,0,$time3,0,0,0))."\n    powered by:小子(LT)");
imageTTFText($im,24,0,20,40,$textcolor,'黑体.ttf',$motto);
imagejpeg($im);
imagedestroy($im);

?>