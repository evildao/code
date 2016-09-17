<?php
/*
   +----------------------------------------------------------------------
   | GIT 分发接口
   +----------------------------------------------------------------------
   | Copyright (c) 2014 http://www.evildao.com All rights reserved.
   +----------------------------------------------------------------------
   | Author: 小子(LT) <mail@xiaoliu.org>
   +----------------------------------------------------------------------
   | Date:2016-09-17 13:53:18
   +----------------------------------------------------------------------
*/
$sync = [
	'uf' => [
		'path' => '/usr/share/nginx/uf',
		'password' => 'uf',
		'repository' => 'https://user:pwd@git.oschina.net/ufox/uf.git'
	],
	'ThinkPHP' => [
                'path' => '/usr/share/nginx/frame',
                'password' => null,
                'repository' => 'https://git.oschina.net/ufox/ThinkPHP.git'
        ],
	
];

try {
	$hook = $_POST['hook'];
	$hook = json_decode($hook, true);
} catch (Exception $e) {
	exit(-1);
}
$lock = 0;
if($hook['hook_name'] !== 'push_hooks') {
	exit(-2);
}

if(!isset($sync[$hook['push_data']['repository']['name']])) {
	exit(-3);
}

$sync = $sync[$hook['push_data']['repository']['name']];

if(!empty($sync['password']) && $hook['password'] !== $sync['password']) {
	exit(-4);
}

exec("./sync_git.sh \"{$sync['path']}\" \"{$sync['repository']}\"");
