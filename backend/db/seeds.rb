# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'hallo@ggg.at',password: 'test', password_confirmation: 'test')

Category.create(name: 'sport', icon: 'sport.url', chilhood: '1')
Category.create(name: 'natrue', icon: 'nature.url', chilhood: '1')
Category.create(name: 'crative', icon: 'creative.url', chilhood: '1')
Category.create(name: 'transportation', icon: 'transportation.url', chilhood: '0')
Category.create(name: 'craft', icon: 'worker.url', chilhood: '0')
Category.create(name: 'indoor', icon: 'indoor.url', chilhood: '0')

#@sub1 = Subcategory.create(name: 'football', icon: 'football.url', category_id: '1')

# craft
@sub7 = Subcategory.create(name: 'paint', icon: 'paint.url', category_id: '5')
@sub8 = Subcategory.create(name: 'sewing machine', icon: 'sewing machine.url', category_id: '5')
@sub9 = Subcategory.create(name: 'saw', icon: 'saw.url', category_id: '5')
@sub10 = Subcategory.create(name: 'screw', icon: 'screw.url', category_id: '5')
@sub11 = Subcategory.create(name: 'dig', icon: 'dig.url', category_id: '5')
@sub12 = Subcategory.create(name: 'electric', icon: 'electric.url', category_id: '5')
# nature
@sub13 = Subcategory.create(name: 'hill', icon: 'hill.url', category_id: '2')
@sub14 = Subcategory.create(name: 'explore', icon: 'explore.url', category_id: '2')
@sub15 = Subcategory.create(name: 'animals', icon: 'animals.url', category_id: '2')
@sub16 = Subcategory.create(name: 'plant', icon: 'plant.url', category_id: '2')
@sub17 = Subcategory.create(name: 'water', icon: 'water.url', category_id: '2')
@sub18 = Subcategory.create(name: 'camping', icon: 'camping.url', category_id: '2')
# sport
@sub19 = Subcategory.create(name: 'football', icon: 'football.url', category_id: '1')
@sub20 = Subcategory.create(name: 'cycle', icon: 'cycle.url', category_id: '1')
@sub21 = Subcategory.create(name: 'ride', icon: 'ride.url', category_id: '1')
@sub22 = Subcategory.create(name: 'swim', icon: 'swim.url', category_id: '1')
@sub23 = Subcategory.create(name: 'ski', icon: 'ski.url', category_id: '1')
@sub24 = Subcategory.create(name: 'tennis', icon: 'tennis.url', category_id: '1')

@job1 = Job.create(name: 'FacharbeiterIn Bienenwirtschaft', image: 'hello1.gif', description: 'FacharbeiterInnen Bienenwirtschaft züchten und betreuen Bienenvölker zur Honig- und Wachsgewinnung. Die wichtigsten Erzeugnisse sind Honigprodukte, Bienenwachs, Blütenpollen,  Propolis (Bienenkittharz) oder  Gelee Royal (Futtersaft für Bienenköniginnen). Sie züchten Bienenvölker für den Eigenbedarf oder Verkauf, erzeugen aber auch transportable Bienenkörbe und Wabenrahmen: Die verschiedenen Tätigkeiten der FacharbeiterInnen Bienenwirtschaft richten sich stark nach der jeweiligen Jahreszeit. FacharbeiterInnen Bienenwirtschaft arbeiten häufig in landwirtschaftlichen Familienbetrieben mit angeschlossener Imkerei, sie stehen in Kontakt mit BerufskollegInnen, LieferantInnen und KundInnen.')
@job2 = Job.create(name: 'HohlglasveredlerIn - Glasmalerei', image: 'hello2.gif', description: 'HohlglasveredlerInnen im Bereich Glasmalerei bemalen und restaurieren Glasfenster von Kirchen, Festhallen und öffentlichen Gebäuden. Sie stellen auch Ornamente aus buntem Glas her, bemalen  Flachglas (z. B. Glastafeln) und Hohlglas (z. B. Trinkgläser) und erzeugen Glasmosaike aus nichttransparenten Glassteinen. HohlglasveredlerInnen arbeiten händisch mit Pinseln oder maschinell mit Siebdruckmaschinen oder Spritzanlagen. Sie arbeiten gemeinsam mit ihren KollegInnen und Vorgesetzten in Werkstatträumen (z. B. Ätzraum, Spritzkabine).')
@job3 = Job.create(name: 'Klavierbau', image: 'hello3.gif', description: 'KlavierbauerInnen erzeugen, warten und reparieren Klaviere und ähnliche Tasteninstrumente (wie z. B. Spinett, Cembalo). Sie bauen vorwiegend Kleinpianos, Pianos, Kleinflügel, Flügel, Konzertflügel und gegebenenfalls auch historische Tasteninstrumente. Sie kennen Aufbau und Funktionsweise der Instrumente, schneiden z. B. Hölzer zu oder leimen Rippen und Stege auf den Resonanzboden und behandeln Oberflächen, wie z. B. Holz, Kunststoff oder Elfenbein durch Schleifen, Lackieren oder Färben. Dafür verwenden sie Werkzeuge wie Hobel, Bohrer, Ziehklingen und Maschinen zur Holz- und Metallbearbeitung wie z. B. Fräsmaschinen, Lackiermaschinen und Sägen. Außerdem gehören die fachliche Beratung ihrer Kundinnen und Kunden und der Handel mit Instrumenten zu ihren Aufgaben. KlavierbauerInnen arbeiten in Werkstätten, in Klavierfachgeschäften oder direkt bei den Kundinnen und Kunden zu Hause.')
@job4 = Job.create(name: 'Metallbearbeitung', image: 'hello.gif4', description: 'MetallbearbeiterInnen sind mit der handwerksmäßigen und maschinellen/industriellen Herstellung und Montage von Einzelteilen, Komponenten und Baugruppen aus Metall befasst. Zu diesem Zweck bearbeiten sie verschiedene Metalle und Metallbleche wie z. B. Eisen, Stahl, Aluminium und stellen daraus verschiedene Werkstücke wie Rohre, Stangen, Geländer und Verstrebungen, Baukonstruktionen, Maschinenteile und Gerüstteile her. Bei ihrer Arbeit setzen sie metallbearbeitende Verfahren wie z. B. Feilen, Bohren, Schweißen, Drehen, Nieten, Wärmebehandeln und Löten ein.
    MetallbearbeiterInnen arbeiten in Werkstätten und Werkhallen von Industrie- und Gewerbebetrieben; sie arbeiten eigenständig sowie im Team mit BerufskollegInnen, Vorgesetzten und verschiedenen Fach- und Hilfskräften zusammen.')
@job5 = Job.create(name: 'Bankkaufmann/-frau', image: 'hello.gif5', description: 'Bankkaufleute informieren und betreuen Bankkundinnen und -kunden bei ihren Geldgeschäften. Sie beraten die Kundinnen und Kunden über Kontoführung, Kreditaufnahme und informieren sie über verschiedene Anlagemöglichkeiten. Sie bearbeiten alle Vorgänge, die mit dem Zahlungsverkehr zu tun haben. Die Buchführung und Kostenrechnung erledigen sie mittels EDV-Datenbanksystemen. Bankkaufleute arbeiten am Schalter von Banken oder in Büroräumen im Backoffice sowohl eigenständig als auch gemeinsam mit Kolleginnen und Kollegen und Expertinnen und Experten anderer Abteilungen.')

# FacharbeiterIn Bienenwirtschaft
@job1.subcategories << @sub9
@job1.subcategories << @sub10
@job1.subcategories << @sub7
@job1.subcategories << @sub13
@job1.subcategories << @sub14
@job1.subcategories << @sub15
@job1.subcategories << @sub16
@job2.subcategories << @sub23
@job2.subcategories << @sub21



# HohlglasveredlerIn - Glasmalerei
@job2.subcategories << @sub7
@job2.subcategories << @sub21
@job2.subcategories << @sub20
# ??????


# Klavierbau
@job3.subcategories << @sub9
@job3.subcategories << @sub10
@job3.subcategories << @sub16
@job3.subcategories << @sub14
@job3.subcategories << @sub21
@job3.subcategories << @sub20
# ?????


# Metallbearbeitung
@job4.subcategories << @sub9
@job4.subcategories << @sub10
@job4.subcategories << @sub14
@job4.subcategories << @sub18
@job4.subcategories << @sub19
@job4.subcategories << @sub20


# Bankkaufmann/-frau
@job5.subcategories << @sub19
@job5.subcategories << @sub20
@job5.subcategories << @sub21
@job5.subcategories << @sub22
@job5.subcategories << @sub23
@job5.subcategories << @sub24