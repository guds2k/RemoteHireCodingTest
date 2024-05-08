create table if not exists public.producers (
    id  uuid DEFAULT random_uuid() not null constraint "producersPK" primary key,
    name varchar(255),
    created_at timestamp not null
);

create table if not exists public.marketplaces (
    id varchar(255) not null constraint "marketplacesPK" primary key,
    description varchar(255)
);

create table if not exists public.seller_infos (
    id uuid DEFAULT random_uuid() not null constraint "seller_infosPK" primary key,
    marketplace_id varchar(255) constraint "FKr8ekbqgwa3g0uhgbaa1tchf09" references public.marketplaces,
    name                  varchar(2048) not null,
    url                   varchar(2048),
    country               varchar(255),
    external_id           varchar(255),
    constraint "UK12xaxk0c1mwxr3ovycs1qxtbk" unique (marketplace_id, external_id)
);

create table if not exists public.sellers (
    id uuid DEFAULT random_uuid() not null constraint "marketplace_sellersPK" primary key,
    producer_id uuid not null constraint "FK6y70nxr3lhubusfq6ub427ien" references public.producers,
    seller_info_id uuid constraint "FKp2fkfcqcndx9x9xkhk5va3cq4" references public.seller_infos,
    state varchar(255) default 'REGULAR'::character varying not null
);

INSERT INTO marketplaces(id, description) values('amazon', 'Amazon');
INSERT INTO marketplaces(id, description) values('ebay', 'eBay');
INSERT INTO marketplaces(id, description) values('etsy', 'Etsy');
INSERT INTO marketplaces(id, description) values('aliexpress', 'AliExpress');
INSERT INTO marketplaces(id, description) values('walmart', 'Walmart');
INSERT INTO marketplaces(id, description) values('rakuten', 'Rakuten');
INSERT INTO marketplaces(id, description) values('bonanza', 'Bonanza');
INSERT INTO marketplaces(id, description) values('facebook', 'Facebook');
INSERT INTO marketplaces(id, description) values('mercadolibre', 'Mercado Libre');
INSERT INTO marketplaces(id, description) values('poshmark', 'Poshmark');
INSERT INTO marketplaces(id, description) values('taobao', 'Taobao');
INSERT INTO marketplaces(id, description) values('flipkart', 'Flipkart');
INSERT INTO marketplaces(id, description) values('craigslist', 'Craigslist');
INSERT INTO marketplaces(id, description) values('shopee', 'Shopee');
INSERT INTO marketplaces(id, description) values('allegro', 'Allegro');
INSERT INTO marketplaces(id, description) values('shopify', 'Shopify');

INSERT INTO Producers(ID, name, created_at) values('3dcd0b3a-bdb7-4a66-b3b7-cc7286c8cf22','Adidas',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('c0d4d4e2-a317-4531-8f24-f98bf010f90e','Relaxo',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('6f128708-b90c-478c-911c-ab20f353aa07','Nike',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('46b33a28-d21c-4ecd-a2d8-1bc8a10bb5b9','Paragon',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('555f0997-b0ad-4bc1-924a-3543346ff315','Skechers',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('dccbff6d-e875-4d02-b407-370888ed8945','Lancer',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('405edf69-29ee-41c7-afbb-b972037808e5','Liberty',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('0c17634e-862c-4f56-86fa-79fcf024c9c2','Red Tape',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('eaccd1a6-c276-4bc6-bea3-cdddf8b3062c','VKC',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('4130b409-69f6-42e3-8be0-dbd960fed837','Carbon Footwear',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('21984379-3738-4439-a6e1-2df0546a17f8','Khadim',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('55749f7f-8fc1-457d-8a2a-ceff81f5179d','Puma',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('927fcce3-70c3-4edf-9206-320fbb61c390','Reebok',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('360755f2-585b-4818-bc13-8154f8d4a3a6','Under Armour Inc',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('40a762b1-2444-4c95-a824-1e1eeb0c6981','Hitz',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('520372d4-7955-4779-999b-f0ed6e3bc51a','Leiner shoes PRIVATE LIMITED',CURRENT_TIMESTAMP);
INSERT INTO Producers(ID, name, created_at) values('d41b21d6-414d-4fe3-8023-09340a53abd4','New Balance',CURRENT_TIMESTAMP);

INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('cc6a7635-4cef-40ad-967d-9ebac1af7099','amazon','NAME-1246164158','https:\\amazon.us','US','EXTERNALID1254765169');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('27e8ffaf-8b66-4d8e-aa3e-5861a894ca9c','ebay','NAME1201363955','https:\\ebay.us','US','EXTERNALID-2034334712');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('07bb5940-6c8a-40cf-8c88-084cef254390','etsy','NAME-1016188163','https:\\etsy.us','US','EXTERNALID-1582141124');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('4210c4da-1c43-4b0a-a6bc-96b8eeaef33b','aliexpress','NAME2137650867','https:\\aliexpress.us','US','EXTERNALID204607152');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('954c081d-6470-4fba-ab38-88dc342a838d','walmart','NAME436858149','https:\\walmart.us','US','EXTERNALID1126176040');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('5d557660-0866-4166-9267-70eaa6d22752','rakuten','NAME1438414808','https:\\rakuten.us','US','EXTERNALID1605471244');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('2fd5428d-0903-43a6-8aec-b29a70180e45','bonanza','NAME1489042610','https:\\bonanza.us','US','EXTERNALID-678932382');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('84625f77-2c7b-447a-b88a-a9f475abd1d7','facebook','NAME-336728285','https:\\facebook.us','US','EXTERNALID2107140985');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('b5f86c7b-ef6f-4699-9c4f-887f7bc75776','mercadolibre','NAME-1163285013','https:\\mercadolibre.us','US','EXTERNALID-736143998');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('3285a0f8-a0a7-4ee4-a87b-c41f5d2aa757','poshmark','NAME-928077276','https:\\poshmark.us','US','EXTERNALID-1898570723');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('29f27a3f-ac8c-4a81-af81-150a2f82affb','taobao','NAME1428300825','https:\\taobao.us','US','EXTERNALID-1983185997');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('7a893f81-0c27-43bc-b4dd-d4fcee451f30','flipkart','NAME-1733753736','https:\\flipkart.us','US','EXTERNALID2132197060');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('1d9002ef-3267-4a85-9e2b-b7dc91d549f8','craigslist','NAME1645231534','https:\\craigslist.us','US','EXTERNALID-1592448680');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('3635a7b1-ef74-4184-badd-db770c54c6e7','shopee','NAME-283051231','https:\\shopee.us','US','EXTERNALID1469545825');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('7cf75950-7912-49c9-8975-5b2973c9aed2','allegro','NAME2069644193','https:\\allegro.us','US','EXTERNALID-1735124443');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('5aad22f8-063f-4beb-a066-0eaf4e43320b','shopify','NAME-2131222283','https:\\shopify.us','US','EXTERNALID2004267408');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('7ca31f75-8f99-453c-922c-467a3ab77431','amazon','NAME-1523346060','https:\\amazon.eu','EUROPE','EXTERNALID-1446579980');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('fbab29ee-b4ad-4ee2-bfdb-81d2c2f209c0','ebay','NAME-2027894774','https:\\ebay.eu','EUROPE','EXTERNALID-1600866214');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('a8380118-0cb8-460b-8ceb-5fa3b6e2706f','etsy','NAME-1301545554','https:\\etsy.eu','EUROPE','EXTERNALID-1148402185');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('a66b73c6-cbaf-4c7f-9390-a873e8912f0b','aliexpress','NAME-1777846517','https:\\aliexpress.eu','EUROPE','EXTERNALID-1316306567');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('2d0848da-e28e-4fe8-9520-577f96ef4ab8','walmart','NAME1250849561','https:\\walmart.eu','EUROPE','EXTERNALID948473629');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('a5faf948-6025-4b31-98a0-7d53b362917c','rakuten','NAME1309736454','https:\\rakuten.eu','EUROPE','EXTERNALID573822986');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('ee2536f2-7ccc-43af-9f27-b93af244acae','bonanza','NAME-434231328','https:\\bonanza.eu','EUROPE','EXTERNALID-520542262');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('15b2fbec-88e4-4be0-bcd7-9e2330149cda','facebook','NAME-1328231656','https:\\facebook.eu','EUROPE','EXTERNALID-701893163');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('18fc199d-3cac-408f-9f37-5533186bd199','mercadolibre','NAME2067365160','https:\\mercadolibre.eu','EUROPE','EXTERNALID-1166242153');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('826eecfb-5f74-4eb0-bce6-920e259a450d','poshmark','NAME626612289','https:\\poshmark.eu','EUROPE','EXTERNALID1269521530');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('99ef2fba-fa7b-4696-8d36-39103c3cc4b7','taobao','NAME-1332615876','https:\\taobao.eu','EUROPE','EXTERNALID1040855434');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('678a40bd-b544-41d7-bcde-9b908066818f','flipkart','NAME1738911912','https:\\flipkart.eu','EUROPE','EXTERNALID106014505');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('ef3eb3b6-cf72-47e7-95ed-d75608135e3a','craigslist','NAME421459096','https:\\craigslist.eu','EUROPE','EXTERNALID-47574654');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('08e324af-b568-4355-82bd-3d252ec99721','shopee','NAME-1979538459','https:\\shopee.eu','EUROPE','EXTERNALID-974045822');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('f1764076-073b-4f5d-97bf-80c665555439','allegro','NAME1886101834','https:\\allegro.eu','EUROPE','EXTERNALID-1423120517');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('4af94a61-9879-4d90-b9dd-57dbc4135ec0','shopify','NAME1710610860','https:\\shopify.eu','EUROPE','EXTERNALID1941173215');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('d22448ac-433d-456e-a688-082bd58cc12f','amazon','NAME-602882501','https:\\amazon.ca','CANADA','EXTERNALID2056867330');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('065c5f4e-b46b-46c7-9801-04ae85d26abb','ebay','NAME485595500','https:\\ebay.ca','CANADA','EXTERNALID-1304761156');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('7f3ce060-4f5f-4857-aa3d-b5e41f49d188','etsy','NAME1731785397','https:\\etsy.ca','CANADA','EXTERNALID-850050658');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('52c7084a-34fb-41bc-95c3-4c0e5f20af7b','aliexpress','NAME740897472','https:\\aliexpress.ca','CANADA','EXTERNALID1656116002');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('38cb8c17-5c4e-4f9b-84d6-5d66c6c181c4','walmart','NAME-1907974941','https:\\walmart.ca','CANADA','EXTERNALID1025741021');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('f0dabd0c-fb02-47d0-a0f1-fdaeadf59716','rakuten','NAME1440684864','https:\\rakuten.ca','CANADA','EXTERNALID-2100715883');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('a11eba32-4c6d-4472-a93b-9fd69b694e8f','bonanza','NAME-1513928728','https:\\bonanza.ca','CANADA','EXTERNALID-634588111');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('e499ed9b-e32c-42dc-a570-2dbdba299f39','facebook','NAME865795535','https:\\facebook.ca','CANADA','EXTERNALID1260196838');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('6de1b733-982f-4259-b3dc-79ac9a88eb2a','mercadolibre','NAME1173437336','https:\\mercadolibre.ca','CANADA','EXTERNALID1076996585');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('e33d0e0d-d100-40b3-9705-d15c19de7fc8','poshmark','NAME657551620','https:\\poshmark.ca','CANADA','EXTERNALID1796090731');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('c3647adb-e2cd-48a0-a884-877e98b67206','taobao','NAME-800204347','https:\\taobao.ca','CANADA','EXTERNALID-1167541744');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('1033c247-f39d-469d-a3df-2fe2accd2c7e','flipkart','NAME-1170854481','https:\\flipkart.ca','CANADA','EXTERNALID1504915074');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('9669a7bd-f23a-4fe2-8959-4f6424bf2eae','craigslist','NAME327578531','https:\\craigslist.ca','CANADA','EXTERNALID211265391');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('60485260-031b-4a21-845b-65c43520376d','shopee','NAME-496907617','https:\\shopee.ca','CANADA','EXTERNALID1755576430');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('6b454a35-f169-4900-bbf4-41ac2c828c21','allegro','NAME335246530','https:\\allegro.ca','CANADA','EXTERNALID-1850866226');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('c77d1e58-fdbe-4ed0-8900-17b03fed5f3c','shopify','NAME-405553290','https:\\shopify.ca','CANADA','EXTERNALID646011779');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('fc25a6d1-beb8-4019-a5c3-acf173008c5d','amazon','NAME-1205091386','https:\\amazon.in','INDIA','EXTERNALID912992948');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('b2bf1102-6bcb-4bf3-bad4-01a892fa8244','ebay','NAME-817920341','https:\\ebay.in','INDIA','EXTERNALID547493994');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('d1ba8ca5-5653-4474-8cbb-1b61e9b1267b','etsy','NAME-1576867513','https:\\etsy.in','INDIA','EXTERNALID-699777863');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('c4b17123-7a6f-4d97-9bf1-1bc3660a9d45','aliexpress','NAME795950524','https:\\aliexpress.in','INDIA','EXTERNALID308017857');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('6bcdd29a-b952-49c7-94c3-1f5ed9690846','walmart','NAME1664188519','https:\\walmart.in','INDIA','EXTERNALID-1312151784');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('c3be1ca6-503a-4bd7-a0dc-1c98932a1a23','rakuten','NAME-18439064','https:\\rakuten.in','INDIA','EXTERNALID1012675050');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('8353a2f5-4070-41f9-b5b1-9b651a7fc2ce','bonanza','NAME1775288539','https:\\bonanza.in','INDIA','EXTERNALID1401718682');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('cd039654-af3e-441d-a8ba-f9076b448c54','facebook','NAME1269390312','https:\\facebook.in','INDIA','EXTERNALID-565406582');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('8c860fc3-abb1-40e8-8376-aa4dddfc7511','mercadolibre','NAME1136303227','https:\\mercadolibre.in','INDIA','EXTERNALID1700658287');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('46421ed7-e770-4586-8ed3-0c5ee7b23b58','poshmark','NAME-791342006','https:\\poshmark.in','INDIA','EXTERNALID-1617473818');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('64c9c21c-6375-413d-bf0b-de4cbf0da67f','taobao','NAME676605528','https:\\taobao.in','INDIA','EXTERNALID1905074262');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('ab6d7425-0bdb-4d51-87ec-9f35dd74bc5d','flipkart','NAME-1599106176','https:\\flipkart.in','INDIA','EXTERNALID-1556786756');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('68cc659f-8099-4b9f-b066-b182ce03cc99','craigslist','NAME-291092680','https:\\craigslist.in','INDIA','EXTERNALID1424297499');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('babacaa2-58d0-4a43-a379-74ae0f5e784b','shopee','NAME760972650','https:\\shopee.in','INDIA','EXTERNALID-723744291');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('85c69982-d9db-480d-9cab-7df625a2ac56','allegro','NAME357159381','https:\\allegro.in','INDIA','EXTERNALID1551533674');
INSERT INTO seller_infos(ID, marketplace_id,NAME,URL,COUNTRY,EXTERNAL_ID)  values('f29185e6-bd98-47d6-874b-ea66bcc57753','shopify','NAME1943176552','https:\\shopify.in','INDIA','EXTERNALID-819024506');

INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('649c62b1-8989-437d-a0e9-e77368603eaa','3dcd0b3a-bdb7-4a66-b3b7-cc7286c8cf22','cc6a7635-4cef-40ad-967d-9ebac1af7099','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('473905a0-70dd-4bbe-9b0c-af6bc865ccbe','c0d4d4e2-a317-4531-8f24-f98bf010f90e','27e8ffaf-8b66-4d8e-aa3e-5861a894ca9c','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('6f5b0cd3-f086-4c2f-94e6-a7590e7746c4','6f128708-b90c-478c-911c-ab20f353aa07','07bb5940-6c8a-40cf-8c88-084cef254390','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('467ed061-8a33-4add-a372-301a1cd30263','46b33a28-d21c-4ecd-a2d8-1bc8a10bb5b9','4210c4da-1c43-4b0a-a6bc-96b8eeaef33b','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('ddd7ddb2-b674-41ed-904f-2cab43aa2e66','555f0997-b0ad-4bc1-924a-3543346ff315','954c081d-6470-4fba-ab38-88dc342a838d','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('5ed92911-ba8c-4982-92ea-3b1bd152df33','dccbff6d-e875-4d02-b407-370888ed8945','5d557660-0866-4166-9267-70eaa6d22752','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('c59631ee-0b25-42a0-a428-2102fdc3177e','405edf69-29ee-41c7-afbb-b972037808e5','2fd5428d-0903-43a6-8aec-b29a70180e45','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('dfbcab39-3cdd-41d9-a6ce-3101c7017f28','0c17634e-862c-4f56-86fa-79fcf024c9c2','84625f77-2c7b-447a-b88a-a9f475abd1d7','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('1a3274fd-36c2-471d-85c4-b9ebd924927b','eaccd1a6-c276-4bc6-bea3-cdddf8b3062c','b5f86c7b-ef6f-4699-9c4f-887f7bc75776','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('b7d151a2-ee70-4d29-acde-ee40895ac5c6','4130b409-69f6-42e3-8be0-dbd960fed837','3285a0f8-a0a7-4ee4-a87b-c41f5d2aa757','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('24d0be27-c410-4703-ad93-68c970d8340f','21984379-3738-4439-a6e1-2df0546a17f8','29f27a3f-ac8c-4a81-af81-150a2f82affb','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('7226bd36-a5df-41bf-8a90-329d5742e2aa','55749f7f-8fc1-457d-8a2a-ceff81f5179d','7a893f81-0c27-43bc-b4dd-d4fcee451f30','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('e80efeb7-0fa0-4117-bc2d-021431c199fd','927fcce3-70c3-4edf-9206-320fbb61c390','1d9002ef-3267-4a85-9e2b-b7dc91d549f8','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('daefab4a-1e53-48ab-92e2-8dd807c761a6','360755f2-585b-4818-bc13-8154f8d4a3a6','3635a7b1-ef74-4184-badd-db770c54c6e7','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('748737ce-44d3-4f03-826f-7ea1bbd5596b','40a762b1-2444-4c95-a824-1e1eeb0c6981','7cf75950-7912-49c9-8975-5b2973c9aed2','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('2c97b00f-cd7d-44bd-9092-1a76f3457bd4','520372d4-7955-4779-999b-f0ed6e3bc51a','5aad22f8-063f-4beb-a066-0eaf4e43320b','GENERAL');
INSERT INTO SELLERS(ID, PRODUCER_ID,SELLER_INFO_ID,STATE) VALUES ('71a812bc-6f67-456f-a82e-f2d70f90e1c2','d41b21d6-414d-4fe3-8023-09340a53abd4','7ca31f75-8f99-453c-922c-467a3ab77431','GENERAL');
