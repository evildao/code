<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
    public function index(){
		header("Content-type: text/html; charset=utf-8");
		//$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p></div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
		if(!empty($_COOKIE['Example_auth'])) {
			list($Example_uid, $Example_username) = explode("\t", uc_authcode($_COOKIE['Example_auth'], 'DECODE'));
		} else {
			$Example_uid = $Example_username = '';
		}

		/**
		 * 获取最新短消息
		 */
		$newpm = uc_pm_checknew($Example_uid);

		/**
		 * 各个功能的 Example 代码
		 */
		switch(@$_GET['example']) {
			case 'login':
				//UCenter 用户登录的 Example 代码
				include 'code/login_nodb.php';
			break;
			case 'logout':
				//UCenter 用户退出的 Example 代码
				include 'code/logout.php';
			break;
			case 'register':
				//UCenter 用户注册的 Example 代码
				include 'code/register_nodb.php';
			break;
			case 'pmlist':
				//UCenter 未读短消息列表的 Example 代码
				include 'code/pmlist.php';
			break;
			case 'pmwin':
				//UCenter 短消息中心的 Example 代码
				include 'code/pmwin.php';
			break;
			case 'friend':
				//UCenter 好友的 Example 代码
				include 'code/friend.php';
			break;
			case 'avatar':
				//UCenter 设置头像的 Example 代码
				include 'code/avatar.php';
			break;
		}

		echo '<hr />';
		if(!$Example_username) {
			//用户未登录
			echo '<a href="'.$_SERVER['PHP_SELF'].'?example=login">登录</a> ';
			echo '<a href="'.$_SERVER['PHP_SELF'].'?example=register">注册</a> ';
		} else {
			//用户已登录
			echo '<script src="ucexample.js"></script><div id="append_parent"></div>';
			echo $Example_username.' <a href="'.$_SERVER['PHP_SELF'].'?example=logout">退出</a> ';
			echo ' <a href="'.$_SERVER['PHP_SELF'].'?example=pmlist">短消息列表</a> ';
			echo $newpm ? '<font color="red">New!('.$newpm.')</font> ' : NULL;
			echo '<a href="###" onclick="pmwin(\'open\')">进入短消息中心</a> ';
			echo ' <a href="'.$_SERVER['PHP_SELF'].'?example=friend">好友</a> ';
			echo ' <a href="'.$_SERVER['PHP_SELF'].'?example=avatar">头像</a> ';
		}
		echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />";
	}
}