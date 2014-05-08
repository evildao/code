#UcForTp3.2 v1.0
#作者 吾爱<zstxt1989@163.com>

关于：
这是一个适用于ThinkPHP3.2框架的UC客户端模块，UC是discuz的那个ucenter.
实现模块级应用配置。

使用：
##注册应用
复制Ucenter目录到你的 **APP_PATH** 下，作为一个Ucenter模块。
以Home模块为例，创建控制器 **Home\Controller\ApiController** ，如果关闭了忽略大小写配置参数，这里Api请改为小写。
控制器继承 **Ucenter\Api\Uc** 类。
创建 **index** 动作方法，该方法用于 *响应UC通信* ，方法实现如下：
~~~
function index(){
	$this->response();
}
~~~
整个 **ApiController** 看上去就像这样：
~~~
<?php
namespace Home\Controller;
use Ucenter\Api\Uc;
class ApiController extends Uc{
    function indexAction(){
        $this->response();
    }
}
?>
~~~
然后你就可以去UCserver后台添加应用了，应用url就是http://yoursite/Home ， 通信脚本设置为 index。
添加完毕后，再点开编辑，将最下面的配置参数全部复制下来。
接下来你需要在 Home/Conf 下添加uc.php，将复制的代码粘贴进去，就像这样：
~~~
<?php
define('UC_CONNECT', 'mysql');
define('UC_DBHOST', '127.0.0.1');
define('UC_DBUSER', 'root');
define('UC_DBPW', '');
define('UC_DBNAME', 'ucenter');
define('UC_DBCHARSET', 'utf8');
define('UC_DBTABLEPRE', '`ucenter`.uc_');
define('UC_DBCONNECT', '0');
define('UC_KEY', 'dddsss');
define('UC_API', 'http://localhost/ucenter');
define('UC_CHARSET', 'utf-8');
define('UC_IP', '');
define('UC_APPID', '1');
define('UC_PPP', '20');
?>
~~~
到这里应该可以看到通信正常。

##使用uc_client
uc_client所有api请参考 *康盛ucenter里面的document手册* ，你所要做的就是在项目中实例化 **Ucenter\client\client** 类，通过类调用接口函数，如下：
~~~
<?php
namespace Home\Controller; 
class PublicController extends \Think\Controller{
	function login(){
		$uc = new \Ucenter\Client\Client();
		$re = $uc->uc_user_login("zhangsan", "lisi");
		//dump($re);
	}
}
?>
~~~
##实现模块的UC通信响应
当你需要接收同步登录等请求时，你需要在上面的Api类中添加对应的事件动作，动作方法命名请参考康盛UCenter压缩包里的手册， *API接口* 一节。