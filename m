Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438260;
	b=f22rFZ1MfKsH98r9ekSz9dh8yUJG0zpJWNNpsg3VcDH9rohH0tr1ZjyhKHXMO+L6vKR0
	 u9jnn88E3womkdTLm1UPOVTbC2oulCc/IY+zRJAyjZPNOOoYk3sl63Zf2jhY/88SMLCx+
	 UlUIF+JlldIBshIEPZG64U7/JW3115EfHmOGnA1UfFySZBAjdSSO/erY4YpHSQQVGgoZh
	 AGU8gUadh1cRuBxQ50uxJbw0DPjsf9Wc+05UnEyED0czexLpCEMW8pMBrZyxrSIPPVqWi
	 Kwg8gdUlCWTSU3IS8u3h3F6YDz/7VqaRO5IJZCMRO8zI9wGGK7csoVSiT1ZDf39G8Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438260;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nFHi5+PTbvdWMIRkq8j1w9A4qvjg0FjKEaYZyLyCejI=;
	b=FRjK4kQsJDBG1+XSPhOtvESMQ/YPZ3mkTmFVjSBtfxRtMgDJsTNYnDflPWYMktwu7aHS
	 WMdqEqm9+YXss3tDsaMlbLkbnJlE4+SpYsVorHDDzbQ1tdCrsKNY9PVssVtq1pvN8X/1v
	 ZPZsF5TEZ0e2IMqisjw1k4agoP0pwhYPLnMKjOEmf5etD54oNI8Didi+W3LCdGnPal0YQ
	 FXTjoD/AxviH0NPrgnZVDBVcj8Jjm3CSWvAM+gucs7X0VLFqirJa2zBU75IYKw8wYbxgU
	 ztieyOYYWY93un1LCzPwts4VQpcHxdXxQduHN6jCFKHJrJafWMGQIVzJmSpW61oNYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RoykFTo1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AE606A31D
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RoykFTo1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728891F0093A;
	Sat, 31 Oct 2026 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793438259;
	bh=nFHi5+PTbvdWMIRkq8j1w9A4qvjg0FjKEaYZyLyCejI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RoykFTo1D1Gja5BtFUs5LRPpBhHshJjDRFbGmSn2rLKl4NPhBwDpgBC4ILTLnqhYQ
	 SjVv7Bt4dfxh5EhOEWS7/BEfFsB/fafHbLGInQcTJv68qpy0EdgMEcEH1Mfx5gbfeb
	 +C/s3/7t6B4Br40O+2WL+wYo8m39fK+eVEhP/1CkDZBALWaSHCpish7kg9Ij4FInMB
	 7RIl131npjtqJESgZVnszTjeXirFYMeXiyDbsP6oBRUBSGlekqYhqWC+ZlcrwYtqDO
	 I+QsRnDJHo7OgJDdpoX6Vh5VS/YXNcm210Le0Krzv68doaSt+L+T7MrIGb8fj88dKc
	 0c6vvWZx1X5Ig==
Message-ID: <sashiko-outbox-191860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] gpio: sim: fix the configfs lockup racing with
 mkdir/rmdir
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261031085821.23385-1-yuz08559@gmail.com>
References: <20261027085653.90471-1-yuz08559@gmail.com>
 <20261031085821.23385-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 09:17:38 +0000
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
- [Medium] gpio: sim: missing leaf bank dependency in gpio_sim_device_locku=
p_configfs()
--

commit e531f54ece1332b506f6748423ca9ef1c7ee7f17
Author: Yu Zhang <yuz08559@gmail.com>

gpio: sim: fix the configfs lockup racing with mkdir/rmdir

This commit fixes races between activating/deactivating a simulated GPIO
device and concurrent configfs mkdir/rmdir operations by holding the config=
fs
subsystem mutex and dev->lock across live transitions and recording the
depended leaf items.

> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 34b45d0d35750..041bbdc5187b6 100644
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

[Severity: Medium]
What happens in gpio_sim_device_lockup_configfs() when a bank has no line
subdirectories and bank->line_list is empty?

In gpio_sim_device_config_make_bank_group(), a bank is initialized with
bank->num_lines =3D 1 and an empty bank->line_list, so creating line<offset>
subdirectories is optional. When bank->line_list is empty,
&bank->group.cg_item is itself the leaf configfs entry for that bank.

Because gpio_sim_device_lockup_configfs() only counts and iterates over
bank->line_list, any bank with an empty line_list is skipped:

1. If a bank has no line subdirectories when the device is activated,
   &bank->group.cg_item is never depended on. While the device is live,
   userspace can rmdir the bank directory (causing
   gpio_sim_bank_config_group_release() to unlink and free struct
   gpio_sim_bank) and even rmdir the live device directory itself.

2. A bank directory in the middle of configfs_mkdir() or configfs_rmdir()
   also has an empty bank->line_list. During configfs_rmdir(), for example,
   subsys->su_mutex is unlocked before config_item_put() invokes
   gpio_sim_bank_config_group_release() to remove bank->siblings from
   dev->bank_list under dev->lock:

   fs/configfs/dir.c:configfs_rmdir() {
       ...
       unlink_group(group);
       client_drop_item(parent_item, item);
       mutex_unlock(&subsys->su_mutex);

       /* Drop our reference from above */
       config_item_put(item);
   }

   If gpio_sim_device_config_live_store() acquires subsys->su_mutex and
   dev->lock in that window (or the similar window in configfs_mkdir() befo=
re
   configfs_attach_group() finishes), gpio_sim_device_lockup_configfs() ski=
ps
   the empty bank instead of checking &bank->group.cg_item and returning
   -EBUSY, allowing gpio_sim_device_activate() to use a bank that is still
   being created or is about to be freed.

Should gpio_sim_device_lockup_configfs() count and depend on
&bank->group.cg_item whenever list_empty(&bank->line_list) is true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031085821.2338=
5-1-yuz08559@gmail.com?part=3D1
