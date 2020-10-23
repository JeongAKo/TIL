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
~~~

