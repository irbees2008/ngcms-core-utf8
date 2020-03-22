ngcms-core-utf8
==========

[![Join the chat at https://gitter.im/vponomarev/ngcms-core](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vponomarev/ngcms-core?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Сборка файлов ядра  NGCMS и плагинов.

Основная ветка (старая админка, плагины без правок ) здесь https://github.com/vponomarev/ngcms-core.

Здесь находится сборка файлов ядра, плагинов,уже установленного composera. Устанавливается также как и версия 0.9.5. 

По поводу плагинов,при возникновении ошибок ,пишите на форуме https://ngcms.ru/forum/ или сюда https://github.com/irbees2008/ngcms-core-utf8/issues/new  . 

Если какого плагина нет в сборке пишите,адаптируем под эту версию.

<h2>Минимальные требование к веб-серверу:</h2>
<p>Apache 2.2<br />
PHP 5.4<br />
MySQL 5.1</p>
<h2>Дополнительные требования:</h2>
<ul class="spisok">
<li>mod_rewrite; (для работы ЧПУ)</li>
<li>GD 2.x; (для работы с картинками)</li>
<li>Модуль XML для PHP (для работы некоторых дополнительных плагинов)</li>
</ul>
<h2>Администрирование сайта:</h2>
<p>Для администрирования сайта необходимо любой из современных браузеров.</p>

<p class="zametka">Перед установкой необходимо скачать последнюю версию NGCMS <a href="https://ngcms.ru/">с официального сайта</a>, либо с <a href="https://github.com/vponomarev/ngcms-core">GIT репозитория</a>.</p>
<ul class="spisok">
<li>Распакуйте архив с дистрибутивом во временный каталог.</li>
<li>Загрузите все файлы из временного каталога в корневой каталог вашего сайта.</li>
<li>Выставьте необходимые права доступа для следующих файлов/каталогов:
<ul class="spisok">
<li>папка: uploads/ (и все папки внутри)</li>
<li>папка: templates/ (и все папки внутри)</li>
<li>папка: engine/conf/ (и все файлы внутри)</li>
<li>папка: engine/backups/</li>
<li>папка: engine/cache/</li>
<li>папка: engine/skin/default/tpl (и все папки внутри)</li>
<li>все файлы (*.tpl) во всех папках: templates/</li>
</ul>
</li>
<li>Наберите в браузере адрес вашего сайта</li>
<li>Следуйте дальнейшим инструкциям</li>
</ul>
<h2>Установка системы</h2>
<p>Фактически установка системы состоит из 7 простых шагов, проядя которые вы полочите полностью рабочую CMS.</p>
<h3>Шаг 1: Лицензионное соглашение</h2>
<p>На данном шаге Вам нужно ознакомиться с лицензионным соглашением NGCMS и принять его, поставиь соответствующую галочку внизу страницы. (рис 2.1)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_1.png" />
<br />рис 2.1 </p>
<h3>Шаг 2: Настройка БД</h2>
<p>На данной странице Вам необходимо ввести параметры подключения к БД. (рис 2.2)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_2.png" />
<br />рис 2.2 </p>
<h3>Шаг 3: Проверка доступов</h2>
<p>На данном шаге выполняется проверка на соответствие характеристик сервера к минимальные требования скрипта. Также проверяется правильно ли выставлены права доступа (chmod) к директориями. (рис 2.3)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_3.png" />
<br />рис 2.3 </p>
<h3>Шаг 4: Активация плагинов</h2>
<p>На данной странице отображается список плагинов, входящих в поставку NGCMS. Некоторые из них вы можете активировать прямо здесь. (рис 2.4)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_4.png" />
<br />рис 2.4 </p>
<h3>Шаг 5: Выбор шаблона</h2>
<p>На данной странице вам предстоит выбрать шаблон для NGCMS. (рис 2.5)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_5.png" />
<br />рис 2.5 </p>
<h3>Шаг 6: Общие параметры</h2>
<p>На данном шаге требуется ввести общие параметры сайта, такие как URL сайта, заголовок, а также логин и пароль для администратора. (рис 2.6)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_6.png" />
<br />рис 2.6 </p>
<h3>Шаг 7: Завершение установки</h2>
<p>Это заключительный этап установки. Здесь отображаются все, выполненные во время установки, действия. (рис 2.7)</p>
<p class="img"><img width="839" src="https://ngcmshak.ru/readme/help/images/screenshots/install_7.png" />
<br />рис 2.7 </p>
