-- For YTDB s
DELETE FROM scripted_areatrigger WHERE entry=3626;
INSERT INTO scripted_areatrigger VALUES (3626, 'at_vaelastrasz');

-- -----------------------------------
-- mangosR2 EAI CleanUp for quests/sd2
-- -----------------------------------

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 25316;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26127;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27483;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27600;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 28610;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 28939;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 29199;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 29200;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 29204;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 29206;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 29219;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 32149;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 32257;

-- fixes for upcoming YTDB DB update
UPDATE creature_template SET ScriptName='' WHERE entry IN (35035, 35770, 35771, 35766);
UPDATE creature_template SET ScriptName='' WHERE entry=36549;
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='npc_toc_announcer' WHERE `entry`=34816;  -- needed to be rerun

-- EAI Text clean up for quests/sd2
DELETE FROM `creature_ai_texts` WHERE (`entry`='-1120') OR (`entry`='-1121') OR (`entry`='-1122') OR (`entry`='-1123') OR (`entry`='-1124') OR (`entry`='-1125') OR (`entry`='-1126') OR (`entry`='-1127') OR (`entry`='-1128');
DELETE FROM `creature_ai_texts` WHERE (`entry`='-555') OR (`entry`='-556') OR (`entry`='-557') OR (`entry`='-558') OR (`entry`='-559') OR (`entry`='-560') OR (`entry`='-561') OR (`entry`='-562') OR (`entry`='-563') OR (`entry`='-564') OR (`entry`='-565');
DELETE FROM `creature_ai_texts` WHERE (`entry`='-696') OR (`entry`='-697');
DELETE FROM `creature_ai_texts` WHERE (`entry`='-312491') OR (`entry`='-312492') OR (`entry`='-312493');
-- ---------------
-- Quest 14107 ---
-- ---------------

-- still needs support to grip of scourge server side effect and immue to the spell for quest
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_fallen_hero_spirit' WHERE `entry` = 32149;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_scourge_conventor' WHERE `entry` = 32257;

UPDATE `gameobject_template` SET `castBarCaption` = 'Discarded Soul Crytal' WHERE `entry` = 195344;
DELETE FROM `item_required_target` WHERE `entry` = 47033;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES ('47033', '1', '32149');
UPDATE `creature_template` SET `KillCredit1` = 35055 WHERE `entry` = 32149; -- set fallen proxy
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 35055 WHERE `entry` = 14107;
UPDATE `creature_template` SET `faction_A` = 7, `faction_H` = 7 WHERE `entry` = 32149; -- Fallens arent suppose to attack unless attacked
UPDATE `creature_template` SET `maxmana` = 7786 WHERE `entry` = 32149; -- updated fallen mana to 3.3.5 standard

-- ---------------------
-- Quest::14111---------
-- ---------------------
UPDATE `quest_template` SET `RewSpell` = '0', `RewSpellCast` = '0', `RewItemId1` = '46978', `RewItemCount1` = '1' WHERE `entry` = 14111;

-- ----------------------------------------
-- Quest 12470 ----------------------------
-- ----------------------------------------
UPDATE creature_template SET ScriptName='npc_hourglass', AIName = '' WHERE entry=27840;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27840;
UPDATE `creature_template` SET `unit_flags` = 516, `dynamicflags` = 8 WHERE `entry` = 27840; -- added root, disable movement, passive

-- spawn more sands   (really should be able to use the whole area)
DELETE FROM `gameobject` WHERE `id`=300209;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(42417, 300209, 571, 1, 1, 4105.65, -404.624, 117.868, 5.27991, 0, 0, 0.480862, -0.876796, -300, 0, 1),
(972569, 300209, 571, 1, 1, 4102.71, -444.36, 124.134, 1.774, 0, 0, 0.775178, 0.631742, -300, 0, 1),
(972568, 300209, 571, 1, 1, 4076.75, -441.368, 120.635, 0.995666, 0, 0, 0.477523, 0.878619, -300, 0, 1),
(972567, 300209, 571, 1, 1, 4070.94, -418.43, 120.234, 6.23349, 0, 0, 0.0248472, -0.999691, -300, 0, 1),
(972570, 300209, 571, 1, 1, 4128.17, -436.042, 125.947, 3.17357, 0, 0, 0.999872, -0.0159903, -300, 0, 1),
(972571, 300209, 571, 1, 1, 4145.28, -419.433, 124.344, 3.38956, 0, 0, 0.992324, -0.123666, -300, 0, 1),
(972572, 300209, 571, 1, 1, 4150.45, -390.681, 120.723, 3.66602, 0, 0, 0.965819, -0.259218, -300, 0, 1),
(972573, 300209, 571, 1, 1, 4126.18, -391.728, 119.142, 5.33813, 0, 0, 0.455137, -0.890421, -300, 0, 1);
-- ----------------------------------------
-- Bury Those Cockroaches Quest 11608 -----
-- ----------------------------------------
 
UPDATE creature_template SET ScriptName='npc_seaforium_depth_charge' WHERE entry=25401;

-- ----------------------------------------
-- Quest 11466 fixes and improvements -----
-- ----------------------------------------

DELETE FROM creature_addon WHERE guid = 115895;
INSERT INTO creature_addon (guid,mount,bytes1,b2_0_sheath,b2_1_pvp_state,emote) VALUES
(115895,0,0,0,0,10);

UPDATE creature_template SET ScriptName = 'npc_olga', AIName = '' WHERE entry = 24639;
UPDATE creature_template SET ScriptName = 'npc_jack_adams', AIName = '' WHERE entry = 24788;

-- -------------------------
-- -Quest:: 11656 ----------
-- -------------------------
-- better support

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25510';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2551051');
INSERT INTO `creature_ai_scripts` VALUES ('2551051', '25510', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25510', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25511';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2551151');
INSERT INTO `creature_ai_scripts` VALUES ('2551151', '25511', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25511', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25512';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2551251');
INSERT INTO `creature_ai_scripts` VALUES ('2551251', '25512', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25512', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25513';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2551351');
INSERT INTO `creature_ai_scripts` VALUES ('2551351', '25513', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25513', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

-- -------------------------
-- Quest :: 12644
-- -------------------------

UPDATE gameobject_template SET
ScriptName='go_still_at_it_quest'
WHERE entry IN(190638,190637,190635,190636,190639);

UPDATE creature_template SET
ScriptName='npc_tipsy_mcmanus'
WHERE entry=28566;

DELETE FROM `gameobject` WHERE guid = '200000';
INSERT INTO `gameobject` VALUES ('200000','190643','571','3','1','5545.45','5767.53','-77.8042','5.39307','0','0','0.959937','0.280215','-25','0','1');

DELETE from creature where id=28537;
INSERT into creature VALUES
(2853701,28537,571,1,1,0,0,5550.404,5768.214,-78.02,1.278,300,0,0,0,0,0,0);
UPDATE `creature_template` SET `minhealth` = 0, `maxhealth` = 1 WHERE `entry` = 28537;

DELETE from spell_script_target WHERE entry in(51932,51931,51933);
INSERT into spell_script_target VALUES
(51932,1,28537),
(51931,1,28537),
(51933,1,28537);

UPDATE creature_template SET
flags_extra=flags_extra |128
WHERE entry=28537;

-- -------------------------
-- Quest :: 12645
-- -------------------------

UPDATE item_template SET ScriptName = 'item_jungle_punch_sample' WHERE entry = 38697;
UPDATE creature_template SET ScriptName = 'mob_taste_test' WHERE entry IN (28047,28568,27986);

-- -------------------------
-- quest 11542/11543 
-- -------------------------

UPDATE creature_template SET modelid_1 = 11686, modelid_2 = 11686 WHERE entry = 25090;
UPDATE creature_template SET modelid_1 = 11686, modelid_2 = 11686 WHERE entry = 25091;
UPDATE creature_template SET modelid_1 = 11686, modelid_2 = 11686 WHERE entry = 25092;
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 25090;
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 25091;
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 25092;
UPDATE `creature_template` SET `scale` = 4 WHERE `entry` = 25090;
UPDATE `creature_template` SET `scale` = 4 WHERE `entry` = 25091;
UPDATE `creature_template` SET `scale` = 4 WHERE `entry` = 25092;

DELETE FROM `creature` WHERE `id`=25092;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(100708, 25092, 530, 1, 1, 0, 0, 13272.2, -7144.51, 4.93783, 3.72311, 300, 0, 0, 1, 0, 0, 0),
(4456494, 25092, 530, 1, 1, 0, 0, 13261.8, -7144.76, 29.6207, 3.73767, 25, 0, 0, 1, 0, 0, 0),
(4456493, 25092, 530, 1, 1, 0, 0, 13313.5, -7149.11, 23.029, 0.326681, 25, 0, 0, 1, 0, 0, 0),
(4456491, 25092, 530, 1, 1, 0, 0, 13263.9, -7144.98, 18.0722, 2.95227, 25, 0, 0, 1, 0, 0, 0),
(4456492, 25092, 530, 1, 1, 0, 0, 13271.3, -7146.79, 19.1243, 5.98391, 25, 0, 0, 1, 0, 0, 0),
(4456490, 25092, 530, 1, 1, 0, 0, 13289.9, -7151.84, 20.5758, 2.77005, 25, 0, 0, 1, 0, 0, 0),
(4456489, 25092, 530, 1, 1, 0, 0, 13300.4, -7149.66, 3.98094, 1.67521, 25, 0, 0, 1, 0, 0, 0),
(4456488, 25092, 530, 1, 1, 0, 0, 13305.6, -7147.99, 19.165, 2.99467, 25, 0, 0, 1, 0, 0, 0),
(4456487, 25092, 530, 1, 1, 0, 0, 13331.7, -7150.1, 25.3583, 3.09835, 25, 0, 0, 1, 0, 0, 0),
(4456486, 25092, 530, 1, 1, 0, 0, 13348.8, -7151.36, 29.4228, 3.06536, 25, 0, 0, 1, 0, 0, 0);

DELETE FROM `creature` WHERE `id`=25090;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(100709, 25090, 530, 1, 1, 0, 0, 13200.6, -7048.38, 3.82285, 3.17961, 300, 0, 0, 1, 0, 0, 0),
(4456485, 25090, 530, 1, 1, 0, 0, 13252.6, -7054.9, 22.4681, 3.5688, 25, 0, 0, 1, 0, 0, 0),
(4456484, 25090, 530, 1, 1, 0, 0, 13229.6, -7052.88, 4.3433, 2.60276, 25, 0, 0, 1, 0, 0, 0),
(4456482, 25090, 530, 1, 1, 0, 0, 13213.4, -7053.09, 18.7827, 1.69955, 25, 0, 0, 1, 0, 0, 0),
(4456481, 25090, 530, 1, 1, 0, 0, 13226.3, -7052.35, 17.7073, 2.66795, 25, 0, 0, 1, 0, 0, 0),
(4456480, 25090, 530, 1, 1, 0, 0, 13256.7, -7056.42, 23.4799, 6.09779, 25, 0, 0, 1, 0, 0, 0),
(4456479, 25090, 530, 1, 1, 0, 0, 13241, -7054.83, 19.4747, 3.12191, 25, 0, 0, 1, 0, 0, 0),
(4456478, 25090, 530, 1, 1, 0, 0, 13272, -7058.13, 27.1397, 2.9664, 25, 0, 0, 1, 0, 0, 0);

DELETE FROM `creature` WHERE `id`=25091;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(100710, 25091, 530, 1, 1, 0, 0, 13317.5, -6988.85, 4.13809, 3.11521, 300, 0, 0, 1, 0, 0, 0),
(4456470, 25091, 530, 1, 1, 0, 0, 13328.7, -6993.48, 11.8975, 1.60531, 25, 0, 0, 1, 0, 0, 0),
(4456469, 25091, 530, 1, 1, 0, 0, 13346, -6993.5, 3.21209, 1.40346, 25, 0, 0, 1, 0, 0, 0),
(4456477, 25091, 530, 1, 1, 0, 0, 13323, -6989.96, 18.1137, 5.29668, 25, 0, 0, 1, 0, 0, 0),
(4456476, 25091, 530, 1, 1, 0, 0, 13309.5, -6987.26, 16.2246, 4.39818, 25, 0, 0, 1, 0, 0, 0),
(4456475, 25091, 530, 1, 1, 0, 0, 13354.3, -6990.59, 19.2655, 1.4121, 25, 0, 0, 1, 0, 0, 0),
(4456474, 25091, 530, 1, 1, 0, 0, 13360.6, -6991.35, 20.7843, 6.2588, 25, 0, 0, 1, 0, 0, 0),
(4456473, 25091, 530, 1, 1, 0, 0, 13339.9, -6989.69, 17.719, 6.27843, 25, 0, 0, 1, 0, 0, 0),
(4456472, 25091, 530, 1, 1, 0, 0, 13379.1, -6991.55, 25.1392, 3.19418, 25, 0, 0, 1, 0, 0, 0),
(4456471, 25091, 530, 1, 1, 0, 0, 13328.7, -6993.48, 11.8975, 1.60531, 25, 0, 0, 1, 0, 0, 0);

-- EventAI -- one additional has been made to YTDB acid  a despawn  so quest graphics and effects reset for next player  at the moment its 2 mins to despawn and 30 secs to respawn (credit triggers are invis) quest might take longer then 2 mins 
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25090';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2509051');
INSERT INTO `creature_ai_scripts` VALUES ('2509051', '25090', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25090', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25091';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2509151');
INSERT INTO `creature_ai_scripts` VALUES ('2509151', '25091', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25091', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '25092';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2509251');
INSERT INTO `creature_ai_scripts` VALUES ('2509251', '25092', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25092', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543');

-- -------------------------
-- fix quest toxic_test 9051 -- still not working is kill credit
-- -------------------------
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '6498' WHERE `entry` =9051; -- fixes spell credit
UPDATE `quest_template` SET `ReqCreatureOrGOCount1` = 1 WHERE `entry` = 9051; -- fixes spell credit

DELETE FROM `creature_ai_scripts` WHERE `id` =649802; -- clean up of testing hack to get kill credit

UPDATE `quest_template` SET `ReqSourceId1` = 22432, `ReqSourceCount1` = 1 WHERE `entry` = 9051; -- take item out of player inventory upon completetion

-- ------------------------------
-- Quest : 12078 Worm Wrangler --
-- ------------------------------

DELETE FROM `item_required_target` WHERE `entry` = 36771 AND `type` = 1 AND `targetEntry` = 26359;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES
('36771', '1', '26359');

-- ------------------------------
-- Quest: Drake Hunt (11940/11919)
-- ------------------------------
UPDATE `creature_template` SET ScriptName='npc_nexus_drake', AIName='' WHERE entry = 26127;

-- -------------------------------
-- Quest: Merciful Freedom (11676)
-- -------------------------------
UPDATE gameobject_template SET ScriptName='go_scourge_cage' WHERE entry IN (187854,187855,187856,187857,187858,187859,187860,187862,187863,187864,187865,187866,187867,187868,187870,187871,187872,187873,187874,187861,190803);

-- ------------------------
-- Quest: Abduction (11590)
-- ------------------------

UPDATE `creature_template` SET
minhealth=6387,
maxhealth=7185,
minlevel=64,
maxlevel=70,
minmana=7031,
maxmana=7196
WHERE entry=25474;

UPDATE `creature_template` SET
`ScriptName`='npc_beryl_sorcerer' , AIName=''
WHERE entry=25316;

-- ---------------------------------------------------
-- Mob support for Quest: Powering Our Defenses (8490)
-- ---------------------------------------------------
-- Enraged Wraith
DELETE FROM `creature` WHERE id = 17086;
UPDATE `creature_template` SET AIName='EventAI', flags_extra=flags_extra|64 WHERE entry=17086;

DELETE FROM `creature_ai_scripts` WHERE creature_id = 17086;
INSERT INTO `creature_ai_scripts` VALUES
(1708601,17086,2,0,100,0,25,0,0,0,11,8599,0,1,1,-106,0,0,0,0,0,0,'Enraged Wraith - Cast Enrage on 50% HP');

-- ---------------
-- Gamel the Cruel
-- ---------------
UPDATE creature SET spawntimesecs = 30 WHERE id = 26449;

UPDATE creature_template SET AIName = 'EventAI', dmg_multiplier = 2 WHERE entry = 26449;
DELETE FROM creature_ai_scripts WHERE creature_id = 26449;
INSERT INTO creature_ai_scripts VALUES
(2644901, 26449, 0,0,80,1, 2000,2000,5000,5000, 11,19643,1,0, 0,0,0,0, 0,0,0,0,'Gamel the Cruel - mortal strike');

-- ---------------------------
-- fix quest _abduction 11590
-- ---------------------------
-- item (Arcane Binder)
DELETE FROM item_required_target WHERE entry = 34691;
INSERT INTO item_required_target VALUES
(34691,1,25316);


-- --------------------------------------------------
-- fixes for Quest Kickin'Nass and Takin manes (12630)
-- --------------------------------------------------
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 28523;
DELETE FROM creature WHERE id=28523;  -- deletes  nass kc bunny credit needs to be summoned not already spawn

-- -----------------------------
-- Quest Fixes to Hard_to_sallow
-- -----------------------------
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '26293';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2629302');
INSERT INTO `creature_ai_scripts` VALUES ('2629302', '26293', '2', '0', '100', '0', '70', '50', '0', '0', '1', '-262930', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Hulking Jormungar - emote between 70% and 50% ');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '26293';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2629301');
INSERT INTO `creature_ai_scripts` VALUES ('2629301', '26293', '9', '0', '100', '1', '0', '30', '14000', '17000', '11', '50293', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Hulking Jormungar - Cast Corrosive Poison');

DELETE FROM `creature_ai_texts` WHERE entry IN ('-262930');
INSERT INTO `creature_ai_texts` VALUES ('-262930', 'The Hulking Jormungar falters for a moment, opening its mouth wide.', '', '', '', '', '', '', '', '', '3', '0', '0', '0', 'Hulking Jormungar-raid emote');

-- ------------------------------------------
-- Support for quest The Denouncement (12273)
-- ------------------------------------------

-- Remove creature
DELETE FROM creature WHERE guid=105029 AND id=27237;

-- Rod of Compulsion Item (37438)

DELETE FROM item_required_target WHERE entry=37438;
INSERT INTO item_required_target VALUES
(37438,1,27237),
(37438,1,27235),
(37438,1,27234),
(37438,1,27236);

-- Rod of Compulsion Spell (48712)

-- Texts
DELETE FROM creature_ai_texts WHERE entry IN (-272371,-272351,-272341,-272361);
INSERT INTO creature_ai_texts VALUES
(-272371,'High general Abbendis personally told me that it was a mistake to come north and that we\'re doomed! I urge you all to lay down your weapons and leave before it\'s too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Commander Jordan yell'),
(-272351,'Renounce the Scarlet Onslaught! Don\'t listen to the lies of the high general and the grand admiral any longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Lead Cannoneer Zierhut yell'),
(-272341,'You are being misled! The Onslaught is all lies! The Scourge and the Forsaken are not our enemies! Wake up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Blacksmith Goodman yell'),
(-272361,'Abbendis is nothing but a harlot and Grand Admiral Westwind is selling her cheap like he sold us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Stable Master Mercer yell');

-- ACID
DELETE FROM creature_ai_scripts WHERE id IN (2723701,2723702,2723703,2723704,2723705,2723501,2723502,2723503,2723504,2723401,2723402,2723403,2723404,2723405,2723601,2723602,2723603,2723604);
INSERT INTO creature_ai_scripts VALUES

-- Commander Jordan (27237)

-- yell
(2723701,27237,4,0,100,6,0,0,0,0,1,-272371,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Yell on Aggro'),
-- Avenging Wrath (50837)
(2723702,27237,0,0,100,1,1000,3000,25000,30000,11,50837,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Cast Avenging Wrath'),
-- Consecration (32773)
(2723703,27237,9,0,100,1,0,10,18000,23000,11,32773,0,1,0,0,0,0,0,0,0,0,'Commander Jordan - Cast Consecration'),
-- Kill credit (48723/48724)
(2723704,27237,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Set Phase 2 after spell hit'),
(2723705,27237,6,1,100,0,0,0,0,0,33,27426,6,3,0,0,0,0,0,0,0,0,'Commander Jordan - Kill Credit on Death (Phase 2)'),


-- Lead Cannoneer Zierhut (27235)

-- yell
(2723501,27235,4,0,100,6,0,0,0,0,1,-272351,0,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Yell on Aggro'),
-- Torch Toss (50832)
(2723502,27235,0,0,100,1,3000,7000,12000,15000,11,50832,4,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Cast Torch Toss'),
-- Kill Credit (48725/48726)
(2723503,27235,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Set Phase 2 after spell hit'),
(2723504,27235,6,1,100,0,0,0,0,0,33,27427,6,3,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Kill Credit on Death (Phase 2)'),

-- Blacksmith Goodman (27234)

-- yell
(2723401,27234,4,0,100,6,0,0,0,0,1,-272341,0,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Yell on Aggro'),
-- Crush Armor (33661)
(2723402,27234,0,0,100,1,2000,5000,5000,7000,11,33661,1,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Cast Crush Armor'),
-- Skull Crack (15621)
(2723403,27234,0,0,100,1,6000,9000,10000,14000,11,15621,1,1,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Cast Skull Crack'),
-- Kill credit (48727/48728)
(2723404,27234,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Set Phase 2 after spell hit'),
(2723405,27234,6,1,100,0,0,0,0,0,33,27428,6,3,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Kill Credit on Death (Phase 2)'),

-- Stable Master Mercer (27236)

-- yell
(2723601,27236,4,0,100,6,0,0,0,0,1,-272361,0,0,0,0,0,0,0,0,0,0,'Stable Master Mercer - Yell on Aggro'),
-- Summon Warhorse (50829)
(2723602,27236,4,0,100,0,0,0,0,0,11,50829,0,1,12,28187,6,0,0,0,0,0,'Stable Master Mercer - Summon Warhorse on Aggro'),
-- Kill credit (48729/48730)
(2723603,27236,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Stable Master Mercer - Set Phase 2 after spell hit'),
(2723604,27236,6,1,100,0,0,0,0,0,33,27429,6,3,0,0,0,0,0,0,0,0,'Stable Master Mercer - Kill Credit on Death (Phase 2)');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27236;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27234;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27235;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27237;

-- ----------------------------------------------
-- Support for quest Defiling Uther's Tomb (9444)
-- ----------------------------------------------
DELETE FROM creature_ai_scripts WHERE creature_id=27002;
INSERT INTO creature_ai_scripts VALUES
(2700201,27002,11,0,100,0,0,0,0,0,1,-270021,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Spawn'),
(2700202,27002,9,0,100,1,5,45,19000,25000,11,52167,1,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Magnataur Charge'),
(2700203,27002,0,0,100,1,7000,14000,12000,16000,11,52166,0,1,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Thunder'),
(2700204,27002,6,0,100,0,0,0,0,0,1,-270022,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Death');

DELETE FROM creature_ai_texts WHERE entry IN (-270021,-270022);
INSERT INTO creature_ai_texts (entry, content_default, type, comment) VALUES
(-270021,'I\'ll consume your flesh and pick my teeth with your bones!',1,'Grom\'thar the Thunderbringer yell1'),
(-270022,'You\'re no magnataur! Where... did you... find... such strength?',1,'Grom\'thar the Thunderbringer yell2');

-- --------------------------------------------------------
-- aldaron the reckless loc fix Blood elf starting area fix
-- --------------------------------------------------------
DELETE FROM `creature` WHERE `id`=16294;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(67521, 16294, 530, 1, 1, 0, 0, 8747.7, -6116.85, 68.5645, 5.28401, 300, 0, 0, 148, 825, 0, 0);

-- -------------------------------------------------
-- Support for quest A Necessary Distraction (10637)
-- -------------------------------------------------

-- Azaloth (21506)
-- UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 21506;
-- UPDATE `creature_template` SET `modelid_2` = 17287 WHERE `entry` = 21506; -- this isnt correct display yet

-- DELETE FROM creature_ai_scripts WHERE creature_id=21506;
-- INSERT INTO creature_ai_scripts VALUES
-- (2150601,21506,8,0,100,1,37834,-1,0,0,1,-21506,0,0,21,6,0,0,16,21892,37834,6,'Azaloth  - Yell and Start Combat Movements'),
-- (2150602,21506,3,0,100,0,0,0,0,0,0,28,0,37833,0,0,0,0,0,0,0,0,'Azaloth  - Yell and Start Combat Movements'),
-- (2150603,21506,0,0,100,1,4000,4000,8000,8000,11,40504,1,0,0,0,0,0,0,0,0,0,'Azaloth - Cast Cleave'),
-- (2150604,21506,0,0,100,1,3000,3000,17000,17000,11,11443,1,1,0,0,0,0,0,0,0,0,'Azaloth Cast Cripple'),
-- (2150605,21506,0,0,100,1,10000,12000,33000,33000,11,38741,4,3,0,0,0,0,0,0,0,0,'Azaloth - Cast Rain of Fire'),
-- (2150606,21506,0,0,100,1,6000,6000,14000,14000,11,38750,1,3,0,0,0,0,0,0,0,0,'Azaloth - Cast War Stomp');

-- DELETE FROM creature_ai_texts WHERE entry=-21506;
-- INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
-- (-21506,'Illidan\s lapdogs! You will pay for my imprisonment with your lives!',1,'Azaloth yell1');

-- not finished with this
