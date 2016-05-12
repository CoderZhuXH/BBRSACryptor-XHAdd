//
//  BBRSACryptor+XHCategory.m
//  BBRSACryptor+XHCategory
//
//  Created by xiaohui on 16/5/10.
//  Copyright © 2016年 qiantou. All rights reserved.
//  https://github.com/CoderZhuXH/BBRSACryptor-XHCategory

#import "BBRSACryptor+XHCategory.h"

@implementation BBRSACryptor (XHCategory)

/**
 *  生成公钥,私钥
 */
+(void)createPublicKeyAndPrivateKey
{
    BBRSACryptor *reaCryptor = [[BBRSACryptor alloc] init];
    [reaCryptor generateRSAKeyPairWithKeySize:1024];
}
/**
 *  公钥加密
 *
 *  @param string    普通字符串
 *  @param publicKey 公钥
 *
 *  @return 加密后字符串
 */
+(NSString *)encryptString:(NSString *)string publicKey:(NSString *)publicKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPublicKeyBase64:publicKey])
    {
        NSData *cipherData = [rsaCryptor encryptWithPublicKeyUsingPadding:RSA_PADDING_TYPE_PKCS1 plainData:[string dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *cipherString = [GTMBase64 stringByEncodingData:cipherData];
        return cipherString;
    }
    return nil;
}

/**
 *  公钥解密
 *
 *  @param string    私钥加密字符串
 *  @param publicKey 公钥
 *
 *  @return 解密后字符串
 */
+(NSString *)decodingString:(NSString *)string publicKey:(NSString *)publicKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPublicKeyBase64:publicKey])
    {
        NSData *cipherData = [GTMBase64 decodeString:string];
        NSData *plainData =  [rsaCryptor decryptWithPublicKeyUsingPadding:RSA_PADDING_TYPE_PKCS1 cipherData:cipherData];
        NSString *plainStr = [[NSString alloc]initWithData:plainData encoding:NSUTF8StringEncoding];
        return plainStr;
    }
    return nil;
}

/**
 *  私钥加密
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 加密后字符串
 */
+(NSString *)encryptString:(NSString *)string privateKey:(NSString *)privateKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPrivateKeyBase64:privateKey])
    {
        NSData *cipherData = [rsaCryptor encryptWithPrivateKeyUsingPadding:RSA_PKCS1_PADDING plainData:[string dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *cipherString = [GTMBase64 stringByEncodingData:cipherData];
        return cipherString;
    }
    return nil;
}

/**
 *  私钥解密
 *
 *  @param string     公钥加密字符串
 *  @param privateKey 私钥
 *
 *  @return 解密后字符串
 */
+(NSString *)decodingString:(NSString *)string privateKey:(NSString *)privateKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPrivateKeyBase64:privateKey])
    {
        NSData *cipherData = [GTMBase64 decodeString:string];
        NSData *plainData = [rsaCryptor decryptWithPrivateKeyUsingPadding:RSA_PADDING_TYPE_PKCS1 cipherData:cipherData];
        NSString *plainText = [[NSString alloc]initWithData:plainData encoding:NSUTF8StringEncoding];
        return plainText;
    }
    return nil;
}

/**
 *  私钥签名
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 签名后字符串
 */
+(NSString *)singString:(NSString *)string privateKey:(NSString *)privateKey
{

    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPrivateKeyBase64:privateKey])
    {
       NSString* sing= [rsaCryptor signString:string];
        return  sing;
    }
    return nil;
}

/**
 *  私钥签名MD5
 *
 *  @param string     普通字符串
 *  @param privateKey 私钥
 *
 *  @return 签名后字符串
 */
+(NSString *)singMD5String:(NSString *)string privateKey:(NSString *)privateKey
{

    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPrivateKeyBase64:privateKey])
    {
         NSString* singMd5 = [rsaCryptor signMD5String:string];
         return  singMd5;
    }
    return nil;
}

/**
 *  RSA sha1 验证签名
 *
 *  @param string     普通字符串
 *  @param signString 签名字符串(base64)
 *  @param publicKey  公钥
 *
 *  @return 验证结果
 */
+(BOOL)verifyString:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPublicKeyBase64:publicKey])
    {
     return [rsaCryptor verifyString:string withSign:signString];
    }
    return NO;
}

/**
 *  RSA MD5 验证签名
 *
 *  @param string     普通字符串
 *  @param signString 签名字符串
 *  @param publicKey  公钥
 *
 *  @return 验证结果
 */
+(BOOL)verifyMD5String:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    if([rsaCryptor importRSAPublicKeyBase64:publicKey])
    {
        return [rsaCryptor verifyMD5String:string withSign:signString];
    }
    return NO;
}
@end
