import router from '@ohos.router';

import { HomeConstants } from '../contants/HomeConstants';
import { StyleConstants } from '../contants/StyleConstants';
import IndexItem from '../viewModel/IndexItem';
import IndexViewModel from '../viewModel/IndexViewModel';
import { IndexConstants } from './index.data';

@Entry
@Component
struct Index {
  @State indexItemList: IndexItem[] = IndexViewModel.getIndexItemList();

  build() {
    GridRow(IndexConstants.gridRow) {
      GridCol(IndexConstants.gridCol) {
        Column({ space: HomeConstants.COLUMN_SPACE }) {
          ForEach(this.indexItemList, (item: IndexItem) => {
            Stack() {
              Image(item.icon)
                .width(StyleConstants.FULL_WIDTH)
                .height($r('app.float.item_height'))
                .borderRadius($r('app.float.item_border_radius'))
              Column() {
                Text(item.title)
                  .fontSize($r('app.float.title_font_size'))
                  .fontColor(Color.White)
                Text(item.description)
                  .opacity(HomeConstants.TEXT_OPACITY)
                  .fontColor(Color.White)
                  .fontSize($r('app.float.description_font_size'))
                  .margin({ top: $r('app.float.description_margin_top') })
                Blank()
                Column() {
                  Button() {
                    Text(item.button).fontColor(Color.White)
                  }
                  .width($r('app.float.button_width'))
                  .height($r('app.float.button_height'))
                  .borderRadius($r('app.float.button_border_radius'))
                  .backgroundColor($r('app.color.button_background_color'))
                  .onClick(() => {
                    router.pushUrl({ url: item.url }, router.RouterMode.Single);
                  })
                }
                .alignItems(HorizontalAlign.End)
                .width(StyleConstants.FULL_WIDTH)
              }
              .width(StyleConstants.FULL_WIDTH)
              .height($r('app.float.item_height'))
              .borderRadius($r('app.float.item_border_radius'))
              .padding($r('app.float.item_padding'))
            }
          }, (item: IndexItem, index: number) => index + JSON.stringify(item))
        }
      }
    }
    .padding({
      top: $r('app.float.column_padding_top'),
      left: $r('app.float.column_padding_left'),
      right: $r('app.float.column_padding_right'),
    })
  }
}