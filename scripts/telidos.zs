//Setup
import crafttweaker.api.tag.manager.ITagManager; 
import crafttweaker.api.recipe.MirrorAxis;
import crafttweaker.api.GenericRecipesManager;
import crafttweaker.api.ingredient.transform.type.TransformDamage;
import crafttweaker.api.ingredient.transform.IIngredientTransformer;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.entity.attribute.AttributeOperation;
import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.recipe.StoneCutterManager;
import crafttweaker.api.tag.manager.type.KnownTagManager;
import crafttweaker.api.villagers.VillagerTrades;
import crafttweaker.api.item.tooltip.ITooltipFunction;
import crafttweaker.api.text.Component;
import crafttweaker.api.loot.condition.builder.LootConditionBuilder;
import crafttweaker.api.loot.condition.DamageSourceLootCondition;
import crafttweaker.api.predicate.DamageSourcePredicate;
import crafttweaker.api.loot.condition.KilledByPlayerLootCondition;
import crafttweaker.api.loot.condition.WeatherCheckLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.predicate.EntityPredicate;
import crafttweaker.api.predicate.EntityEquipmentPredicate;
import crafttweaker.api.predicate.ItemPredicate;
import crafttweaker.api.block.Block;

var disabled_items = <tag:items:blockexpansion:piglin_loved>;
var web = <item:minecraft:string>;
var air = <item:minecraft:air>;
var redstone_dust = <item:minecraft:redstone>;
var sea_lantern = <item:minecraft:sea_lantern>;
var cobble = <tag:items:minecraft:stone_tool_materials>;
var brewing_stand = <item:minecraft:brewing_stand>;
var chiseled_stone = <item:minecraft:chiseled_stone_bricks>;
var coal = <item:minecraft:coal>;
var netherrack = <item:minecraft:netherrack>;
var soul_sand = <item:minecraft:soul_sand>;
var nether_brick = <item:minecraft:nether_brick>;
var red_dye = <item:minecraft:red_dye>;
var blaze_powder = <item:minecraft:blaze_powder>;
var iron_nugget = <item:minecraft:iron_nugget>;
var gold_nugget = <item:minecraft:gold_nugget>;
var stick = <item:minecraft:stick>;
var redstone = <item:minecraft:redstone>;
var brick = <item:minecraft:brick>;
var echo_shard = <item:minecraft:echo_shard>;
var wood = <tag:items:minecraft:planks>;
var obsidian = <item:minecraft:obsidian>;
var leather = <item:minecraft:leather>;
var woodslab = <tag:items:minecraft:wooden_slabs>;
var log = <tag:items:minecraft:logs_that_burn>;
var tuff = <item:minecraft:tuff>;
var obby = <item:minecraft:crying_obsidian>;
var glass = <item:minecraft:glass>;
//Recipe Changes

recipes.remove(<item:blockexpansion:cut_lapis_slab>);
craftingTable.addShaped("tuffslab", <item:blockexpansion:cut_lapis_slab> * 6, [
	[tuff, tuff, tuff]]);
recipes.remove(<item:blockexpansion:cut_lapis_stairs>);
craftingTable.addShaped("tuffstairs", <item:blockexpansion:cut_lapis_stairs> * 4, [
	[tuff, air, air],
	[tuff, tuff, air],
	[tuff, tuff, tuff]]);
craftingTable.remove(<item:minecraft:note_block>);
craftingTable.addShaped("rnote", <item:minecraft:note_block>, [
	[wood, wood, wood],
	[wood, <item:minecraft:amethyst_shard>, wood],
	[wood, wood, wood]]);
craftingTable.remove(<item:minecraft:red_nether_bricks>);
craftingTable.addShaped("redstone_bricks", <item:minecraft:red_nether_bricks> * 2, [
	[<item:minecraft:nether_wart>, nether_brick],
	[nether_brick, <item:minecraft:nether_wart>]]);

craftingTable.remove(<item:minecraft:lodestone>);
craftingTable.addShaped("soul_lodestone", <item:minecraft:lodestone>, [
	[chiseled_stone, chiseled_stone, chiseled_stone],
	[chiseled_stone, <item:minecraft:amethyst_shard>, chiseled_stone],
	[chiseled_stone, chiseled_stone, chiseled_stone]]);
craftingTable.remove(<item:minecraft:bricks>);
craftingTable.addShaped("cheapbrick", <item:minecraft:bricks> * 4, [
	[brick, brick],
	[brick, brick]]);
	
craftingTable.remove(<item:minecraft:nether_bricks>);
craftingTable.addShaped("cheapnetherbrick", <item:minecraft:nether_bricks> * 4, [
	[nether_brick, nether_brick],
	[nether_brick, nether_brick]]);

craftingTable.remove(<item:minecraft:respawn_anchor>);
craftingTable.addShaped("fixedanchor", <item:minecraft:respawn_anchor>, [
	[obsidian, obsidian, obsidian],
	[blaze_powder, echo_shard, blaze_powder],
	[obsidian, obsidian, obsidian]]);
	
craftingTable.addShapeless("glowdust", <item:minecraft:glowstone_dust> * 2, [<item:minecraft:glow_berries>]);
craftingTable.addShapeless("alchvap", <item:minecraft:dragon_breath> * 2, [<item:minecraft:glass_bottle>, <item:minecraft:dragon_breath>, blaze_powder]);
craftingTable.addShapeless("gildingblackstone", <item:minecraft:gilded_blackstone>, [<item:minecraft:gold_nugget>, <item:minecraft:blackstone>]);
craftingTable.addShapeless("warped_propagation", <item:minecraft:warped_nylium>, [netherrack, <item:minecraft:warped_fungus>]);
craftingTable.addShapeless("crimson_propagation", <item:minecraft:crimson_nylium>, [netherrack, <item:minecraft:crimson_fungus>]);

villagerTrades.removeTradesSelling(<profession:minecraft:librarian>, 1, <item:minecraft:enchanted_book>);
villagerTrades.removeTradesSelling(<profession:minecraft:librarian>, 3, <item:minecraft:enchanted_book>);

//Disabling Items
<tagmanager:items>.addId(disabled_items,
<resource:blockexpansion:obsidian_brick_slab>,<resource:blockexpansion:obsidian_brick_stairs>,<resource:blockexpansion:obsidian_brick_pillar>,<resource:blockexpansion:obsidian_brick_wall>,<resource:blockexpansion:cracked_obsidian_bricks>,
<resource:blockexpansion:cut_emerald>,<resource:blockexpansion:cut_emerald_slab>,<resource:blockexpansion:cut_emerald_stairs>,
<resource:blockexpansion:cut_iron>,<resource:blockexpansion:cut_iron_slab>,<resource:blockexpansion:cut_iron_stairs>,
<resource:blockexpansion:cut_netherite>,<resource:blockexpansion:cut_netherite_slab>,<resource:blockexpansion:cut_netherite_stairs>,
<resource:blockexpansion:cut_diamond>,<resource:blockexpansion:cut_diamond_slab>,<resource:blockexpansion:cut_diamond_stairs>,
<resource:blockexpansion:cut_lapis>,<resource:blockexpansion:cut_coal_slab>,<resource:blockexpansion:cut_coal_stairs>,<resource:blockexpansion:obsidian_bricks>,
<resource:basicweapons:wooden_spear>,<resource:basicweapons:stone_spear>,<resource:basicweapons:iron_spear>,<resource:basicweapons:golden_spear>,<resource:basicweapons:diamond_spear>,<resource:basicweapons:netherite_spear>,
<resource:basicweapons:wooden_quarterstaff>,<resource:basicweapons:stone_quarterstaff>,<resource:basicweapons:iron_quarterstaff>,<resource:basicweapons:golden_quarterstaff>,<resource:basicweapons:diamond_quarterstaff>,<resource:basicweapons:netherite_quarterstaff>
);
recipes.remove(disabled_items);
<tag:items:c:hidden_from_recipe_viewers>.add(disabled_items);

loot.modifiers.register(
    "add_diamonds_2",
    LootConditions.none(),
    CommonLootModifiers.remove(obby)
);
disabled_items.asIIngredient().addTooltip(Component.literal("Disabled! Please do not use.").setStyle(<constant:formatting:red>));
