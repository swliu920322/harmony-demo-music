
import { UiComponent } from '@ohos.UiTest';
interface IConfig {
  rowConfig: GridRowOptions;
  colConfig: GridColOptions;
  component: UiComponent
}

@Component
export struct GridRowCol {
  @Link config: IConfig;

  build() {
    GridRow(this.config.rowConfig) {
      GridCol(this.config.colConfig) {
        this.config.component
        ForEach()
      }
    }
  }
}