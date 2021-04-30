# Health Tracker

<p align="center">
  <img src="./Screenshots/HealthTracker.png" />  
</p>
<p align="center"> <b>Концепт-приложение для учета медицинских данных</b> </p>
<p align="center">
  <img src="https://img.shields.io/badge/language-swift-orange.svg">
  <img src="https://img.shields.io/badge/platform-ios%2013.0%2B-lightgrey">
  <img src="https://img.shields.io/badge/smp-Lottie-red">
  <img src="https://img.shields.io/badge/SwiftUI-purple">
  <img src="https://img.shields.io/badge/Combine-lightblue">
  <img src="https://img.shields.io/badge/CoreData-green">
</p>

## Описание проекта
 При первом запуске приложения пользователь попадает на экран авторизации, интерфейс которого выполнен в стиле неоморфизма с добавлением Lottie анимаций.
После успешного входа, пользователь перенаправляется на главный экран с карточками последних замеров и рекомендательными статьями по улучшению показателей.
С помощью меню навигации пользователь может попасть на экран с историей замеров артериального давления и результатами анализов. Также на этом экране присутствует кнопка, позволяющая добавлять новые данные. 
 Для организации работы с всеми данными пользователя используется фреймворк CoreData.

 ## Реализовано

- [x] Добавление и отображение истории медицинских данных
- [x] Сохранение данных на устройстве с помощью CoreData
- [x] Полезные статьи для пользователей
- [x] Оценка показателей давления пользователя
- [x] Локализация на английский и русский языки

## UserFlow
<p align="center">
  <img src="./Screenshots/HealthTrackerUserFlow.png" />  
</p>

## Используемые технологии

+ SwiftUI
+ Combine
+ Lottie
+ Swift Package Manager
+ UIKit

## Демонстрация работы приложения

<p align="center">
  <img height="600"  src="./Screenshots/HealthTracker.gif">
</p>