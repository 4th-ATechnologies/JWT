//
//  JWTAlgorithmNoneSpec.m
//  JWT
//
//  Created by Lobanov Dmitry on 16.10.15.
//  Copyright © 2015 Karma. All rights reserved.
//

#import "Kiwi.h"

#import "JWTAlgorithmNone.h"
#import "MF_Base64Additions.h"

SPEC_BEGIN(JWTAlgorithmNoneSpec)

__block JWTAlgorithmNone *algorithm;

beforeEach(^{
    algorithm = [[JWTAlgorithmNone alloc] init];
});

it(@"name is none", ^{
    [[algorithm.name should] equal:@"none"];
});

it(@"should not encode payload and return emptry signature instead", ^{
    NSData *encodedPayload = [algorithm encodePayload:@"payload" withSecret:@"secret"];
    [[[encodedPayload base64Encoding] should] equal:@""];
});

SPEC_END