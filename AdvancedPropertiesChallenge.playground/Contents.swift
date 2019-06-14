import Foundation

var width: Float = 1.5
var height: Float = 2.3

var areaPerBucket: Float = 1.5

var bucketsOfPaint: Int {
    get {
        let area = width * height
        return Int((area / areaPerBucket).rounded(.up))
    }
    set {
        let paintCoverage = Float(newValue) * areaPerBucket
        print("With \(newValue) buckets of pain, you can paint \(paintCoverage) meters squared of wall")
    }
}

print(bucketsOfPaint)
