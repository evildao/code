<a href="?key=add">添加新闻</a>&nbsp;<a href="?key=updata">静态化新闻</a>&nbsp;<a href="./">首页</a><br/>
<?php
if(!empty($_GET)) {
	$news = new news();
	switch(trim($_GET["key"])){
		case 'add':
			if(isset($_POST["button"])){
				echo $news->add();
			}
			echo '<form id=\'form1\' name=\'form1\' method=\'post\' action=\'\'>';
			echo '标题:<input type=\'text\' name=\'title\'/><br/>';
			echo '内容:<textarea name=\'txt\' id=\'textarea\' cols=\'45\' rows=\'7\'></textarea><br/>';
			echo '<input type=\'submit\' name=\'button\' id=\'button\' value=\'Add\' /></form>';
			
		break;
		case 'updata':
			if(isset($_POST['button'])){
				if(!empty($_POST['file'])){
					$file=trim($_POST['file'].".txt");
				}else{
					$file=trim(date("Y-m-d").".txt");
				}
				echo $news->updata($file);
			}else{
				echo '<form id=\'form1\' name=\'form1\' method=\'post\' action=\'\'>';
				echo '日期:<input type=\'text\' name=\'file\'/>';
				echo '<input type=\'submit\' name=\'button\' id=\'button\' value=\'UpData\' /></form>';
			}
			
		break;
	}
}
class news{
	
	public function add(){
		$title=htmlspecialchars(stripslashes($_POST['title']));
		$txt=nl2br(htmlspecialchars(stripslashes($_POST['txt'])));
		$txt=str_replace("\n","",$txt);
		$txt=str_replace("\r","",$txt);
		$time1=date("Y-m-d");
		$time2=date("Y-m-d H:m:s");
		$filename=date("YmsHms").rand(00000,99999).".html";
		$ff=fopen(trim("./data/".$time1.".txt"),"a");
		fwrite($ff,$title.'<evildao>'.$time1.'<evildao>'.$time2.'<evildao>'.$txt.'<evildao>'.$filename."\n");
		fclose($ff);
		return "添加成功";
	}
	
	public function updata($file){
		$filedir="./news/";
		$lines = file("./data/".$file);
		$r=null;
		foreach($lines as $n){
			$r=explode('<evildao>',$n);
			$t="<h1>".$r[0]."</h1>".$r[2]."<br/>".$r[3];
			file_put_contents(trim($filedir.$r[4]),$t);
			$r.="<a href=\"./news/".$r[4]."\">".$r[0]."</a><br/>";
		}
		file_put_contents("index.html",$this->_indexUpadte());
		$r.="更新完毕";
		return $r;
	}
	
	private function _indexUpadte() {
		$oldlist = $this->myreaddir("./data/");
		sort($oldlist); //数组排序
		$list=$oldlist;
		$t=1;
		$str = null;
		for($i = count($list)-1;$i>-1;$i--){
			$lines = file("./data/".$list[$i]);
			foreach($lines as $n){
				$r=explode('<evildao>',$n);
				$str .= $t.":<a href=\"./news/".$r[4]."\">".$r[0]."</a>...............[".$r[2]."]<br/>";
				$t++;
			}
		}
		$str = '<html><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head><body>' . $str .
				'<div class="copyright">版权所有&copy;翻版不究   <br/>powered by: www.evildao.com</div></div></body></html>';
		return $str;
	}
	
	private function myreaddir($dir) {//目录文件名获取函数
		$handle=@opendir($dir);
		$i=0;
		while(true==($file=readdir($handle))) {
			if (($file!=".")and($file!="..")) {
				$list[$i]=$file;
				$i=$i+1;
				}
			}
		closedir($handle); 
		return $list;
	}

}//Class End!

?>