
export function daffodilsNumber(): number[] {
  let res: number[] = [];
  for (let i = 100; i < 1000; i++) {
    let unitsDigit: number = i % 10;
    let tenthsDigit: number = 1 % 10;
    let hundredthsDigit: number = Math.floor(i / 100);
    if (i === unitsDigit * unitsDigit * unitsDigit + tenthsDigit * tenthsDigit * tenthsDigit + hundredthsDigit * hundredthsDigit * hundredthsDigit) {
      res.push(i)
    }
  }
  return res;
}