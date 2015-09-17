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
   -- Playable
   hero = {}
   hero.x = 300
   hero.y = 550
   hero.speed = 50
   hero.jump = 100

   -- Aliens
   aliens = {}
   for i = 0,7 do
      alien = {}
      alien.width = 40
      alien.height = 20
      alien.x = i * (alien.width + 60) + 100
      alien.y = alien.height + 100
      alien.speed = 50
      alien.dir = -1
      alien.origin = alien.x + (alien.width / 2)
      table.insert(aliens, alien)
   end

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

   -- Alien Movement
   for i,v in ipairs (aliens) do
      if v.x > v.origin + 20 then
         alien.dir = alien.dir * -1
      elseif v.x + v.width - 20 < v.origin then
         alien.dir = alien.dir * -1
      end

      v.x = v.x + alien.dir * v.speed * dt
   end -- for

end -- update



function love.draw()
   -- The Ground
   love.graphics.setColor(0, 255, 0, 255)
   love.graphics.rectangle("fill", 0, 560, 800, 150)

   -- The Movable
   love.graphics.setColor(255, 255, 0, 255)
   love.graphics.rectangle("fill", hero.x, hero.y, 30, 15)

   -- Aliens
   love.graphics.setColor(0, 255, 255, 255)
   for i,v in ipairs(aliens) do
      love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
   end

end --draw
