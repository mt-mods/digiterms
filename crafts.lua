--[[
	digiterms mod for Minetest - Digilines monitors using Display API / Font API
	(c) Pierre-Yves Rollo

	This file is part of digiterms.

	signs is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	signs is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with signs.  If not, see <http://www.gnu.org/licenses/>.
--]]

local function material_fallback(list)
  for _, material in ipairs(list) do
    if core.registered_items[material] then
      return material
    end
  end
  -- Fallback to last item 
  -- (Due to some items returning nil despite existing, like "mcl_copper:copper_ingot")
  return list[#list]
end

local body = material_fallback({
  'homedecor:plastic_sheeting',
  xcompat.materials.steel_ingot,
})

local glass = xcompat.materials.glass

local electronic = material_fallback({
  'mesecons_microcontroller:microcontroller0000',
  'mesecons_luacontroller:luacontroller0000',
  xcompat.materials.copper_ingot,
})

local button = material_fallback({
  'mesecons_button:button_off',
  'mcl_buttons:button_stone_off',
  xcompat.materials.stone,
})

local silicon = material_fallback({
	'mesecons_materials:silicon',
	xcompat.materials.dye_black,
})

local wire = 'digilines:wire_std_00000000'

core.register_craft({
	output = "digiterms:lcd_monitor",
	recipe = {
		{body, electronic},
		{glass, silicon},
		{body, wire},
	}
})

core.register_craft({
	output = "digiterms:cathodic_beige_monitor",
	recipe = {
		{body, body, xcompat.materials.dye_yellow},
		{glass, xcompat.materials.dye_orange, electronic},
		{body, body, wire}
	}
})

core.register_craft({
	output = "digiterms:cathodic_white_monitor",
	recipe = {
		{body, body, xcompat.materials.dye_white},
		{glass, xcompat.materials.dye_green, electronic},
    {body, body, wire}
	}
})

core.register_craft({
	output = "digiterms:cathodic_black_monitor",
	recipe = {
		{body, body, xcompat.materials.dye_black},
		{glass, xcompat.materials.dye_white, electronic},
    {body, body, wire}
	}
})


core.register_craft({
	output = "digiterms:beige_keyboard",
	recipe = {
		{button, button, xcompat.materials.dye_yellow},
    {body, body, wire}
	}
})

core.register_craft({
	output = "digiterms:white_keyboard",
	recipe = {
		{button, button, xcompat.materials.dye_white},
    {body, body, wire}
	}
})

core.register_craft({
	output = "digiterms:black_keyboard",
	recipe = {
		{button, button, xcompat.materials.dye_black},
    {body, body, wire}
	}
})
