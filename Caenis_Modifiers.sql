INSERT INTO Types
        (Type,                              Kind)
VALUES  ('CAENIS_UNIT_MAINTENANCE',         'KIND_MODIFIER'),
        ('CAENIS_UNIT_STRENGTH',            'KIND_MODIFIER'),
        ('CAENIS_TRADER_PLUNDER',           'KIND_MODIFIER'),
        ('CAENIS_TRADE_GOLD',               'KIND_MODIFIER'),
        ('CAENIS_TRADE_CULTURE',            'KIND_MODIFIER'),
        ('CAENIS_GARRISON_LOYALTY',         'KIND_MODIFIER'),
        ('CAENIS_OCEAN',                    'KIND_MODIFIER'),
        ('CAENIS_FREE_SAILING',             'KIND_MODIFIER'),
        ('CAENIS_FREE_SHIPBUILDING',        'KIND_MODIFIER'),
        ('OLYMPUS_MOUNTAINS_BONUS_CULTURE', 'KIND_MODIFIER'),
        ('OLYMPUS_MOUNTAINS_BONUS_FAITH',   'KIND_MODIFIER'),
        ('OLYMPUS_COAST_FOOD',              'KIND_MODIFIER'),
        ('OLYMPUS_COAST_GOLD',              'KIND_MODIFIER'),
        ('OLYMPUS_TOURISM',                 'KIND_MODIFIER');

--------------------------
-- Leader Trait
--------------------------
INSERT INTO TraitModifiers
        (TraitType,                              ModifierID)
VALUES  ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_UNIT_MAINTENANCE'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_UNIT_STRENGTH'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_TRADER_PLUNDER'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_TRADE_GOLD'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_TRADE_CULTURE'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_GARRISON_LOYALTY'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_OCEAN'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_FREE_SAILING'),
        ('TRAIT_LEADER_CAENIS_SEA_GODS_ESSENCE', 'CAENIS_FREE_SHIPBUILDING');

--------------------------
-- Modifiers
--------------------------
INSERT INTO Modifiers
        (ModifierID,                 ModifierType)
VALUES  ('CAENIS_UNIT_MAINTENANCE',  'MODIFIER_PLAYER_ADJUST_UNIT_MAINTENANCE_DISCOUNT'),
        ('CAENIS_TRADE_GOLD',        'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD'),
        ('CAENIS_TRADE_CULTURE',     'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD'),
        ('CAENIS_OCEAN',             'MODIFIER_PLAYER_UNITS_ADJUST_VALID_TERRAIN'),
        ('CAENIS_FREE_SAILING',      'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY'),
        ('CAENIS_FREE_SHIPBUILDING', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST');

INSERT INTO Modifiers
        (ModifierId,              ModifierType,                                   OwnerRequirementSetId)
VALUES  ('CAENIS_UNIT_STRENGTH',  'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'NAVY_REQ'),
        ('CAENIS_TRADER_PLUNDER', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',          'UNIT_IS_TRADER');

INSERT INTO Modifiers
        (ModifierId,                ModifierType,                                      SubjectRequirementSetId)
VALUES  ('CAENIS_GARRISON_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'CITY_HAS_GARRISON_UNIT_REQUIERMENT');

--------------------------
-- Modifier Arguments
--------------------------
INSERT INTO ModifierArguments
        (ModifierID,                Name,          Value)
VALUES  ('CAENIS_UNIT_MAINTENANCE', 'Amount',      2),
        ('CAENIS_UNIT_STRENGTH',    'Amount',      5),
        ('CAENIS_TRADER_PLUNDER',   'AbilityType', 'ABILITY_TRADE_ROUTE_PLUNDER_IMMUNITY_SEA'),
        ('CAENIS_TRADE_GOLD',       'YieldType',   'YIELD_GOLD'),
        ('CAENIS_TRADE_GOLD',       'Amount',      2),
        ('CAENIS_TRADE_CULTURE',    'YieldType',   'YIELD_CULTURE'),
        ('CAENIS_TRADE_CULTURE',    'Amount',      1),
        ('CAENIS_OCEAN',            'TerrainType', 'TERRAIN_OCEAN'),
        ('CAENIS_OCEAN',            'Valid',       1);

INSERT INTO ModifierArguments
        (ModifierId,            Name,      Value)
VALUES  ('CAENIS_FREE_SAILING', 'TechType', 'TECH_SAILING');

INSERT INTO ModifierArguments
        (ModifierId,                 Name,       Value)
VALUES  ('CAENIS_FREE_SHIPBUILDING', 'TechType', 'TECH_SHIPBUILDING');


INSERT INTO Requirements
        (RequirementId, RequirementType)
VALUES  ('NAVY1',       'REQUIREMENT_UNIT_TAG_MATCHES'),
        ('NAVY2',       'REQUIREMENT_UNIT_TAG_MATCHES'),
        ('NAVY3',       'REQUIREMENT_UNIT_TAG_MATCHES'),
        ('NAVY4',       'REQUIREMENT_UNIT_TAG_MATCHES');

INSERT INTO RequirementArguments
        (RequirementId, Name,   Value)
VALUES  ('NAVY1',       'Tag', 'CLASS_NAVAL_MELEE'),
        ('NAVY2',       'Tag', 'CLASS_NAVAL_RANGED'),
        ('NAVY3',       'Tag', 'CLASS_NAVAL_RAIDER'),
        ('NAVY4',       'Tag', 'CLASS_NAVAL_CARRIER');

INSERT INTO RequirementSets
        (RequirementSetId, RequirementSetType)
VALUES  ('NAVY_REQ',       'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements 
        (RequirementSetId, RequirementId)
VALUES  ('NAVY_REQ',       'NAVY1'),
        ('NAVY_REQ',       'NAVY2'),
        ('NAVY_REQ',       'NAVY3'),
        ('NAVY_REQ',       'NAVY4');

--------------------------
-- Civilization Trait
------------------------
INSERT INTO TraitModifiers
        (TraitType,                              ModifierId)
VALUES  ('TRAIT_CIVILIZATION_OLYMPUS_AFFECTION', 'OLYMPUS_MOUNTAINS_BONUS_CULTURE'),
        ('TRAIT_CIVILIZATION_OLYMPUS_AFFECTION', 'OLYMPUS_MOUNTAINS_BONUS_FAITH'),
        ('TRAIT_CIVILIZATION_OLYMPUS_AFFECTION', 'EIFFEL_TOWER_ADDAPPEAL'),
        ('TRAIT_CIVILIZATION_OLYMPUS_AFFECTION', 'OLYMPUS_TOURISM');

INSERT INTO Modifiers
        (ModifierId,                        ModifierType,                                  SubjectRequirementSetId)
VALUES  ('OLYMPUS_MOUNTAINS_BONUS_CULTURE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'MOUNTAIN_ADJACENT'),
        ('OLYMPUS_MOUNTAINS_BONUS_FAITH',   'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'MOUNTAIN_ADJACENT'),
        ('OLYMPUS_COAST_FOOD',              'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'IS_COAST'),
        ('OLYMPUS_COAST_GOLD',              'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'IS_COAST'),
        ('OLYMPUS_TOURISM',                 'MODIFIER_PLAYER_ADJUST_TOURISM',              'IS_RELIGIOUS');

INSERT INTO ModifierArguments
        (ModifierId,                        Name,         Value)
VALUES  ('OLYMPUS_MOUNTAINS_BONUS_CULTURE', 'YieldType',  'YIELD_CULTURE'),
        ('OLYMPUS_MOUNTAINS_BONUS_CULTURE', 'Amount',     1),
        ('OLYMPUS_MOUNTAINS_BONUS_FAITH',   'YieldType',  'YIELD_FAITH'),
        ('OLYMPUS_MOUNTAINS_BONUS_FAITH',   'Amount',     2),
        ('OLYMPUS_COAST_FOOD',              'YieldType',  'YIELD_FOOD'),
        ('OLYMPUS_COAST_FOOD',              'Amount',     2),
        ('OLYMPUS_COAST_GOLD',              'YieldType',  'YIELD_GOLD'),
        ('OLYMPUS_COAST_GOLD',              'Amount',     1),
        ('OLYMPUS_TOURISM',                 'Amount',     50);

INSERT INTO RequirementSets
        (RequirementSetId,    RequirementSetType)
VALUES  ('MOUNTAIN_ADJACENT', 'REQUIREMENTSET_TEST_ALL'),
        ('IS_COAST',          'REQUIREMENTSET_TEST_ALL'),
        ('IS_RELIGIOUS',      'REQUIREMENTSET_TEST_ALL');

INSERT INTO Requirements
        (RequirementId,                    RequirementType)
VALUES  ('REQUIRES_CITY_FOLLOWS_RELIGION', 'REQUIREMENT_CITY_FOLLOWS_RELIGION');

INSERT INTO RequirementSetsRequirements
        (RequirementSetId,    RequirementId)
VALUES  ('MOUNTAIN_ADJACENT', 'REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN'),
        ('IS_COAST',          'REQUIRES_PLOT_HAS_COAST'),
        ('IS_RELIGIOUS',      'REQUIRES_CITY_FOLLOWS_RELIGION');
--------------------------
-- Unit Abilities
------------------------
INSERT INTO Tags
        (Tag,                   Vocabulary)
VALUES  ('CLASS_CAENIS',        'ABLITIY_CLASS');

INSERT INTO Types
        (Type,                  Kind)
VALUES  ('ABILITY_CAENIS_HP_1', 'KIND_ABILITY'),
        ('ABLITIY_CAENIS_HP_2', 'KIND_ABILITY'),
        ('ABILITY_CAENIS_HP_3', 'KIND_ABILITY'),
        ('ABILITY_CAENIS_HP_4', 'KIND_ABILITY'),
        ('ABILITY_CAENIS_HP_5', 'KIND_ABILITY');

INSERT INTO TypeTags
        (Type,                  Tag)
VALUES  ('UNIT_CAENIS_ANCIENT', 'CLASS_CAENIS');

INSERT INTO UnitAbilitesModifiers
        (UnitAbilityType,    ModifierId)
VALUES  ('ABILITY_CAENIS_1', 'CAENIS_HP_1'),
        ('ABILITY_CAENIS_2', 'CAENIS_HP_2'),
        ('ABILITY_CAENIS_2', 'CAENIS_COMBAT_1'),
        ('ABILITY_CAENIS_3', 'CAENIS_HP_3'),
        ('ABILITY_CAENIS_3', 'CAENIS_COMBAT_1'),
        ('ABILITY_CAENIS_4', 'CAENIS_HP_4'),
        ('ABILITY_CAENIS_4', 'CAENIS_COMBAT_2'),
        ('ABILITY_CAENIS_5', 'CAENIS_HP_5'),
        ('ABILITY_CAENIS_5', 'CAENIS_COMBAT_2');

INSERT INTO TechnologyModifiers
        (TechnologyModifiers, ModifierId)
VALUES  ('TECH_ASTRONOMY',    'GRANT_CAENIS');

INSERT INTO Modifiers
        (ModifierId,        ModifierType,                                Permanent,  SubjectRequirementSetId,        RunOnce)
VALUES  ('CAENIS_HP_1',     'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN', 0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_HP_2',     'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN', 0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_HP_3',     'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN', 0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_HP_4',     'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN', 0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_HP_5',     'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN', 0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_COMBAT_1', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('CAENIS_COMBAT_2', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      0,         'CAENIS_PLOT_IS_COAST_OR_OCEAN', 0),
        ('GRANT_CAENIS',    'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPTIAL',     1,          NULL,                           1);

INSERT INTO ModifierArguments
        (ModifierID,         Name,     Value)
VALUES  ('CAENIS_HP_1',     'Amount', 10),
        ('CAENIS_HP_2',     'Amount', 15),
        ('CAENIS_HP_3',     'Amount', 20),
        ('CAENIS_HP_4',     'Amount', 30),
        ('CAENIS_HP_5',     'Amount', 35),
        ('CAENIS_COMBAT_1', 'Amount', 25),
        ('CAENIS_COMBAT_2', 'Amount', 30);

INSERT INTO RequirementSets
        (RequirementSetId,                RequirementSetType)
VALUES  ('CAENIS_PLOT_IS_COAST_OR_OCEAN', 'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetsRequirements
        (RequirementSetId,                RequirementId)
VALUES  ('CAENIS_PLOT_IS_COAST_OR_OCEAN', 'REQUIRES_TERRAIN_OCEAN'),
        ('CAENIS_PLOT_IS_COAST_OR_OCEAN', 'REQUIRES_TERRAIN_COAST');