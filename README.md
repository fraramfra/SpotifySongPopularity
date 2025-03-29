# 🎸SpotifySpinStats - Motivation🎸

Target Audience: Music Labels and Artists

This app provides insights to help music labels and emerging artists understand which musical characteristics make albums popular. By analyzing relationships between features like danceability, tempo, and popularity according to Spotify standards, the app helps its target audience invest in artists and genres with a higher likelihood of success understanding that popularity is key to driving revenue across the music industry.

The dashboard visualizes various aspects of music, including genres, characteristics (danceability, energy, valence, etc.), explicit content, and popularity levels of a wide variety of albums available on Spotify.

You can find the app deployed on Posit Connect Cloud in this [link](https://0195e098-b360-07c6-5613-ec87a6dcdfe6.share.connect.posit.cloud/)

---

## App Description

[Click here to go to Demo Video file location for download](img/SpotifySpinStatsDemo.mp4)

[Watch the video here - Vimeo](https://vimeo.com/manage/videos/1066078699)

---
## 🛠️ **Installation Instructions**

Thank you for considering contributing to **SpotifySpinStats**! We welcome contributions that help improve the project, whether by adding new features, improving documentation, or fixing bugs. Below is a guide to help you get started if you’d like to run the dashboard locally or contribute to the project.

### Prerequisites

To run the app locally, you'll need to set up your environment with the required dependencies. 

To do so, the `renv` library is a prerequisite.

### Environment Setup

1. Clone this repository:

    ```bash
    git clone git@github.com:fraramfra/SpotifySongPopularity.git
    ```

2. Navigate to the project directory:

    ```bash
    cd SpotifySongPopularity/
    ```

3. Set up R environment based on the provided `.Rproj` and `renv.lock` file:

  - Open `DSCI_532_individual-assignment_fraram88.Rproj` in RStudio
  - On the terminal in RStudio install the environment:

    ```bash
    renv::restore()
    ```

### Running the Dashboard Locally

To run the application:

  - Option A:
    - From the RStudio session with the R project.
    - Go to File->Open File and select `app.R` located in the folder `/src`.
    - Locate the button `Run App` and click it.

  - Option B:
    - From the command line and on the root folder of the Git Repo:
    ```bash
    RScript src/app.R
    ```
    - Locate URL that looks like `http://127.0.0.1:8050`
    - Copy and paste it in an explorer.

---

## 🎶 **For Dashboard Users**

By using this dashboard, you'll be able to explore:

- **Danceability:** Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.

- **Duration:** The duration of the track in minutes.

- **Energy:** Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.

- **Loudness:** The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typically range between -60 and 0 db.

- **Tempo:** The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.

- **Valence:** A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).

---

## Need Help?

If you encounter any issues or have questions, please feel free to open an issue in the GitHub repository.

---

## Issues & Pull Requests 🎧

If you encounter any issues while using the dashboard or have an idea for a new feature, feel free to open an issue or submit a pull request. Please make sure to follow the contributing guidelines and include relevant information for your proposed changes.

---

## 📄 **License**

Commuting Insights is licensed under the MIT license. See the LICENSE file for more details.

---

## 👨‍💻 **Contributors**

- [Francisco Ramirez](https://github.com/fraramfra)

---

## 🔗 **References**
Pandy, M. (2020). Spotify Tracks Dataset. Kaggle. https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset

Spotify. (n.d.). Get audio features. Spotify Developer. Retrieved March 14, 2025, from https://developer.spotify.com/documentation/web-api/reference/get-audio-features
