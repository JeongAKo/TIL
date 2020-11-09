APNs Key(AuthKey_8Z6AYPA2Y6.p8)

- Name:APNs
- Key ID:8Z6AYPA2Y6
- Services:Apple Push Notifications service (APNs)





https://www.raywenderlich.com/11395893-push-notifications-tutorial-getting-started



온라인으로 TEST

https://www.logisticinfotech.com/send-push-notification-online/



~~~json
{
   “aps” : {
      “alert” : {
         “title” : “Game Request”,
         “subtitle” : “Five Card Draw” //없어도 됨
         “body” : “Bob wants to play poker”,
      },
      “category” : “GAME_INVITATION”
   },
   “gameID” : “12345678”
}

{
	"aps": {
		"content-available": 1, //Int
		“alert” : {
         “title” : “Game Request”, //String
         “subtitle” : “Five Card Draw” //String //없어도됨
         “body” : “Bob wants to play poker”, //String
      },
		"badge": 9, //Int
		"sound": "default" //String
	}
}

{   "aps": {
       "alert": "Hello!",
       "sound": "default",
       "mutable-content": 1,
       "badge": 1,
   },
   "data": {
       "attachment-url": "https://abc.com/sample_image.jpg"
   }
}
~~~



https://www.logisticinfotech.com/send-push-notification-online/

**Key ID** 8Z6AYPA2Y6

**Team ID** QAFQ5XW788

**Bundle ID** fp.FleapopProject

**Device Token** 4cfa502a78ef54a898895c1d1f69b7aa52f4f29e436d48b8183debbed27ae074





https://developer.apple.com/forums/thread/660715

iOS14부터 call이 안들어오는 이슈

이유는 이름이 한글이라서



Xcode project -> Build Settings -> Packaging

 **Product Name** 을 변경해 주니까 나온다

<img width="947" alt="스크린샷 2020-11-03 오후 8 01 19" src="https://user-images.githubusercontent.com/47776915/97977293-58e9eb80-1e0f-11eb-92dd-b5505e6ddafb.png">

