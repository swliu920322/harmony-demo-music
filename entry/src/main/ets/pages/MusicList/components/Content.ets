import { AlbumCover } from '../../../components/AlbumCover';
import { BreakpointConstants } from '../../../contants/BreakpointConstants';
import { GridConstants } from '../../../contants/GridConstants';
import { StyleConstants } from '../../../contants/StyleConstants';
import { BreakpointType } from '../../../utils/BreakpointSystem';
import { PlayList } from './PlayList';

@Component
export struct Content {
  @Link currentBreakpoint: string;
  static col: any = {
    sm: GridConstants.SPAN_TWELVE,
    md: GridConstants.SPAN_SIX,
    lg: GridConstants.SPAN_FOUR
  }

  build() {
    GridRow() {
      GridCol({ span: Content.col }) {
        AlbumCover({ currentBreakpoint: $currentBreakpoint })
      }
      .backgroundColor('#e4ecf7')
      .padding({
        left: new BreakpointType({ sm: 10, md: 30, lg: 40 }).getValue(this.currentBreakpoint),
        right: new BreakpointType({ sm: 10, md: 30, lg: 40 }).getValue(this.currentBreakpoint)
      })

      GridCol({ span: Content.col }) {
        PlayList()
      }
    }
    .height(StyleConstants.FULL_HEIGHT)
    .onBreakpointChange((breakpoints: string) => {
      this.currentBreakpoint = breakpoints;
    })
  }
}