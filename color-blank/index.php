<?php 
session_start();
$y = intval($_GET[y]);
$x = intval($_GET[x]);
if($_SESSION["data"][$y][$x] == 1){
	unset($_SESSION["data"][$y][$x]);
}else{
	$_SESSION["data"][$y][$x]=1;
}
cc($_SESSION["data"]);
print_r($_SESSION["data"]);

/* for($i=10;$i>0;$i--){
	$y=rand(1,23);
	$x=rand(1,98);
	$data[$y][$x]=1;
	if($y==intval($_GET['y']) and $x==intval($_GET['x'])){
		$r++;
	}
} */

function cc($data){
	for($a=0;$a<25;$a++){
		for($b=0;$b<100;$b++){
			if($a==0 or $a==24 or $b==0 or $b==99){$data[$a][$b]=1;}
			if($data[$a][$b]==1){
				echo "<a style=\"background:green;\" href=\"?x=$b&y=$a\">&nbsp;</a>";
			}else{
				echo "<a style=\"background:#000;\" href=\"?x=$b&y=$a\">&nbsp;</a>";
			}
		}
		echo "<br/>\n";
	}
}

?>
<style>
body {
	/* background-color: #000000; */
	text-align: center;
}
span{
	width:10px;
	height:10px;
}
</style>