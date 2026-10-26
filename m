Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006731;
	b=mCAfCAqryGLcFahHmJ/JpBCS+pETtfflOFbp9Kqrkl3scsqaUvt/UE3MLLLDHOI3Ig4z
	 sxgXiAbJwGtPDij4AWC4gDhPryg9m6T4jrx6bqlQs5e186RZ5vrwps4whMgepBqptYPmN
	 D6PUdnI2BoNkRVUlSOLxevSJqdrSiB7C9xAMXl9rpV97e1ZA47fBtzkVxyzUnxsK9pv1a
	 mH8BWxJ8bDh4FPTPATbtywFxZPHV0Oy3wXXTrKr2GnOZUr/RJ/+QwMsM+3NHEZ7ih42GQ
	 8/XkRRyTtAxtp0/F0OiK4+CoxOCOEajiu+3IUgLt6GwhmqYpKmlbAW/d6v1PlGdt/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gFPWDdla/ApqMOuW3P8mnga6pMpg71fhbUlfUWCt1lc=;
	b=Tis+X95FM80Y9MqEUzAfnSJie/w6SZf9Dkwmo7bjFiPs4w//lbbvkPAWdzMUmBHyuV1M
	 jswSYTxiaumjH8RzXiQSJTQJFq7VGoX7utsDE6u/bEXcaoDQUvgtqEhkoGo0TAU29oQ8N
	 YXb6W6F2nQhezXBYXI0BEcLyrtcYVJWuDrKN+/udCAeG03APY4FieWGroiezx6/zFtOuq
	 2pzcA7DiWINFqluZpTfulRSAb04C8hzJCJLsRk2sewcFRyZ9YsTw2GFSvwcfD1KimQiHQ
	 s8E6MncVVgeP3OJE6ps0LhYy5rnajTHCLIX4JhfBljPLLTXes1ABrFizlIZa8zaVNBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orOjDwce;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E63606A327
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orOjDwce
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E301F031E7;
	Mon, 26 Oct 2026 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006731;
	bh=gFPWDdla/ApqMOuW3P8mnga6pMpg71fhbUlfUWCt1lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=orOjDwceILMwlPZwpRl1Wsv5E/NcM+ZvNMLyVD8xL07xYiIK3J21LmyhD1gIGNOGO
	 UZiuv0CMESm2TS9DqWdxVU/UIQuX8Uj77ralh3pYXrJ8bWq5lcAkI2/cPYpu2m78Qa
	 zyNsO+pOlCqRBCo1uncAgwv7WYuQEx2AOR0WSSKMs642bfx89bzppG+R9VT5IOpPVh
	 1ukgxOCPXRuwyYULKye1EWLPOZ/L/ibLBBsGbHqyVC8Zs2PUM8DFc8z/jKBWlvvcwZ
	 8HGnnMIjicI17gUGce8GdJz+M3/iCqQAxSJD2fuWByIQAFrvr5QHs9PB7pEkVQES+2
	 0ncLQGh+l2MRg==
Message-ID: <sashiko-outbox-184777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: sim: snapshot configfs leaf items before
 depending on them
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261026060049.60599-1-yuz08559@gmail.com>
References: <20261026060049.60599-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:25:30 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] gpio: sim: race with mkdir/rmdir in gpio_sim_device_lockup_con=
figfs()
- [Critical] gpio: sim: extra leaf ref in gpio_sim_device_lockup_configfs()=
 UAFs parent
- [High] gpio: sim: unchecked kcalloc() failure in gpio_sim_device_lockup_c=
onfigfs()
--

commit 2fe24a96c3fb83559b6e4860a61df83ca81d16bb
Author: Yu Zhang <yuz08559@gmail.com>

gpio: sim: snapshot configfs leaf items before depending on them

This commit takes a reference-counted snapshot of leaf configfs items in
gpio_sim_device_lockup_configfs() while holding dev->lock, then calls
configfs_depend_item_unlocked() or configfs_undepend_item_unlocked() after
dropping the lock to avoid lock-order inversion with configfs rmdir.

> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 898638e2794cb..e4d1318b3019c 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -978,27 +978,61 @@ static void
>  gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
>  {
>  	struct configfs_subsystem *subsys =3D dev->group.cg_subsys;
> +	struct config_item **items =3D NULL, *item;
>  	struct gpio_sim_bank *bank;
>  	struct gpio_sim_line *line;
> -	struct config_item *item;
> +	size_t i, n;
> =20
>  	/*
>  	 * The device only needs to depend on leaf entries. This is
>  	 * sufficient to lock up all the configfs entries that the
>  	 * instantiated, alive device depends on.
> +	 *
> +	 * The bank and line lists are only stable under dev->lock, but
> +	 * configfs_[un]depend_item_unlocked() must not be called under it:
> +	 * they take configfs-internal locks and that would invert the lock
> +	 * order against the configfs rmdir path, which removes lines and
> +	 * banks from these lists and frees them under dev->lock. So take a
> +	 * pinned snapshot of the leaf items under the lock - skipping any
> +	 * that are already being torn down - and then depend/undepend the
> +	 * snapshot with the lock dropped.
>  	 */
> -	list_for_each_entry(bank, &dev->bank_list, siblings) {
> -		list_for_each_entry(line, &bank->line_list, siblings) {
> -			item =3D line->hog ? &line->hog->item
> -					 : &line->group.cg_item;
> -
> -			if (lock)
> -				WARN_ON(configfs_depend_item_unlocked(subsys,
> -								      item));
> -			else
> -				configfs_undepend_item_unlocked(item);
> +	scoped_guard(mutex, &dev->lock) {
> +		n =3D 0;
> +		list_for_each_entry(bank, &dev->bank_list, siblings)
> +			list_for_each_entry(line, &bank->line_list, siblings)
> +				n++;
> +
> +		if (!n)
> +			return;
> +
> +		items =3D kcalloc(n, sizeof(*items), GFP_KERNEL);
> +		if (!items)
> +			return;

[Severity: High]
What happens if kcalloc() fails here when called from
gpio_sim_device_config_live_store()?

drivers/gpio/gpio-sim.c:gpio_sim_device_config_live_store() {
    ...
	if (live)
		gpio_sim_device_lockup_configfs(dev, true);

	scoped_guard(mutex, &dev->lock) {
		if (live =3D=3D gpio_sim_device_is_live(dev))
			ret =3D -EPERM;
		else if (live)
			ret =3D gpio_sim_device_activate(dev);
		else
			gpio_sim_device_deactivate(dev);
	}

	if (live =3D=3D !!ret)
		gpio_sim_device_lockup_configfs(dev, false);
}

Because gpio_sim_device_lockup_configfs() returns void, an allocation failu=
re
on the lock =3D=3D true path is silently ignored without depending on any l=
eaf
items. gpio_sim_device_config_live_store() still proceeds, and when
gpio_sim_device_lockup_configfs(dev, false) later runs (either immediately =
on
activation failure / -EPERM or later on deactivation) and its kcalloc()
succeeds, configfs_undepend_item_unlocked() -> configfs_undepend_item() hit=
s:

fs/configfs/dir.c:configfs_undepend_item() {
    ...
	sd =3D target->ci_dentry->d_fsdata;
	BUG_ON(sd->s_dependent_count < 1);

	sd->s_dependent_count -=3D 1;
    ...
}

Conversely, if kcalloc() fails on the lock =3D=3D false path during deactiv=
ation,
gpio_sim_device_deactivate() has already torn down the device, so the
s_dependent_count references on all leaf items are permanently leaked and t=
he
configfs directories can never be removed.

Should gpio_sim_device_lockup_configfs() propagate allocation errors, or can
the items be tracked without a dynamic allocation on the undepend path?

> +
> +		i =3D 0;
> +		list_for_each_entry(bank, &dev->bank_list, siblings) {
> +			list_for_each_entry(line, &bank->line_list, siblings) {
> +				item =3D line->hog ? &line->hog->item
> +						 : &line->group.cg_item;
> +				item =3D config_item_get_unless_zero(item);
> +				if (item)
> +					items[i++] =3D item;
> +			}
>  		}
> +		n =3D i;
>  	}

[Severity: Critical]
Can this snapshot logic still race with concurrent configfs mkdir and rmdir
operations in three ways?

First, when a hog directory is removed via configfs_rmdir(), the final
config_item_put() drops hog->item.ci_kref to 0 and calls
gpio_sim_hog_config_item_release(), which waits on dev->lock before clearing
line->hog:

drivers/gpio/gpio-sim.c:gpio_sim_hog_config_item_release() {
    ...
	scoped_guard(mutex, &dev->lock)
		line->hog =3D NULL;
    ...
}

If gpio_sim_device_lockup_configfs(dev, true) holds dev->lock at that point,
it sees line->hog !=3D NULL, calls config_item_get_unless_zero(&line->hog->=
item)
which returns NULL, and skips the line completely without falling back to
&line->group.cg_item. Once dev->lock is dropped, line->hog becomes NULL, so=
 a
subsequent gpio_sim_device_lockup_configfs(dev, false) snapshots
&line->group.cg_item and triggers BUG_ON(sd->s_dependent_count < 1) in
configfs_undepend_item().

Second, in configfs_rmdir(), unlink_obj() clears item->ci_group =3D NULL be=
fore
the final config_item_put() drops ci_kref to 0 and runs the release callbac=
k:

fs/configfs/dir.c:unlink_obj() {
    ...
	item->ci_group =3D NULL;
	item->ci_parent =3D NULL;

	/* Drop the reference for ci_entry */
	config_item_put(item);
}

An item can therefore be snapshotted via config_item_get_unless_zero() after
unlink_obj() has already cleared ci_group (or a concurrent configfs_rmdir()
can run unlink_obj() after dev->lock is dropped but before
configfs_depend_item_unlocked() runs). When configfs_depend_item_unlocked()
then inspects the snapshotted item, target->ci_group is NULL and
parent->cg_subsys dereferences a NULL pointer:

fs/configfs/dir.c:configfs_depend_item_unlocked() {
    ...
	parent =3D target->ci_group;
	if (configfs_is_root(&parent->cg_item)) {
		target_subsys =3D to_configfs_subsystem(to_config_group(target));
		root =3D parent;
	} else {
		target_subsys =3D parent->cg_subsys;
    ...
}

Third, in configfs_mkdir(), gpio_sim_bank_config_make_line_group() and
gpio_sim_line_config_make_hog_item() add the new item to bank->line_list or
line->hog with ci_kref =3D=3D 1 under dev->lock before link_obj() sets
item->ci_group and before configfs_dir_set_ready() clears
CONFIGFS_USET_CREATING. Snapshotting the item in that window either
dereferences NULL target->ci_group in configfs_depend_item_unlocked() or fa=
ils
with -ENOENT in configfs_depend_prep() (leaving s_dependent_count =3D=3D 0 =
and
later hitting BUG_ON(sd->s_dependent_count < 1) on undepend).

> +
> +	for (i =3D 0; i < n; i++) {
> +		if (lock)
> +			WARN_ON(configfs_depend_item_unlocked(subsys,
> +							      items[i]));
> +		else
> +			configfs_undepend_item_unlocked(items[i]);
> +		config_item_put(items[i]);
> +	}

[Severity: Critical]
Does holding an extra ci_kref reference on items[i] across the unlocked win=
dow
allow a child's release callback to run after its parent has already been
freed?

In configfs, unlink_obj() drops the child's reference on its parent
config_group during configfs_rmdir(child) via config_group_put(group), rath=
er
than when the child's ci_kref reaches 0.

If a concurrent rmdir removes the leaf item (for example, right after
configfs_undepend_item_unlocked(items[i]) on deactivation, or before
configfs_depend_item_unlocked() on activation) while items[i] still holds a
reference from config_item_get_unless_zero(), configfs_rmdir(child) finishes
and drops the reference on the parent directory while child->ci_kref remains
1. Userspace can then immediately rmdir the now-empty parent line or bank
directory, freeing struct gpio_sim_line or struct gpio_sim_bank.

When config_item_put(items[i]) then drops the last reference on the child,
gpio_sim_hog_config_item_release() or gpio_sim_line_config_group_release()
dereferences the uncounted hog->parent or line->parent pointer into the fre=
ed
parent structure:

drivers/gpio/gpio-sim.c:gpio_sim_hog_config_item_release() {
	struct gpio_sim_hog *hog =3D to_gpio_sim_hog(item);
	struct gpio_sim_line *line =3D hog->parent;
	struct gpio_sim_device *dev =3D gpio_sim_hog_get_device(hog);

	scoped_guard(mutex, &dev->lock)
		line->hog =3D NULL;
    ...
}

drivers/gpio/gpio-sim.c:gpio_sim_line_config_group_release() {
	struct gpio_sim_line *line =3D to_gpio_sim_line(item);
	struct gpio_sim_device *dev =3D gpio_sim_line_get_device(line);

	scoped_guard(mutex, &dev->lock)
		list_del(&line->siblings);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026060049.6059=
9-1-yuz08559@gmail.com?part=3D1
