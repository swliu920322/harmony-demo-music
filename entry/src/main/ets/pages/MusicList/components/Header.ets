import router from '@ohos.router';
import { BreakpointType } from '../../../utils/BreakpointSystem';
import { HeaderConstants } from '../../../contants/HeaderConstants';
import { StyleConstants } from '../../../contants/StyleConstants';

@Component
export struct Header {
  @Link currentBreakpoint: string;
  build() {
    Row({ space: 10 }) {
      Image($r('app.media.ic_back'))
        .width('20vp')
        .height('20vp')
        .onClick(() => router.back())
      Text($r('app.string.play_list'))
        .fontWeight(HeaderConstants.TITLE_FONT_WEIGHT)
        .fontColor($r('app.color.title_color'))
        .opacity($r('app.float.title_opacity'))
        .fontSize(new BreakpointType({
          sm: 18,
          md: 20,
          lg: 22
        }).getValue(this.currentBreakpoint))
      Blank()
      Image($r('app.media.ic_more'))
        .width(20)
        .height(20)
    }
    .padding({ left: 16, right: 16 })
    .width(StyleConstants.FULL_WIDTH)
    .height(50)
  }
}