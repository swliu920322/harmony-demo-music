import router from '@ohos.router';
import { BreakpointConstants } from '../constants/BreakpointConstants';
import IndexItem from '../viewModel/IndexItem'
import IndexViewModel from '../viewModel/IndexViewModel'

const adjustRow: GridRowOptions = {
  breakpoints: {
    value: BreakpointConstants.BREAKPOINT_VALUE,
    reference: BreakpointsReference.WindowSize
  },
  columns: {
    sm: BreakpointConstants.COLUMN_SM,
    md: BreakpointConstants.COLUMN_MD,
    lg: BreakpointConstants.COLUMN_LG
  },
  direction: GridRowDirection.Row
}

const adjustCol: GridColOptions = {
  span: {
    sm: BreakpointConstants.SPAN_SM,
    md: BreakpointConstants.SPAN_MD,
    lg: BreakpointConstants.SPAN_LG
  },
  offset: {
    md: BreakpointConstants.OFFSET_MD,
    lg: BreakpointConstants.OFFSET_LG
  }
}

@Entry
@Component
struct Index {
  @State indexItemList: IndexItem[] = IndexViewModel.getIndexItemList();

  @Builder
  CardItem(item: IndexItem) {
    Stack() {
      Image(item.icon)
        .width('100%')
        .height(200)
        .borderRadius(24)
      Column() {
        Text(item.title)
          .fontColor(Color.White)
          .fontSize(20)
        Text(item.description)
          .fontColor(Color.White)
          .margin({ top: 8 })
          .fontSize(18)
        Blank()
        Button(item.button)
          .alignSelf(ItemAlign.End)
          .onClick(() => {
            router.pushUrl({ url: item.url }, router.RouterMode.Single)
          })
      }
      .width('100%')
      .height(200)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(20)

    }
  }

  build() {
    GridRow(adjustRow) {
      GridCol(adjustCol) {
        Column({ space: 12 }) {
          ForEach(this.indexItemList, (i: IndexItem) => {
            this.CardItem(i);
          }, (i: IndexItem, index: number) => JSON.stringify(i) + index)
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding({
      top: 64, left: 12, right: 12
    })

  }
}