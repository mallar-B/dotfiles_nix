// ==UserScript==
// u/name         Auto Skip YouTube Ads
// u/version      1.0.0
// u/description  Speed up and skip YouTube ads automatically
// u/author       jso8910
// u/match        *://*.youtube.com/*
// u/exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==
setInterval(() => {
  const btn = document.querySelector(".ytp-skip-ad-button");
  if (btn) {
    btn.click();
  }
  const ad = [...document.querySelectorAll(".ad-showing")][0];
  if (ad) {
    document.querySelector("video").playbackRate = 10;
  }
}, 50);
