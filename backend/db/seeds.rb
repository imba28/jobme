# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'hallo@ggg.at', password: 'test', password_confirmation: 'test')

@cate1 = Category.create(name: 'Sport', icon: 'Sport.svg', chilhood: '1')
@cate2 = Category.create(name: 'Natur', icon: 'Natur.svg', chilhood: '1')
@cate3 = Category.create(name: 'Kreativität', icon: 'Kreativ.svg', chilhood: '1')
@cate4 = Category.create(name: 'Transport', icon: 'Transportation.svg', chilhood: '0')
@cate5 = Category.create(name: 'Handwerk', icon: 'Craft.svg', chilhood: '0')
@cate6 = Category.create(name: 'Indoor', icon: 'Indoor.svg', chilhood: '0')
@cate0 = Category.create(name: 'superman', icon: '', chilhood: '-1')

# @sub1 = Subcategory.create(name: 'football', icon: 'football.url', category_id: '1')

# craft
@sub7 = Subcategory.create(name: 'Malen', icon: 'paint.url', category_id: '5')
@sub8 = Subcategory.create(name: 'Nähen', icon: 'sewing machine.url', category_id: '5')
@sub9 = Subcategory.create(name: 'Sägen', icon: 'saw.url', category_id: '5')
@sub10 = Subcategory.create(name: 'Schrauben', icon: 'screw.url', category_id: '5')
@sub11 = Subcategory.create(name: 'Graben', icon: 'dig.url', category_id: '5')
@sub12 = Subcategory.create(name: 'Elektrik', icon: 'electric.url', category_id: '5')
# nature
@sub13 = Subcategory.create(name: 'Bergsteigen', icon: 'hill.url', category_id: '2')
@sub14 = Subcategory.create(name: 'Erkunden', icon: 'explore.url', category_id: '2')
@sub15 = Subcategory.create(name: 'Tiere', icon: 'animals.url', category_id: '2')
@sub16 = Subcategory.create(name: 'Pflanzen', icon: 'plant.url', category_id: '2')
@sub17 = Subcategory.create(name: 'Wasser', icon: 'water.url', category_id: '2')
@sub18 = Subcategory.create(name: 'Camping', icon: 'camping.url', category_id: '2')
# sport
@sub19 = Subcategory.create(name: 'Fußball', icon: 'Fußball.svg', category_id: '1')
@sub20 = Subcategory.create(name: 'Fahrrad', icon: 'cycle.url', category_id: '1')
@sub21 = Subcategory.create(name: 'Reiten', icon: 'ride.url', category_id: '1')
@sub22 = Subcategory.create(name: 'Schwimmen', icon: 'swim.url', category_id: '1')
@sub23 = Subcategory.create(name: 'Skifahren', icon: 'ski.url', category_id: '1')
@sub24 = Subcategory.create(name: 'Tennis', icon: 'tennis.url', category_id: '1')
# creative
@sub25 = Subcategory.create(name: 'Singen', icon: 'karaoke.svg', category_id: '3')
@sub26 = Subcategory.create(name: 'Musik hören', icon: 'musik.url', category_id: '3')
@sub27 = Subcategory.create(name: 'Malen', icon: 'malen.url', category_id: '3')
@sub28 = Subcategory.create(name: 'Fotografieren', icon: 'Fotografieren.url', category_id: '3')
@sub29 = Subcategory.create(name: 'Musik spielen', icon: 'mspielen.url', category_id: '3')
# @sub30 = Subcategory.create(name: 'Tennis', icon: 'tennis.url', category_id: '3')
# indoor
@sub31 = Subcategory.create(name: 'Zocken', icon: 'zocken.svg', category_id: '6')
@sub32 = Subcategory.create(name: 'Computer', icon: 'computer.url', category_id: '6')
@sub33 = Subcategory.create(name: 'Karten spielen', icon: 'karten.url', category_id: '6')
@sub34 = Subcategory.create(name: 'kochen', icon: 'kochen.url', category_id: '6')
@sub35 = Subcategory.create(name: 'Fernsehen', icon: 'mspielen.url', category_id: '6')
@sub36 = Subcategory.create(name: 'superman', icon: 'tennis.url', category_id: '7')
# transportation
@sub37 = Subcategory.create(name: 'Fahrrad', icon: 'Fahrrad.svg', category_id: '4')
@sub38 = Subcategory.create(name: 'Boot', icon: 'Boot.url', category_id: '4')
@sub39 = Subcategory.create(name: 'Bus', icon: 'Bus.url', category_id: '4')
@sub40 = Subcategory.create(name: 'Auto', icon: 'Auto.url', category_id: '4')
@sub41 = Subcategory.create(name: 'Flugzeug', icon: 'Flugzeug.url', category_id: '4')
@sub42 = Subcategory.create(name: 'Zug', icon: 'Zug.url', category_id: '4')

@job1 = Job.create(name: 'FacharbeiterIn Bienenwirtschaft', image: 'jedi.gif', description: 'FacharbeiterInnen Bienenwirtschaft züchten und betreuen Bienenvölker zur Honig- und Wachsgewinnung. Die wichtigsten Erzeugnisse sind Honigprodukte, Bienenwachs, Blütenpollen,  Propolis (Bienenkittharz) oder  Gelee Royal (Futtersaft für Bienenköniginnen). Sie züchten Bienenvölker für den Eigenbedarf oder Verkauf, erzeugen aber auch transportable Bienenkörbe und Wabenrahmen: Die verschiedenen Tätigkeiten der FacharbeiterInnen Bienenwirtschaft richten sich stark nach der jeweiligen Jahreszeit. FacharbeiterInnen Bienenwirtschaft arbeiten häufig in landwirtschaftlichen Familienbetrieben mit angeschlossener Imkerei, sie stehen in Kontakt mit BerufskollegInnen, LieferantInnen und KundInnen.')
@job2 = Job.create(name: 'HohlglasveredlerIn - Glasmalerei', image: 'ski-head.png', description: 'HohlglasveredlerInnen im Bereich Glasmalerei bemalen und restaurieren Glasfenster von Kirchen, Festhallen und öffentlichen Gebäuden. Sie stellen auch Ornamente aus buntem Glas her, bemalen  Flachglas (z. B. Glastafeln) und Hohlglas (z. B. Trinkgläser) und erzeugen Glasmosaike aus nichttransparenten Glassteinen. HohlglasveredlerInnen arbeiten händisch mit Pinseln oder maschinell mit Siebdruckmaschinen oder Spritzanlagen. Sie arbeiten gemeinsam mit ihren KollegInnen und Vorgesetzten in Werkstatträumen (z. B. Ätzraum, Spritzkabine).')
@job3 = Job.create(name: 'Klavierbau', image: 'hello3.gif', description: 'KlavierbauerInnen erzeugen, warten und reparieren Klaviere und ähnliche Tasteninstrumente (wie z. B. Spinett, Cembalo). Sie bauen vorwiegend Kleinpianos, Pianos, Kleinflügel, Flügel, Konzertflügel und gegebenenfalls auch historische Tasteninstrumente. Sie kennen Aufbau und Funktionsweise der Instrumente, schneiden z. B. Hölzer zu oder leimen Rippen und Stege auf den Resonanzboden und behandeln Oberflächen, wie z. B. Holz, Kunststoff oder Elfenbein durch Schleifen, Lackieren oder Färben. Dafür verwenden sie Werkzeuge wie Hobel, Bohrer, Ziehklingen und Maschinen zur Holz- und Metallbearbeitung wie z. B. Fräsmaschinen, Lackiermaschinen und Sägen. Außerdem gehören die fachliche Beratung ihrer Kundinnen und Kunden und der Handel mit Instrumenten zu ihren Aufgaben. KlavierbauerInnen arbeiten in Werkstätten, in Klavierfachgeschäften oder direkt bei den Kundinnen und Kunden zu Hause.')
@job4 = Job.create(name: 'Metallbearbeitung', image: 'hello.gif4', description: 'MetallbearbeiterInnen sind mit der handwerksmäßigen und maschinellen/industriellen Herstellung und Montage von Einzelteilen, Komponenten und Baugruppen aus Metall befasst. Zu diesem Zweck bearbeiten sie verschiedene Metalle und Metallbleche wie z. B. Eisen, Stahl, Aluminium und stellen daraus verschiedene Werkstücke wie Rohre, Stangen, Geländer und Verstrebungen, Baukonstruktionen, Maschinenteile und Gerüstteile her. Bei ihrer Arbeit setzen sie metallbearbeitende Verfahren wie z. B. Feilen, Bohren, Schweißen, Drehen, Nieten, Wärmebehandeln und Löten ein.
    MetallbearbeiterInnen arbeiten in Werkstätten und Werkhallen von Industrie- und Gewerbebetrieben; sie arbeiten eigenständig sowie im Team mit BerufskollegInnen, Vorgesetzten und verschiedenen Fach- und Hilfskräften zusammen.')
@job5 = Job.create(name: 'Bankkaufmann/-frau', image: 'hello.gif5', description: 'Bankkaufleute informieren und betreuen Bankkundinnen und -kunden bei ihren Geldgeschäften. Sie beraten die Kundinnen und Kunden über Kontoführung, Kreditaufnahme und informieren sie über verschiedene Anlagemöglichkeiten. Sie bearbeiten alle Vorgänge, die mit dem Zahlungsverkehr zu tun haben. Die Buchführung und Kostenrechnung erledigen sie mittels EDV-Datenbanksystemen. Bankkaufleute arbeiten am Schalter von Banken oder in Büroräumen im Backoffice sowohl eigenständig als auch gemeinsam mit Kolleginnen und Kollegen und Expertinnen und Experten anderer Abteilungen.')
@job6 = Job.create(name: 'Superman', image: 'hello.gif5', description: 'Du bist Superman :)')
@job7 = Job.create(name: 'Bekleidungsgestaltung', image: 'hello.gif5', description: 'Modisch sind BekleidungsgestalterInnen immer up to date. Ob Hosen, Röcke, Blusen, Mäntel, sie fertigen jedes Kleidungsstück, Wäsche, Hüte und diverse Pelz- und Lederbekleidung von A-Z. Sie nehmen Maß an den KundInnen, zeichnen Schnittmuster, berechnen den Stoff- und Materialbedarf, schneiden die Teile zu, heften und nähen sie. Sie verarbeiten Materialien aller Art (z. B. Wollstoffe, Seidenstoffe, Leinen, Leder, Filz, Pelze). Außerdem führen sie Änderungsarbeiten und Reparaturen durch und beraten die KundInnen.
BekleidungsgestalterInnen arbeiten in Werkstätten und Ateliers von Textilbetrieben (z. B. Maß- und Änderungsschneidereien) und in Produktionshallen der Textilindustrie. Sie haben Kontakt zu ihren KundInnen, zu Berufskolleginnen und -kollegen und zu unterschiedlichen Fachkräften aus den Bereichen Design, Produktion, Verkauf usw.')

# add Job image
# path = '/public/uploads/job/image/'
path_job = '/app/assets/images/job/'

img = File.open(File.join(Rails.root, path_job + 'bee.gif'))
@job1.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'glasmalerei.gif'))
@job2.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'klavier.gif'))
@job3.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'metal.gif'))
@job4.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'banker.gif'))
@job5.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'superman.gif'))
@job6.update(image: img, image_preview: img)
img = File.open(File.join(Rails.root, path_job + 'gestaltung.gif'))
@job7.update(image: img, image_preview: img)

# add category img
path_cate = '/app/assets/images/category/'
img = File.open(File.join(Rails.root, path_cate + 'Sport.svg'))
@cate1.update(icon: img)
img = File.open(File.join(Rails.root, path_cate + 'Natur.svg'))
@cate2.update(icon: img)
img = File.open(File.join(Rails.root, path_cate + 'Kreativ.svg'))
@cate3.update(icon: img)
img = File.open(File.join(Rails.root, path_cate + 'Transportation.svg'))
@cate4.update(icon: img)
img = File.open(File.join(Rails.root, path_cate + 'Craft.svg'))
@cate5.update(icon: img)
img = File.open(File.join(Rails.root, path_cate + 'Indoor.svg'))
@cate6.update(icon: img)

# add subcategory craft img
path_sub = '/app/assets/images/subcategory/craft/'
img = File.open(File.join(Rails.root, path_sub + 'Farbrolle.svg'))
@sub7.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Nähmaschine.svg'))
@sub8.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Säge.svg'))
@sub9.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Schrauben.svg'))
@sub10.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Spaten.svg'))
@sub11.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Stecker.svg'))
@sub12.update(icon: img)

# add subcategory nature img
path_sub = '/app/assets/images/subcategory/natur/'
img = File.open(File.join(Rails.root, path_sub + 'Berg.svg'))
@sub13.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Fernglas.svg'))
@sub14.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Hund.svg'))
@sub15.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Pflanzen.svg'))
@sub16.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Wasser.svg'))
@sub17.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Zelten.svg'))
@sub18.update(icon: img)

# add subcategory sport img
path_sub = '/app/assets/images/subcategory/sport/'
img = File.open(File.join(Rails.root, path_sub + 'Fußball.svg'))
@sub19.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Radfahren.svg'))
@sub20.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Reiten.svg'))
@sub21.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Schwimmen.svg'))
@sub22.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Ski.svg'))
@sub23.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'Tennis.svg'))
@sub24.update(icon: img)

# add subcategory creative img
path_sub = '/app/assets/images/subcategory/creative/'
img = File.open(File.join(Rails.root, path_sub + 'karaoke.svg'))
@sub25.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'music-player.svg'))
@sub26.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'paint-palette.svg'))
@sub27.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'photo-camera.svg'))
@sub28.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'guitar.svg'))
@sub29.update(icon: img)
# img = File.open(File.join(Rails.root, path_sub + 'empty.svg'))
# @sub30.update(icon: img)

# add subcategory indoor img
path_sub = '/app/assets/images/subcategory/indoor/'
img = File.open(File.join(Rails.root, path_sub + 'gamepad.svg'))
@sub31.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'laptop.svg'))
@sub32.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'playing-cards.svg'))
@sub33.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'stove.svg'))
@sub34.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'tv.svg'))
@sub35.update(icon: img)
# img = File.open(File.join(Rails.root, path_sub + 'empty.svg'))
# @sub36.update(icon: img)

# add subcategory transportation img
path_sub = '/app/assets/images/subcategory/transportation/'
img = File.open(File.join(Rails.root, path_sub + 'bicycle.svg'))
@sub37.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'boat.svg'))
@sub38.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'bus.svg'))
@sub39.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'car.svg'))
@sub40.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'plane.svg'))
@sub41.update(icon: img)
img = File.open(File.join(Rails.root, path_sub + 'train.svg'))
@sub42.update(icon: img)

# FacharbeiterIn Bienenwirtschaft
@job1.subcategories << @sub9
@job1.subcategories << @sub10
@job1.subcategories << @sub7
@job1.subcategories << @sub13
@job1.subcategories << @sub14
@job1.subcategories << @sub15
@job1.subcategories << @sub16

# HohlglasveredlerIn - Glasmalerei
@job2.subcategories << @sub7
@job2.subcategories << @sub21
@job2.subcategories << @sub20
@job2.subcategories << @sub23
@job5.subcategories << @sub35
@job5.subcategories << @sub33
@job5.subcategories << @sub37

# Klavierbau
@job3.subcategories << @sub9
@job3.subcategories << @sub10
@job3.subcategories << @sub16
@job3.subcategories << @sub14
@job3.subcategories << @sub21
@job3.subcategories << @sub20
@job3.subcategories << @sub29
@job3.subcategories << @sub26

# Metallbearbeitung
@job4.subcategories << @sub9
@job4.subcategories << @sub10
@job4.subcategories << @sub14
@job4.subcategories << @sub18
@job4.subcategories << @sub19
@job4.subcategories << @sub20
@job4.subcategories << @sub39
@job4.subcategories << @sub40
@job4.subcategories << @sub42

# Bankkaufmann/-frau
@job5.subcategories << @sub19
@job5.subcategories << @sub20
@job5.subcategories << @sub21
@job5.subcategories << @sub22
@job5.subcategories << @sub23
@job5.subcategories << @sub24
@job5.subcategories << @sub32
@job5.subcategories << @sub35

# funny superman :)
@job6.subcategories << @sub36

# Bekleidungsgestaltung
@job7.subcategories << @sub8
@job7.subcategories << @sub11
@job7.subcategories << @sub12
@job7.subcategories << @sub17
@job7.subcategories << @sub25
@job7.subcategories << @sub26
@job7.subcategories << @sub28
@job7.subcategories << @sub31
@job7.subcategories << @sub38
@job7.subcategories << @sub41
