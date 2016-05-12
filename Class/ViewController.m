//
//  ViewController.m
//  BBRSACryptor+XHCategory
//
//  Created by xiaohui on 16/5/10.
//  Copyright © 2016年 qiantou. All rights reserved.
//

/*
 1.使用方法:
 ---1.将RSALibary文件夹加入工程
 ---2.在TARGETAS-Build Settings中配置Header Search Pathes 添加文件搜索相对路径 ./RSALibary/OpenSSL/include
 ---3.在ViewController.m，导入BBRSACryptor+XHCategory.h，使用下面的代码生成公钥,私钥
 [BBRSACryptor createPublicKeyAndPrivateKey];
 ---4.运行后，在控制台会打印出证书路径，进入路径后，可以看到公钥证书(bb.publicKey.pem)和私钥证书(bb.privateKey.pem)。
 将两证书拷贝到桌面.pem后缀改为.txt并打开,将—–BEGIN PUBLIC KEY—–和—–END PUBLIC KEY—–之间的部分复制，新建一个宏，来保存这个公钥(宏定义时,公钥中若有换行,记得删除),
 客户端仅保存公钥即可，私钥放在服务器上.
 */

#import "ViewController.h"
#import "BBRSACryptor+XHCategory.h"

//公钥 (请替换)
#define RSAPublicKey @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE+jPXWpW0Ooo+7y8wigCQVRq+ULPHYm6UbJNGJTddzBcWilKw5xY13Fzst/sHQZQVi8Bp+P2EXZQtwnhCkU/4rTy5tdTM0BN04yT7NuMRLLSV6u0Yl+6DE01s2+nC5NIzpq+ZXDZYJSo9EmLapZbeIm4Q/1PYX/1CA/A4YBGkXQIDAQAB"

//私钥 (请替换)
#define RSAPrivateKey   @"MIICXQIBAAKBgQDA5vY0poAxvMv/hrK8bD31vwXSyAAEWmK1X8fsR4/x07RclNoKsyfGGVafLdMp4SteAaVAP8JBV27/NYxma4vIyH+JoQl7JWzRWY1c3RF0KPUhjuOCkaPj71zKedIqQ8rKzLieYK/Lkh9G5HYJEcvH2bdfvDDD5PODiz69yvqerQIDAQABAoGBAIb/Gz4tZ3lnTrw8X8lNVu8sB79DCAAD4SBdL2RDkJEEPyyrXwwt5J/WC7DKOQUN93OKY0NbW26u6ZbguqjSird4o7Y1or1fM0l7M7j5MVdOl2iPTNBqGRGMInIdIks8hbcMNeIszjVU4ynhE+LtlxjiGQqGAdLszN8zPfswBpVhAkEA8l9w42J9Mo1mkF4rtHi0Hp61/50pvovyvwJhCEDupZ7JeObH7F33v0JLkKILUjuEUp+kSyzpx+8+M/4ocrk2+wJBAMu/eOrhmweiDx7BrX3qxr0jbigjpxBlFV/A0A9wO0/YCUPZy4s5kYpMT3nitF+5qpT4It1o/NEmrTRwJf1JMHcCQQCpwPji+V8woeKc6Kf5rbSR4Z0c26maIJCzAWqOilPbQfxgJlsODL5xgXBFa4k8Xh0OdWtvj5RpiQHrDm6r81czAkAzJDJzsoE5X0IwVCj6DC4qV3RU+u36PYUp7bnLxj39ApsAvvBKV/7iGdlxHKhtxqq8jbQiozGiRfT/zo6ajv5tAkBLTNDOxZw6nng/8o/314YAHz7gEqGlmCDNwCpZu9ZDMIL6/CYCJeDFZJ8bOrE3BzWaPqhS6ww0ddC8FKKrr95K";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"RSA公钥私钥生成/加密/解密";
    
    /**
     *  生成公钥,私钥
     */
    [BBRSACryptor createPublicKeyAndPrivateKey];
    
    /**
     *  公钥加密
     */
    NSString *str0 = @"123456";
    NSString *newStr0=[BBRSACryptor encryptString:str0 publicKey:RSAPublicKey];
    NSLog(@"\n加密后:\n%@",newStr0);
    
    /**
     *  公钥解密
     */
    NSString *str = @"rR06kVjrqJOOaYprEucj9AJSWjJwFxYS38Mc2Gc+t3CuGWO6+LgpSxULJp+dAkPa8M1rKdgJXtooL/JbEphlEvHAHWCalppG/hbE0WI1t2PS6xSpjo0hcHZeQNVvqwlLcxiSySV22aXHt1XxAL8XW6YP30gKLws3S+ZHlLbrodY=";
    NSString *newStr=[BBRSACryptor decodingString:str publicKey:RSAPublicKey];//传入"私钥加密字符串";
    NSLog(@"\n解密后:\n%@",newStr);
    
    //其他私钥加密,解密,签名,验证签名,请查看 BBRSACryptor+XHCategory.h  所提供类方法
    
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
