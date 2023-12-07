export default class IndexItem {
  /**
   * List item name.
   */
  title: ResourceStr;

  /**
   * List item description.
   */
  description: ResourceStr;

  /**
   * Button text information.
   */
  button: ResourceStr;

  /**
   * Background image information.
   */
  icon: Resource;

  /**
   * Jumping path information.
   */
  url: string;

  constructor(title: ResourceStr, description: ResourceStr, button: ResourceStr, icon: Resource, url: string) {
    this.title = title;
    this.description = description;
    this.button = button;
    this.icon = icon;
    this.url = url;
  }
}