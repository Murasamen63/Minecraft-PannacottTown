#> fishing_battle:advancements/picked_up/high_class/unagi
#
# fishing_battle：『ウナギ』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/high_class/unagi



#region 内容

# アイテム処理
        ### 元アイテム削除
            #execute if predicate fishing_battle:game_state/play run clear @s cod{FSBTNotPickedUpHookedItem:1b,FSBTUnagi:1b}
        ### スコア増加
            execute if predicate fishing_battle:game_state/play run scoreboard players add @s PCTW.FSBT.Score 60
        ### 観賞用アイテム付与
            execute if predicate fishing_battle:game_state/play run function fishing_battle:give/hooked_item/high_class/unagi
        ### 通知
            ### 通知
                execute if predicate fishing_battle:game_state/play run tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"ウナギ","italic":true},"』    ","+",{"text":"60pt","bold":true,"color":"yellow"}]
            ### 効果音
                execute if predicate fishing_battle:game_state/play run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/high_class/unagi

#endregion