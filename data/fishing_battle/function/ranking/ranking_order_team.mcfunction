#> fishing_battle:ranking/ranking_order_team
#
# fishing_battle：順位を決めるfunction（チーム戦）
#
# @within
#   function fishing_battle:ranking/**
#   function fishing_battle:main/game_state/4_result


#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.WIP.Comparison.Rank
    #define score_holder $PCTW.FSBT.Temp.largest.Score
    #define score_holder $PCTW.FSBT.Temp.Rank.Num_of_People

#> Tag
# @within
#   function fishing_battle:main/game_state/4_result
#   function fishing_battle:ranking/**
    #define tag PCTW.FSBT.Temp.Score.1st
    #define tag PCTW.FSBT.Temp.Score.2nd
    #define tag PCTW.FSBT.Temp.Score.3rd

#endregion


#region 内容

# 初期化
    ## AEC召喚
        ### 赤チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp at @r[team=FSBTPlayerTeamRed] run summon marker ~ ~ ~ {Tags:["PCTW.FSBT.Marker","PCTW.FSBT.Marker.Temp","PCTW.FSBT.Marker.Save_Score","PCTW.FSBT.Marker.Save_Score.Red"]}
        ### 青チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp at @r[team=FSBTPlayerTeamBlue] run summon marker ~ ~ ~ {Tags:["PCTW.FSBT.Marker","PCTW.FSBT.Marker.Temp","PCTW.FSBT.Marker.Save_Score","PCTW.FSBT.Marker.Save_Score.Blue"]}
        ### 黃チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp at @r[team=FSBTPlayerTeamYellow] run summon marker ~ ~ ~ {Tags:["PCTW.FSBT.Marker","PCTW.FSBT.Marker.Temp","PCTW.FSBT.Marker.Save_Score","PCTW.FSBT.Marker.Save_Score.Yellow"]}
        ### 緑チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp at @r[team=FSBTPlayerTeamGreen] run summon marker ~ ~ ~ {Tags:["PCTW.FSBT.Marker","PCTW.FSBT.Marker.Temp","PCTW.FSBT.Marker.Save_Score","PCTW.FSBT.Marker.Save_Score.Green"]}
    ## スコア反映
        ### 赤チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp if entity @a[team=FSBTPlayerTeamRed] run scoreboard players operation @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Red
        ### 青チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp if entity @a[team=FSBTPlayerTeamBlue] run scoreboard players operation @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Blue
        ### 黃チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp if entity @a[team=FSBTPlayerTeamYellow] run scoreboard players operation @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Yellow
        ### 緑チーム
            execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp if entity @a[team=FSBTPlayerTeamGreen] run scoreboard players operation @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Green
    ## scoreboard初期化
        execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp = $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp run scoreboard players set $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp 1

# 比較
    ## 各自スコアを一時保管
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1.. run execute as @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] at @s run scoreboard players operation @s PCTW.Core.Temp = @s PCTW.FSBT.Score
    ## トップのスコアを保存
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1.. run scoreboard players operation $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score > @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] PCTW.Core.Temp
    ## 各自のスコアからトップスコアを減算
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1.. run scoreboard players operation @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] PCTW.Core.Temp -= $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score

# 順位付け
    ## 1位
        ### 1位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1 run execute as @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Core.Temp=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.1st
    ## 2位
        ### 2位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 2 run execute as @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Core.Temp=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.2nd
    ## 3位
        ### 3位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 3 run execute as @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Core.Temp=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.3rd

# 再帰処理
    ## 回数を1上げる
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1..3 run scoreboard players add $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp 1
    ## scoreboard初期化 
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1..3 run scoreboard players reset $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score
    ## 3位まで繰り返す
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 1..3 run function fishing_battle:ranking/ranking_order_team
    ## 終了
        ### スコア削除
            ### 比較スコア
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score
            ### Temporary
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 4 run scoreboard players reset @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score] PCTW.Core.Temp
            ### 周回数スコア
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Core.Temp

#endregion