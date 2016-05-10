//
//  BBRSACryptor+XHCategory.h
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

#import "BBRSACryptor.h"
#import "GTMBase64.h"

//公钥 (请替换成自己生成的公钥)
#define RSAPublicKey @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE+jPXWpW0Ooo+7y8wigCQVRq+ULPHYm6UbJNGJTddzBcWilKw5xY13Fzst/sHQZQVi8Bp+P2EXZQtwnhCkU/4rTy5tdTM0BN04yT7NuMRLLSV6u0Yl+6DE01s2+nC5NIzpq+ZXDZYJSo9EmLapZbeIm4Q/1PYX/1CA/A4YBGkXQIDAQAB"

@interface BBRSACryptor (XHCategory)

/**
 *  生成公钥,私钥 (生成成功后控制台会打印出 公钥,私钥 存储路径)
 */
+(void)createPublicKeyAndPrivateKey;

/**
 *  公钥加密
 *
 *  @param string 普通字符串
 *
 *  @return  加密后的字符串
 */
+(NSString *)RSAPublicKeyEncryptString:(NSString *)string;

/**
 *  公钥解密
 *
 *  @param string 服务器返回的私钥加密字符串
 *
 *  @return 解密后字符串
 */
+(NSString *)RSAPublicKeyDecodingString:(NSString *)string;

@end
