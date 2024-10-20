#> fishing_battle:score/ctrl_xpbar
#
# fishing_battle：スコアをXPバーに反映させるfunction
#
# @within function fishing_battle:main/game_state/3_play



#region 内容

# レベルを操作
    ## 初期化
        xp set @s 0 levels
        scoreboard players operation @s PCTW.Core.Temp = @s PCTW.FSBT.Score
    ## 操作
        ### 規定数以上でカンスト
            execute if score @s PCTW.Core.Temp matches 131072.. run scoreboard players set @s PCTW.FSBT.Score 131071
            execute if score @s PCTW.Core.Temp matches 131072.. run scoreboard players set @s PCTW.Core.Temp 131071
            execute if score @s PCTW.Core.Temp matches 131072.. run tellraw @s ["","\n","  申し訳御座いません","\n","  現在のバージョンでは",{"text":"131071pt","bold":true,"color":"gold"},"が最大値です","\n","\n","  またこのメッセージが出た場合、MVrasameに",{"text":"  「131071が出ました。」","bold":true,"italic":true},"とお伝え頂けると幸いです。","\n"]
        ### レベルを増加
            execute if score @s PCTW.Core.Temp matches 65536.. run xp add @s 65536 levels
            execute if score @s PCTW.Core.Temp matches 65536.. run scoreboard players remove @s PCTW.Core.Temp 65536
            execute if score @s PCTW.Core.Temp matches 32768.. run xp add @s 32768 levels
            execute if score @s PCTW.Core.Temp matches 32768.. run scoreboard players remove @s PCTW.Core.Temp 32768
            execute if score @s PCTW.Core.Temp matches 16384.. run xp add @s 16384 levels
            execute if score @s PCTW.Core.Temp matches 16384.. run scoreboard players remove @s PCTW.Core.Temp 16384
            execute if score @s PCTW.Core.Temp matches 8192.. run xp add @s 8192 levels
            execute if score @s PCTW.Core.Temp matches 8192.. run scoreboard players remove @s PCTW.Core.Temp 8192
            execute if score @s PCTW.Core.Temp matches 4096.. run xp add @s 4096 levels
            execute if score @s PCTW.Core.Temp matches 4096.. run scoreboard players remove @s PCTW.Core.Temp 4096
            execute if score @s PCTW.Core.Temp matches 2048.. run xp add @s 2048 levels
            execute if score @s PCTW.Core.Temp matches 2048.. run scoreboard players remove @s PCTW.Core.Temp 2048
            execute if score @s PCTW.Core.Temp matches 1024.. run xp add @s 1024 levels
            execute if score @s PCTW.Core.Temp matches 1024.. run scoreboard players remove @s PCTW.Core.Temp 1024
            execute if score @s PCTW.Core.Temp matches 512.. run xp add @s 512 levels
            execute if score @s PCTW.Core.Temp matches 512.. run scoreboard players remove @s PCTW.Core.Temp 512
            execute if score @s PCTW.Core.Temp matches 256.. run xp add @s 256 levels
            execute if score @s PCTW.Core.Temp matches 256.. run scoreboard players remove @s PCTW.Core.Temp 256
            execute if score @s PCTW.Core.Temp matches 128.. run xp add @s 128 levels
            execute if score @s PCTW.Core.Temp matches 128.. run scoreboard players remove @s PCTW.Core.Temp 128
            execute if score @s PCTW.Core.Temp matches 64.. run xp add @s 64 levels
            execute if score @s PCTW.Core.Temp matches 64.. run scoreboard players remove @s PCTW.Core.Temp 64
            execute if score @s PCTW.Core.Temp matches 32.. run xp add @s 32 levels
            execute if score @s PCTW.Core.Temp matches 32.. run scoreboard players remove @s PCTW.Core.Temp 32
            execute if score @s PCTW.Core.Temp matches 16.. run xp add @s 16 levels
            execute if score @s PCTW.Core.Temp matches 16.. run scoreboard players remove @s PCTW.Core.Temp 16
            execute if score @s PCTW.Core.Temp matches 8.. run xp add @s 8 levels
            execute if score @s PCTW.Core.Temp matches 8.. run scoreboard players remove @s PCTW.Core.Temp 8
            execute if score @s PCTW.Core.Temp matches 4.. run xp add @s 4 levels
            execute if score @s PCTW.Core.Temp matches 4.. run scoreboard players remove @s PCTW.Core.Temp 4
            execute if score @s PCTW.Core.Temp matches 2.. run xp add @s 2 levels
            execute if score @s PCTW.Core.Temp matches 2.. run scoreboard players remove @s PCTW.Core.Temp 2
            execute if score @s PCTW.Core.Temp matches 1.. run xp add @s 1 levels
            execute if score @s PCTW.Core.Temp matches 1.. run scoreboard players remove @s PCTW.Core.Temp 1

# 音声ストップ
    stopsound @a player entity.player.levelup

# scoreboard削除
    scoreboard players reset @s PCTW.Core.Temp

#endregion