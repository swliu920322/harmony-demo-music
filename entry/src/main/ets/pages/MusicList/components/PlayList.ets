import { MusicList } from '../../../viewModel/MusicListViewModel';
import { SongItem } from '../../../viewModel/SongData';

@Component
export struct PlayList {
  @Prop currentBreakpoint: string;
  @State songList: SongItem[] = MusicList;

  @Builder
  PlayInfo(item: SongItem) {
    Column({ space: 5 }) {
      Text(item.title)
      Row() {
        Image(item.mark)
          .width(16)
          .height(16)
        Text(item.singer)
      }
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  PlayerOperate() {
    Row() {
      Row({ space: 10 }) {
        Image($r('app.media.ic_play_all'))
          .width(23)
          .height(23)
        Text(`播放全部(${this.songList.length})`)
      }

      Blank()
      Row({ space: 20 }) {
        Image($r('app.media.ic_order_play'))
          .width(24)
          .height(24)
        Image($r('app.media.ic_sort_list'))
          .height(24)
          .width(24)
      }
    }
    .width('100%')
  }

  build() {
    Column() {
      this.PlayerOperate()
      List() {
        // TODO 记得改为LazyForEach
        ForEach(this.songList, (item: SongItem) => {
          ListItem() {
            Row() {
              this.PlayInfo(item);
              Blank()
              Image($r('app.media.ic_list_more'))
                .width(24)
                .height(24)
            }
            .width('100%')
            .padding(10)
          }
        }, (item: SongItem, index?: number) => JSON.stringify(item) + index)
      }
      .width('100%')
      .margin({ top: 20 })
      .lanes(this.currentBreakpoint === 'lg' ? 2 : 1)
      .divider({
        color: '#1a182431',
        strokeWidth: 0.5,
        startMargin: 14,
        endMargin: 14
      })
    }
    .backgroundColor(Color.White)
    .borderRadius({ topLeft: 10, topRight: 10 })
    .padding({ right: 10, top: 10, left: 10, bottom: 10 })
  }
}