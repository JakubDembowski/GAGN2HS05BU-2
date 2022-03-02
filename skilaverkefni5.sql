```sql

-- 5.01:
-- Skrifið function, FjoldiSkylduafanga sem skilar fjölda skylduáfanga á ákveðinni braut. Brautarnúmerið er
-- gefið upp þegar fallið(function) er keyrt.

create database Verkefni5;


delimiter €€
drop function if exists FjoldiSkylduafanga €€

create function FjoldiSkylduafanga(brautar_numer int)
returns int deterministic
begin
	declare fjoldi int;
    
    select count(*) into fjoldi from AfangarBrauta
    where brautarNumer = brautar_numer and erSkylda = true;
    
    return fjoldi;
end €€

delimiter ;

-- TEST:
select FjoldiSkylduafanga(7) as Fjöldi;


-- 5.02:
-- Skrifið function, Meðaleinkunn sem reiknar meðaleinkunn úr áföngum sem ákv. nemandi hefur lokið.
-- Gefa þarf upp númer nemandans(nemandi_id) þegar kalla er á fallið.

delimiter $$
drop function if exists Meðaleinkunn $$

create function Meðaleinkunn(nemandi_id int)
returns float deterministic
begin
	declare m_eink float;
	select avg(einkunn) into m_eink from nemandi where nemandaNumer = nemandi_id;
    
    return m_eink;
end $$
delimiter ;

select Meðaleinkunn(1);


-- 5.03:
-- Skrifið function, FjoldiUndanfara sem telur hve marga undanfara einhver ákveðinn áfangi hefur. Hafi
-- áfangi engan undanfara þá er skilað 0

delimiter $$
drop function if exists FjoldiUndanfara $$

create function FjoldiUndanfara(afanga_numer char(15))
returns int deterministic
begin
	-- Ykkar kóði hér.  Muna return! og muna að testa :-)
end $$
delimiter ;


-- 5.04:
-- Skrifið function, FjoldiBrautarAfanga sem skilar fjölda áfanga á ákveðinni braut.

delimiter $$
drop function if exists FjoldiBrautarAfanga $$

create function FjoldiBrautarAfanga(brautar_numer int)
returns int deterministic
begin
	-- Ykkar kóði hér.  Muna return! og muna að testa :-)
end $$
delimiter ;


-- 5.05:
-- Skrifið function, EndurteknirAfangar sem skilar fjolda skipta sem ákveðinn nemandi hefur tekið
-- ákveðinn áfanga. Hafi nemandinn ekki verið í áfanganum þá skilar fallið 0
delimiter $$
drop function if exists EndurteknirAfangar $$

create function EndurteknirAfangar(numer_nemanda int,numer_afanga char(15))
returns int deterministic
begin
	-- Ykkar kóði hér.  Muna return! og muna að testa :-)
end $$
delimiter ;

-- Hér fyrir neðan eru svo SP sniðmátin:

-- 5.06:
-- Skrifið stored procedure, NyBraut sem skráir nýja námsbraut í gagnagrunninn.
-- ATH: Gefa þarf upp heiti nýju brautarinnar og hvaða skóla hún tilheyrir.Notið last_insert_id() til
-- að fá brautarnúmerið sem auto_increment úthlutaði við að keyra þennan SP.
-- Prófið með eftiþví að skrá námsbrautina 'Tölvuleikjaskólinn' á Upplýsingatækniskólann.
delimiter €€
drop procedure if exists NyBraut €€

create procedure NyBraut(heiti varchar(75), skoli_id int)
begin
	-- Ykkar kóði hér. Muna að nota last_insert_id() sem síðustu línu í kóðanum.  Ekki gleyma testinu!
end €€
delimiter ;


-- 5.07:
-- Skrifið stored procedure, Afangaskraning sem skráir ákv. nemanda í ákv. áfanga. Byrjað er á að kanna
-- hvort nemandinn er skráður í áfangann og sé svo ekki þá heldur skráningin áfram. Sé nemandinn hins
-- vegar skráður(einkunn is null) þá er ekki aðhafst neitt.
-- ATH: Hér má nota last_insert_id() eins og gert var í lið 6
delimiter €€
drop procedure if exists Afangaskraning €€

create procedure Afangaskraning(nemandi_id int, afanga_numer char(15))
begin
	-- Ykkar kóði kemur hér. fyrst að tékka á því hvort nemandinn er skráður í áfangann.
end €€
delimiter ;


-- 5.08:
-- Skrifið stored procedure, NemendaYfirlit sem birtir upplýsingar um nemendur og nám þeirra. Sýnið
-- eftirfarandi upplýsingar: nemandanúmer, nafn nemanda, áfanganúmer, afangaheiti, einkunn og
-- einingafjölda.
delimiter €€
drop procedure if exists NemendaYfirlit €€

create procedure NemendaYfirlit()
begin
	-- ykkar kóði hér.
end €€
delimiter ;


-- 5.09:
/*
	NemendaYfirlit úr lið 8 skilar þeim upplýsingum sem beðið er um en það er smá ónákvæmni sem vert er að skoða.
	Hafi nemandinn fengi undir 5 í einkunn á hann ekki rétt á einingum, alla vega ekki í þessu kerfi :-)
	Einkunnafjöldi fyrir hvern áfanga er hins vegar skráður í töfluna Afangar svo að það þarf að "reikna" út hvort
	viðkomandi nemandi á að fá einingar fyrir áfangann eða ekki. Reglan hér er: einkunn < 5 => einingar = 0.
	Reynið að bæta fyrirspurninaúr lið 8 þannig að þetta birtist í yfirlitinu(með t.d. case when) 
	Kallið endurgerðan SP, NemendaYfirlit_II
*/
delimiter €€
drop procedure if exists NemendaYfirlit_II €€

create procedure NemendaYfirlit_II()
begin
	-- ykkar kóði hérna.  Það má hugsanlega nota case when then til að útfæra þessa viðbót.
end €€
delimiter ;


-- 5.10:
/*
	Skrifið VIEW, AfangaframbodUndirskola.
	Birtið: heiti skóla, heiti undirskóla, heiti brauta, afanganúmer, áfangaheiti, önn áfangans og hvort áfangin er skylda.
	Raðið eftir skólaheiti, undirskólaheiti, brautarheiti.
*/
-- kóðinn fyrir þessa lausn er í glósunum frá í gær(06.10.2021).

```
