
@Component
export struct Header {
  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_back'))
          .width(20)
          .height(20)
        Text($r('app.string.play_list'))
          .margin({left: 10})
      }
      Blank()
      Image($r('app.media.ic_more'))
        .width(20)
        .height(20)
    }
    .width('100%')
    .padding(20)
  }
}