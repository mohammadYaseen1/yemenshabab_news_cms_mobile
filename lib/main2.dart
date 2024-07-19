// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports
String exanple = '''
<html lang="ar" data-critters-container="" dir="rtl">
   <script id="allow-copy_script" src="chrome-extension://aefehdhdciieocakfobpaaolhipkcpgc/content_scripts/copy.js"></script>
   <head>
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
      <meta charset="utf-8">
      <title>يمن شباب نت</title>
      <base href="/">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="icon" type="image/x-icon" href="favicon.ico">
      <script>
         const html = document.querySelector('html');
         const isLightOrAuto = localStorage.getItem('hs_theme') === 'light' || (localStorage.getItem('hs_theme') === 'auto' && !window.matchMedia('(prefers-color-scheme: dark)').matches);
         const isDarkOrAuto = localStorage.getItem('hs_theme') === 'dark' || (localStorage.getItem('hs_theme') === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches);
         
         if (isLightOrAuto && html.classList.contains('dark')) html.classList.remove('dark');
         else if (isDarkOrAuto && html.classList.contains('light')) html.classList.remove('light');
         else if (isDarkOrAuto && html.classList.contains('dark')) html.classList.add('dark');
         else if (isLightOrAuto && html.classList.contains('light')) html.classList.add('light');
      </script>
      <style>@font-face{font-family:'Material Icons';font-style:normal;font-weight:400;src:url(https://fonts.gstatic.com/s/materialicons/v142/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2) format('woff2');}.material-icons{font-family:'Material Icons';font-weight:normal;font-style:normal;font-size:24px;line-height:1;letter-spacing:normal;text-transform:none;display:inline-block;white-space:nowrap;word-wrap:normal;direction:ltr;-webkit-font-feature-settings:'liga';-webkit-font-smoothing:antialiased;}</style>
      <style>*,:before,:after{box-sizing:border-box;border-width:0;border-style:solid;border-color:#e5e7eb}:before,:after{--tw-content: ""}html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;font-family:ui-sans-serif,system-ui,sans-serif,"Apple Color Emoji","Segoe UI Emoji",Segoe UI Symbol,"Noto Color Emoji";font-feature-settings:normal;font-variation-settings:normal;-webkit-tap-highlight-color:transparent}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}h3,h4{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}button{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;letter-spacing:inherit;color:inherit;margin:0;padding:0}button{text-transform:none}button{-webkit-appearance:button;background-color:transparent;background-image:none}h3,h4,hr,p{margin:0}ul{list-style:none;margin:0;padding:0}button{cursor:pointer}img,svg{display:block;vertical-align:middle}img{max-width:100%;height:auto}*,:before,:after{--tw-border-spacing-x: 0;--tw-border-spacing-y: 0;--tw-translate-x: 0;--tw-translate-y: 0;--tw-rotate: 0;--tw-skew-x: 0;--tw-skew-y: 0;--tw-scale-x: 1;--tw-scale-y: 1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness: proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width: 0px;--tw-ring-offset-color: #fff;--tw-ring-color: rgb(59 130 246 / .5);--tw-ring-offset-shadow: 0 0 #0000;--tw-ring-shadow: 0 0 #0000;--tw-shadow: 0 0 #0000;--tw-shadow-colored: 0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }.fixed{position:fixed}.absolute{position:absolute}.relative{position:relative}.bottom-20{bottom:5rem}.left-0{left:0}.left-\[-5px\]{left:-5px}.right-5{right:1.25rem}.start-0{inset-inline-start:0px}.top-0{top:0}.top-\[-5px\]{top:-5px}.top-full{top:100%}.z-10{z-index:10}.z-50{z-index:50}.col-span-10{grid-column:span 10 / span 10}.col-span-5{grid-column:span 5 / span 5}.mx-2{margin-left:.5rem;margin-right:.5rem}.mx-auto{margin-left:auto;margin-right:auto}.my-6{margin-top:1.5rem;margin-bottom:1.5rem}.mb-2{margin-bottom:.5rem}.mb-6{margin-bottom:1.5rem}.ms-2{margin-inline-start:.5rem}.mt-0{margin-top:0}.mt-3{margin-top:.75rem}.mt-52{margin-top:13rem}.mt-6{margin-top:1.5rem}.line-clamp-1{overflow:hidden;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:1}.block{display:block}.inline-block{display:inline-block}.flex{display:flex}.inline-flex{display:inline-flex}.grid{display:grid}.hidden{display:none}.size-4{width:1rem;height:1rem}.size-5{width:1.25rem;height:1.25rem}.size-\[46px\]{width:46px;height:46px}.size-full{width:100%;height:100%}.h-3{height:.75rem}.h-36{height:9rem}.h-\[220px\]{height:220px}.h-\[32px\]{height:32px}.h-auto{height:auto}.min-h-\[40rem\]{min-height:40rem}.w-1\/2{width:50%}.w-10{width:2.5rem}.w-3{width:.75rem}.w-48{width:12rem}.w-\[80\%\]{width:80%}.w-\[80rem\]{width:80rem}.w-full{width:100%}.max-w-\[100\%\]{max-width:100%}.max-w-\[80rem\]{max-width:80rem}.max-w-\[85rem\]{max-width:85rem}.flex-shrink-0,.shrink-0{flex-shrink:0}.grid-cols-1{grid-template-columns:repeat(1,minmax(0,1fr))}.grid-cols-10{grid-template-columns:repeat(10,minmax(0,1fr))}.grid-cols-5{grid-template-columns:repeat(5,minmax(0,1fr))}.flex-row{flex-direction:row}.flex-col{flex-direction:column}.flex-wrap{flex-wrap:wrap}.items-center{align-items:center}.justify-center{justify-content:center}.justify-between{justify-content:space-between}.gap-2{gap:.5rem}.gap-3{gap:.75rem}.gap-5{gap:1.25rem}.gap-6{gap:1.5rem}.gap-8{gap:2rem}.gap-x-2{column-gap:.5rem}.gap-x-3\.5{column-gap:.875rem}.gap-x-5{column-gap:1.25rem}.gap-y-1{row-gap:.25rem}.gap-y-4{row-gap:1rem}.gap-y-5{row-gap:1.25rem}.overflow-hidden{overflow:hidden}.overflow-x-auto{overflow-x:auto}.truncate{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.rounded-full{border-radius:9999px}.rounded-lg{border-radius:.5rem}.rounded-md{border-radius:.375rem}.rounded-sm{border-radius:.125rem}.rounded-r-md{border-top-right-radius:.375rem;border-bottom-right-radius:.375rem}.border{border-width:1px}.border-2{border-width:2px}.border-r-4{border-right-width:4px}.border-amber-600{--tw-border-opacity: 1;border-color:rgb(217 119 6 / var(--tw-border-opacity))}.border-gray-200{--tw-border-opacity: 1;border-color:rgb(229 231 235 / var(--tw-border-opacity))}.border-red-600{--tw-border-opacity: 1;border-color:rgb(220 38 38 / var(--tw-border-opacity))}.border-transparent{border-color:transparent}.bg-\[\#0088cc\]{--tw-bg-opacity: 1;background-color:rgb(0 136 204 / var(--tw-bg-opacity))}.bg-\[\#1877f2\]{--tw-bg-opacity: 1;background-color:rgb(24 119 242 / var(--tw-bg-opacity))}.bg-\[\#c13584\]{--tw-bg-opacity: 1;background-color:rgb(193 53 132 / var(--tw-bg-opacity))}.bg-\[\#ff0000\]{--tw-bg-opacity: 1;background-color:rgb(255 0 0 / var(--tw-bg-opacity))}.bg-black{--tw-bg-opacity: 1;background-color:rgb(0 0 0 / var(--tw-bg-opacity))}.bg-gray-100{--tw-bg-opacity: 1;background-color:rgb(243 244 246 / var(--tw-bg-opacity))}.bg-red-600{--tw-bg-opacity: 1;background-color:rgb(220 38 38 / var(--tw-bg-opacity))}.bg-red-700{--tw-bg-opacity: 1;background-color:rgb(185 28 28 / var(--tw-bg-opacity))}.bg-slate-900{--tw-bg-opacity: 1;background-color:rgb(15 23 42 / var(--tw-bg-opacity))}.bg-slate-950{--tw-bg-opacity: 1;background-color:rgb(2 6 23 / var(--tw-bg-opacity))}.bg-white{--tw-bg-opacity: 1;background-color:rgb(255 255 255 / var(--tw-bg-opacity))}.object-cover{object-fit:cover}.p-2{padding:.5rem}.px-2{padding-left:.5rem;padding-right:.5rem}.px-3{padding-left:.75rem;padding-right:.75rem}.px-4{padding-left:1rem;padding-right:1rem}.px-5{padding-left:1.25rem;padding-right:1.25rem}.px-8{padding-left:2rem;padding-right:2rem}.py-1{padding-top:.25rem;padding-bottom:.25rem}.py-10{padding-top:2.5rem;padding-bottom:2.5rem}.py-2{padding-top:.5rem;padding-bottom:.5rem}.py-3{padding-top:.75rem;padding-bottom:.75rem}.pb-0{padding-bottom:0}.pb-2{padding-bottom:.5rem}.text-center{text-align:center}.text-sm{font-size:.875rem;line-height:1.25rem}.text-xl{font-size:1.25rem;line-height:1.75rem}.text-xs{font-size:.75rem;line-height:1rem}.font-bold{font-weight:700}.font-light{font-weight:300}.font-medium{font-weight:500}.font-semibold{font-weight:600}.uppercase{text-transform:uppercase}.capitalize{text-transform:capitalize}.leading-normal{line-height:1.5}.text-amber-600{--tw-text-opacity: 1;color:rgb(217 119 6 / var(--tw-text-opacity))}.text-black{--tw-text-opacity: 1;color:rgb(0 0 0 / var(--tw-text-opacity))}.text-gray-200{--tw-text-opacity: 1;color:rgb(229 231 235 / var(--tw-text-opacity))}.text-gray-500{--tw-text-opacity: 1;color:rgb(107 114 128 / var(--tw-text-opacity))}.text-gray-600{--tw-text-opacity: 1;color:rgb(75 85 99 / var(--tw-text-opacity))}.text-gray-800{--tw-text-opacity: 1;color:rgb(31 41 55 / var(--tw-text-opacity))}.text-gray-900{--tw-text-opacity: 1;color:rgb(17 24 39 / var(--tw-text-opacity))}.text-red-600{--tw-text-opacity: 1;color:rgb(220 38 38 / var(--tw-text-opacity))}.text-slate-800{--tw-text-opacity: 1;color:rgb(30 41 59 / var(--tw-text-opacity))}.text-white{--tw-text-opacity: 1;color:rgb(255 255 255 / var(--tw-text-opacity))}.opacity-0{opacity:0}.shadow-md{--tw-shadow: 0 4px 6px -1px rgb(0 0 0 / .1), 0 2px 4px -2px rgb(0 0 0 / .1);--tw-shadow-colored: 0 4px 6px -1px var(--tw-shadow-color), 0 2px 4px -2px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000),var(--tw-ring-shadow, 0 0 #0000),var(--tw-shadow)}.transition{transition-property:color,background-color,border-color,text-decoration-color,fill,stroke,opacity,box-shadow,transform,filter,backdrop-filter;transition-timing-function:cubic-bezier(.4,0,.2,1);transition-duration:.15s}.transition-\[opacity\,margin\]{transition-property:opacity,margin;transition-timing-function:cubic-bezier(.4,0,.2,1);transition-duration:.15s}.transition-transform{transition-property:transform;transition-timing-function:cubic-bezier(.4,0,.2,1);transition-duration:.15s}.duration-150{transition-duration:.15s}.duration-500{transition-duration:.5s}.duration-\[150ms\]{transition-duration:.15s}.ease-in-out{transition-timing-function:cubic-bezier(.4,0,.2,1)}.\[--adaptive\:none\]{--adaptive: none}.\[--placement\:bottom-right\]{--placement: bottom-right}.\[--strategy\:fixed\]{--strategy: fixed}.\[--trigger\:hover\]{--trigger: hover}@font-face{font-family:NeoSans;src:url("./media/Neo Sans Arabic Regular-C2FJCHY6.ttf")}html{scroll-behavior:smooth}*{transition:.2s;font-family:NeoSans,sans-serif}@media (min-width: 640px){}@media (min-width: 1024px){}html,body{height:100%}body{margin:0;font-family:Roboto,Helvetica Neue,sans-serif}.before\:absolute:before{content:var(--tw-content);position:absolute}.before\:-top-5:before{content:var(--tw-content);top:-1.25rem}.before\:start-1:before{content:var(--tw-content);inset-inline-start:.25rem}.before\:h-5:before{content:var(--tw-content);height:1.25rem}.before\:w-full:before{content:var(--tw-content);width:100%}.hover\:bg-amber-600:hover{--tw-bg-opacity: 1;background-color:rgb(217 119 6 / var(--tw-bg-opacity))}.hover\:bg-gray-100:hover{--tw-bg-opacity: 1;background-color:rgb(243 244 246 / var(--tw-bg-opacity))}.hover\:bg-red-600:hover{--tw-bg-opacity: 1;background-color:rgb(220 38 38 / var(--tw-bg-opacity))}.hover\:bg-red-700:hover{--tw-bg-opacity: 1;background-color:rgb(185 28 28 / var(--tw-bg-opacity))}.hover\:text-blue-600:hover{--tw-text-opacity: 1;color:rgb(37 99 235 / var(--tw-text-opacity))}.hover\:text-gray-400:hover{--tw-text-opacity: 1;color:rgb(156 163 175 / var(--tw-text-opacity))}.hover\:text-gray-800:hover{--tw-text-opacity: 1;color:rgb(31 41 55 / var(--tw-text-opacity))}.hover\:text-white:hover{--tw-text-opacity: 1;color:rgb(255 255 255 / var(--tw-text-opacity))}.hover\:shadow-lg:hover{--tw-shadow: 0 10px 15px -3px rgb(0 0 0 / .1), 0 4px 6px -4px rgb(0 0 0 / .1);--tw-shadow-colored: 0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000),var(--tw-ring-shadow, 0 0 #0000),var(--tw-shadow)}.focus\:shadow-lg:focus{--tw-shadow: 0 10px 15px -3px rgb(0 0 0 / .1), 0 4px 6px -4px rgb(0 0 0 / .1);--tw-shadow-colored: 0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000),var(--tw-ring-shadow, 0 0 #0000),var(--tw-shadow)}.focus\:outline-none:focus{outline:2px solid transparent;outline-offset:2px}.focus\:ring-0:focus{--tw-ring-offset-shadow: var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);--tw-ring-shadow: var(--tw-ring-inset) 0 0 0 calc(0px + var(--tw-ring-offset-width)) var(--tw-ring-color);box-shadow:var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow, 0 0 #0000)}.focus\:ring-2:focus{--tw-ring-offset-shadow: var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);--tw-ring-shadow: var(--tw-ring-inset) 0 0 0 calc(2px + var(--tw-ring-offset-width)) var(--tw-ring-color);box-shadow:var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow, 0 0 #0000)}.focus\:ring-blue-500:focus{--tw-ring-opacity: 1;--tw-ring-color: rgb(59 130 246 / var(--tw-ring-opacity))}.active\:shadow-lg:active{--tw-shadow: 0 10px 15px -3px rgb(0 0 0 / .1), 0 4px 6px -4px rgb(0 0 0 / .1);--tw-shadow-colored: 0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000),var(--tw-ring-shadow, 0 0 #0000),var(--tw-shadow)}.disabled\:pointer-events-none:disabled{pointer-events:none}.disabled\:opacity-50:disabled{opacity:.5}.group:hover .group-hover\:scale-105{--tw-scale-x: 1.05;--tw-scale-y: 1.05;transform:translate(var(--tw-translate-x),var(--tw-translate-y)) rotate(var(--tw-rotate)) skew(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.group:hover .group-hover\:text-gray-600{--tw-text-opacity: 1;color:rgb(75 85 99 / var(--tw-text-opacity))}@media (min-width: 640px){.sm\:bottom-20{bottom:5rem}.sm\:right-32{right:8rem}.sm\:col-span-1{grid-column:span 1 / span 1}.sm\:col-span-3{grid-column:span 3 / span 3}.sm\:col-span-7{grid-column:span 7 / span 7}.sm\:mt-0{margin-top:0}.sm\:mt-36{margin-top:9rem}.sm\:block{display:block}.sm\:flex{display:flex}.sm\:grid{display:grid}.sm\:h-28{height:7rem}.sm\:h-\[180px\]{height:180px}.sm\:w-36{width:9rem}.sm\:w-\[50rem\]{width:50rem}.sm\:max-w-\[85rem\]{max-width:85rem}.sm\:grid-cols-7{grid-template-columns:repeat(7,minmax(0,1fr))}.sm\:flex-row{flex-direction:row}.sm\:flex-col{flex-direction:column}.sm\:flex-nowrap{flex-wrap:nowrap}.sm\:items-center{align-items:center}.sm\:items-baseline{align-items:baseline}.sm\:justify-normal{justify-content:normal}.sm\:justify-start{justify-content:flex-start}.sm\:justify-end{justify-content:flex-end}.sm\:justify-between{justify-content:space-between}.sm\:gap-20{gap:5rem}.sm\:gap-5{gap:1.25rem}.sm\:gap-x-0{column-gap:0px}.sm\:gap-x-5{column-gap:1.25rem}.sm\:gap-x-6{column-gap:1.5rem}.sm\:space-y-3>:not([hidden])~:not([hidden]){--tw-space-y-reverse: 0;margin-top:calc(.75rem * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(.75rem * var(--tw-space-y-reverse))}.sm\:overflow-x-visible{overflow-x:visible}.sm\:rounded-none{border-radius:0}.sm\:border-0{border-width:0px}.sm\:px-0{padding-left:0;padding-right:0}.sm\:px-6{padding-left:1.5rem;padding-right:1.5rem}.sm\:py-0{padding-top:0;padding-bottom:0}.sm\:py-4{padding-top:1rem;padding-bottom:1rem}.sm\:pb-0{padding-bottom:0}.sm\:ps-5{padding-inline-start:1.25rem}.sm\:pt-2{padding-top:.5rem}.sm\:text-sm{font-size:.875rem;line-height:1.25rem}}@media (min-width: 1024px){.lg\:px-8{padding-left:2rem;padding-right:2rem}}</style>
      <link rel="stylesheet" href="styles-RL72UBNJ.css" media="all" onload="this.media='all'">
      <noscript>
         <link rel="stylesheet" href="styles-RL72UBNJ.css">
      </noscript>
      <link rel="modulepreload" href="chunk-O2RJCE5S.js">
      <link rel="modulepreload" href="chunk-T543UCMY.js">
      <link rel="modulepreload" href="chunk-YMIOOVPK.js">
      <link rel="modulepreload" href="chunk-FVXZWXXG.js">
      <style>.hs-ar-mode[_ngcontent-ng-c445782345]{display:none}.hs-ar-mode-active[_ngcontent-ng-c445782345]   .hs-ar-mode[_ngcontent-ng-c445782345]{display:block}</style>
      <style>.nav--hidden[_ngcontent-ng-c2188090793]{transform:translateY(-100%)}.nav2--hidden[_ngcontent-ng-c2188090793]{transform:translateY(-265%);box-shadow:0 6px 6px -4px #1b1b3a73}.nav-sticky[_ngcontent-ng-c2188090793]{transition:transform .2s ease-in-out}.nav-sticky2[_ngcontent-ng-c2188090793]{transition:transform .15s ease-in-out}</style>
      <style>.active-hr[_ngcontent-ng-c2332797924]   p[_ngcontent-ng-c2332797924]{border-bottom:2px solid gray;font-weight:700;transition:border-bottom-color .3s,border-bottom-width .3s}hr[_ngcontent-ng-c2332797924]{transition:border-color .3s,border-width .3s}</style>
      <meta name="description" content="">
      <meta name="keywords" content="">
      <meta property="og:title" content="yemenshabab">
      <meta property="og:site_name" content="yemenshabab">
      <meta property="og:description" content="">
      <meta name="dir" content="rtl">
      <style>input[_ngcontent-ng-c1126989614]{width:100%}li[_ngcontent-ng-c1126989614]{cursor:pointer}li.selected[_ngcontent-ng-c1126989614]{font-weight:700}</style>
      <style>vg-player{font-family:videogular;position:relative;display:flex;width:100%;height:100%;overflow:hidden;background-color:#000}vg-player.fullscreen{position:fixed;left:0;top:0}vg-player.native-fullscreen.controls-hidden{cursor:none}</style>
      <style>vg-overlay-play{z-index:200}vg-overlay-play.is-buffering{display:none}vg-overlay-play .vg-overlay-play{transition:all .5s;cursor:pointer;position:absolute;display:block;color:#fff;width:100%;height:100%;font-size:80px;filter:alpha(opacity=60);opacity:.6}vg-overlay-play .vg-overlay-play.native-fullscreen.controls-hidden{cursor:none}vg-overlay-play .vg-overlay-play .overlay-play-container.vg-icon-play_arrow{pointer-events:none;width:100%;height:100%;position:absolute;display:flex;align-items:center;justify-content:center;font-size:80px}vg-overlay-play .vg-overlay-play:hover{filter:alpha(opacity=100);opacity:1}vg-overlay-play .vg-overlay-play:hover .overlay-play-container.vg-icon-play_arrow:before{transform:scale(1.2)}</style>
      <style>vg-buffering{display:none;z-index:201}vg-buffering.is-buffering{display:block}.vg-buffering{position:absolute;display:block;width:100%;height:100%}.vg-buffering .bufferingContainer{width:100%;position:absolute;cursor:pointer;top:50%;margin-top:-50px;zoom:1;filter:alpha(opacity=60);opacity:.6}.vg-buffering .loadingSpinner{background-color:#0000;border:5px solid rgba(255,255,255,1);opacity:.9;border-top:5px solid rgba(0,0,0,0);border-left:5px solid rgba(0,0,0,0);border-radius:50px;box-shadow:0 0 35px #fff;width:50px;height:50px;margin:0 auto;-moz-animation:spin .5s infinite linear;-webkit-animation:spin .5s infinite linear}.vg-buffering .loadingSpinner .stop{-webkit-animation-play-state:paused;-moz-animation-play-state:paused}</style>
      <style>vg-controls{position:absolute;display:flex;width:100%;height:50px;z-index:300;bottom:0;background-color:#00000080;transition:bottom 1s}vg-controls.hide{bottom:-50px}</style>
      <style>vg-play-pause{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:50px;cursor:pointer;color:#fff;line-height:50px}vg-play-pause .icon{pointer-events:none}</style>
      <style>vg-scrub-bar{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;position:absolute;width:100%;height:5px;bottom:50px;margin:0;cursor:pointer;align-items:center;background:rgba(0,0,0,.75);z-index:250;transition:bottom 1s,opacity .5s}vg-scrub-bar .scrubBar{position:relative;display:flex;flex-grow:1;align-items:center;height:100%}vg-controls vg-scrub-bar{position:relative;bottom:0;background:transparent;height:50px;flex-grow:1;flex-basis:0;margin:0 10px;transition:initial}vg-scrub-bar.hide{bottom:0;opacity:0}vg-controls vg-scrub-bar.hide{bottom:initial;opacity:initial}</style>
      <style>vg-time-display{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:60px;cursor:pointer;color:#fff;line-height:50px;pointer-events:none;font-family:Helvetica Neue,Helvetica,Arial,sans-serif}</style>
      <style>vg-mute{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:50px;cursor:pointer;color:#fff;line-height:50px}vg-mute .icon{pointer-events:none}</style>
      <style>vg-volume{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:100px;cursor:pointer;color:#fff;line-height:50px}vg-volume .volumeBar{position:relative;display:flex;flex-grow:1;align-items:center}vg-volume .volumeBackground{display:flex;flex-grow:1;height:5px;pointer-events:none;background-color:#333}vg-volume .volumeValue{display:flex;height:5px;pointer-events:none;background-color:#fff;transition:all .2s ease-out}vg-volume .volumeKnob{position:absolute;width:15px;height:15px;left:0;top:50%;transform:translateY(-50%);border-radius:15px;pointer-events:none;background-color:#fff;transition:all .2s ease-out}vg-volume .volumeBackground.dragging .volumeValue,vg-volume .volumeBackground.dragging .volumeKnob{transition:none}</style>
      <style>vg-fullscreen{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:50px;cursor:pointer;color:#fff;line-height:50px}vg-fullscreen .icon{pointer-events:none}</style>
      <style>vg-playback-button{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;height:50px;width:50px;cursor:pointer;color:#fff;line-height:50px;font-family:Helvetica Neue,Helvetica,Arial,sans-serif}vg-playback-button .button{display:flex;align-items:center;justify-content:center;width:50px}</style>
      <style>vg-scrub-bar-current-time{display:flex;width:100%;height:5px;pointer-events:none;position:absolute}vg-scrub-bar-current-time .background{background-color:#fff}vg-controls vg-scrub-bar-current-time{position:absolute;top:calc(50% - 3px);border-radius:2px}vg-controls vg-scrub-bar-current-time .background{border:1px solid white;border-radius:2px}vg-scrub-bar-current-time .slider{background:white;height:15px;width:15px;border-radius:50%;box-shadow:0 0 10px #000;margin-top:-5px;margin-left:-10px}</style>
      <style>vg-scrub-bar-buffering-time{display:flex;width:100%;height:5px;pointer-events:none;position:absolute}vg-scrub-bar-buffering-time .background{background-color:#ffffff4d}vg-controls vg-scrub-bar-buffering-time{position:absolute;top:calc(50% - 3px)}vg-controls vg-scrub-bar-buffering-time .background{border-radius:2px}</style>
      <style>vg-quality-selector{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;user-select:none;display:flex;justify-content:center;width:50px;height:50px;cursor:pointer;color:#fff;line-height:50px}vg-quality-selector .container{position:relative;display:flex;flex-grow:1;align-items:center;padding:0;margin:5px}vg-quality-selector select.quality-selector{width:50px;padding:5px 8px;border:none;background:none;-webkit-appearance:none;-moz-appearance:none;appearance:none;color:transparent;font-size:16px}vg-quality-selector select.quality-selector::-ms-expand{display:none}vg-quality-selector select.quality-selector option{color:#000}vg-quality-selector .quality-selected{position:absolute;width:100%;height:50px;top:-6px;text-align:center;text-transform:uppercase;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;padding-top:2px;pointer-events:none}vg-quality-selector .vg-icon-closed_caption:before{width:100%}</style>
      <style>.stock-ticker[_ngcontent-ng-c519048173]{padding-block:4px;overflow:hidden;-webkit-user-select:none;user-select:none;--gap: 20px;display:flex;gap:var(--gap)}.stock-ticker[_ngcontent-ng-c519048173]   ul[_ngcontent-ng-c519048173]{list-style:none;flex-shrink:0;min-width:100%;display:flex;justify-content:space-between;align-items:center;gap:var(--gap);animation:_ngcontent-ng-c519048173_scroll 50s linear infinite}.stock-ticker[_ngcontent-ng-c519048173]:hover   ul[_ngcontent-ng-c519048173]{animation-play-state:paused}@keyframes _ngcontent-ng-c519048173_scroll{to{transform:translate(calc(100% - var(--gap)))}}</style>
   </head>
   <body class="dark:bg-neutral-900" data-new-gr-c-s-check-loaded="14.1186.0" data-gr-ext-installed="">
      <!--nghm-->
      <app-root _nghost-ng-c445782345="" ng-version="17.3.9" ng-server-context="ssr">
         <main _ngcontent-ng-c445782345="" id="content" class="shrink-0 mt-52 sm:mt-36">
            <div _ngcontent-ng-c445782345="" class="max-w-[80rem] min-h-[40rem] mx-auto py-10 px-4 sm:px-6 lg:px-8">
               <app-base-news-page ng-version="17.3.9">
                  <router-outlet></router-outlet>
                  <app-base-news-page ng-version="17.3.9">
                     <router-outlet></router-outlet>
                     <app-live-stream-page _nghost-ng-c1126989614="">
                        <div _ngcontent-ng-c1126989614="" class="rounded-md overflow-hidden">
                           <vg-player _ngcontent-ng-c1126989614="" dir="ltr">
                              <vg-overlay-play _ngcontent-ng-c1126989614="">
                                 <div class="vg-overlay-play">
                                    <div class="overlay-play-container vg-icon-play_arrow"></div>
                                 </div>
                              </vg-overlay-play>
                              <vg-buffering _ngcontent-ng-c1126989614="">
                                 <div class="vg-buffering">
                                    <div class="bufferingContainer">
                                       <div class="loadingSpinner"></div>
                                    </div>
                                 </div>
                              </vg-buffering>
                              <vg-controls _ngcontent-ng-c1126989614="" style="pointer-events: initial;">
                                 <vg-play-pause _ngcontent-ng-c1126989614="">
                                    <div tabindex="0" role="button" class="icon vg-icon-play_arrow" aria-label="play" aria-valuetext="paused"></div>
                                 </vg-play-pause>
                                 <vg-scrub-bar _ngcontent-ng-c1126989614="">
                                    <div tabindex="0" role="slider" aria-label="scrub bar" aria-level="polite" aria-valuemin="0" aria-valuemax="100" class="scrubBar" aria-valuenow="24%" aria-valuetext="24%"></div>
                                 </vg-scrub-bar>
                                 <vg-time-display _ngcontent-ng-c1126989614="" vgproperty="right">
                                    <span>LIVE</span><!----><!---->
                                 </vg-time-display>
                                 <vg-quality-selector _ngcontent-ng-c1126989614="">
                                    <div class="container">
                                       <div class="quality-selected vg-icon-hd">  </div>
                                       <select tabindex="0" aria-label="quality selector" class="quality-selector">
                                          <option value="0"> AUTO </option>
                                          <option value="1"> 0 </option>
                                          <!---->
                                       </select>
                                    </div>
                                 </vg-quality-selector>
                                 <!---->
                                 <vg-mute _ngcontent-ng-c1126989614="">
                                    <div tabindex="0" role="button" aria-label="mute button" class="icon vg-icon-volume_up" aria-valuetext="unmuted"></div>
                                 </vg-mute>
                                 <vg-volume _ngcontent-ng-c1126989614="">
                                    <div tabindex="0" role="slider" aria-label="volume level" aria-level="polite" aria-valuemin="0" aria-valuemax="100" aria-orientation="horizontal" class="volumeBar" aria-valuetext="100%" aria-valuenow="100">
                                       <div class="volumeBackground">
                                          <div class="volumeValue" style="width: 85%;"></div>
                                          <div class="volumeKnob" style="left: 85%;"></div>
                                       </div>
                                    </div>
                                 </vg-volume>
                                 <vg-fullscreen _ngcontent-ng-c1126989614="">
                                    <div tabindex="0" role="button" aria-label="fullscreen button" class="icon vg-icon-fullscreen" aria-valuetext="normal mode"></div>
                                 </vg-fullscreen>
                              </vg-controls>
                              <video _ngcontent-ng-c1126989614="" id="singleVideo" crossorigin="" src="blob:https://yemenshabab.org/b081f198-26cc-48d5-91fd-842c4b43d022"></video>
                           </vg-player>
                        </div>
                     </app-live-stream-page>
                     <!---->
                  </app-base-news-page>
                  <!---->
               </app-base-news-page>
            </div>
         </main>
      </app-root>
      <script src="polyfills-A7MJM4D4.js" type="module"></script><script src="scripts-KXNLFU3U.js" defer=""></script><script src="main-DQXOXK2Z.js" type="module"></script>
      <script async="" src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      <script id="ng-state" type="application/json">{"3556860544":{"b":{"data":[{"uuid":"7b82ac40-33e6-11ef-9025-3a0c42fef3c0","image":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/1f141a884d454efea72e402a2c09d5ae.jpg","titleAr":"الخطوط اليمنية: احتجاز مليشيات الحوثي 4 طائرات يهدد سلامة الملاحة الجوية ويؤثر على تشغيل الرحلات","titleEn":"Yemeni lines: detention of the Al-Houth militias 4 aircraft threatening the safety of air traffic and affecting the operation of flights","descriptionAr":"أعلنت شركة الخطوط الجوية اليمنية، اليوم الأربعاء، احتجاز مليشيات الحوثي الانقلابية الإرهابية المدعومة من إيران، 4 من طائرات اليمنية في مطار صنعاء الدولي..","descriptionEn":"On Wednesday, Yemen Airways announced the detention of Iranian-supported Al-Houthi terrorist militias, four Yemeni aircraft at Sana ' a International Airport.","creationDate":"2024-06-26T18:01:53Z","category":"News","categoryId":"0d2abaf7-33d7-11ef-9d7f-1a45187a1332","categoryAr":"&#x202B;أخبا&#x202C;&#x202B;ر&#x202C;","categoryColor":"rgb(114,28,189)","section":"Video","writerImage":"","writerName":"","sourceAr":"","sourceEn":""},{"uuid":"731015cc-33ed-11ef-9025-3a0c42fef3c0","image":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/44725c2e09244b9985c9f1d996086024.jpeg","titleAr":"محافظ المركزي اليمني يصدر قراراً بشأن مزاولة نشاط التحويلات المالية الداخلية","titleEn":"Including shutting down the networks. The Yemeni Central Governor makes a decision on internal financial transfer activity","descriptionAr":"أصدر محافظ البنك المركزي اليمني في العاصمة عدن أحمد غالب المعبقي، اليوم الاربعاء، قراراً بشأن مزاولة نشاط التحويلات المالية الداخلية.","descriptionEn":"The Governor of the Yemeni Central Bank in the capital, Aden Ahmed Ghalib al-Malib al-Maqib, issued a decision on domestic financial transfer activity on Wednesday.","creationDate":"2024-06-26T18:40:26Z","category":"Economy","categoryId":"fe316ef7-33d7-11ef-9d7f-1a45187a1332","categoryAr":"&#x202B;اقتصاد&#x202C;","categoryColor":"rgb(35,184,127)","section":"Economy","writerImage":"","writerName":"","sourceAr":"","sourceEn":""},{"uuid":"0aeeca8e-33ef-11ef-9025-3a0c42fef3c0","image":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/c787292531324a58a457bbdf6bb04971.jpeg","titleAr":"وزارة النقل تطالب الأمم المتحدة بالتدخل العاجل للإفراج عن طائرات اليمنية المحتجزة بصنعاء","titleEn":"The Ministry of Transport demands that the United Nations urgently intervene to release Yemeni aircraft detained in Sana ' a","descriptionAr":"وزارة النقل اليمنية تصدر بيانا أدانت فيه ما أقدمت عليه مليشيات الحوثي الإرهابية من احتجاز ثلاث طائرات تابعة للخطوط الجوية اليمنية","descriptionEn":"The Yemeni Ministry of Transport issued a statement condemning the detention of three Yemeni airlines by the Hothi terrorist militias","creationDate":"2024-06-26T18:55:09Z","category":"News","categoryId":"0d2abaf7-33d7-11ef-9d7f-1a45187a1332","categoryAr":"&#x202B;أخبا&#x202C;&#x202B;ر&#x202C;","categoryColor":"rgb(114,28,189)","section":"Video","writerImage":"","writerName":"","sourceAr":"","sourceEn":""},{"uuid":"787f2f65-33ef-11ef-9025-3a0c42fef3c0","image":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/2ff7644419b34dc4a7c376504f7cb515.jpeg","titleAr":"هيومن رايتس: الحوثيون يستخدمون الاعتقالات التعسفية كأداة سياسية لصرف الأنظار عن الأزمة الإنسانية","titleEn":"Hüman Wrights: Hawathes use arbitrary arrests as a political tool to divert attention from the humanitarian crisis","descriptionAr":"هيومن رايتس: الحوثيون يستخدمون الاعتقالات التعسفية كأداة سياسية لصرف الأنظار عن الأزمة الإنسانية","descriptionEn":"Hüman Wrights: Hawathes use arbitrary arrests as a political tool to divert attention from the humanitarian crisis","creationDate":"2024-06-26T19:06:07Z","category":"Political","categoryId":"75435bab-33d6-11ef-9d7f-1a45187a1332","categoryAr":"سياسة","categoryColor":"rgb(255,0,0)","section":"Yemen News","writerImage":"","writerName":"","sourceAr":"","sourceEn":""},{"uuid":"7ae0ba44-33f1-11ef-9025-3a0c42fef3c0","image":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/f4afed382a6b42f284472bdf48b872ec.jpeg","titleAr":"صربيا تطالب بإجراءات \"حاسمة\" ضد جماهير ألبانيا وكرواتيا","titleEn":"Serbia is demanding the actions of Hazema against the audiences of Albania and Croatia","descriptionAr":"طالب الاتحاد الصربي لكرة القدم، نظيره الأوروبي باتخاذ إجراءات \"حاسمة\" ضد الهتافات المشتركة المسيئة للجماهير في مباراة كرواتيا وألبانيا، الأربعاء، بمنافسات \"يورو 2024\" والتي انتهت بالتعادل 2-2.","descriptionEn":"The Serbian Federation of Football, its European counterpart, called for the taking of decisive action against the abusive common cheers of the masses at the Croatian and Albania Game, Wednesday, with Euro 2024 competitions, which ended with tie 2.2.","creationDate":"2024-06-26T19:09:34Z","category":"Sports","categoryId":"283cffb0-33d8-11ef-9d7f-1a45187a1332","categoryAr":"&#x202B;رياضة &#x202C;&#x202B;","categoryColor":"rgb(66,25,191)","section":"Sport","writerImage":"","writerName":"","sourceAr":"","sourceEn":""}],"latestData":[],"mostViewed":[],"layoutType":"","totalRecords":"0","color":"","categoryAr":""},"h":{},"s":200,"st":"OK","u":"https://main.yemenshabab.org/api/v1/main/news-bar","rt":"json"},"3817296205":{"b":{"sections":[{"uuid":"8fe25d2a-33d5-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;أخبار&#x202C;","nameEn":"Yemen News","editable":true,"categories":[{"uuid":"75435bab-33d6-11ef-9d7f-1a45187a1332","nameAr":"سياسة","nameEn":"Political","editable":false,"onBar":true,"layout":"LIST","color":"rgb(255,0,0)","modifiedBy":"super"},{"uuid":"90ff812c-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;محلية&#x202C;","nameEn":"Locals","editable":false,"onBar":true,"layout":"LIST","color":"rgb(20,197,217)","modifiedBy":"super"}],"dataType":"NEWS","order":"1"},{"uuid":"be2d9257-33d5-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;فيديو&#x202C;","nameEn":"Video","editable":true,"categories":[{"uuid":"0d2abaf7-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;أخبا&#x202C;&#x202B;ر&#x202C;","nameEn":"News","editable":false,"onBar":true,"layout":"LIST","color":"rgb(114,28,189)","modifiedBy":""},{"uuid":"1b017401-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;تقارير&#x202C;","nameEn":"Reports","editable":false,"onBar":true,"layout":"GRID","color":"rgb(255,157,0)","modifiedBy":"super"},{"uuid":"336a9123-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;برامج&#x202C;","nameEn":"Programs","editable":false,"onBar":true,"layout":"GRID","color":"rgb(31,105,224)","modifiedBy":""},{"uuid":"5048ac5a-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;ميديا&#x202C;","nameEn":"Media","editable":false,"onBar":true,"layout":"LIST","color":"rgb(82,41,204)","modifiedBy":""},{"uuid":"64b89f17-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;رأي&#x202C;&#x202B; الناس&#x202C;","nameEn":"People's Opinion","editable":false,"onBar":true,"layout":"LIST","color":"rgb(42,99,232)","modifiedBy":"super"}],"dataType":"VIDEO","order":"2"},{"uuid":"a7b5b475-33d5-11ef-9d7f-1a45187a1332","nameAr":"عربي ودولي","nameEn":"Arab and international","editable":true,"categories":[{"uuid":"f6461833-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;العالم&#x202C;","nameEn":"World","editable":false,"onBar":true,"layout":"LIST","color":"rgb(153,57,237)","modifiedBy":"super"},{"uuid":"d5a9cbe6-33d6-11ef-9d7f-1a45187a1332","nameAr":"عربي","nameEn":"Arab","editable":false,"onBar":true,"layout":"LIST","color":"rgb(11,75,224)","modifiedBy":"super"},{"uuid":"e53a0f09-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;غزة&#x202C;","nameEn":"Gaza","editable":false,"onBar":true,"layout":"LIST","color":"rgb(222,49,66)","modifiedBy":"helal"}],"dataType":"NEWS","order":"3"},{"uuid":"c998ef10-33d5-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;تقارير&#x202C;","nameEn":"Reports","editable":true,"categories":[{"uuid":"7d399900-33d7-11ef-9d7f-1a45187a1332","nameAr":"تقارير ","nameEn":"Reports ","editable":false,"onBar":true,"layout":"LIST","color":"rgb(98,183,252)","modifiedBy":"helal"},{"uuid":"943150b6-33d7-11ef-9d7f-1a45187a1332","nameAr":"ترجمات","nameEn":"Translations","editable":false,"onBar":true,"layout":"GRID","color":"rgb(145,209,17)","modifiedBy":"helal"}],"dataType":"NEWS","order":"4"},{"uuid":"e3165f06-33d5-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;مقالات&#x202C;","nameEn":"Articles","editable":true,"categories":[{"uuid":"b4838b57-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;كتابنا&#x202C;","nameEn":"Our Writers","editable":false,"onBar":true,"layout":"LIST","color":"rgb(101,51,181)","modifiedBy":""},{"uuid":"c51502ad-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;أراء&#x202C;","nameEn":"Opinions","editable":false,"onBar":true,"layout":"LIST","color":"rgb(13,84,217)","modifiedBy":"helal"}],"dataType":"ARTICLE","order":"5"},{"uuid":"f39784c7-33d5-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;حوارات&#x202C;","nameEn":"Dialogues","editable":true,"categories":[{"uuid":"d89aad1a-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;حوارات&#x202C;","nameEn":"Dialogues","editable":false,"onBar":true,"layout":"LIST","color":"rgb(53,146,150)","modifiedBy":""}],"dataType":"NEWS","order":"6"},{"uuid":"079cc7af-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;ملفات&#x202C;","nameEn":"Files","editable":true,"categories":[{"uuid":"ec8e78d9-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;ملفات&#x202C;","nameEn":"Files","editable":false,"onBar":true,"layout":"LIST","color":"rgb(33,122,166)","modifiedBy":""}],"dataType":"NEWS","order":"7"},{"uuid":"586d324d-33d8-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;برامج&#x202C;&#x202B; القناة&#x202C;","nameEn":"Channel programs","editable":true,"categories":[{"uuid":"b8bc74e0-33da-11ef-9d7f-1a45187a1332","nameAr":"برامج القناة","nameEn":"Channel Programs","editable":false,"onBar":true,"layout":"GRID","color":"rgb(23,194,177)","modifiedBy":"super"}],"dataType":"PROGRAM","order":"8"},{"uuid":"1ebe79a6-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;اقتصاد&#x202C;","nameEn":"Economy","editable":true,"categories":[{"uuid":"fe316ef7-33d7-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;اقتصاد&#x202C;","nameEn":"Economy","editable":false,"onBar":true,"layout":"LIST","color":"rgb(35,184,127)","modifiedBy":"helal"}],"dataType":"NEWS","order":"9"},{"uuid":"2be2447f-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;مجتمع&#x202C;&#x202B; وثقافة&#x202C;","nameEn":"Society and culture","editable":true,"categories":[{"uuid":"13eb9ae2-33d8-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;مجتمع &#x202C;&#x202B;وثقافة&#x202C;","nameEn":"Society and culture","editable":false,"onBar":true,"layout":"GRID","color":"rgb(75,227,82)","modifiedBy":""}],"dataType":"NEWS","order":"10"},{"uuid":"3974ad6d-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;رياضة &#x202C;&#x202B;","nameEn":"Sport","editable":true,"categories":[{"uuid":"283cffb0-33d8-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;رياضة &#x202C;&#x202B;","nameEn":"Sports","editable":false,"onBar":true,"layout":"GRID","color":"rgb(66,25,191)","modifiedBy":"helal"}],"dataType":"NEWS","order":"11"},{"uuid":"53cb1c8f-33d6-11ef-9d7f-1a45187a1332","nameAr":"&#x202B;منوعات","nameEn":"Mix","editable":true,"categories":[{"uuid":"bbdaa9a4-3cb4-11ef-8c22-8e6b5c300bcb","nameAr":"متفرقات","nameEn":"Miscellaneous","editable":false,"onBar":true,"layout":"LIST","color":"rgb(255,0,0)","modifiedBy":"helal"},{"uuid":"41d8e4c9-33d8-11ef-9d7f-1a45187a1332","nameAr":"علوم&#x202C;","nameEn":"Information and science","editable":false,"onBar":true,"layout":"LIST","color":"rgb(46,201,168)","modifiedBy":"helal"},{"uuid":"855cf32f-3cb4-11ef-8c22-8e6b5c300bcb","nameAr":"صحة","nameEn":"health","editable":false,"onBar":true,"layout":"LIST","color":"rgb(255,0,0)","modifiedBy":"helal"}],"dataType":"NEWS","order":"12"}],"totalRecords":"12"},"h":{},"s":200,"st":"OK","u":"https://main.yemenshabab.org/api/v1/main/landing/sections","rt":"json"},"4115098966":{"b":{"news":[],"totalRecords":"0"},"h":{},"s":200,"st":"OK","u":"https://main.yemenshabab.org/api/v1/main/breaking-news","rt":"json"},"4206855982":{"b":{"programs":[{"uuid":"a8e904e4-65d4-42f6-a6a5-9736a81b8694","title":"Safe passage","titleAr":"ممر امن","showTime":"0000-01-01 08:12:48.089 +0000 UTC","releaseDays":"saturday,sunday,monday","programImage":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/bc2235c8a15d4777a12e032a451b6439.jpeg","programUuid":"32be713c-0db3-4ddb-8b81-3ad54c91e7a4"},{"uuid":"81ec1ab0-75cf-4551-9a4d-9370817c099a","title":"Citizen's Diary","titleAr":"يوميات مواطن","showTime":"0000-01-01 08:18:03.409 +0000 UTC","releaseDays":"tuesday,wednesday,thursday","programImage":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/b42756eeceec475e8add12d1d7bd46aa.jpeg","programUuid":"f541b09b-2ef0-4986-91e4-d4421acdf8d4"},{"uuid":"bc684469-6fba-46f7-b4f3-f5c834a57d9d","title":"Ramadan and people 2024","titleAr":"رمضان والناس 2024","showTime":"0000-01-01 16:54:02.552 +0000 UTC","releaseDays":"sunday,tuesday","programImage":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/4b7572a2876b46328224c454bb7055cc.jpeg","programUuid":"3c32c524-566a-420a-8535-4e852a9f3444"},{"uuid":"1b57a64a-b43d-4582-b19a-d1f8075d16aa","title":"Comment","titleAr":"كومنت","showTime":"0000-01-01 13:30:00.991 +0000 UTC","releaseDays":"sunday,tuesday,thursday","programImage":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/0081b8ff033e47af95a1ce92b45b5f91.jpeg","programUuid":"b2b5d2fd-f56e-4004-bb7b-d9b8cc8cafb2"},{"uuid":"3bf7910a-d627-4cfa-b366-bd98fc7da703","title":"Chance of a million","titleAr":"فرصة المليون","showTime":"0000-01-01 11:10:03.737 +0000 UTC","releaseDays":"monday,tuesday","programImage":"https://yemenshabab-test.sgp1.digitaloceanspaces.com/images/ebfca5b7e0d64961a00d3c7327d5b0e3.webp","programUuid":"d1c7fa8a-859f-4eb0-810d-6242eafc4b42"}],"totalRecords":"5"},"h":{},"s":200,"st":"OK","u":"https://main.yemenshabab.org/api/v1/main/programs-schedule","rt":"json"},"4257344010":{"b":{"siteName":"yemenshabab","siteEmail":"yemenshabab@info.com","siteTags":"","siteDescription":"","contactUs":"","facebook":"https://www.facebook.com/TvYemenShabab.news","twitter":"https://twitter.com/YemenShababNet","youtube":"https://www.youtube.com/user/yemenshabab","telegram":"https://telegram.me/YemenShababNet","instagram":"https://www.instagram.com/tvYemenShabab/","liveStreamUrl":"https://master.starmena-cloud.com/hls/yemenshabab.m3u8","radioLiveStream":"https://master.starmena-cloud.com/yemenshabab.mp3","creationDate":"2024-06-26T12:52:20Z"},"h":{},"s":200,"st":"OK","u":"https://main.yemenshabab.org/api/v1/main/settings","rt":"json"},"__nghData__":[{},{"t":{"0":"t1","1":"t2"},"c":{"0":[{"i":"t2","r":1}],"1":[]}},{"t":{"0":"t1","1":"t2"},"c":{"0":[{"i":"t1","r":3,"t":{"0":"t3","1":"t4"},"c":{"0":[{"i":"t4","r":1,"t":{"7":"t5"},"c":{"7":[{"i":"t5","r":1,"x":2}]}}],"1":[]}}],"1":[]}},{"t":{"0":"t1","1":"t2"},"c":{"0":[{"i":"t1","r":3,"t":{"0":"t3","1":"t4"},"c":{"0":[{"i":"t4","r":1,"t":{"7":"t5"},"c":{"7":[{"i":"t5","r":1,"x":5}]}}],"1":[]}}],"1":[]}},{"t":{"0":"t1","1":"t2"},"c":{"0":[{"i":"t1","r":3,"t":{"0":"t3","1":"t4"},"c":{"0":[{"i":"t4","r":1,"t":{"7":"t5"},"c":{"7":[{"i":"t5","r":1,"x":3}]}}],"1":[]}}],"1":[]}},{"t":{"0":"t1","1":"t2"},"c":{"0":[{"i":"t1","r":3,"t":{"0":"t3","1":"t4"},"c":{"0":[{"i":"t3","r":1}],"1":[]}}],"1":[]}},{"t":{"5":"t0"},"c":{"5":[{"i":"t0","r":1,"x":14}]}},{"t":{"6":"t7","9":"t8"},"c":{"6":[{"i":"t7","r":2,"x":5}],"9":[{"i":"t8","r":2,"x":5}]}},{"t":{"1":"t10"},"c":{"1":[]}},{"t":{"0":"t20","1":"t21","4":"t22","7":"t23"},"c":{"0":[{"i":"t20","r":1}],"1":[],"4":[{"i":"t22","r":1,"x":7}],"7":[{"i":"t23","r":1,"t":{"6":"t24"},"c":{"6":[{"i":"t24","r":1}]},"x":2}]}},{"c":{"0":[{"i":"c2544598283","r":1}]}},{"c":{"0":[{"i":"c2161755373","r":1}]}},{"t":{"5":"t13"},"c":{"5":[{"i":"t13","r":2,"t":{"0":"t14"},"c":{"0":[{"i":"t14","r":1}]},"x":2}]}},{"t":{"5":"t13"},"c":{"5":[{"i":"t13","r":2,"t":{"0":"t14"},"c":{"0":[{"i":"t14","r":1}]},"x":5}]}},{"t":{"5":"t13"},"c":{"5":[{"i":"t13","r":2,"t":{"0":"t14"},"c":{"0":[{"i":"t14","r":1}]},"x":3}]}},{"t":{"5":"t13"},"c":{"5":[{"i":"t13","r":2,"t":{"0":"t14"},"c":{"0":[{"i":"t14","r":1}]}}]}},{"t":{"1":"t25","2":"t26","3":"t27","4":"t28","5":"t29"},"c":{"1":[{"i":"t25","r":1}],"2":[],"3":[],"4":[],"5":[]}},{"t":{"1":"t25","2":"t26","3":"t27","4":"t28","5":"t29"},"c":{"1":[{"i":"t26","r":1}],"2":[],"3":[],"4":[],"5":[]}},{"t":{"1":"t25","2":"t26","3":"t27","4":"t28","5":"t29"},"c":{"1":[{"i":"t27","r":1}],"2":[],"3":[],"4":[],"5":[]}},{"t":{"1":"t25","2":"t26","3":"t27","4":"t28","5":"t29"},"c":{"1":[{"i":"t28","r":1}],"2":[],"3":[],"4":[],"5":[]}},{"t":{"1":"t25","2":"t26","3":"t27","4":"t28","5":"t29"},"c":{"1":[{"i":"t29","r":1}],"2":[],"3":[],"4":[],"5":[]}},{"t":{"5":"t11","10":"t15","11":"t16","12":"t17","13":"t18","14":"t19"},"c":{"5":[{"i":"t11","r":2,"t":{"0":"t12"},"c":{"0":[{"i":"t12","r":1}]},"x":7},{"i":"t11","r":1,"t":{"0":"t12"},"c":{"0":[]},"x":5}],"10":[{"i":"t15","r":1}],"11":[{"i":"t16","r":1}],"12":[{"i":"t17","r":1}],"13":[{"i":"t18","r":1}],"14":[{"i":"t19","r":1}]}},{"t":{"3":"t6","4":"t9"},"c":{"3":[{"i":"t6","r":1}],"4":[],"6":[{"i":"c2161755373","r":1}]}}]}</script><iframe scrolling="no" frameborder="0" allowtransparency="true" src="https://platform.twitter.com/widgets/widget_iframe.2f70fb173b9000da126c79afe2098f02.html?origin=https%3A%2F%2Fyemenshabab.org" title="Twitter settings iframe" style="display: none;"></iframe><iframe id="rufous-sandbox" scrolling="no" frameborder="0" allowtransparency="true" allowfullscreen="true" style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: none;" title="Twitter analytics iframe"></iframe>
   </body>
   <chatgpt-sidebar data-gpts-theme="light"></chatgpt-sidebar>
   <grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration>
   <chatgpt-sidebar-popups data-gpts-theme="light"></chatgpt-sidebar-popups>
</html>

''';


void main() => runApp(const MaterialApp(home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
            openDialog(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(webViewController: _controller),
          SampleMenu(webViewController: _controller),
        ],
      ),
      body: WebViewWidget(controller: _controller),
      floatingActionButton: favoriteButton(),
    );
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Favorited $url')),
          );
        }
      },
      child: const Icon(Icons.favorite),
    );
  }

  Future<void> openDialog(HttpAuthRequest httpRequest) async {
    final TextEditingController usernameTextController =
    TextEditingController();
    final TextEditingController passwordTextController =
    TextEditingController();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${httpRequest.host}: ${httpRequest.realm ?? '-'}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  autofocus: true,
                  controller: usernameTextController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: passwordTextController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // Explicitly cancel the request on iOS as the OS does not emit new
            // requests when a previous request is pending.
            TextButton(
              onPressed: () {
                httpRequest.onCancel();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                httpRequest.onProceed(
                  WebViewCredential(
                    user: usernameTextController.text,
                    password: passwordTextController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Authenticate'),
            ),
          ],
        );
      },
    );
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
  logExample,
  basicAuthentication,
}

class SampleMenu extends StatelessWidget {
  SampleMenu({
    super.key,
    required this.webViewController,
  });

  final WebViewController webViewController;
  late final WebViewCookieManager cookieManager = WebViewCookieManager();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      key: const ValueKey<String>('ShowPopupMenu'),
      onSelected: (MenuOptions value) {
        switch (value) {
          case MenuOptions.showUserAgent:
            _onShowUserAgent();
          case MenuOptions.listCookies:
            _onListCookies(context);
          case MenuOptions.clearCookies:
            _onClearCookies(context);
          case MenuOptions.addToCache:
            _onAddToCache(context);
          case MenuOptions.listCache:
            _onListCache();
          case MenuOptions.clearCache:
            _onClearCache(context);
          case MenuOptions.navigationDelegate:
            _onNavigationDelegateExample();
          case MenuOptions.doPostRequest:
            _onDoPostRequest();
          case MenuOptions.loadLocalFile:
            _onLoadLocalFileExample();
          case MenuOptions.loadFlutterAsset:
            _onLoadFlutterAssetExample();
          case MenuOptions.loadHtmlString:
            _onLoadHtmlStringExample();
          case MenuOptions.transparentBackground:
            _onTransparentBackground();
          case MenuOptions.setCookie:
            _onSetCookie();
          case MenuOptions.logExample:
            _onLogExample();
          case MenuOptions.basicAuthentication:
            _promptForUrl(context);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.showUserAgent,
          child: Text('Show user agent'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.listCookies,
          child: Text('List cookies'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.clearCookies,
          child: Text('Clear cookies'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.addToCache,
          child: Text('Add to cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.listCache,
          child: Text('List cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.clearCache,
          child: Text('Clear cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.navigationDelegate,
          child: Text('Navigation Delegate example'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.doPostRequest,
          child: Text('Post Request'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadHtmlString,
          child: Text('Load HTML string'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadLocalFile,
          child: Text('Load local file'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadFlutterAsset,
          child: Text('Load Flutter Asset'),
        ),
        const PopupMenuItem<MenuOptions>(
          key: ValueKey<String>('ShowTransparentBackgroundExample'),
          value: MenuOptions.transparentBackground,
          child: Text('Transparent background example'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.setCookie,
          child: Text('Set cookie'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.logExample,
          child: Text('Log example'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.basicAuthentication,
          child: Text('Basic Authentication Example'),
        ),
      ],
    );
  }

  Future<void> _onShowUserAgent() {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    return webViewController.runJavaScript(
      'Toaster.postMessage("User Agent: " + navigator.userAgent);',
    );
  }

  Future<void> _onListCookies(BuildContext context) async {
    final String cookies = await webViewController
        .runJavaScriptReturningResult('document.cookie') as String;
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Cookies:'),
            _getCookieList(cookies),
          ],
        ),
      ));
    }
  }

  Future<void> _onAddToCache(BuildContext context) async {
    await webViewController.runJavaScript(
      'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";',
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Added a test entry to cache.'),
      ));
    }
  }

  Future<void> _onListCache() {
    return webViewController.runJavaScript('caches.keys()'
    // ignore: missing_whitespace_between_adjacent_strings
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  Future<void> _onClearCache(BuildContext context) async {
    await webViewController.clearCache();
    await webViewController.clearLocalStorage();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Cache cleared.'),
      ));
    }
  }

  Future<void> _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }
  }

  Future<void> _onNavigationDelegateExample() {
    final String contentBase64 = base64Encode(
      const Utf8Encoder().convert(exanple),
    );
    return webViewController.loadRequest(
      Uri.parse('data:text/html;base64,$contentBase64'),
    );
  }

  Future<void> _onSetCookie() async {
    await cookieManager.setCookie(
      const WebViewCookie(
        name: 'foo',
        value: 'bar',
        domain: 'httpbin.org',
        path: '/anything',
      ),
    );
    await webViewController.loadRequest(Uri.parse(
      'https://httpbin.org/anything',
    ));
  }

  Future<void> _onDoPostRequest() {
    return webViewController.loadRequest(
      Uri.parse('https://httpbin.org/post'),
      method: LoadRequestMethod.post,
      headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
      body: Uint8List.fromList('Test Body'.codeUnits),
    );
  }

  Future<void> _onLoadLocalFileExample() async {
    final String pathToIndex = await _prepareLocalFile();
    await webViewController.loadFile(pathToIndex);
  }

  Future<void> _onLoadFlutterAssetExample() {
    return webViewController.loadFlutterAsset('assets/www/index.html');
  }

  Future<void> _onLoadHtmlStringExample() {
    return webViewController.loadHtmlString(exanple);
  }

  Future<void> _onTransparentBackground() {
    return webViewController.loadHtmlString(exanple);
  }

  Widget _getCookieList(String cookies) {
    if (cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
    cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }

  static Future<String> _prepareLocalFile() async {
    final String tmpDir = (await getTemporaryDirectory()).path;
    final File indexFile = File(
        <String>{tmpDir, 'www', 'index.html'}.join(Platform.pathSeparator));

    await indexFile.create(recursive: true);
    await indexFile.writeAsString(exanple);

    return indexFile.path;
  }

  Future<void> _onLogExample() {
    webViewController
        .setOnConsoleMessage((JavaScriptConsoleMessage consoleMessage) {
      debugPrint(
          '== JS == ${consoleMessage.level.name}: ${consoleMessage.message}');
    });

    return webViewController.loadHtmlString(exanple);
  }

  Future<void> _promptForUrl(BuildContext context) {
    final TextEditingController urlTextController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input URL to visit'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'URL'),
            autofocus: true,
            controller: urlTextController,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (urlTextController.text.isNotEmpty) {
                  final Uri? uri = Uri.tryParse(urlTextController.text);
                  if (uri != null && uri.scheme.isNotEmpty) {
                    webViewController.loadRequest(uri);
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Visit'),
            ),
          ],
        );
      },
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No back history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            if (await webViewController.canGoForward()) {
              await webViewController.goForward();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No forward history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => webViewController.reload(),
        ),
      ],
    );
  }
}