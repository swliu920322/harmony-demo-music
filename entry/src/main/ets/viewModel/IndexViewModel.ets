import IndexItem from './IndexItem';

class IndexViewModel {
  /**
   * Data information on the home page.
   *
   * @returns IndexItem array.
   */
  getIndexItemList(): IndexItem[] {
    let IndexItemList: IndexItem[] = [];
    IndexItemList.push(new IndexItem($r('app.string.music_title'), $r('app.string.music_description'),
      $r('app.string.button_music'), $r('app.media.ic_music'),
      'pages/MusicList/MusicList'));
    IndexItemList.push(new IndexItem($r('app.string.live_title'), $r('app.string.live_description'),
      $r('app.string.button_live'), $r('app.media.ic_live'),
      'pages/Live'));
    return IndexItemList;
  }
}

export default new IndexViewModel();