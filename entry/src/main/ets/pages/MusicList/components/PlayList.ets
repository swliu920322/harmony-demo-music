import { BreakpointConstants } from '../../../contants/BreakpointConstants';
import { StyleConstants } from '../../../contants/StyleConstants';
import { MusicList } from '../../../viewModel/MusicListViewModel';
import { SongItem } from '../../../viewModel/SongData';
import { SongDataSource } from '../../../viewModel/SongDataSource';

@Component
export struct PlayList {
  @Link currentBreakpoint: string;
  songList: SongItem[] = MusicList;

  @Builder
  PlayAll() {
    Row() {
      Row() {
        Image($r('app.media.ic_play_all'))
          .width(23)
          .height(23)
        Text('播放全部' + this.songList.length)
          .margin({left: 16})
      }
      Blank()
      Row() {
        Image($r('app.media.ic_order_play'))
          .width(23)
          .height(23)
        Image($r('app.media.ic_sort_list'))
          .width(23)
          .height(23)
          .margin({left: 16})
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  SongItem(item: SongItem, index: number) {
    Row() {
      Column() {
        Text(item.title)
          .fontColor(Color.Black)
          .margin({ bottom: 4 })
        Row() {
          Image(item.mark)
            .width(16)
            .height(16)
            .margin({ right: 4 })
          Text(item.singer)
            .fontColor(Color.Black)
            .opacity(0.38)
        }
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      Image($r('app.media.ic_list_more'))
        .width(24)
        .height(24)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(60)
  }

  build() {
    Column() {
      this.PlayAll();
      Column() {
        List() {
          LazyForEach(new SongDataSource(this.songList), (item: SongItem, index: number) => {
            ListItem() {
              this.SongItem(item, index)
            }
          }, (item: SongItem, index?: number) => JSON.stringify(item) + index)
        }
        .lanes(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
          2 : 1)
        .height(StyleConstants.FULL_HEIGHT)
        .width(StyleConstants.FULL_WIDTH)
        .margin({ top: 60 })
        // .layoutWeight(1)
        .divider({
          color: '#1a182431',
          strokeWidth: 0.5,
          // startMargin: 14,
          // endMargin: 14
        })
      }
      .layoutWeight(1)
    }
    .padding({
      left: 14,
      right: 14
    })
  }
}