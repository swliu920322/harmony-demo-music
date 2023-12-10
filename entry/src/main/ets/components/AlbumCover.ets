import { BreakpointConstants } from '../contants/BreakpointConstants';
import { GridConstants } from '../contants/GridConstants';
import { StyleConstants } from '../contants/StyleConstants';
import { BreakpointType } from '../utils/BreakpointSystem';

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

  @Builder
  CoverIntro() {

  }

  @Builder
  coverOperate() {

  }

  static rowCol = {
    sm: GridConstants.SPAN_FOUR,
    md: GridConstants.SPAN_TWELVE,
    lg: GridConstants.SPAN_TWELVE
  }

  build() {
    Column() {
      GridRow() {
        GridCol({ span: AlbumComponent.rowCol }) {
          this.CoverImg()
        }
      }
      .padding({
        top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 50 : 70,
        left: new BreakpointType({ sm: 0, md: 10, lg: 20 }).getValue(this.currentBreakpoint),
        right: new BreakpointType({ sm: 0, md: 10, lg: 20 }).getValue(this.currentBreakpoint)
      })
    }

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

