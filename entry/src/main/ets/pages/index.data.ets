import { BreakpointConstants } from '../contants/BreakpointConstants'
export class IndexConstants {
  static gridRow = {
    breakpoints: {
      value: BreakpointConstants.BREAKPOINT_VALUE,
      reference: BreakpointsReference.WindowSize
    },
    columns: {
      sm: BreakpointConstants.COLUMN_SM,
      md: BreakpointConstants.COLUMN_MD,
      lg: BreakpointConstants.COLUMN_LG,
    },
    gutter: {x: BreakpointConstants.GUTTER_X}
  }
  static gridCol = {
    span: {
      sm: BreakpointConstants.SPAN_SM,
      md: BreakpointConstants.SPAN_MD,
      lg: BreakpointConstants.SPAN_LG
    },
    offset: {
      md: BreakpointConstants.OFFSET_MD,
      lg: BreakpointConstants.OFFSET_LG,
    }
  }
}