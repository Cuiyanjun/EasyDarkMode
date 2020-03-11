//
//  UIButton+DMRemote.m
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIButton+DMRemote.h"
#import "UIImage+DMRemote.h"

@implementation UIButton (DMRemote)

- (void)dm_setImageUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        UIImage *newImage;
        if (@available(iOS 13.0, *)) {
            UITraitCollection *lightCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
            UITraitCollection *darkColleciton = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
            UITraitCollection *unspecified = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
            newImage = [[image.imageAsset imageWithTraitCollection:unspecified] copy];
            [newImage.imageAsset registerImage:[image.imageAsset imageWithTraitCollection:lightCollection] withTraitCollection:lightCollection];
            [newImage.imageAsset registerImage:[image.imageAsset imageWithTraitCollection:darkColleciton] withTraitCollection:darkColleciton];
        } else {
            newImage = image;
        }
        [selfWeak setImage:newImage forState:state];
    }];
}

- (void)dm_setImagePathStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_setImageUrlLight:lightUrl dark:darkUrl forState:state];
}

- (void)dm_setBackgroundUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        [selfWeak setBackgroundImage:image forState:state];
    }];
}

- (void)dm_setBackgroundPathStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_setBackgroundUrlLight:lightUrl dark:darkUrl forState:state];
}

@end
