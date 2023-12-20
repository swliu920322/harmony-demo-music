import { GridConstants } from '../../../constants/GridConstants'
import { BreakpointType } from '../../../utils/BreakpointSystem'
import { OptionItem, optionList } from '../../../viewModel/SongListData'


@Component
export struct SongInfo {
  @Prop currentBreakpoint: string

  @Builder
  AlbumCover() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.ic_album'))
        .width('100%')
      Text('12.5万')
        .fontColor(Color.White)
        .padding(10)
    }
  }

  commonColConfig: GridColColumnOption = {
    sm: GridConstants.SPAN_FOUR,
    md: GridConstants.SPAN_TWELVE,
    lg: GridConstants.SPAN_TWELVE
  }

  build() {
    Column() {
      GridRow({ gutter: 10 }) {
        GridCol({ span: this.commonColConfig }) {
          this.AlbumCover()
        }

        GridCol({ span: { ...this.commonColConfig, sm: GridConstants.SPAN_EIGHT } } as GridColOptions) {
          Column({ space: 10 }) {
            Text($r('app.string.list_name'))
              .fontColor('#556b89')
              .fontSize(new BreakpointType({ sm: 16, md: 18, lg: 20 }).getValue(this.currentBreakpoint))
            Text($r('app.string.playlist_Introduction'))
              .fontSize(new BreakpointType({ sm: 12, md: 14, lg: 16 }).getValue(this.currentBreakpoint))
          }
          .alignItems(HorizontalAlign.Start)
          .margin({
            top: new BreakpointType({ sm: 10, md: 30, lg: 40 }).getValue(this.currentBreakpoint)
          })
        }
      }

      Row() {
        ForEach(optionList, (item: OptionItem) => {
          Column({ space: 5 }) {
            Image(item.image)
              .width(30)
              .height(30)
            Text(item.text)
          }
        }, (item: OptionItem, index?: number) => index + JSON.stringify(item))
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(
        new BreakpointType({ sm: 20, md: 30, lg: 40 }).getValue(this.currentBreakpoint)
      )
    }

    .padding({
      top: new BreakpointType({ sm: 10, md: 30, lg: 40 }).getValue(this.currentBreakpoint),
      left: new BreakpointType({ sm: 10, md: 30, lg: 40 }).getValue(this.currentBreakpoint),
    })
    // .backgroundColor(Color.Gray)
    // .width('100%')
  }
}

