<item turbo="true">
    <link>{{ home ~ news.url.full }}</link>
    <title>{{ news.title }}</title>
    <pubDate>{{ news.dateStamp | date('D, d M y H:i:s O') }}</pubDate>
    <turbo:content>
        <![CDATA[
            <header>
                <h1>{{ news.title }}</h1>
                {#
                    <h2>����� ��������</h2>
                    <menu>
                        <a href="{{ home }}">�������</a>
                        <a href="{{ home }}/catalog">�������</a>
                        <a href="{{ home }}/static/contacts.html">��������</a>
                    </menu>
                #}
            </header>

            {# ����������� �������� � ������ ������� � �������������� ����������� ������������� ������. #}
            <p>{{ news.short | striptags }}</p>

            {{ news.full | striptags('<p><figure><img><iframe><br><ul><ol><li><b><strong><i><em><sup><sub><ins><del><small><big><pre></pre><abbr><u><a>') | replace({
                'src="/': 'src="' ~ home ~ '/',
                'src="../': 'src="' ~ home ~ '/',
            }) }}

            {#
                ������� ���������������� ��������� ����� � ������������ �����������.

                <p>{{ news.full | striptags }}</p>
                <p>{{ news.full | striptags('<figure><img><p><br><ul><ol><li><b><i><u><pre></pre><a>') }}</p>
                <p>{{ news.full | striptags | truncateHTML(350, '...') }}</p>
            #}

            {#
                ������ ������ ������������� ������ �� ����������.

                {{ news.full | replace({
                    'src="/': 'src="' ~ home ~ '/',
                    'src="../': 'src="' ~ home ~ '/',
                }) }}
            #}

            {#
                ������ �������� ������ ���� �����������.

                {% for image in news.embed.images %}
                    <figure>
                        <img src="{{ image.url }}" alt="" />
                    </figure>
                {% endfor %}
            #}

            {#
                ������� ������������� ���. �����.

                1) ���� ���� ����� ��������� ���.
                {{ p.xfields.specification.value ? p.xfields.specification.value : '�������������� �� �������' }}

                2) ���� ���� ����� �������� ���.
                {% if p.xfields.price.value >= 0 %}
                    ��������� �� {{ p.xfields.price.value }} ������
                {% endif %}

                3) ���� ���� ������������ ����� ������ �����������.
                {% for image in p.xfields.poster.entries %}
                    <figure>
                        <img src="{{ image.url }}" alt="" />
                    </figure>
                {% endfor %}
            #}

            {#
                ������ ����������� ������� ��������� � ������ ��������� �������.

                {{ news.categories.masterText }}

                {% for category in news.categories.list %}
                    <a href="{{ category.url }}">{{ category.name }}</a>
                {% endfor %}
            #}
        ]]>
    </turbo:content>
</item>
