import { BreakpointSystem, BreakpointType } from '../../utils/BreakpointSystem'
import { BreakpointConstants } from '../../contants/BreakpointConstants'
import { StyleConstants } from '../../contants/StyleConstants'
import { Content } from './components/Content'
import { Header } from './components/Header'
import { Player } from './components/Player'

@Entry
@Component
struct MusicList {
  @State currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  // private breakpointSystem: BreakpointSystem = new BreakpointSystem();

  // aboutToAppear() {
  //   this.breakpointSystem.register();
  // }
  //
  // aboutToDisappear() {
  //   this.breakpointSystem.unregister();
  // }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Header({ currentBreakpoint: $currentBreakpoint })
      Content({ currentBreakpoint: $currentBreakpoint })
      Player({ currentBreakpoint: $currentBreakpoint })
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(
        this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
        '#e4ecf7' : '#f6f9fc'
    )
  }
}