Feature: Просмотр загруженных изображений

  Background: Открываем главную страницу сайта
    Given я нахожусь на главной странице сайта

  Scenario: Загрузка изображений от других пользователей производится сразу после открытия страницы с удалённого сервера
    Then ни одно изображение не загружено
    When загружаю данные с удалённого сервера
    Then загружаются все изображения от других пользователей

  Scenario: При загрузке данных с сервера произошла ошибка запроса, нужно показать соответствующее сообщение
    Given при загрузке данных с сервера получаем ошибку
    When загружаю данные с удалённого сервера
    Then отображается сообщение с текстом "Ошибка загрузки"
    # текст может быть - Ошибка загрузки изображений

#4.3. Все загруженные изображения показаны на главной странице в виде миниатюр. DOM-элемент миниатюры генерируется на основе шаблонного элемента picture, расположенного в элементе template на странице.
#Предыстория: я нахожусь на главной странице сайта (лента изображений)
#Дано: Открываем ленту сайта Кексаграм
#Когда лента открывается
#Тогда DOM-элемент миниатюры генерируется на основе шаблонного элемента picture, расположенного в элементе template на странице.

  Scenario: При нажатии на любую из миниатюр, показывается блок
    When открываем миниатюру номер 0
    Then элемент ".big-picture" становится видимым
    And большое изображение показывает "photos/1.jpg"
    And количество лайков 11
    And элемент "body" содержит класс "modal-open"

  Scenario: Выход из полноэкранного режима просмотра фотографии осуществляется нажатием на иконку крестика
    When открываем миниатюру номер 0
    When кликаем по элементу ".big-picture__cancel"
    Then элемент ".big-picture" становится невидимым
    Then элемент "body" не содержит класс "modal-open"

  Scenario: Выход из полноэкранного режима просмотра фотографии осуществляется либо нажатием на клавишу Esc
    When открываем миниатюру номер 0
    When нажимаем клавишу "esc"
    Then элемент ".big-picture" становится невидимым
    Then элемент "body" не содержит класс "modal-open"

  Scenario: Сразу после открытия изображения в полноэкранном режиме отображается не более 5 комментариев
    When открываем миниатюру номер 0
    Then элемент ".big-picture" становится видимым
    And в элементе ".social__comment-count" видим текст "5 из 9 комментариев"
    And показано 5 комментариев

  Scenario: Отображение дополнительных комментариев происходит при нажатии на кнопку "Загрузить ещё"
    When открываем миниатюру номер 0
    Then показано 5 комментариев
    When кликаем по элементу ".social__comments-loader"
    Then показано 9 комментариев
    And в элементе ".social__comment-count" видим текст "9 из 9 комментариев"
    And элемент ".social__comments-loader" становится невидимым

  Scenario: Отображение дополнительных комментариев происходит при нажатии на кнопку "Загрузить ещё" v2
    When открываем миниатюру номер 3
    Then показано 5 комментариев
    And в элементе ".social__comment-count" видим текст "5 из 16 комментариев"
    And элемент ".social__comments-loader" становится видимым
    When кликаем по элементу ".social__comments-loader"
    Then показано 10 комментариев
    And в элементе ".social__comment-count" видим текст "10 из 16 комментариев"
    And элемент ".social__comments-loader" становится видимым
    When кликаем по элементу ".social__comments-loader"
    Then в элементе ".social__comment-count" видим текст "15 из 16 комментариев"
    When кликаем по элементу ".social__comments-loader"
    Then в элементе ".social__comment-count" видим текст "16 из 16 комментариев"
    And элемент ".social__comments-loader" становится невидимым
    And элемент ".social__comments-loader" содержит класс "hidden"

  Scenario: При открытии превью с комментариями меньше 6 кнопка "Загрузить ещё" не отображается
    When открываем миниатюру номер 1
    Then показано 4 комментариев
    And в элементе ".social__comment-count" видим текст "4 из 4 комментариев"
    And элемент ".social__comments-loader" становится невидимым
    And элемент ".social__comments-loader" содержит класс "hidden"
