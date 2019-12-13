--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

global = {
  paused = false,
  ui = {
    header = { height = 60 }
  },
  assets = {
    gfx = {
      bg = { ground = nil },
      entities = { coins = nil, player = nil }
    },
    sfx = {
      ambient = { music = nil },
      effects = { coin = nil }
    },
    fonts = {
      small = nil,
      large = nil,
      huge = nil
    }
  }
}

return global
