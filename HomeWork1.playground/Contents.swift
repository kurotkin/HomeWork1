import Foundation

// TODO: Решить квадратное уравнение

// Параметры квадратного уравнения
struct param {
    var a: Float = 1.0
    var b: Float = 1.0
    var c: Float = 1.0
}

// Класс квадратного уравнения
class QEq {
    var p = param()
    func D() -> Float{
        return p.b * p.b - 4.0 * p.a * p.c
    }
    func isRoots() -> Bool{
        if D() >= 0.0 {
            return true
        } else {
            return false
        }
    }
    func isQEq() -> Bool {
        if p.a == 0.0 {
            return false
        } else {
            return true
        }
    }
    func Solve() -> (Float?, Float?){
        if isQEq() {
            if isRoots() {      // В случае квадратного уравнения
                return ((-1.0 * p.b + sqrt(D())) / (2.0 * p.a), (-1.0 * p.b - sqrt(D())) / (2.0 * p.a))
            } else {
                return (nil, nil)
            }
        } else {                // В случак не квадратного уравнения
            if p.b != 0.0 {
                return ((-1.0 * p.c / p.b), (-1.0 * p.c / p.b))
            } else {
                return (0.0, 0.0)
            }
        }
    }
    init (p: param) {
        self.p = p
    }
}

var myQEq = QEq(p:param(a:1.1, b:9.1, c: 3.2))

if myQEq.isRoots() {
    print("X1 = \(myQEq.Solve().0!)   X2 = \(myQEq.Solve().1!) ")
} else{
    print("No roots")
}


// TODO: Даны катеты прямоугольного треугольника. Найдите площадь, периметр и гипотенузу треугольника.

class Triangle {
    var a: Float
    var b: Float
    init (a:Float, b:Float) {
        self.a = a
        self.b = b
    }
    func getHypotenuse() -> Float{
        return sqrt(a * a + b * b)
    }
    func getPerimeter() -> Float{
        return a + b + getHypotenuse()
    }
    func getArea() -> Float{
        return a * b / 2.0
    }
}

var a: Float = 14.7;
var b: Float = 19.5;
var myTr = Triangle(a:a, b:b)
print("Площадь треугольника = \(myTr.getArea())")
print("Периметр треугольника = \(myTr.getPerimeter())")
print("Гипотенуза треугольника = \(myTr.getHypotenuse())")


// TODO: Пользователь вводит сумму вклада в банк и годовой процент. Найдите сумму вклада через 5 лет.

class Deposit {
    let rate: Float
    var summ: Float
    init (rate:Float, summ:Float){
        self.rate = rate
        self.summ = summ
    }
    func yearEnded() {
        summ += summ / 100.0 * rate
    }
    func getSumm() -> String{
        return "Текущая сумма = \(summ)"
    }
}

var myDeposit = Deposit(rate: 8.9, summ: 100_000)
for year in 1...5 {
    myDeposit.yearEnded()
}
print(myDeposit.getSumm())

