# Who Wants to Be a Millionaire?
Данный проект представляет собой демонстрационную версию мобильной игры "Миллионер", которая позволяет проверить свои знания в различных областях.

<h2>Оглавление</h2>

1. [Скриншоты](#%D1%81%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%D1%8B)
2. [Демо видео](#%D0%B4%D0%B5%D0%BC%D0%BE-%D0%B2%D0%B8%D0%B4%D0%B5%D0%BE)
3. [Описание](#%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5)
4. [Технологии](#%D1%82%D0%B5%D1%85%D0%BD%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D0%B8)

<div>  
<h2>Скриншоты</h2>
  
<img height="700" src="https://user-images.githubusercontent.com/75171952/223358295-71b4bb99-dad5-4fd9-9c4c-b2aa94d9777e.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223358313-0da38a07-1975-4613-a2fe-8d78ed11d956.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223358327-d9aed10b-8cf3-4e09-be78-73b6d150c8c7.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223358319-2a231fb5-2830-4c8e-85c7-38c63ab78136.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223370538-7ba4566f-13b7-4568-9be8-e6edf654b731.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223370555-ea763a87-329b-4761-8766-f49cc50fe5e0.png">
<img height="700" src="https://user-images.githubusercontent.com/75171952/223370970-aa374f55-cba7-4905-924e-447c94843588.png">

<h2>Демо видео</h2>
<details>
  <summary><h2>Видео (Кликнуть чтоб увидеть)</h2></summary>
  
Анимации приложения  | Добавление удаление вопроса
:-: | :-:
<video src='https://user-images.githubusercontent.com/75171952/223362197-4f5d97b4-80b4-46f6-b075-0c8d8a9c451b.mov'/>  | <video src='https://user-images.githubusercontent.com/75171952/223362213-9519339b-f061-4be5-8186-e8325fc4507d.mov'/>

Экран результатов | Экран настройки сложности
:-: | :-:
<video src='https://user-images.githubusercontent.com/75171952/223362207-1424f02a-76dd-470d-b78b-10b21c345586.mov'/> |  <video src='https://user-images.githubusercontent.com/75171952/223362211-dcb597f8-2761-49c0-a8ac-f917b7590b7d.mov'/> 
</details>
</div>

## Описание

Поддерживает **iOS 13 и выше**.

Данный проект является **демонстрационной версией мобильной игры**. В игре **доступно всего 7 вопросов, чтобы ознакомиться с функционалом приложения**. По окончании вопросов игра начинает показывать их заново.

В игре **реализована таблица результатов**, которая отображает результаты предыдущих игроков. Также в проекте **реализована возможность добавления пользовательских вопросов**.

Предыдущие результаты и добавленные пользовательские вопросы **сохраняются в UserDefaults**.

Для реализации сессии игры в данном проекте был **реализован [паттерн Observer](millionaireGame/Supports/Observer/Observable.swift)**.

Также есть **возможность выбрать сложность игры**: на нормальной и хард сложности дополнительно показываются в случайном порядке вопросы + добавленные пользователями.

В приложении соблюдается стиль тв программы. [Кастомная анимированная **кнопка**](millionaireGame/UI/GameButton.swift) **создана с использованием UIBezierPath и CABasicAnimation**.

# Технологии
* UIKit (UI programmatically | Auto Layout)
* MVС
* pattern Observer
* UserDefaults
* CABasicAnimation
* Namespace
