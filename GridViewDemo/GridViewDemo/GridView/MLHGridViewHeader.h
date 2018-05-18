//
//  MLHGridViewHeader.h
//  DemoMLH
//
//  Created by 啊育 on 2018/5/8.
//  Copyright © 2018年 Helloworld. All rights reserved.
//

#ifndef MLHGridViewHeader_h
#define MLHGridViewHeader_h

#define MLH_linewidth 0.25f*([UIScreen mainScreen].scale)  ///表格线条宽度
#ifndef HEXCOLOR
#define HEXCOLOR(c)  [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]  //二进制颜色
#endif
#define MLH_lineColor HEXCOLOR(0xe7e7e7)  ///表格线条颜色
#define MLH_textFontSize 14.0 //文字大小
#define MLH_textToBottom 10.0  //文字到方格底部间距
#define MLH_textToTop 10.0 //文字到方格顶部间距
#define MLH_textToLeft 10.0 //文字到方格左边间距
#define MLH_textToRight 10.0 //文字到方格右边间距

#endif /* MLHGridViewHeader_h */
