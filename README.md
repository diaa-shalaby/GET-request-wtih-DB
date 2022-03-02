### HTTP endpoint sentiment analysis
A simple HTTP endpoint in Python using Flask that predicts sentiment for a given sentence
(sentiment analysis). The service authenticates the user (found in `users_DB.txt`), give the opportunity to select a model and
return one of the 3 sentiments: “happy”, “neutral”, or “unhappy”.

GET request handler for the route /predict.

- Input: /predict?username=dwight&amp;model=happy&amp;sentence=i-am-very-happy  
- Output: minimal json response: { “predicted_sentiment”: &quot;happy&quot; }  

- Input: /predict?username=john&amp;model=length-based&amp;sentence=i-am-very-happy-but-my-sentence-is-long  
- Output: minimal json response: { “predicted_sentiment”: &quot;unhappy&quot; }

### SQL Impressions and Conversions DB
In programmatic advertising, ads (commonly referred to as impressions) are shown on websites with the
help of DSPs (Demand Side Platforms). These platforms want to make sure that they are showing the
right impressions to the right users in order to generate as many conversions as possible. Conversion is
an event that occurs when a user lands on the advertiser&#39;s website. Put simply - when a user opens a
website which contains some space for an ad, a request is sent to our servers where choose the right
impression, which we serve to the user. We also store the request data in a table
called impressions. If a user clicks on the ad and lands on the advertiser&#39;s website
we store this event in a table called conversions. For each conversion there exists
at least one impression, but not all impressions have a conversion.




