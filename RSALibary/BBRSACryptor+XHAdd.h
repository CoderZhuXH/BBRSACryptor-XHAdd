//
//  BBRSACryptorXHAdd.h
//  BBRSACryptorXHAdd
//
//  Created by xiaohui on 16/5/10.
//  Copyright © 2016年 qiantou. All rights reserved.
//  https://github.com/CoderZhuXH/BBRSACryptor-XHCategory


#import "BBRSACryptor.h"
#import "GTMBase64.h"


@interface BBRSACryptor (XHCategory)

/**
 *  生成公钥,私钥 (生成成功后控制台会打印出 公钥,私钥 存储路径)
 */
+(void)createPublicKeyAndPrivateKey;

/**
 *  公钥加密
 *
 *  @param string    普通字符串
 *  @param publicKey 公钥
 *
 *  @return 加密后字符串
 */
+(NSString *)encryptString:(NSString *)string publicKey:(NSString *)publicKey;

/**
 *  公钥解密
 *
 *  @param string    私钥加密字符串
 *  @param publicKey 公钥
 *
 *  @return 解密后字符串
 */
+(NSString *)decodingString:(NSString *)string publicKey:(NSString *)publicKey;

/**
 *  私钥加密
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 加密后字符串
 */
+(NSString *)encryptString:(NSString *)string privateKey:(NSString *)privateKey;

/**
 *  私钥解密
 *
 *  @param string     公钥加密字符串
 *  @param privateKey 私钥
 *
 *  @return 解密后字符串
 */
+(NSString *)decodingString:(NSString *)string privateKey:(NSString *)privateKey;

/**
 *  私钥签名
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 签名后字符串
 */
+(NSString *)singString:(NSString *)string privateKey:(NSString *)privateKey;

/**
 *  私钥签名MD5
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 签名后字符串
 */
+(NSString *)singMD5String:(NSString *)string privateKey:(NSString *)privateKey;

/**
 *  RSA sha1 验证签名
 *
 *  @param string     普通字符串
 *  @param signString 签名字符串(base64)
 *  @param publicKey  公钥
 *
 *  @return 验证结果
 */
+(BOOL)verifyString:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey;

/**
 *  RSA MD5 验证签名
 *
 *  @param string     普通字符串
 *  @param signString 签名字符串
 *  @param publicKey  公钥
 *
 *  @return 验证结果
 */
+(BOOL)verifyMD5String:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey;
@end
