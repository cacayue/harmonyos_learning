class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string,imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

class ArticleClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  title: string = '';
  brief: string = '';
  webUrl: string = '';

  constructor(id: string,imageSrc: ResourceStr, title: string, brief: string, webUrl: string) {
      this.id  = id;
      this.imageSrc  = imageSrc;
      this.title  = title;
      this.brief  = brief;
      this.webUrl = webUrl;
  }
}

@Entry
@Component
struct Index {
  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      Scroll(){
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}

@Component
struct EnablementView {
  @State enablementList: Array<ArticleClass> = [
    new ArticleClass('1', $r('app.media.enablement_pic1'), 'HarmonyOS第一课',
      '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-video-courses/video-tutorials-0000001443535745'),
    new ArticleClass('2', $r('app.media.enablement_pic2'), '开发指南',
      '提供系统能力概述、快速入门，用于指导开发者进行场景化的开发。指南涉及到的知识点包括必要的背景知识、符合开发者实际开发场景的操作任务流（开发流程、开发步骤、调测验证）以及常见问题等。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-dev-guide-0000001630265101'),
    new ArticleClass('3', $r('app.media.enablement_pic3'), '最佳实践',
      '针对新发布特性及热点特性提供详细的技术解析和开发最佳实践。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/topic-architecture-0000001678045510'),
  ];

  build() {
    Column() {
      Text('赋能套件')
        .fontColor($r('sys.color.font_primary'))
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid() {
        ForEach(this.enablementList, (item: ArticleClass) => {
          GridItem() {
            EnablementItem({ enablementItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top:2, left: 16, right: 16 })
    }
    .margin({ top:18 })
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct TutorialView {
  @State tutorialList: Array<ArticleClass> = [
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'Step1 环境的搭建',
      '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new ArticleClass('2', $r('app.media.tutorial_pic2'), 'Step2 使用Swiper构建运营广告位',
      'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new ArticleClass('3', $r('app.media.tutorial_pic3'), 'Step3 创建和组合视图',
      'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new ArticleClass('4', $r('app.media.tutorial_pic4'), 'Step4 网格和列表组建的使用',
      '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ];

  build() {
    Column() {
      Text('入门教程')
        .fontColor($r('sys.color.font_primary'))
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({ space: 12 }){
        ForEach(this.tutorialList, (item: ArticleClass) => {
          ListItem() {
            TutorialItem({ tutorialItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .scrollBar(BarState.Off)
      .padding({ left:16, right: 16})
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}

// @Preview
@Component
struct Banner {
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.banner_pic0'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.banner_pic1'),
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.banner_pic2'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', $r('app.media.banner_pic3'),
      'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', $r('app.media.banner_pic4'),
      'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', $r('app.media.banner_pic5'),
      'https://developer.huawei.com/consumer/cn/sdk')
  ];

  build() {
    Swiper() {
      ForEach(this.bannerList, (banner: BannerClass) => {
        Image(banner.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (banner: BannerClass) => banner.id)
    }
    .autoPlay(true)
    .duration(500)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7')
    )
  }
}

// @Preview
@Component
struct EnablementItem {
  @Prop enablementItem: ArticleClass;

  build() {
    Column() {
      Image(this.enablementItem.imageSrc)
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius( {
          topLeft: 16,
          topRight: 16
        })
      Text(this.enablementItem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 2, right: 12})
        .margin({ top: 8 })
      Text(this.enablementItem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0,0,0, 0.6)')
        .padding({ left: 12, right: 12})
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}

// @Preview
@Component
struct TutorialItem {
  @Prop tutorialItem: ArticleClass;

  build() {
    Row() {
      Column(){
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0,0,0, 0.6)')
          .margin({ top: 5 })
      }
      .height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })

      Image(this.tutorialItem.imageSrc)
        .height(64)
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}