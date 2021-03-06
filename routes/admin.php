<?php
/**
 * 系统后台路由文件
 */

//登录路由
Route::get('login', 'LoginController@showLoginForm')->name('admin.login');
Route::post('login', 'LoginController@login');
Route::match(['get', 'post'], 'logout', 'LoginController@logout');
//验证登录,获取菜单路由组
Route::group(['middleware' => ['auth:admin','menu']], function () {
    Route::get('/', 'IndexController@index');
    //验证权限的路由组
    Route::group(['middleware'=>['permission']], function(){
        //用户管理路由
        Route::match(['get', 'post'], 'user/index', ['as' => 'admin.user.index', 'uses' => 'UserController@index']);  //用户管理
        Route::resource('user', 'UserController', [
            'names' => [
                'index' => 'admin.user.index',
                'show' => 'admin.user.show',
                'create' => 'admin.user.create',
                'store' => 'admin.user.create',
                'edit' => 'admin.user.edit',
                'update' => 'admin.user.edit',
                'destroy' => 'admin.user.destroy',
            ]
        ]);
        //权限管理路由
        Route::match(['get', 'post'], 'permission/index', ['as' => 'admin.permission.index', 'uses' => 'PermissionController@index']);
        Route::get('permission/{cid}/list', ['as' => 'admin.permission.index','uses' => 'PermissionController@index'])->where('cid', '[0-9]+');
        Route::get('permission/{cid}/create', ['as'=>'admin.permission.create','uses' => 'PermissionController@create'])->where('cid', '[0-9]+');
        Route::resource('permission', 'PermissionController', [
            'names' => [
                'index' => 'admin.permission.index',
                'show' => 'admin.permission.show',
                'create' => 'admin.permission.create',
                'store' => 'admin.permission.create',
                'edit' => 'admin.permission.edit',
                'update' => 'admin.permission.edit',
                'destroy' => 'admin.permission.destroy',
            ],
        ]);
        //角色管理路由
        Route::match(['get', 'post'], 'role/index', ['as' => 'admin.role.index', 'uses' => 'RoleController@index']);
        Route::resource('role', 'RoleController', [
            'names' => [
                'index' => 'admin.role.index',
                'show' => 'admin.role.show',
                'create' => 'admin.role.create',
                'store' => 'admin.role.create',
                'edit' => 'admin.role.edit',
                'update' => 'admin.role.edit',
                'destroy' => 'admin.role.destroy',
            ],
        ]);
    });
});
//与微信公众号服务器通信路由
Route::any('serve/wechat', 'WechatController@serve');

