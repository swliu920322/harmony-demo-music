import { MainData } from '../contants/MainData'
import { Home } from './Home'
@Component
struct NetEaseTab {
  private controller: TabsController = new TabsController()
  private tabs = MainData.getTabs()
  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
      TabContent() {
        Home()
      }
      .tabBar(this.tabs[0].label)

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Blue)
      }
      .tabBar(this.tabs[1].label)

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Yellow)
      }
      .tabBar(this.tabs[2].label)

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Pink)
      }
      .tabBar(this.tabs[3].label)
      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.White)
      }
      .tabBar(this.tabs[4].label)
    }
    .vertical(false)
    .barWidth('100%') // 设置TabBar宽度
    .barHeight(60) // 设置TabBar高度
    .width('100%') // 设置Tabs组件宽度
    .height('100%') // 设置Tabs组件高度
    .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @Provide theme: 'dark' | 'light' = 'dark';

  build() {
    Column() {
      NetEaseTab()
    }
    .height('100%')
    .width('100%')
  }
}