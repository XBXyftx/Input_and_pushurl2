import router from '@ohos.router';
@Entry
@Component
struct FirstPage {
  @State message: string = '第一个页面';
  @State backMSG: string = ''
  @State num:number = 0;

  onPageShow(){
    let record = router.getParams() as Record<string,string>
    if(record){
      this.backMSG = record['backMSG']
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        Text(this.backMSG)
          .fontSize(20)
          .opacity(0.8)
        Blank()

        TextInput({placeholder:'请输入'})
          .width(200)
          .backgroundColor('#36D')
          .type(InputType.Number)
          .onChange((value)=>{
            console.log(value)
            this.num = parseInt(value)
          })
        Blank()
        Button('跳转到第二个页面')
          .fontSize(18)
          .width(300)
          .height(40)
          .backgroundColor(Color.Blue)
          .onClick(()=>{
            //页面跳转
            router.pushUrl({
              url: "pages/SecondPage",
              params:{
                sendMsg:'这是第一页传来的数据'+ this.num
              }
            })
          })
      }
      .width('100%')
      .height(160)
    }
    .height('100%')
    .backgroundImage($rawfile('Amiya2.jpg'))
    .backgroundImageSize(ImageSize.Cover)
    .opacity(1)
    .backgroundImagePosition(Alignment.Center)
  }
}