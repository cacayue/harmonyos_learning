import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { RouterPath } from './CommonParams';

export class Tmp{
  paramA1: string = ""
}

export type  buttonClickFn = () => void;

@Builder export function overBuilder(params: Tmp){
  Row() {
    Text(`User State Var Ref: ${params.paramA1}`)
      .fontSize(30)
  }
}

@Builder
export function buildButton(text: string, fn: buttonClickFn){
  Button(text)
    .fontSize(30)
    .margin(20)
    .onClick(() => {
      fn();
    })
}

export function goToRouter(path: RouterPath){
  router.pushUrl({ url: path })
    .catch((err: BusinessError) => {
      console.info(err.message);
    });
}

export function goToIndex(){
  router.pushUrl({ url: RouterPath.Index })
    .catch((err: BusinessError) => {
      console.info(err.message);
    });
}