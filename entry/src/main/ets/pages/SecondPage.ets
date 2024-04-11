import router from '@ohos.router';
@Entry
@Component
struct SecondPage {
  @State message: string = '第二个页面';
  @State Msg:string = (router.getParams() as Record<string,string>)['sendMsg']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        //展示前一个页面传过来的数据
        Text(this.Msg)
          .fontSize(20)
          .opacity(0.8)
          .fontColor(0xff0000)
          .backgroundColor(0x0000ff)
        Blank()

        Button('返回')
          .fontSize(18)
          .width(300)
          .height(40)
          .backgroundColor(Color.Blue)
          .onClick(()=>{
            //确认窗口
            router.showAlertBeforeBackPage({message:'你确定要返回吗?'})
            //页面跳转
            router.back({
              url:"pages/FirstPage",
              params:{
              backMSG:'这是第二页传回的数据'
            }
            })
          })
      }
      .width('100%')
      .height(140)
      .backgroundImageSize(ImageSize.Cover)
    }
    .height('100%')
    .backgroundImage($rawfile('Amy.jpg'))
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImagePosition(Alignment.Center)
  }
}