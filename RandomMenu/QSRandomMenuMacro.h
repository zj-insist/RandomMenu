//
//  QSRandomMenuMacro.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#ifndef QSRandomMenuMacro_h
#define QSRandomMenuMacro_h

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width

//缩放比例
#define ratio2_scale (Screen_Width/375.f)
#define UIScale(x) ((x)*ratio2_scale)
#define UIScaleHeight(x) ((x)*Screen_Height/667.f)

// RGB颜色
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define HEXRGBCOLOR(h)      RGBCOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF))
#define HEXRGBACOLOR(h,a)   RGBACOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)

#endif /* QSRandomMenuMacro_h */
