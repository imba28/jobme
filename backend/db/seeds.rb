# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'hallo@ggg.at',password: 'test', password_confirmation: 'test')

@cate1 = Category.create(name: 'Sport', icon: 'Sport.svg', chilhood: '1')
@cate2 = Category.create(name: 'Natur', icon: 'Natur.svg', chilhood: '1')
@cate3 = Category.create(name: 'Kreativität', icon: 'Kreativ.svg', chilhood: '1')
@cate4 = Category.create(name: 'Transport', icon: 'Transportation.svg', chilhood: '0')
@cate5 = Category.create(name: 'Handwerk', icon: 'Craft.svg', chilhood: '0')
@cate6 = Category.create(name: 'Indoor', icon: 'Indoor.svg', chilhood: '0')

#@sub1 = Subcategory.create(name: 'football', icon: 'football.url', category_id: '1')

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
@sub18 = Subcategory.create(name: 'Caping', icon: 'camping.url', category_id: '2')
# sport
@sub19 = Subcategory.create(name: 'Fußball', icon: 'Fußball.svg', category_id: '1')
@sub20 = Subcategory.create(name: 'Fahrrad', icon: 'cycle.url', category_id: '1')
@sub21 = Subcategory.create(name: 'Reiten', icon: 'ride.url', category_id: '1')
@sub22 = Subcategory.create(name: 'Schwimmen', icon: 'swim.url', category_id: '1')
@sub23 = Subcategory.create(name: 'Skifahren', icon: 'ski.url', category_id: '1')
@sub24 = Subcategory.create(name: 'Tennis', icon: 'tennis.url', category_id: '1')

@job1 = Job.create(name: 'FacharbeiterIn Bienenwirtschaft', image: 'jedi.gif', description: 'FacharbeiterInnen Bienenwirtschaft züchten und betreuen Bienenvölker zur Honig- und Wachsgewinnung. Die wichtigsten Erzeugnisse sind Honigprodukte, Bienenwachs, Blütenpollen,  Propolis (Bienenkittharz) oder  Gelee Royal (Futtersaft für Bienenköniginnen). Sie züchten Bienenvölker für den Eigenbedarf oder Verkauf, erzeugen aber auch transportable Bienenkörbe und Wabenrahmen: Die verschiedenen Tätigkeiten der FacharbeiterInnen Bienenwirtschaft richten sich stark nach der jeweiligen Jahreszeit. FacharbeiterInnen Bienenwirtschaft arbeiten häufig in landwirtschaftlichen Familienbetrieben mit angeschlossener Imkerei, sie stehen in Kontakt mit BerufskollegInnen, LieferantInnen und KundInnen.')
@job2 = Job.create(name: 'HohlglasveredlerIn - Glasmalerei', image: 'ski-head.png', description: 'HohlglasveredlerInnen im Bereich Glasmalerei bemalen und restaurieren Glasfenster von Kirchen, Festhallen und öffentlichen Gebäuden. Sie stellen auch Ornamente aus buntem Glas her, bemalen  Flachglas (z. B. Glastafeln) und Hohlglas (z. B. Trinkgläser) und erzeugen Glasmosaike aus nichttransparenten Glassteinen. HohlglasveredlerInnen arbeiten händisch mit Pinseln oder maschinell mit Siebdruckmaschinen oder Spritzanlagen. Sie arbeiten gemeinsam mit ihren KollegInnen und Vorgesetzten in Werkstatträumen (z. B. Ätzraum, Spritzkabine).')
@job3 = Job.create(name: 'Klavierbau', image: 'hello3.gif', description: 'KlavierbauerInnen erzeugen, warten und reparieren Klaviere und ähnliche Tasteninstrumente (wie z. B. Spinett, Cembalo). Sie bauen vorwiegend Kleinpianos, Pianos, Kleinflügel, Flügel, Konzertflügel und gegebenenfalls auch historische Tasteninstrumente. Sie kennen Aufbau und Funktionsweise der Instrumente, schneiden z. B. Hölzer zu oder leimen Rippen und Stege auf den Resonanzboden und behandeln Oberflächen, wie z. B. Holz, Kunststoff oder Elfenbein durch Schleifen, Lackieren oder Färben. Dafür verwenden sie Werkzeuge wie Hobel, Bohrer, Ziehklingen und Maschinen zur Holz- und Metallbearbeitung wie z. B. Fräsmaschinen, Lackiermaschinen und Sägen. Außerdem gehören die fachliche Beratung ihrer Kundinnen und Kunden und der Handel mit Instrumenten zu ihren Aufgaben. KlavierbauerInnen arbeiten in Werkstätten, in Klavierfachgeschäften oder direkt bei den Kundinnen und Kunden zu Hause.')
@job4 = Job.create(name: 'Metallbearbeitung', image: 'hello.gif4', description: 'MetallbearbeiterInnen sind mit der handwerksmäßigen und maschinellen/industriellen Herstellung und Montage von Einzelteilen, Komponenten und Baugruppen aus Metall befasst. Zu diesem Zweck bearbeiten sie verschiedene Metalle und Metallbleche wie z. B. Eisen, Stahl, Aluminium und stellen daraus verschiedene Werkstücke wie Rohre, Stangen, Geländer und Verstrebungen, Baukonstruktionen, Maschinenteile und Gerüstteile her. Bei ihrer Arbeit setzen sie metallbearbeitende Verfahren wie z. B. Feilen, Bohren, Schweißen, Drehen, Nieten, Wärmebehandeln und Löten ein.
    MetallbearbeiterInnen arbeiten in Werkstätten und Werkhallen von Industrie- und Gewerbebetrieben; sie arbeiten eigenständig sowie im Team mit BerufskollegInnen, Vorgesetzten und verschiedenen Fach- und Hilfskräften zusammen.')
@job5 = Job.create(name: 'Bankkaufmann/-frau', image: 'hello.gif5', description: 'Bankkaufleute informieren und betreuen Bankkundinnen und -kunden bei ihren Geldgeschäften. Sie beraten die Kundinnen und Kunden über Kontoführung, Kreditaufnahme und informieren sie über verschiedene Anlagemöglichkeiten. Sie bearbeiten alle Vorgänge, die mit dem Zahlungsverkehr zu tun haben. Die Buchführung und Kostenrechnung erledigen sie mittels EDV-Datenbanksystemen. Bankkaufleute arbeiten am Schalter von Banken oder in Büroräumen im Backoffice sowohl eigenständig als auch gemeinsam mit Kolleginnen und Kollegen und Expertinnen und Experten anderer Abteilungen.')

#add Job image 
#path = '/public/uploads/job/image/'
pathJob = '/app/assets/images/job/'

img = File.open(File.join(Rails.root, pathJob + 'jedi.gif'))
@job1.update(image: img, image_preview: img)

img = File.open(File.join(Rails.root, pathJob + 'ski-head.png'))
#img = ImageIconUploader.store_dir('ski-head.png')
@job2.update(image: img, image_preview: img)

# add category img
pathCate = '/app/assets/images/category/'
img = File.open(File.join(Rails.root, pathCate + 'Sport.svg'))
@cate1.update(icon: img)
img = File.open(File.join(Rails.root, pathCate + 'Natur.svg'))
@cate2.update(icon: img)
img = File.open(File.join(Rails.root, pathCate + 'Kreativ.svg'))
@cate3.update(icon: img)
img = File.open(File.join(Rails.root, pathCate + 'Transportation.svg'))
@cate4.update(icon: img)
img = File.open(File.join(Rails.root, pathCate + 'Craft.svg'))
@cate5.update(icon: img)
img = File.open(File.join(Rails.root, pathCate + 'Indoor.svg'))
@cate6.update(icon: img)

# add subcategory craft img 
pathSub = '/app/assets/images/subcategory/craft/'
img = File.open(File.join(Rails.root, pathSub + 'Farbrolle.svg'))
@sub7.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Nähmaschine.svg'))
@sub8.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Säge.svg'))
@sub9.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Schrauben.svg'))
@sub10.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Spaten.svg'))
@sub11.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Stecker.svg'))
@sub12.update(icon: img)

# add subcategory nature img 
pathSub = '/app/assets/images/subcategory/natur/'
img = File.open(File.join(Rails.root, pathSub + 'Berg.svg'))
@sub13.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Fernglas.svg'))
@sub14.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Hund.svg'))
@sub15.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Pflanzen.svg'))
@sub16.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Wasser.svg'))
@sub17.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Zelten.svg'))
@sub18.update(icon: img)

# add subcategory sport img 
pathSub = '/app/assets/images/subcategory/sport/'
img = File.open(File.join(Rails.root, pathSub + 'Fußball.svg'))
@sub19.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Radfahren.svg'))
@sub20.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Reiten.svg'))
@sub21.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Schwimmen.svg'))
@sub22.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Ski.svg'))
@sub23.update(icon: img)
img = File.open(File.join(Rails.root, pathSub + 'Tennis.svg'))
@sub24.update(icon: img)

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