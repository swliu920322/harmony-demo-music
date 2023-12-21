import { SongItem } from '../../../viewModel/SongData'

@Component
export struct PlayInfo {
  @Link item: SongItem

  build() {
    Column({ space: 5 }) {
      Text(this.item.title)
      Row() {
        Image(this.item.mark)
          .width(16)
          .height(16)
        Text(this.item.singer)
      }
    }
    .alignItems(HorizontalAlign.Start)
  }
}