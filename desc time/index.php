<?php
header("content-type:image/jpeg");
$nowtime=strtotime(date("Y-m-d H:i:s"));//��ǰʱ��
$oneyear=31557600;//ÿ�������
$oldtime=strtotime("1991-10-23 00:00:00");//��������
$runyear=60;//�������
$sttime=$oneyear*$runyear+$oldtime;
$time3=ceil($sttime-$nowtime);

//echo $time3.'<br/>';
//echo date("y��m��d�� Hʱi��s��",mktime(0,0,$time3,0,0,0));


$im=imagecreate(500,150); //����600*100����
imagecolorallocate($im,34,34,34);//������ɫ
$textcolor=imagecolorallocate($im,0,128,0);//������ɫ
$motto=iconv("gb2312","utf-8","        ��������ʱ\n".date(" y��m��d�� Hʱi��s��",mktime(0,0,$time3,0,0,0))."\n    powered by:С��(LT)");
imageTTFText($im,24,0,20,40,$textcolor,'����.ttf',$motto);
imagejpeg($im);
imagedestroy($im);

?>