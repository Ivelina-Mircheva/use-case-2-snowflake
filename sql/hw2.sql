--Направете си нова база данни, наречена {HANDLER}_ZOO_DB.
CREATE DATABASE SPARROW_ZOO_DB;

CREATE TABLE SPARROW_ZOO_DB.PUBLIC.td_zoo(
    record_id INT AUTOINCREMENT,
    zoo_json VARIANT
)

INSERT INTO SPARROW_ZOO_DB.PUBLIC.td_zoo(zoo_json)
SELECT TRY_PARSE_JSON('{
"zooName": "Cosmic Critters Galactic Zoo",
"location": "Space Station Delta-7, Sector Gamma-9",
"establishedDate": "2077-01-01",
"director": {
    "name": "Zorp Glorbax",
    "species": "Xylosian"
},
"habitats": [
    {
    "id": "H001",
    "name": "Crystal Caves",
    "environmentType": "Subterranean",
    "sizeSqMeters": 1500,
    "safetyRating": 4.5,
    "features": ["Luminescent Flora", "Geothermal Vents", "Echo Chambers"],
    "currentTempCelsius": 15
    },
    {
    "id": "H002",
    "name": "Azure Aquarium",
    "environmentType": "Aquatic",
    "sizeSqMeters": 3000,
    "safetyRating": 4.8,
    "features": ["Coral Reef Simulation", "High-Pressure Zone", "Bioluminescent Plankton"],
    "currentTempCelsius": 22
    },
    {
    "id": "H003",
    "name": "Floating Forest",
    "environmentType": "Zero-G Jungle",
    "sizeSqMeters": 2500,
    "safetyRating": 4.2,
    "features": ["Magnetic Vines", "Floating Islands", "Simulated Rain"],
    "currentTempCelsius": 28
    },
    {
    "id": "H004",
    "name": "Frozen Tundra",
    "environmentType": "Arctic",
    "sizeSqMeters": 1800,
    "safetyRating": 4.0,
    "features": ["Ice Caves", "Simulated Aurora"],
    "currentTempCelsius": -10
    }
],
"creatures": [
    {
    "id": "C001",
    "name": "Gloob",
    "species": "Gelatinoid",
    "originPlanet": "Xylar",
    "diet": "Photosynthesis",
    "temperament": "Docile",
    "habitatId": "H001",
    "acquisitionDate": "2077-01-15",
    "specialAbilities": null,
    "healthStatus": { "lastCheckup": "2077-03-01", "status": "Excellent" }
    },
    {
    "id": "C002",
    "name": "Finblade",
    "species": "Aqua-Predator",
    "originPlanet": "Neptunia Prime",
    "diet": "Carnivore",
    "temperament": "Aggressive",
    "habitatId": "H002",
    "acquisitionDate": "2077-02-01",
    "specialAbilities": ["Sonar Burst", "Camouflage"],
    "healthStatus": { "lastCheckup": "2077-03-10", "status": "Good" }
    },
    {
    "id": "C003",
    "name": "Sky-Wisp",
    "species": "Aether Flyer",
    "originPlanet": "Cirrus V",
    "diet": "Energy Absorption",
    "temperament": "Shy",
    "habitatId": "H003",
    "acquisitionDate": "2077-02-20",
    "specialAbilities": ["Invisibility", "Phase Shift"],
    "healthStatus": { "lastCheckup": "2077-03-15", "status": "Fair" }
    },
    {
    "id": "C004",
    "name": "Krystal Krawler",
    "species": "Silicate Arthropod",
    "originPlanet": "Xylar",
    "diet": "Mineralvore",
    "temperament": "Neutral",
    "habitatId": "H001",
    "acquisitionDate": "2077-03-05",
    "specialAbilities": ["Crystal Armor", "Burrowing"],
    "healthStatus": { "lastCheckup": "2077-03-20", "status": "Excellent" }
    },
    {
    "id": "C005",
    "name": "Ice Strider",
    "species": "Cryo-Mammal",
    "originPlanet": "Cryonia",
    "diet": "Herbivore",
    "temperament": "Docile",
    "habitatId": "H004",
    "acquisitionDate": "2077-03-10",
    "specialAbilities": ["Thermal Resistance", "Ice Skating"],
    "healthStatus": { "lastCheckup": "2077-03-25", "status": "Good"}
    }
],
"staff": [
    {
    "employeeId": "S001",
    "name": "Grunga",
    "role": "Senior Keeper",
    "species": "Gronk",
    "assignedHabitatIds": ["H001", "H004"]
    },
    {
    "employeeId": "S002",
    "name": "Dr. Elara Vance",
    "role": "Chief Veterinarian",
    "species": "Human",
    "assignedHabitatIds": []
    },
    {
    "employeeId": "S003",
    "name": "Bleep-Bloop",
    "role": "Maintenance Droid",
    "species": "Robotic Unit 7",
    "assignedHabitatIds": ["H002", "H003"]
    }
],
"upcomingEvents": [
    {
    "eventId": "E001",
    "name": "Finblade Feeding Frenzy",
    "type": "Feeding Show",
    "scheduledTime": "2077-04-01T14:00:00Z",
    "locationHabitatId": "H002",
    "involvedCreatureIds": ["C002"]
    },
    {
    "eventId": "E002",
    "name": "Sky-Wisp Visibility Demo",
    "type": "Educational",
    "scheduledTime": "2077-04-05T11:00:00Z",
    "locationHabitatId": "H003",
    "involvedCreatureIds": ["C003"]
    }
]
}');

SELECT * FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO;

--🔥Профил на зоопарка
-- Да се извлекат официалното име на зоологическата градина (zooName) и нейното местоположение (location). Тази информация е фундаментална и служи като основа за идентифициране на зоопарка и неговото географско разположение. Полезна е за общи справки, документация или заглавни страници на отчети.

SELECT zoo_json:zooName, zoo_json:location
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO;

-- 🔥Достъп до данни вложен обект
-- Да се получат името (name) и видът (species) на директора на зоологическата градина. Целта е да се демонстрира как се извлича специфична информация от по-сложни структури данни, където данните са организирани йерархично (вложени). В случая, това са детайли за ключова фигура в управлението на зоопарка.

SELECT zoo_json:director.name, zoo_json:director.species
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO;

-- 🔥Изброяване на всички същества
-- Да се изброят името (name) и видът (species) на всяко същество в зоологическата градина. Тази задача цели да се създаде пълен каталог на всички животни, показващ основните им идентификатори. Това е полезно за инвентаризация, общи прегледи или като основа за по-сложни филтрирания.
-- Подсказка: Ще трябва да "сплеснете" (обработите като плосък списък) масива creatures.

SELECT creature.value:name, creature.value:species
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature; --'Сплескване' на масива creatures

-- 🔥Филтриране на същества по произход
-- Да се намерят имената на всички същества, произхождащи от планетата 'Xylar'. Задачата изисква филтриране на данните по специфичен критерий – произход. Това позволява да се идентифицират групи същества с общи характеристики, което може да е важно за научни изследвания, образователни програми или специализирани грижи, свързани с техния роден свят.

SELECT creature.value:name
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature
WHERE creature.value:originPlanet = 'Xylar';

-- 🔥Заявка за хабитати по размер
-- Да се изброят имената и типовете на средата (environment types) на хабитати, по-големи от 2000 квадратни метра. Тази задача цели да се идентифицират най-просторните хабитати в зоопарка. Тази информация може да бъде полезна при планиране на разширения, разпределяне на нови видове, оценка на капацитета или за идентифициране на хабитати, подходящи за големи животни.
-- Подсказка: Не забравяйте да преобразувате размера в число за сравнение.

SELECT habitat.value:name, habitat.value:environmentType
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:habitats) AS habitat
WHERE habitat.value:sizeSqMeters > 2000; --работи и без преобразуване

-- 🔥Намиране на същества със специфични способности
-- Да се намерят имената на същества, които притежават специалната способност 'Camouflage' (Камуфлаж). Целта е да се търсят същества въз основа на техните уникални умения. Това може да е важно за образователни демонстрации, изследователски проекти относно адаптациите на видовете или за специфични програми за обогатяване на средата им.
-- Подсказка: Проверете дали масивът specialAbilities съдържа стойността. ARRAY_CONTAINS може да е полезен.

SELECT creature.value:name
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature
WHERE ARRAY_CONTAINS('Camouflage' :: VARIANT, creature.value:specialAbilities);

-- 🔥Проверка на здравния статус на съществата
-- Да се изброят имената и здравният статус (полето status вътре в обекта healthStatus) на всички същества, чийто статус НЕ е 'Excellent' (Отличен). Тази задача е от критично значение за управлението на здравето на животните. Целта е бързо да се идентифицират всички същества, които може да се нуждаят от ветеринарна помощ, специални грижи или наблюдение, като се филтрират тези, които не са в перфектно здраве.

SELECT creature.value:name, creature.value:healthStatus.status
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature
WHERE creature.value:healthStatus.status != 'Excellent';

-- 🔥Разпределения на персонала**
-- Да се намерят имената и ролите на служителите, назначени към хабитат 'H001' (Crystal Caves - Кристалните пещери). Целта е да се получи информация за отговорностите на персонала, конкретно кои служители и с какви длъжности са ангажирани с поддръжката и грижата за определен хабитат. Това е важно за оперативното управление, координацията и при спешни случаи.
-- Подсказка: "Сплеснете" масива на персонала, след което проверете техния масив assignedHabitatIds.

SELECT staff.value:name, staff.value:role
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:staff) AS staff,
LATERAL FLATTEN(input => staff.value:assignedHabitatIds) AS habId
WHERE habId.value = 'H001';

-- 🔥Брой същества по хабитат**
-- Да се преброи колко същества пребивават във всеки habitatId. Да се покажат habitatId и броят. Тази задача предоставя обобщена информация за натовареността или гъстотата на популацията във всеки хабитат. Това е полезно за управление на ресурсите, планиране на пространството и осигуряване на подходящи условия за животните във всеки хабитат.

SELECT creature.value:habitatId, COUNT(*)
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature
GROUP BY creature.value:habitatId;

-- 🔥 Изследване на характеристиките на хабитатите**
-- Да се изброят всички уникални характеристики, налични във всички хабитати. Целта е да се получи пълен списък на разнообразните елементи и характеристики (напр. водни басейни, катерушки, укрития), с които разполагат хабитатите в зоопарка. Това помага за оценка на общото обогатяване на средата, идентифициране на липсващи елементи или планиране на подобрения в хабитатите.
-- Подсказка: Първо ще трябва да "сплеснете" масива habitats, а след това да "сплеснете" масива features във всеки хабитат. Използвайте DISTINCT.

SELECT DISTINCT habitat.value:name, feature.value
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:habitats) AS habitat,
LATERAL FLATTEN(input => habitat.value:features) AS feature;

-- 🔥Детайли за предстоящи събития
-- Да се извлекат името, типът и планираното време (като времеви печат - timestamp) за всички предстоящи събития. Тази задача е насочена към получаване на информация за планираните дейности и събития в зоопарка. Това е важно за информиране на посетителите, координация на персонала и логистично планиране на събитията.

SELECT event.value:name, event.value:type, event.value:scheduledTime::TIMESTAMP
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:upcomingEvents) AS event;

-- 🔥Свързване на същества с типовете среда на хабитатите им
-- Да се изброят името (name) на всяко същество и типът на средата (environmentType) на хабитата, в който живее. Целта е да се създаде връзка между всяко същество и специфичния тип на околната среда на неговия хабитат. Това позволява да се анализира дали животните са настанени в подходящи за техния вид условия, както и за образователни цели, показвайки връзката между видовете и техните естествени или изкуствено създадени среди. Това е по-сложна заявка, която изисква комбиниране на данни от различни части на структурата.
-- Подсказка: Това е най-сложната задача. Нуждаете се от информация както от масива creatures, така и от масива habitats, свързани чрез habitatId. Може да са ви нужни две FLATTEN функции и условие за свързване (join) в контекста на един и същи ред.

SELECT creature.value:name, habitat.value:environmentType
FROM SPARROW_ZOO_DB.PUBLIC.TD_ZOO,
LATERAL FLATTEN(input => zoo_json:creatures) AS creature,
LATERAL FLATTEN(input => zoo_json:habitats) AS habitat
WHERE creature.value:habitatId = habitat.value:id;