import { BreakpointConstants } from '../contants/BreakpointConstants';
import { GridConstants } from '../contants/GridConstants';
import { StyleConstants } from '../contants/StyleConstants';
import { AlbumComponent } from './AlbumComponent';

@Component
struct AlbumComponent {
  @Link currentBreakpoint: string;

  @Builder
  CoverImg() {

  }

  @Builder
  CoverIntro() {

  }

  @Builder
  coverOperate() {

  }

  build() {
    GridRow() {
      GridCol({ span: {
        sm: GridConstants.SPAN_FOUR,
        md: GridConstants.SPAN_TWELVE,
        lg: GridConstants.SPAN_TWELVE
      } }) {

      }
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