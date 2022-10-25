# Machikaniaで遊びました
## ここは
ここは[Machikania](http://www.ze.em-net.ne.jp/~kenken/machikania/typep.html)で遊ぶ際につくったサンプルコードを晒す場所です。<br>
昔懐かしいBasicの実行環境と思いきや、I/Oや数値計算、描画関連のライブラリも揃い、実行スピードも速い侮れない奴です。<br>
[言語の解説](http://www.ze.em-net.ne.jp/~kenken/machikania/machikania-guide.pdf)も非常に分かりやすいので、簡単ブレッドボード工作のお供に最適です。<br>
お手軽キットのMachikania Type Pは[Picoソフトさん](https://store.shopping.yahoo.co.jp/orangepicoshop/pico-k-056.html?sc_i=shp_pc_search_itemlist_shsrg_img)で、時々販売中。<br>
## サンプルコード
### Startrip.bas (v0.2) - 作り中
 [Startrip.bas](https://github.com/Layer812/machikania/blob/main/STARTRIP.BAS)古のゲームのパ...オマージュです、画面は[こんな感じ](https://twitter.com/layer812/status/1584224494096306177)です。以下Todo。<br>
 - ジェット燃料 (今だけ加速し放題)
 - 恒星、重力
 - 公転(スイングバイしたい)
 - 当り判定
 - クリア条件
### Line.bas
 [Line.bas](https://github.com/Layer812/machikania/blob/main/line.BAS):昔懐かしい雰囲気のスクリーンセーバです。<br>
### cntdown.bas
 [cntdown.bas](https://github.com/Layer812/machikania/blob/main/cntdown.bas):言語仕様を見ていてI2Cが使えるとのことで、確認用に作成。<br>
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

