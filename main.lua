--[[

   Lua Space Invaders Copyright (C) 2015 Anthony Zheng

   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by the
   Free Software Foundation; either version 2 of the License,
   or (at your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.

   See the GNU General Public License for more details.
   You should have received a copy of the GNU General Public License along
   with this program; if not, write to the

   Free Software Foundation, Inc.,
   51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301 USA.

--]]

function love.load()
   hero = {}
   hero.x = 300
   hero.y = 550
   hero.speed = 50
   hero.jump = 100
end

function love.update(dt)
   if love.keyboard.isDown("left") then
      hero.x = hero.x - hero.speed * dt
   elseif love.keyboard.isDown("right") then
      hero.x = hero.x + hero.speed * dt
   end

   if love.keyboard.isDown("up") then
      hero.y = hero.y - hero.jump * dt
   elseif hero.y < 550 then
      hero.y = hero.y + hero.jump * dt
   end

end -- update

function love.draw()
   -- The Ground
   love.graphics.setColor(0, 255, 0, 255)
   love.graphics.rectangle("fill", 0, 560, 800, 150)

   -- The Movable
   love.graphics.setColor(255, 255, 0, 255)
   love.graphics.rectangle("fill", hero.x, hero.y, 30, 15)
end --draw