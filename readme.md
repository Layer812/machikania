# Machikaniaで遊びました
## ここは
ここは[Machikania](http://www.ze.em-net.ne.jp/~kenken/machikania/typep.html)で遊ぶ際につくったサンプルコードを晒す場所です。<br>
昔懐かしいBasicの実行環境と思いきや、I/Oや数値計算、描画関連のライブラリも揃い、実行スピードも速い侮れない奴です。<br>
[言語の解説](http://www.ze.em-net.ne.jp/~kenken/machikania/machikania-guide.pdf)も非常に分かりやすいので、簡単ブレッドボード工作のお供に最適です。<br>
お手軽キットのMachikania Type Pは[Picoソフトさん](https://store.shopping.yahoo.co.jp/orangepicoshop/pico-k-056.html?sc_i=shp_pc_search_itemlist_shsrg_img)で、時々販売中。<br>
## サンプルコード
### otamapl.bas
 [otamapl.bas](https://github.com/Layer812/machikania/blob/main/otamapl.BAS)明和電機さんの光操作テルミン[OTAMAMIN](https://www.maywadenki.com/news/otamamin/)を自動演奏します。<BR>
 動作風景はこんな感じです。音感に影響がない範囲でご利用ください。<BR>
 ![破壊するよ!](https://user-images.githubusercontent.com/111331376/200283830-56070417-8053-4be6-9236-6649d5ca8eee.jpg)<br>
 #### 操作方法
  -「tune OTAMAMIN as A then HIT START」が表示されている間に白色LEDをOTAMAMINのセンサ(お尻)に刺してください。
  - A3(ラ)の音が鳴るように位置を調整してください。  
  - スタートボタンを押すと再生が始まります。
 #### 作成方法
 以下のような感じで、白色LEDのGNDを物理3ピン(GND)にLEDのGNDを、プラス側を物理4ピン(GPIO 2)に(抵抗経由で)接続します。<br>
 ![otama](https://user-images.githubusercontent.com/111331376/200287642-ffef10cc-ed40-490c-ac5f-295ea6c707a9.png)
 #### 音楽データの変更
  - otamamin.basの最終行、DATAを編集することで再生する音楽を変更できます。
  - 音データとして1～23までの数字を指定します。0でデータ終了です。
  - 音データの1がシ(B3:246Hz付近)で半音含めて23のラ(A5:880Hz付近)まで指定できます。11がラ(A4:440Hz付近)になりますが、厳密ではありません。
  - 休符データとして71以上の数字が指定できます。71から1増えるごとに0.5秒づつ待つようになります。
  - 1音の再生に0.5秒かけています。
  - サンプル曲(el condr pasa?)は、Layer8の記憶コピーで作ったものなので、サンプルです。
### Startrip.bas (v0.3) 
 [Startrip.bas](https://github.com/Layer812/machikania/blob/main/STARTRIP.BAS)古の[ゲーム](https://www.youtube.com/watch?v=1EWQYAfuMYw)のパ...オマージュです、画面は[こんな感じ](https://twitter.com/layer812/status/1588184667718492160)です。v0.2からの変更点は以下です。<br>
 - ジェット燃料 
 - 恒星、重力(?)
 - 当り判定
 - クリア条件
#### 操作
 - 左右で機体が回転します。
 - 上ボタンで加速します。
 - STARTボタンでミサイルが打てます。
 - FIREボタンで機体の破壊指令が出せます。
#### クリア条件など
 - スタート直後に恒星の重力(?)から離脱する加速が必要です。
 - 加速に使うジェット燃料は面ごとに有限です。画面下のバーで残量が分かります。
 - 画面上の「+」マークが機雷です、ミサイルですべて破壊すると次の面に進みます。
 - 画面中心の「*」マークは重力(?)を持つ恒星です。破壊できません。
 - 機体が恒星か機雷に接触するとミッション失敗です。
 - 全６面でゲームクリアです。
![動作画面](https://user-images.githubusercontent.com/111331376/199758119-adeb1b31-156e-4536-b11f-70f8fca8e415.png)
### STARFLD.BAS
 [STARFLD.BAS](https://github.com/Layer812/machikania/blob/main/STARFLD.BAS):良くある宇宙飛行です。<br>
 上キーで加速、下キーで減速です。動作イメージは[こんな](https://twitter.com/layer812/status/1588938695348215810)感じ。<br>
### Line.bas
 [Line.bas](https://github.com/Layer812/machikania/blob/main/line.BAS):昔懐かしい雰囲気のスクリーンセーバです。<br>
### cntdown.bas
 [cntdown.bas](https://github.com/Layer812/machikania/blob/main/cntdown.bas):言語仕様を見ていてI2Cが使えるとのことで、確認用に作成。[こんな感じ](https://twitter.com/layer812/status/1581504899493175302)で動きます。<br>
 以前作成したMicroPython版の[vgmpico.py](https://github.com/Layer812/vgmpico)を移植しました。細かい使い方などはvgmpicoを参照の事。<br>
 [とよしまさんのSCC(LPC810)](https://qiita.com/toyoshim/items/8590bbc2d456cbafacdd)を繋げるHATの回路図を以下に置きます。<br>
 出力側のLPFは好みの容量の抵抗とコンデンサをお使いください。LPC810に繋がるプルアップ抵抗は2-10KΩの適当なもので良いです。<br>
 ![接続図](https://user-images.githubusercontent.com/111331376/196030208-bcee35cb-5ea3-4495-b43b-58ff1449a0a7.png)
 音が小さいのでスピーカーの前に[秋月さんの2Wアンプ](https://akizukidenshi.com/catalog/g/gK-08217/)を繋ぐと良いです。<br>
 曲データは[ぱるぷさん](https://twitter.com/layer812/status/1579369608221687809)製作のMorning Musicを使わせていただいています。<br>
 MSXPLAYでエクスポートしたvgmファイルを「morning2.vgm」としてcntdown.basと同じフォルダに保存します。<br>
## おやくそく
 - 本サンプル等の利用により発生する損害や不都合を補償しません。
 - [Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0)に基づいてご利用ください。ご連絡は[layer8](https://twitter.com/layer812)までお願いします。

