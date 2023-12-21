import { BreakpointConstants } from '../../constants/BreakpointConstants'
import { GridConstants } from '../../constants/GridConstants'
import { Header } from './components/Header'
import { Player } from './components/Player'
import { PlayList } from './components/PlayList'
import { SongInfo } from './components/SongInfo'

@Entry
@Component
struct MusicList {
  @State message: string = 'Hello World'
  @State currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  commonColConfig: GridColColumnOption = {
    sm: GridConstants.SPAN_TWELVE,
    md: GridConstants.SPAN_SIX,
    lg: GridConstants.SPAN_FOUR
  }

  build() {
    Column() {
      Header()

      Flex() {
        GridRow() {
          GridCol({ span: this.commonColConfig }) {
            SongInfo({ currentBreakpoint: this.currentBreakpoint })
          }

          GridCol({ span: { ...this.commonColConfig, lg: GridConstants.SPAN_EIGHT } } as GridColOptions) {
            PlayList({ currentBreakpoint: this.currentBreakpoint })
          }
        }
        .width('100%')
        .onBreakpointChange((breakpoints: string) => {
          this.currentBreakpoint = breakpoints;
        })
      }
      .flexGrow(1)
      .flexShrink(1)

      Player()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
      '#e4ecf7' : '#f69fc')
  }
}