# Childcare

## サイト概要

### サイトテーマ

保育業務で必要な書類を作成したり業務管理ができ、保護者との連絡や日々の子どもの情報を共有できる情報共有サイトです。
家庭でも利用できる遊び集を閲覧することもできます。

### テーマを選んだ理由

保育士経験があり、当時書類作成は手書きで行われていたため作業にかなり時間を要し、保管した書類を探し出す際にも時間がかかり不便だったので、データで管理ができると仕事の効率化になると思いました。
さらにこれからはIT化が進むと思い、手書き作業からパソコンやスマホで作成できることは保育士はもちろん保護者にとっても需要があると考えたからです。
また、園の利用者にとって子どもたちがどんな遊びをしているのか気軽に知ることができたり、家庭でも遊び方の参考になります。
日々の情報共有をすることで子どもたちにとってもより良い教育環境を提供することができると考えました。

### ターゲットユーザ

- 幼稚園や保育園の先生
- 園の利用者
- 園を利用するか検討している方
- 子どもがいる親御さんや子どもの遊びを知りたい方

### 主な利用シーン
- 園と保護者の間で子どもの情報共有をする際に使用します。
- 保護者が園に対し、欠席や遅刻の連絡を行うことができます。
- 家庭でも利用できる子どもとの遊び方を知りたいときや、園でどんな遊びをしているのか知りたいときに利用します。
- 遊び集は誰でも閲覧可能なため、他の保育士にとっても遊びの参考になります。

## 設計書
アプリケーション詳細設計書  
https://docs.google.com/spreadsheets/d/19WgdfbKNuCy3r3OUmtFo-dI6e5_o6CNcHaVJa8YVZA4/edit?usp=sharing

テーブル定義書  
https://docs.google.com/spreadsheets/d/1DCXVUR1hDjGWjebLETgANCTnbPs1LlxxTnPu9XpPyo8/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用素材
フリー画像：https://www.photo-ac.com/

## 機能一覧
会員（保護者）
- ログイン・ログアウト機能
- 会員情報編集機能
- 連絡帳投稿機能
- 連絡帳日付検索機能
- 欠席・遅刻連絡機能
- 遊び検索機能（タグ検索、ワード検索）
- 遊びソート機能（新しい順、古い順、いいね多い順、いいね少ない順）
- 遊びいいね機能（非同期化）
- 通知機能

管理者（園）
- ログイン・ログアウト機能
- 会員新規登録・編集・退会機能
- 会員検索機能
- 会員の子ども新規登録・削除機能（非同期化）
- 会員の子ども編集機能
- クラス新規登録・削除機能（非同期化）
- クラス編集機能
- 遊び投稿・編集機能
- 遊び検索機能（タグ検索、ワード検索）
- 遊びソート機能（新しい順、古い順、いいね多い順、いいね少ない順）
- 連絡帳投稿機能
- 連絡帳公開/非公開
- 連絡帳日付検索機能
- お知らせ投稿機能
- 通知機能
