//
//  ViewController.m
//  BBRSACryptor+XHCategory
//
//  Created by xiaohui on 16/5/10.
//  Copyright © 2016年 qiantou. All rights reserved.
//


/*
 前言
 1.RSA 一般加密流程:
 ---0.
 生成公钥,私钥,客户端保存公钥,服务器保存私钥
 ---1.
 客户端  数据 公钥加密后 发给服务器
 服务器  收到数据后 利用私钥 解密 还原数据
 ---2.
 服务器 私钥加密 数据 返回给 客户端
 客户端 收到后数据后 利用公钥解密 还原数据
 
 2.使用方法:
 ---1.新建工程,将RSALibary文件夹加入工程
 ---2.在TARGETAS-Build Settings中配置Header Search Pathes 添加文件搜索相对路径 ./RSALibary/OpenSSL/include
 ---3.在ViewController.m，导入BBRSACryptor+XHCategory.h，使用下面的代码生成公钥,私钥
 [BBRSACryptor createPublicKeyAndPrivateKey];
 ---4.运行后，在控制台会打印出证书路径，进入路径后，可以看到公钥证书(bb.publicKey.pem)和私钥证书(bb.privateKey.pem)。
 将两证书拷贝到桌面.pem后缀改为.txt并打开,将—–BEGIN PUBLIC KEY—–和—–END PUBLIC KEY—–之间的部分复制，新建一个宏，来保存这个公钥(宏定义时,公钥中若有换行,记得删除),
 客户端仅保存公钥即可，私钥放在服务器上,php可以直接读取证书。
 */


#import "ViewController.h"
#import "BBRSACryptor+XHCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"RSA加密解密";
    
    /**
     *  生成公钥,私钥
     */
    [BBRSACryptor createPublicKeyAndPrivateKey];
    
    /**
     *  加密
     */
    NSString *str0 = @"123456";
    NSString *newStr0=[BBRSACryptor RSAPublicKeyEncryptString:str0];
    NSLog(@"\n加密后:\n%@",newStr0);
    
    /**
     *  解密
     */
    //解密数据来源:服务器返回的 私钥加密的字符串
    NSString *str = @"rR06kVjrqJOOaYprEucj9AJSWjJwFxYS38Mc2Gc+t3CuGWO6+LgpSxULJp+dAkPa8M1rKdgJXtooL/JbEphlEvHAHWCalppG/hbE0WI1t2PS6xSpjo0hcHZeQNVvqwlLcxiSySV22aXHt1XxAL8XW6YP30gKLws3S+ZHlLbrodY=";
    NSString *newStr=[BBRSACryptor RSAPublicKeyDecodingString:str];//传入服务器返回的"私钥加密字符串";
    NSLog(@"\n解密后:\n%@",newStr);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
