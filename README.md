# AppStore

This was built and optimized for the iPhone X, so simulating it on the iPhone X will yield the best results. 

## Features

This app loads the top 25 posts from api.reddit and displays their: subreddit, title, author name, and image (if available). If the user scrolls beyond the initial 25 posts. It then shows a snazzy animation when the reddit post is clicked on ala the Apple App Store.

## Third-party libraries

[SDWebImage](https://github.com/rs/SDWebImage) was used to download images asynchronously and to cache images so that they were only downloaded one time. SDWebImage also has a convenient way to display placeholder images while the image is being loaded.

[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) is parsing library which was used to parse the JSON response from api.reddit into Swift objects.

[Cards](https://github.com/PaoloCuscela/Cards) is a UI library for card views



![Demo GIF](AirCam.gif)

