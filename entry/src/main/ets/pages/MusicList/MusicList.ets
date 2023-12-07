import { BreakpointConstants } from '../../contants/BreakpointConstants'
import { StyleConstants } from '../../contants/StyleConstants'
import { Content } from './components/Content'
import { Header } from './components/Header'
import { Player } from './components/Player'

@Entry
@Component
struct MusicList {
  @State message: string = 'Hello World'
  @State currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  build() {
    Stack() {
      Header()
      Content()
      Player()
    }
    .width(StyleConstants.FULL_WIDTH)
  }
}