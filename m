Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717396;
	b=Wun3cFqcyo1CdZzfVuOT/rqCTc+o48jFAFyXUAy8CbzvrP1L7/VhkgmH4SDsgENE9KKy
	 2KS5ECNNNgdJ0BYeVJZbPlP8zV0W7lv/l9PfOkVAD6BHzRqGYx16SWFOU3aPEUlWRAgJL
	 PPlv8YZd8R+5WZUPreOiv/y+8Aow3w5BybqwNVz4amc/RVNLS+SmXKaapLlAAeTe+q/Lh
	 WU8/m573HpCvlHGnZmh0TtOQjtBrj1aNAfi2VHpmI7PQlEGVEvmTpz/qIdxNeqq3W6cuu
	 9aQ6rEcph8JhYBZ7E77C5dJvaKgkHB3XaG5DEMgZA2ATn4hI6nOywWhuNa+3G202lNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VRkzcsoUJfRBUzC0gVeg2/ud2UbGnnUh8Ve5wOMQDP0=;
	b=Jn8AhtLv91ItDw8K18Sml+FjiSixjsBiXLFj/D3HTeOzULunGi9WrXiKrDqzpDnv0Aex
	 VhAOxKtnOmfIhjZOPiCRnzJR9Tbsk1rzt2FncCaWwWifwrvCC4mft6Pvvy+Oa+oy7Mtte
	 LIxXACziiIwf8DnDm2w1zumbHjRiNoZhYYVhHeDCXoAZ4s3gC1R5L2n1xdo8JmUjUth9D
	 3z/9c2EXPrtIZhgmHX6ek9bTk+GXTQsXxIItbZleSl6ssqi1ApzMbGQwT92eI+GRkjnuH
	 kUT4mTehpcS0X8JU0Lg1aebNjD9CS3gCvfKJp4TdAACMTrNAhCX2bnVmxkuxzf0wn3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PygIG5wu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16076083612
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PygIG5wu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6C61F000C1;
	Tue,  3 Nov 2026 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717395;
	bh=VRkzcsoUJfRBUzC0gVeg2/ud2UbGnnUh8Ve5wOMQDP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PygIG5wuz8yeKWgbn0xrOjATdizgdls6dHtGOow1nG9vYcB3FifaSP4RIJYiEsLWz
	 nE1JXqjuH326rvOouGANt0XP9X5t/FksOwxpf72uRiWoWd3NLKzmNke/zsYQ1Ba7WA
	 iUb8N8WveeL2gyeYUpZDsE1+Uz9QjDge6T9dPrkLF0eN5RUWW6bdvgaDfUyfw/X+rt
	 hZS7mwJfwMnYoDZ/adawIG/9OMd2UMZ4xzDvF1uercJny5V02YJB1b0GqJWlree7LK
	 Vr/AgioINqU/ToIzgDeIeyiZlzUEClPz24k36nw1hjzl3AktJm0c4rBCxDtQcTumG9
	 8yAVShri0bzRw==
Message-ID: <sashiko-outbox-195512@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND] gpio: sim: fix the configfs lockup racing
 with mkdir/rmdir
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103143136.62155-1-yuz08559@gmail.com>
References: <20261103143136.62155-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:49:54 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: sim: empty banks not depended on in gpio_sim_device_lockup_c=
onfigfs()
--

commit 912c87ed34604f75f35efcd268b39a5c4d993d4d
Author: Yu Zhang <yuz08559@gmail.com>

gpio: sim: fix the configfs lockup racing with mkdir/rmdir

This commit fixes races between toggling a gpio-sim device's live state
and concurrent configfs directory creation or removal by holding both the
configfs subsystem mutex and dev->lock across the transition and recording
the leaf configfs items that were depended on.

> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 0c73bec042670..abc73bb0b44b0 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c

[ ... ]

> @@ -974,31 +978,80 @@ static void gpio_sim_device_deactivate(struct gpio_=
sim_device *dev)
>  	gpio_sim_remove_swnode_recursive(swnode);
>  }
> =20
> -static void
> -gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
> +static void gpio_sim_device_unlock_configfs(struct gpio_sim_device *dev)
> +{
> +	unsigned int i;
> +
> +	lockdep_assert_held(&dev->lock);
> +
> +	for (i =3D 0; i < dev->num_deps; i++)
> +		configfs_undepend_item_unlocked(dev->deps[i]);
> +
> +	kfree(dev->deps);
> +	dev->deps =3D NULL;
> +	dev->num_deps =3D 0;
> +}
> +
> +static int gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev)
>  {
>  	struct configfs_subsystem *subsys =3D dev->group.cg_subsys;
>  	struct gpio_sim_bank *bank;
>  	struct gpio_sim_line *line;
>  	struct config_item *item;
> +	unsigned int num =3D 0;
> +	int ret;
> +
> +	lockdep_assert_held(&subsys->su_mutex);
> +	lockdep_assert_held(&dev->lock);
> =20
>  	/*
>  	 * The device only needs to depend on leaf entries. This is
>  	 * sufficient to lock up all the configfs entries that the
>  	 * instantiated, alive device depends on.
> +	 *
> +	 * dev->lock keeps the bank and line lists stable and the subsystem
> +	 * mutex keeps the entries' ci_group stable. An entry that is still
> +	 * being created or removed cannot be depended on, in which case the
> +	 * device is not brought up. The entries that were actually depended
> +	 * on are recorded, so that exactly those are undepended when the
> +	 * device goes down.
>  	 */
> +	list_for_each_entry(bank, &dev->bank_list, siblings)
> +		num +=3D list_count_nodes(&bank->line_list);
> +
> +	if (!num)
> +		return 0;
> +
> +	dev->deps =3D kzalloc_objs(*dev->deps, num);
> +	if (!dev->deps)
> +		return -ENOMEM;
> +
>  	list_for_each_entry(bank, &dev->bank_list, siblings) {
>  		list_for_each_entry(line, &bank->line_list, siblings) {
>  			item =3D line->hog ? &line->hog->item
>  					 : &line->group.cg_item;

[Severity: High]
What happens in gpio_sim_device_lockup_configfs() when a bank in
dev->bank_list has an empty bank->line_list?

Creating line<offset> subdirectories under a bank is optional (a new bank
defaults to num_lines =3D 1 with an empty bank->line_list). When
bank->line_list is empty, the leaf configfs entry for that bank is
&bank->group.cg_item, but gpio_sim_device_lockup_configfs() only counts
and iterates over bank->line_list.

As a result, &bank->group.cg_item is never passed to
configfs_depend_item_unlocked(). This appears to leave two issues:

1. If a device is activated with a bank that has no line subdirectories,
   userspace can remove the bank directory (and then the device directory)
   with rmdir while the platform device is still live.

2. A bank being created by configfs_mkdir() or removed by configfs_rmdir()
   always has an empty bank->line_list. During configfs_rmdir() of a bank,
   unlink_group() clears bank->group.cg_item.ci_group and drops
   subsys->su_mutex before config_item_put() calls
   gpio_sim_bank_config_group_release():

   drivers/gpio/gpio-sim.c:gpio_sim_bank_config_group_release() {
       ...
       scoped_guard(mutex, &dev->lock)
           list_del(&bank->siblings);

       kfree(bank->label);
       kfree(bank);
   }

   Similarly, during configfs_mkdir() of a bank,
   gpio_sim_device_config_make_bank_group() adds the bank to
   dev->bank_list before configfs_mkdir() drops subsys->su_mutex and
   finishes attaching the group (or unlinks and frees it on error).

   If gpio_sim_device_config_live_store() runs during either window,
   gpio_sim_device_lockup_configfs() skips the empty bank instead of
   checking &bank->group.cg_item and returning -EBUSY, allowing
   gpio_sim_device_activate() to use a bank that is about to be unlinked
   and freed.

Should a bank with an empty line_list be counted and depended on via
&bank->group.cg_item as a leaf item?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103143136.6215=
5-1-yuz08559@gmail.com?part=3D1
