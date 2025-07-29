// person.ts
export interface Person {
  id: string;
  name: string;
  age: number;
  x?:string;
}

// export type Persons = Array<PersonInter>

// Person の配列
export type Persons = Person[]

// ✅ ユニオン型
export type AgeGroup = 'child' | 'adult' | 'senior'

// ✅ 交差型
export type Named = { name: string }
export type WithId = { id: string }
export type NamedWithId = Named & WithId // => { name: string, id: string }

// ✅ ジェネリクス（例：ID 付きデータ）
export type WithGenericId<T> = T & { id: string }

// ✅ 関数
export const ageLimit = 18

export function greet(p: Person): string {
  return `你好，${p.name}，你今年${p.age}岁`
}
