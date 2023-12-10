import { BreakpointConstants } from '../contants/BreakpointConstants';
import { GridConstants } from '../contants/GridConstants';
import { StyleConstants } from '../contants/StyleConstants';
import { BreakpointType } from '../utils/BreakpointSystem';
import { OptionItem, optionList } from '../viewModel/SongListData';

@Component
struct AlbumComponent {
  @Link currentBreakpoint: string;
  @State count: string = '12.5万';

  @Builder
  CoverImg() {
    // 因为从下定位好定位
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.ic_album'))
        .width(StyleConstants.FULL_WIDTH)
        .borderRadius(8)
        .aspectRatio(1)
      Text(this.count)
        .fontColor(Color.White)
        .translate({
          x: StyleConstants.TRANSLATE_X,
          y: StyleConstants.TRANSLATE_Y
        })
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    // 当前组件的宽高比
    .aspectRatio(1)
  }

  static titleFont = {
    sm: 16, md: 18, lg: 20
  }
  static contentFont = {
    sm: 12, md: 14, lg: 16
  }

  isSM() {
    return this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM
  }

  @Builder
  CoverIntro() {
    Column() {
      Text('独立民谣')
        .fontSize(new BreakpointType(AlbumComponent.titleFont).getValue(this.currentBreakpoint))
        .margin({ bottom: 10 })
      Text('歌单选取了一些比较受关注的民谣歌曲。')
        .fontSize(new BreakpointType(AlbumComponent.contentFont).getValue(this.currentBreakpoint))
        .opacity(0.6)
        .fontColor('#556B89')
    }
    .width(StyleConstants.FULL_HEIGHT)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: this.isSM() ? 20 : 0 })
    .margin({
      top: this.isSM() ? 0 : 30,
      bottom: this.isSM() ? 0 : 20
    })
  }

  @Builder
  coverOperate() {
    Row() {
      ForEach(optionList, (item: OptionItem) => {
        Column() {
          Image(item.image)
            .width(30).aspectRatio(1)
          Text(item.text)
        }
      }, (item: OptionItem, index: Number) => index + JSON.stringify(item))
    }
  }

  static imgRowCol = {
    sm: GridConstants.SPAN_FOUR,
    md: GridConstants.SPAN_TWELVE,
    lg: GridConstants.SPAN_TWELVE
  }
  static introRowCol = {
    sm: GridConstants.SPAN_EIGHT,
    md: GridConstants.SPAN_TWELVE,
    lg: GridConstants.SPAN_TWELVE
  }

  build() {
    GridRow() {
      GridCol({ span: AlbumComponent.imgRowCol }) {
        this.CoverImg()
      }

      GridCol({ span: AlbumComponent.introRowCol }) {
        this.CoverIntro()
      }

      GridCol({ span: 12 }) {
        this.coverOperate()
      }
    }
    .padding({
      top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 50 : 70,
      left: new BreakpointType({ sm: 0, md: 10, lg: 20 }).getValue(this.currentBreakpoint),
      right: new BreakpointType({ sm: 0, md: 10, lg: 20 }).getValue(this.currentBreakpoint)
    })
  }
}

@Component
export struct AlbumCover {
  @Link currentBreakpoint: string;

  build() {
    if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM) {
      AlbumComponent({ currentBreakpoint: $currentBreakpoint })
    } else {
      AlbumComponent({ currentBreakpoint: $currentBreakpoint })
        .height(StyleConstants.FULL_HEIGHT)
    }
  }
}

