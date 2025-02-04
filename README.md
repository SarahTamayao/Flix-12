# Project 2 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **15-18** hours spent in total

## User Stories

The following **required** functionality is complete:

- [✅ ] User sees an app icon on the home screen and a styled launch screen.
- [✅ ] User can view a list of movies currently playing in theaters from The Movie Database.
- [✅ ] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [✅ ] User sees a loading state while waiting for the movies API.
- [✅ ] User can pull to refresh the movie list.
- [✅ ] User sees an error message when there's a networking error.
- [✅ ] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [✅ ] User can tap a poster in the collection view to see a detail screen of that movie
- [✅ ] User can search for a movie.
- [✅ ] All images fade in as they are loading.
- [✅ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [✅ ] Customize the navigation bar.
- [✅ ] Customize the UI.
- [✅] Run your app on a real device.

The following **additional** features are implemented:

- Clicking on poster view in detailed view links to the movie trailer
- Release dates added to detailed view of movies

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Have an option to favorite movies and save it onto another page
2. Have more appealing/complementing colors and design

## Video Walkthrough

Here's a walkthrough of implemented user stories:



GIF created with (ezgif.com/video-to-gif).

## Notes

Challenges encountered while building the app.
- Collection view wouldn't resize to put search bar above the view
- Backdrop kept covering up poster view 
- Backdrop didn't expand to sides of phone
- Mispelling of the poster view outlet messed up the linking to click for movie trailer

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- WebKit - web content framework
- UIKit - user interface framework

## License

    Copyright [2021] [Ileen Fan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
