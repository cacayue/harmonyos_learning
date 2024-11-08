import { CourseLearning } from '@ohos/learning';
import { KnowledgeMap, KnowledgeMapContent } from '@ohos/map';
import { QuickStartPage } from '@ohos/quickstart';

@Entry
@Component
struct Index {
  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent(){
        Text('context1')
      }
      .tabBar('TabBar1')
      TabContent(){
        Text('context2')
      }
      .tabBar('TabBar2')
      TabContent(){
        Text('context3')
      }
      .tabBar('TabBar3')
    }
    .scrollable(false)
    .vertical(false)
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28})
  }
}