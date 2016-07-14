//-------------------------------------------------------
//SNIPER RIFLES
//Keyword rifles. They are subtype of rifles, but still contained here as a specialist weapon.

/obj/item/ammo_magazine/sniper
	name = "M42A Scoped Rifle Magazine (10x28mm Caseless)"
	desc = "A magazine of sniper rifle ammo."
	caliber = "10�28mm Caseless"
	icon_state = "75"
	icon_empty = "75-0"
	max_rounds = 7
	default_ammo = "sniper bullet"
	gun_type = "/obj/item/weapon/gun/rifle/sniper/M42A"
	handful_type = "Bullets (10�28mm Caseless)"
	reload_delay = 3

/obj/item/ammo_magazine/sniper/incendiary
	name = "M42A Incendiary Magazine (10x28mm Caseless)"
	default_ammo = "incendiary sniper bullet"
	handful_type = "Incendiary Bullets (10�28mm Caseless)"

/obj/item/ammo_magazine/sniper/flak
	name = "M42A Flak Magazine (10x28mm Caseless)"
	default_ammo = "flak sniper bullet"
	handful_type = "Flak Bullets (10�28mm Caseless)"
	icon_state = "a762"
	icon_empty = "a762-0"

//Pow! Headshot.
/obj/item/weapon/gun/rifle/sniper/M42A
	name = "\improper M42A Scoped Rifle"
	desc = "A heavy sniper rifle manufactured by Armat Systems. It has a scope system and fires armor penetrating rounds out of a 7-round magazine.\n'Peace Through Superior Firepower'"
	icon_state = "M42c"
	icon_empty = "M42c_empty"
	item_state = "m42a"  //placeholder!!
	origin_tech = "combat=6;materials=5"
	fire_sound = 'sound/weapons/GunFireSniper.ogg'
	mag_type = "/obj/item/ammo_magazine/sniper"
	accuracy = 10
	fire_delay = 60
	burst_amount = 1
	force = 12
	recoil = 1
	zoomdevicename = "scope"
	slot_flags = SLOT_BACK
	gun_features = GUN_AUTO_EJECTOR | GUN_TWOHANDED

	New()
		..()
		attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 20, "under_x" = 19, "under_y" = 14)
		var/obj/item/attachable/scope/S = new(src)
		S.icon_state = "" //Let's make it invisible. The sprite already has one.
		S.can_be_removed = 0
		S.Attach(src)
		var/obj/item/attachable/sniperbarrel/Q = new(src)
		Q.Attach(src)
		update_attachables()

/obj/item/ammo_magazine/sniper/elite
	name = "M42C Magazine (12.7x99mm Caseless)"
	default_ammo = "supersonic sniper bullet"
	gun_type = "/obj/item/weapon/gun/rifle/sniper/elite"
	caliber = "12.7�99mm Caseless"
	max_rounds = 9
	handful_type = "Bullets (12.7�99mm Caseless)"

/obj/item/weapon/gun/rifle/sniper/elite
	name = "\improper M42C Anti-Tank Sniper Rifle"
	desc = "A high end mag-rail heavy sniper rifle from Weyland-Armat chambered in the heaviest ammo available, 12.7�99mm Caseless."
	icon_state = "pmcM42c"
	icon_empty = "pmcM42c_empty"
	item_state = "m42a"  //placeholder!!
	origin_tech = "combat=7;materials=5"
	fire_sound = 'sound/weapons/sniper_heavy.ogg'
	mag_type = "/obj/item/ammo_magazine/sniper/elite"
	slot_flags = SLOT_BACK
	accuracy = 35
	fire_delay = 90
	burst_amount = 1
	force = 17
	recoil = 10
	zoomdevicename = "scope"
	gun_features = GUN_AUTO_EJECTOR | GUN_TWOHANDED | GUN_WY_RESTRICTED

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 15, "rail_y" = 19, "under_x" = 20, "under_y" = 15)
		var/obj/item/attachable/scope/S = new(src)
		S.icon_state = "pmcscope"
		S.can_be_removed = 0
		S.Attach(src)
		var/obj/item/attachable/sniperbarrel/Q = new(src)
		Q.Attach(src)
		update_attachables()

	afterattack(atom/A as mob|obj|turf|area, mob/living/user as mob|obj, flag, params)
		..()
		if(istype(user,/mob/living/carbon/human))
			if(user.lying == 0 && !istype(user:wear_suit,/obj/item/clothing/suit/storage/marine/PMCarmor/commando) && !istype(user:wear_suit,/obj/item/clothing/suit/storage/marine/PMCarmor))
				user.visible_message("[user] is blown backwards from the recoil of the [src]!")
				user.Weaken(5)


/obj/item/ammo_magazine/rifle/sniper/svd
	name = "SVD Magazine (7.62x54mmR)"
	desc = "A 12mm marksman rifle magazine."
	caliber = "7.62�54mmR"
	icon_state = "a762"
	icon_empty = "a762-0"
	default_ammo = "marksman rifle bullet"
	max_rounds = 30
	gun_type = "/obj/item/weapon/gun/rifle/sniper/svd"
	handful_type = "Marksman Bullets (7.62�54mmR)"

/obj/item/weapon/gun/rifle/sniper/svd
	name = "\improper SVD Dragunov-033"
	desc = "A sniper variant of the MAR-40 rifle, with a new stock, barrel, and scope. Finely crafted in 2133 by someone probably illiterate. Fires 7.62�54mmR rounds."
	icon_state = "VSS"
	icon_empty = "VSS_empty"
	origin_tech = "combat=5;materials=3;syndicate=5"
	icon_wielded = "SVD-w"
	item_state = "mar40"
	mag_type = "/obj/item/ammo_magazine/rifle/sniper/svd"
	fire_sound = 'sound/weapons/automag.ogg'
	eject_casings = 1
	recoil = 1
	burst_amount = 2
	gun_features = GUN_AUTO_EJECTOR | GUN_TWOHANDED | GUN_ON_MERCS | GUN_ON_RUSSIANS

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 17,"rail_x" = 13, "rail_y" = 19, "under_x" = 24, "under_y" = 13)
		var/obj/item/attachable/S = new /obj/item/attachable/scope/slavic(src)
		S.Attach(src)
		S = new /obj/item/attachable/slavicbarrel(src)
		S.Attach(src)
		S = new /obj/item/attachable/stock/slavic(src)
		S.Attach(src)
		update_attachables()

//-------------------------------------------------------
//SMARTGUN
/obj/item/ammo_magazine/internal/smartgun
	name = "Integrated Smartgun Belt"
	caliber = "10�28mm Caseless"
	icon_state = ".45a"
	icon_empty = ".45a0"
	max_rounds = 50
	default_ammo = "smartgun bullet"
	gun_type = "/obj/item/weapon/gun/smartgun"
	handful_type = "Bullets (10�28mm Caseless)"

//Come get some.
/obj/item/weapon/gun/smartgun
	name = "\improper M56 Smartgun"
	desc = "The actual firearm in the 4-piece M56 Smartgun System. Essentially a heavy, mobile machinegun.\nReloading is a cumbersome process requiring a Powerpack. Click the powerpack icon in the top left to reload."
	icon_state = "m56"
	item_state = "m56"
	origin_tech = "combat=6;materials=5"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	mag_type = "/obj/item/ammo_magazine/internal/smartgun"
	slot_flags = 0
	w_class = 5
	force = 20
	accuracy = 5
	fire_delay = 3
	burst_amount = 3
	burst_delay = 1
	var/shells_fired_max = 20 //Smartgun only; once you fire # of shells, it will attempt to reload automatically. If you start the reload, the counter resets.
	var/shells_fired_now = 0 //The actual counter used. shells_fired_max is what it is compared to.
//	var/restriction_toggled = 1 //Begin with the safety on.
	gun_features = GUN_TWOHANDED


	New()
		..()
		attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 17, "rail_y" = 19, "under_x" = 22, "under_y" = 14)

	examine()
		..()

		if(current_mag.current_rounds) usr << "Ammo counter shows [current_mag.current_rounds] round\s remaining."
		else usr << "It's dry."

//		usr << "The restriction system is [restriction_toggled ? "<B>on</b>" : "<B>off</b>"]."

/*
	proc/toggle_restriction(var/mob/user as mob) //Works like reloading the gun. We don't actually change the ammo though.
		user << "\icon[src] You [restriction_toggled ? "<B>disable</b>" : "<B>enable</b>"] the [src]'s fire restriction. You will [restriction_toggled ? "harm anyone in your way" : "not harm allies"]."
		playsound(src.loc,'sound/machines/click.ogg', 50, 1)
		if(restriction_toggled)
			ammo.damage = 33
			ammo.skips_marines = 0
			ammo.armor_pen = 10
		else
			ammo.damage = 28
			ammo.skips_marines = 1
			ammo.armor_pen = 5
		restriction_toggled = !restriction_toggled
		return
*/
	unique_action(mob/user)
//		toggle_restriction(user)
		return

	able_to_fire(mob/user)
		if(!ishuman(user)) return
		var/mob/living/carbon/human/smart_gunner = user
		if( !istype(smart_gunner.wear_suit,/obj/item/clothing/suit/storage/marine_smartgun_armor) || !istype(smart_gunner.back,/obj/item/smartgun_powerpack))
			click_empty(smart_gunner)
			return
		return ..()

	load_into_chamber(mob/user)
		if(active_attachable) active_attachable = null
		return ready_in_chamber()

	reload_into_chamber(mob/user)
		set waitfor = 0
		var/mob/living/carbon/human/smart_gunner = user
		var/obj/item/smartgun_powerpack/power_pack = smart_gunner.back
		if(power_pack) //I don't know how it would break, but it is possible.
			if(shells_fired_now >= shells_fired_max && power_pack.rounds_remaining > 0) // If shells fired exceeds shells needed to reload, and we have ammo.
				sleep(1)
				if(power_pack && power_pack.loc) power_pack.attack_self(smart_gunner)
			else shells_fired_now++

		return current_mag.current_rounds

	delete_bullet(obj/item/projectile/projectile_to_fire, refund = 0)
		cdel(projectile_to_fire)
		if(refund) current_mag.current_rounds++
		return 1

	reload()
		return

	unload()
		return

	make_casing()
		return

/obj/item/ammo_magazine/internal/smartgun/dirty
	default_ammo = "irradiated smartgun bullet"
	gun_type = "/obj/item/weapon/gun/smartgun/dirty"

//Cannot be upgraded.
/obj/item/weapon/gun/smartgun/dirty
	name = "\improper M57D 'Dirty' Smartgun"
	desc = "The actual firearm in the 4-piece M57D Smartgun System. If you have this, you're about to bring some serious pain to anyone in your way. Otherwise identical to the M56."
	origin_tech = "combat=7;materials=5"
//	restriction_toggled = 0
	mag_type = "/obj/item/ammo_magazine/internal/smartgun/dirty"
	accuracy = 10 //Slightly more accurate.
	gun_features = GUN_TWOHANDED | GUN_WY_RESTRICTED


	unique_action() //Cannot toggle restrictions. It has none.
		return

//-------------------------------------------------------
//GRENADE LAUNCHER

/obj/item/weapon/gun/m92
	name = "M92 grenade launcher"
	desc = "A heavy, 5-shot grenade launcher used by the Colonial Marines for area denial and big explosions."
	icon_state = "m92"
	icon_wielded = "riotgun"
	item_state = "riotgun" //Ugh replace this plz
	origin_tech = "combat=5;materials=5"
	matter = list("metal" = 80000)
	w_class = 4.0
	throw_speed = 2
	throw_range = 10
	force = 5.0
	fire_sound = 'sound/weapons/armbomb.ogg'
	cocked_sound = 'sound/weapons/grenadelaunch.ogg'
	fire_delay = 22
	var/list/grenades = new/list()
	var/max_grenades = 6
	gun_features = GUN_UNUSUAL_DESIGN | GUN_TWOHANDED

	New()
		..()
		spawn(1) //Load er up!
			grenades += new /obj/item/weapon/grenade/explosive(src)
			grenades += new /obj/item/weapon/grenade/explosive(src)
			grenades += new /obj/item/weapon/grenade/incendiary(src)
			grenades += new /obj/item/weapon/grenade/explosive(src)
			grenades += new /obj/item/weapon/grenade/explosive(src)

	examine()
		set src in view()
		..()
		if(grenades.len)
			if (!(usr in view(2)) && usr!=src.loc) return
			usr << "\blue It is loaded with <b>[grenades.len] / [max_grenades]</b> grenades."

	attackby(obj/item/I as obj, mob/user as mob)
		if((istype(I, /obj/item/weapon/grenade)))
			if(grenades.len < max_grenades)
				user.drop_item()
				I.loc = src
				grenades += I
				user << "\blue You put \the [I] in the grenade launcher."
				user << "\blue Now storing: [grenades.len] / [max_grenades] grenades."
			else
				user << "\red The grenade launcher cannot hold more grenades."

	afterattack(atom/target, mob/user , flag)
		if(able_to_fire(user))
			if(get_dist(target,user) <= 2)
				user << "\red The grenade launcher beeps a warning noise. You are too close!"
				return
			if(grenades.len)
				spawn(0) fire_grenade(target,user)
				playsound(user.loc, cocked_sound, 50, 1)
			else user << "\red The grenade launcher is empty."

	proc/fire_grenade(atom/target, mob/user)
		set waitfor = 0
		for(var/mob/O in viewers(world.view, user))
			O.show_message(text("\red [] fired a grenade!", user), 1)
		user << "\red You fire the grenade launcher!"
		var/obj/item/weapon/grenade/F = grenades[1]
		grenades -= F
		F.loc = user.loc
		F.throw_range = 20
		F.throw_at(target, 20, 2, user)
		if(F && F.loc) //Apparently it can get deleted before the next thing takes place, so it run times.
			message_admins("[key_name_admin(user)] fired a grenade ([F.name]) from a grenade launcher ([src.name]).")
			log_game("[key_name_admin(user)] used a grenade ([name]).")
			F.active = 1
			F.icon_state = initial(icon_state) + "_active"
			playsound(F.loc, fire_sound, 50, 1)
			sleep(10)
			if(F && F.loc) F.prime()

	//Doesn't use most of any of these. Listed for reference.
	load_into_chamber()
		return

	reload_into_chamber()
		return

	reload()
		return

	unload(var/mob/user)
		if(grenades.len)
			var/obj/item/weapon/grenade/nade = grenades[grenades.len] //Grab the last one.
			if(user)
				user.put_in_hands(nade)
				playsound(user, unload_sound, 20, 1)
			else nade.loc = get_turf(src)
			grenades -= nade
		else user << "It's empty."

	make_casing()
		return

//-------------------------------------------------------
//SADAR

/obj/item/ammo_magazine/rocket
	name = "High Explosive Rocket"
	desc = "A rocket tube for an M83 SADAR rocket. Activate it without a missile inside to receive some materials."
	caliber = "rocket"
	icon_state = "rocket_tube"
	icon_empty = "rocket_tube_empty"
	origin_tech = "combat=3;materials=3"
	matter = list("metal" = 100000)
	w_class = 3.0
	max_rounds = 1
	default_ammo = "high explosive rocket"
	gun_type = "/obj/item/weapon/gun/rocketlauncher"

	attack_self(mob/user as mob)
		if(current_rounds <= 0)
			user << "You begin taking apart the empty tube frame..."
			if(do_after(user,10))
				user.visible_message("[user] deconstructs the rocket tube frame.","You take apart the empty frame!")
				var/obj/item/stack/sheet/metal/M = new(get_turf(user))
				M.amount = 2
				user.drop_item(src)
				cdel(src)
		else user << "Not with a missile inside!"

	update_icon()
		..()
		if(current_rounds <= 0) name = "Empty Rocket Frame"

/obj/item/ammo_magazine/rocket/ap
	name = "Anti Tank Rocket"
	icon_state = "rocket_tube_ap"
	default_ammo = "anti-armor rocket"
	desc = "A tube for an AP rocket - the warhead of which is extremely dense and turns molten on impact. When empty, use this frame to deconstruct it."

/obj/item/ammo_magazine/rocket/wp
	name = "Phosphorous Rocket"
	icon_state = "rocket_tube_wp"
	default_ammo = "white phosphorous rocket"
	desc = "A highly destructive warhead that bursts into deadly flames on impact. Use this in hand to deconstruct it."

/obj/item/ammo_magazine/internal/rocket
	name = "Internal Tube"
	desc = "The internal tube of a M83 SADAR."
	caliber = "rocket"
	default_ammo = "high explosive rocket"
	max_rounds = 1
	reload_delay = 60

/obj/item/weapon/gun/rocketlauncher
	name = "M83 SADAR rocket launcher"
	desc = "The M83 SADAR is the primary anti-armor weapon of the USCM. Used to take out light-tanks and enemy structures, the SADAR is a dangerous weapon with a variety of combat uses."
	icon_state = "M83sadar"
	item_state = "rocket"
	icon_wielded = "rocket"
	origin_tech = "combat=6;materials=5"
	matter = list("metal" = 100000)
	mag_type = "/obj/item/ammo_magazine/internal/rocket"
	flags =  FPRINT | TABLEPASS | CONDUCT
	slot_flags = 0
	w_class = 5
	force = 15
	fire_delay = 10
	recoil = 3
	gun_features = GUN_TWOHANDED
	var/datum/effect/effect/system/smoke_spread/puff

	New()
		..()
		puff = new /datum/effect/effect/system/smoke_spread()
		puff.attach(src)

	examine()
		..()

		if(current_mag.current_rounds)  usr << "It's ready to rocket."
		else 							usr << "It's empty."


	able_to_fire(mob/user)
		if(user)
			var/turf/current_turf = get_turf(user)
			if(current_turf.z == 3 || current_turf.z == 4) //Can't fire on the Sulaco, bub.
				click_empty(user)
				user << "\red You can't fire that here!"
				return
		return ..()

	load_into_chamber(mob/user)
		if(active_attachable) active_attachable = null
		return ready_in_chamber()

	reload_into_chamber(mob/user)
		set waitfor = 0
		sleep(1)
		var/smoke_dir = user.dir
		if(user)
			switch(smoke_dir) //We want the opposite of their direction.
				if(2,8)
					smoke_dir /= 2
				if(1,4)
					smoke_dir *= 2
		puff.set_up(1,,,smoke_dir)
		puff.start()
		return 1

	delete_bullet(obj/item/projectile/projectile_to_fire, refund = 0)
		cdel(projectile_to_fire)
		if(refund) current_mag.current_rounds++
		return 1

	reload(mob/user = null, var/obj/item/ammo_magazine/rocket)
		if(!rocket || !istype(rocket) || rocket.caliber != current_mag.caliber)
			user << "That's not going to fit!"
			return

		if(current_mag.current_rounds > 0)
			user << "\The [src] is already loaded!"
			return

		if(rocket.current_rounds <= 0)
			user << "That frame is empty!"
			return

		if(user)
			user << "You begin reloading \the [src]. Hold still!"
			if(do_after(user,current_mag.reload_delay))
				user.remove_from_mob(rocket)
				replace_ammo(user,rocket)
				current_mag.current_rounds = current_mag.max_rounds
				rocket.current_rounds = 0
				user << "\blue You load \the [rocket] into \the [src]!"
				if(reload_sound) playsound(user, reload_sound, 100, 1)
				else playsound(user,'sound/machines/click.ogg', 100, 1)
			else
				user << "Your reload was interrupted."
				return
		else
			rocket.loc = get_turf(src)
			replace_ammo(,rocket)
			current_mag.current_rounds = current_mag.max_rounds
			rocket.current_rounds = 0
		rocket.update_icon()
		update_icon()
		return 1

	unload(mob/user)
		if(user)
			if(!current_mag.current_rounds) user << "\The [src] is already empty."
			else 							user << "It would be too much trouble to unload \the [src] now. Should have thought ahead!"

	make_casing()
		return

//-------------------------------------------------------
//SADARS MEAN FUCKING COUSIN

/obj/item/ammo_magazine/rocket/quad
	name = "Thermobaric Rocket Array"
	desc = "A thermobaric rocket tube for an M83AM quad launcher. Activate in hand to receive some metal when it's used up."
	caliber = "rocket array"
	icon_state = "rocket_tube4"
	icon_empty = "rocket_tube_empty4"
	origin_tech = "combat=4;materials=4"
	max_rounds = 4
	default_ammo = "thermobaric rocket"
	gun_type = "/obj/item/weapon/gun/rocketlauncher/quad"
	reload_delay = 200

/obj/item/ammo_magazine/internal/rocket/quad
	desc = "The internal tube of an M83AM Thermobaric Launcher."
	caliber = "rocket array"
	default_ammo = "thermobaric rocket"
	max_rounds = 4

/obj/item/weapon/gun/rocketlauncher/quad
	name = "M83AM Thermobaric Launcher"
	desc = "The M83AM is posssibly the most destructive man-portable weapon ever made. It is a 4-barreled missile launcher capable of burst-firing 4 thermobaric missiles. Enough said."
	icon_state = "quaddar"
	item_state = "rocket4"
	icon_wielded = "rocket4"
	origin_tech = "combat=7;materials=5"
	mag_type = "/obj/item/ammo_magazine/internal/rocket/quad"
	fire_delay = 6
	burst_amount = 4
	burst_delay = 4
	accuracy = -20
	gun_features = GUN_TWOHANDED | GUN_WY_RESTRICTED
