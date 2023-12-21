import { MusicList } from '../../../viewModel/MusicListViewModel';
import { SongItem } from '../../../viewModel/SongData';
import { PlayInfo } from './PlayInfo'

@Component
export struct Player {
  @State songList: SongItem[] = MusicList;
  @State songItem: SongItem = this.songList[0]
  @State isPlay: boolean = false;
  // @StorageLink('isPlay') @Watch('animationFun') isPlay: boolean = false;
  //
  // animationFun(): void {
  //
  // }

  build() {
    Row() {
      Row({ space: 12 }) {
        Image(this.songItem.label)
          .width(32)
          .height(32)
          .borderRadius(16)
        PlayInfo({ item: $songItem })
      }
      .layoutWeight(1)

      Blank()
      Row() {
        Image($r('app.media.ic_previous'))
          .height(24)
          .width(24)
        Image(this.isPlay ? $r('app.media.ic_play') : $r('app.media.ic_pause'))
          .height(24)
          .width(24)
        Image($r('app.media.ic_list_next'))
          .height(24)
          .width(24)
      }
    }
    .width('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#f6f9fc')
  }
}