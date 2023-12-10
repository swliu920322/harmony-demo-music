import { BreakpointType } from '../../../utils/BreakpointSystem';
import { MusicList } from '../../../viewModel/MusicListViewModel';
import { SongItem } from '../../../viewModel/SongData';

@Component
export struct Player {
  @Link currentBreakpoint: string;
  @StorageProp('selectIndex') selectIndex: number = 0;
  @StorageLink('isPlay') @Watch('animationFun') isPlay: boolean = false;
  songList: SongItem[] = MusicList;

  animationFun() {

  }

  getCurSong() {
    return this.songList[this.selectIndex]
  }

  getSongSingerFont() {
    return new BreakpointType({
      sm: 10, md: 12, lg: 14
    }).getValue(this.currentBreakpoint)
  }

  build() {
    Row() {
      Row() {
        Image(this.getCurSong().label)
          .width(32)
          .height(32)
          .borderRadius(16)
          .margin({ right: 12 })
        Column() {
          Text(this.getCurSong().title)
            .fontSize(new BreakpointType({
              sm: 14, md: 16, lg: 18
            }).getValue(this.currentBreakpoint))
            .fontColor('#000000')
          Row() {
            Image(this.getCurSong().mark)
              .height(16)
              .width(16)
              .margin({ right: 4 })
            Text(this.getCurSong().singer)
              .fontColor('#000000')
              .fontSize(this.getSongSingerFont())
              .opacity(0.3)
          }
        }
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      Blank()
      Row() {
        Image($r('app.media.ic_previous'))
          .width(24)
          .height(24)
        Image(this.isPlay ? $r('app.media.ic_play') : $r('app.media.ic_pause'))
          .width(24)
          .height(24)
          .margin({ right: 16, left: 16 })
        Image($r('app.media.ic_list_next'))
          .width(24)
          .height(24)

      }
      .width(
        new BreakpointType({
          sm: 120,
          md: 120,
          lg: 150
        }).getValue(this.currentBreakpoint)
      )
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height(48)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#F6F9FC')
    .justifyContent(FlexAlign.SpaceBetween)
    .position({ x: 0, y: '100%' })
    .translate({ x: 0, y: -48 })
  }
}