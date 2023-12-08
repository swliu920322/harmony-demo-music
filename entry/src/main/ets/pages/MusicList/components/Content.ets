import { AlbumCover } from '../../../components/AlbumCover';
import { GridConstants } from '../../../contants/GridConstants';

@Component
export struct Content {
  @Link currentBreakpoint: string;

  build() {
    GridRow() {
      GridCol({ span: {
        sm: GridConstants.SPAN_TWELVE,
        md: GridConstants.SPAN_SIX,
        lg: GridConstants.SPAN_FOUR
      } }) {
        AlbumCover({ currentBreakpoint: $currentBreakpoint })
      }
    }
    .onBreakpointChange((breakpoints: string) => {
      this.currentBreakpoint = breakpoints;
    })
  }
}