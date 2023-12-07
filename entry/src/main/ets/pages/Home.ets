@Component
export struct Home {
  build() {
    Column() {
      Row() {
        Text('占位')
        Flex() {
          TextInput()
        }
        .flexShrink(1)

        Text('免')
        Text('话筒')
      }
      .width('100%')

      Scroll() {
        Column() {

        }
      }
    }
    .height('100%')
  }
}