import UIKit

let date = Date()
let calender = Calendar.current
let month = calender.component(.month, from: date)
let day = calender.component(.day, from: date)
let hour = calender.component(.hour, from: date)
let minutes = calender.component(.minute, from: date)
let seconds = calender.component(.second, from: date)

// Get Components
let componentsFromRightNow = calender.dateComponents([.year, .month, .day, .hour, .minute], from: date)
let dayOfWeek = calender.component(.weekday, from: date)

// Time intervals between two dates
let monthIterval = calender.dateInterval(of: .month, for: date)
let timePeriod = calender.dateComponents([.minute], from: monthIterval!.start, to: monthIterval!.end)
let minutesInMonth = timePeriod.minute


print("\(componentsFromRightNow)")
print("\(dayOfWeek)")
print("\(date)")
print("\(month)월 \(day)일,\(hour):\(minutes):\(seconds)")
