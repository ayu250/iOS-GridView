//
//  MLHGridCollectionCell.m
//  DemoMLH
//
//  Created by 啊育 on 2018/5/8.
//  Copyright © 2018年 Helloworld. All rights reserved.
//

#import "MLHGridCollectionCell.h"
#import "MLHGridView.h"

@interface MLHGridCollectionCell()



@end

@implementation MLHGridCollectionCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.leftLine.backgroundColor = MLH_lineColor;
    self.rightLine.backgroundColor = MLH_lineColor;
    self.topLine.backgroundColor = MLH_lineColor;
    self.bottomLine.backgroundColor = MLH_lineColor;
    self.textLabel.font = [UIFont systemFontOfSize:MLH_textFontSize];
}

// MARK: -

-(void)setFirstRow:(BOOL)firstRow firstColumn:(BOOL)firstColumn{
    if (firstColumn) {
        self.leftLine.hidden = NO;
    }else{
        self.leftLine.hidden = YES;
    }
    if (firstRow) {
        self.topLine.hidden = NO;
    }else{
        self.topLine.hidden = YES;
    }
}

@end
