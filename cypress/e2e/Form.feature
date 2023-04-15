2. Редактирование изображения и ограничения, накладываемые на поля
2.1. Масштаб:

o	При нажатии на кнопки .scale__control--smaller и .scale__control--bigger должно изменяться значение поля .scale__control--value;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на кнопку .scale__control--smaller и .scale__control--bigger
То меняться значение поля .scale__control--value;

o	Значение должно изменяться с шагом в 25. Например, если значение поля установлено в 50%, после нажатия на «+», значение должно стать равным 75%. Максимальное значение — 100%, минимальное — 25%. Значение по умолчанию — 100%;

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Масштаб по умолчанию максимальный - 100%
Если значение поля установлено в 50%
И нажимаю на кнопку +
То значение должно стать равным 75%
Или нажимаю –
То значение становится 25%
И является минимальным




o	При изменении значения поля .scale__control--value изображению внутри .img-upload__preview должен добавляться соответствующий стиль CSS, который с помощью трансформации scale задаёт масштаб. Например, если в поле стоит значение 75%, то в стиле изображения должно быть написано transform: scale(0.75).

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Масштаб по умолчанию максимальный - 100%
Если значение поля установлено в 75%
То transform: scale(0.75).


2.2. Наложение эффекта на изображение:

o	По умолчанию должен быть выбран эффект «Оригинал».

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал


o	На изображение может накладываться только один эффект.

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал
Когда выбираю радиокнопку effect-sepia
То у изображения появляется класс effects__preview—sepia
И предыдущий фильтр не применяется



o	При смене эффекта, выбором одного из значений среди радиокнопок .effects__radio, добавить картинке внутри .img-upload__preview CSS-класс, соответствующий эффекту. Например, если выбран эффект .effect-chrome, изображению нужно добавить класс effects__preview--chrome.

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал
Когда выбираю радиокнопку effect-chrome
То у изображения появляется класс effects__preview--chrome



o	Интенсивность эффекта регулируется перемещением ползунка в слайдере. Слайдер реализуется сторонней библиотекой для реализации слайдеров noUiSlider. Уровень эффекта записывается в поле .effect-level__value. При изменении уровня интенсивности эффекта (предоставляется API слайдера), CSS-стили картинки внутри .img-upload__preview обновляются следующим образом:

	Для эффекта «Хром» — filter: grayscale(0..1) с шагом 0.1;
	Для эффекта «Сепия» — filter: sepia(0..1) с шагом 0.1;
	Для эффекта «Марвин» — filter: invert(0..100%) с шагом 1%;
	Для эффекта «Фобос» — filter: blur(0..3px) с шагом 0.1px;
	Для эффекта «Зной» — filter: brightness(1..3) с шагом 0.1;
	Для эффекта «Оригинал» CSS-стили filter удаляются.



Хром
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-chrome
то у изображения появляется класс effects__preview--chrome
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: grayscale(0.5);

Сепия
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-sepia
то у изображения появляется класс effects__preview--sepia
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: sepia(0.5);

Марвин
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-marvin
то у изображения появляется класс effects__preview--marvin
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: invert(50%);

Фобос
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-phobos
то у изображения появляется класс effects__preview--phobos
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview  меняются style=filter: blur(1.5px);

Зной
Предыстория : я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-heat
то у изображения появляется класс effects__preview--heat
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview  меняются style=filter: brightness(2)

Оригинал
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-heat
то у изображения появляется класс effects__preview--heat
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: brightness(2)
Когда возвращаю эффект оригинал
То у изображения стоит класс effects__preview--none






o	При выборе эффекта «Оригинал» слайдер скрывается.
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-heat
то у изображения появляется класс effects__preview--heat
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: brightness(2)
Когда возвращаю эффект оригинал
То у изображения стоит класс effects__preview—none
И слайдер скрывается

o	При переключении эффектов, уровень насыщенности сбрасывается до начального значения (100%): слайдер, CSS-стиль изображения и значение поля должны обновляться.

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открыта лента изображений
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда показывается форма редактирования изображения
у элемента .img-upload__overlay удаляется класс hidden
body задаётся класс modal-open.
Тогда по умолчанию выбран фильтр оригинал effect-none
И у изображения стоит класс effects__preview--none
Когда выбираю радиокнопку effect-heat
то у изображения появляется класс effects__preview--heat
Когда перемещаю ползунок на середину слайдера
то CSS-стили картинки внутри .img-upload__preview меняются style=filter: brightness(2)
Когда возвращаю эффект оригинал
То уровень насыщенности сбрасывается до начального значения (100%): слайдер, CSS-стиль изображения и значение поля должны обновляться.

2.3. Хэш-теги:

o	хэш-тег начинается с символа # (решётка);
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм  “           	”
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю фото
Всплывает подсказка ХЭШ-ТЕГ ДОЛЖЕН НАЧИНАТЬСЯ С СИМВОЛА #

o	строка после решётки должна состоять из букв и чисел и не может содержать пробелы, спецсимволы (#, @, $ и т. п.), символы пунктуации (тире, дефис, запятая и т. п.), эмодзи и т. д.;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю #фото2$.iu
Всплывает подсказка хеш-тег содержит недопустимые символы


o	хеш-тег не может состоять только из одной решётки;

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю #
Всплывает подсказка хеш-тег не должен состоять из одного символа #

o	максимальная длина одного хэш-тега 20 символов, включая решётку;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю #ПавликПодпрыгнулВверх
Всплывает подсказка длина хеш-тега не должна превышать 20 символов

o	хэш-теги нечувствительны к регистру: #ХэшТег и #хэштег считаются одним и тем же тегом;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю #ХэшТег #хэштег
Всплывает подсказка что хештеги не должны повторяться

o	хэш-теги разделяются пробелами;

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю теги без пробела #хэштег#Павликподпрыгнул
Всплывает подсказка длина хеш-тега не должна превышать 20 символов
Если добавляю пробел между тегами #хэштег #Павликподпрыгнул
То подсказок нет

o	один и тот же хэш-тег не может быть использован дважды;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю теги #цветок #цветок
Всплывает подсказка хеш-теги не должны повторяться

o	нельзя указать больше пяти хэш-тегов;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Вбиваю теги: #цветок #море #еда #солнце #лето #осень
Всплывает подсказка Хеш-тегов должно быть не больше 5

o	хэш-теги необязательны;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Когда оставляю поле хештег пустым
И нажимаю на кнопку опубликовать
То появляется сообщение об успешной загрузке


o	если фокус находится в поле ввода хэш-тега, нажатие на Esc не должно приводить к закрытию формы редактирования изображения.

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле хештег
То поле становится активным
Когда нажимаю на клавиатуре Esc
То форма редактирования не закрывается


2.4. Комментарий:
o	комментарий не обязателен;
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле ваш комментарий
То оставляю поле пустым
Когда нажимаю опубликовать фото
То появляется окно изображение успешно загружено

o	длина комментария не может составлять больше 140 символов;
-добавление текстового комментария (140 символов);
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле ваш комментарий
То добавляю текст Когда брат сказал, что поедет кататься на лодке, Павлик положил руку на его плечо и тих попросил:Маленький старичок с длинной седой бородой сидел на большой скамейке
Когда нажимаю опубликовать фото
То появляется окно изображение успешно загружено

-добавление текстового комментария (141 символ);
Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле ваш комментарий
То добавляю текст Когда брат сказал, что поедет кататься на лодке, Павлик положил руку на его плечо и тихо попросил:Маленький старичок с длинной седой бородой сидел на большой скамейке
и 141 символ не добавляется


o	если фокус находится в поле ввода комментария, нажатие на Esc не должно приводить к закрытию формы редактирования изображения.

Предыстория: я нахожусь на главной странице сайта (лента изображений)
Дано: Открываем ленту сайта Кексаграм
Когда нажимаю на кнопку загрузить
Тогда появляется окно загрузки файла
Когда выбираю любой графический файл с помощью стандартного контрола загрузки файла #upload-file
Тогда изображение подгружается в появившемся окне
Когда нажимаю на поле ваш комментарий
То поле становится активным
Когда нажимаю на клавиатуре Esc
То форма редактирования не закрывается
