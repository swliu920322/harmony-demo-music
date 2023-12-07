class Tab {
  label = '';
  activeIcon = '';
  commonIcon = '';

  constructor(label: string, activeIcon?: any, commonIcon?: any) {
    this.label = label;
    this.activeIcon = activeIcon;
    this.commonIcon = commonIcon;
  }
}

export class MainData {
  static getTabs(): Tab[] {
    let tabs: Tab[] = [];
    tabs.push(new Tab('发现'));
    tabs.push(new Tab('播客'));
    tabs.push(new Tab('我的'));
    tabs.push(new Tab('动态'));
    tabs.push(new Tab('漫游'));
    return tabs;
  }
}