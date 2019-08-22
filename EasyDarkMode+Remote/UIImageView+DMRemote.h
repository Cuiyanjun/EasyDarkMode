//
//  UIImageView+DMRemote.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DMRemote)

- (void)dm_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark;

- (void)dm_setImagePathStringLight:(nullable NSString *)light dark:(nullable NSString *)dark;

@end

NS_ASSUME_NONNULL_END
