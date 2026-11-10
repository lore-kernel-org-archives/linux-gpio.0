Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305677;
	b=y0vkd8kzPc63MnvroG/U8cxNK+FtJzWrBurh0d+NJ+nLSgpPS5IMrx+hbx/Nve3auVA9
	 w03NhacM7lUcZGL5OufHZXM2ZvFq52wejW4oqn32c+PZUdauPfFNFvlLT/cGpy0omK7VP
	 JADWHPPMsccQhzsbZcbysPBJ77BZfw45qwasdL1ESTsjt+cXXnSZrl9a2bYL3q/1E9ON7
	 P6L7H732Z9W8rSUmZq2BJfdsP56oyS0xuWdCUmD8rWnxA/Hr186qrXsJsdsZNhibqeWEo
	 OO1gUi5LgjOEeceXnqLt7x2qNnu/cZGVHbiA6BpFA/PZjS7AtdH08EMvL52yKnRrjTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QZBHF3Pilskj96yRttgo8CL+alyzO3KOkyxepRghXC0=;
	b=gwjWgNui3UeOBs7rRzpCwvwH5BOKsPTY3zWAgY8pAInO/Kd3Db93tf6Kmlck+r+mSsCR
	 C9297wLDf1lRvnM8ocdp1u/YvgLTKxKXxxxb8h+YPlzJZwehsaJqJCgn3292+YGbG075N
	 Qn76iC3Fq1t5Ic9J3TmAIAw/3ruqPvnkx3BRrRYdP7QyX9cWLCPyi6yEak/oHAX1Abbgz
	 W1CnzS12S6OIOD1QoBV/hsWRrL+nuiVxGnhRRRqNG7MqiN8Ih+AFM+Bv6xL/41AXa8mpk
	 XNYgw2SPgfKaBwqQ1Jjw8ewvNlkTZTGzCKu+eXIxQLVBRKTTWiVgRshTxhnS8zvY3iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hd0jEzwa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D12606A321;
	Tue, 10 Nov 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hd0jEzwa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00B91F008A1;
	Tue, 10 Nov 2026 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305676;
	bh=QZBHF3Pilskj96yRttgo8CL+alyzO3KOkyxepRghXC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hd0jEzwaV4eGo7hdcvApJ60ycNTq/4BsRA6VOsLVwAfw0buh/LeU7tZae4QyrYkFS
	 9aq5lmXtZu6YguyUW+56eqh7lFOUFXfoTryuKHaftHyo2xS81gITZ6Wld8IN+E1Jjq
	 w7kFk+KeHZBoGCuZVKR8pzLcTVldsVo2xWFajPF5bJhYqt7SVI6cqfdB8WswPOl+jB
	 o8u6tS6+moD4y1GWU9UVm6y/PUszGQNCvLP2wptBn50rDiQVlmn5k5NS9Olo8ptB3t
	 MDo1A2Np3k99FymIDaVhn4KwNi8rpVg0COEcMkCOu5jboerPxMv3r8M4DnJYPJZsqI
	 hNjnF32Vs0Kbw==
Message-ID: <sashiko-outbox-206845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] pinctrl: airoha: configure pin muxes on GPIO
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhengping Zhang" <zhengping.zhang@airoha.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110094339.749110-3-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-3-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:14:35 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] pinctrl: airoha: pinmux ownership bypass and mux_setting
  corruption with function_is_gpio()
- [Medium] pinctrl: airoha: false -EBUSY conflict in
  airoha_pinmux_check_conflicts()
--

commit 9a9749c74aba6ad54ceaf9a1debe606913f398d5
Author: Zhengping Zhang <zhengping.zhang@airoha.com>

pinctrl: airoha: configure pin muxes on GPIO requests

This commit adds a gpio_request_enable callback to configure pin muxes when
a GPIO is requested and introduces optional conflict detection for shared
mux bits across pin groups and GPIO owners.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 8dd0881bba4ad..25562e51ebbdc 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -400,57 +400,236 @@ static int airoha_pinctrl_add_gpiochip(struct airo=
ha_pinctrl *pinctrl,

[ ... ]

> +/* Shared mux bits can affect pads outside the requested pin group. */
> +static bool
> +airoha_pinmux_groups_conflict(const struct airoha_pinctrl_func_group *a,
> +			     const struct airoha_pinctrl_func_group *b)
> +{
> +	int i, j;
> +
> +	for (i =3D 0; i < a->regmap_size; i++) {
> +		for (j =3D 0; j < b->regmap_size; j++) {
> +			u32 mask;
> =20
> -		group =3D &func->groups[i];
> -		if (strcmp(group->name, grp->grp.name))
> +			if ((a->regmap[i].mux =3D=3D AIROHA_FUNC_MUX) !=3D
> +			    (b->regmap[j].mux =3D=3D AIROHA_FUNC_MUX) ||
> +			    a->regmap[i].offset !=3D b->regmap[j].offset)
> +				continue;
> +
> +			mask =3D a->regmap[i].mask & b->regmap[j].mask;
> +			if (mask & (a->regmap[i].val ^ b->regmap[j].val))
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}

[ ... ]

> +static int
> +airoha_pinmux_check_conflicts(struct pinctrl_dev *pctldev,
> +			     const struct airoha_pinctrl_func_group *group)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < pctldev->desc->npins; i++) {
> +		const struct airoha_pinctrl_func_group *active;
> +		struct pinctrl_setting_mux setting;
> +		unsigned int number =3D pctldev->desc->pins[i].number;
> +		struct pin_desc *pin;
> +		bool claimed, gpio_owned;
> +
> +		pin =3D pin_desc_get(pctldev, number);
> +		if (!pin)
> +			continue;
> +
> +		scoped_guard(mutex, &pin->mux_lock) {
> +			claimed =3D pin->mux_usecount && pin->mux_setting;
> +			gpio_owned =3D !!pin->gpio_owner;
> +			if (claimed)
> +				setting =3D *pin->mux_setting;
> +		}
> +
> +		/* GPIO requests need no explicit DTS pinctrl state. */
> +		if (gpio_owned) {
> +			active =3D airoha_pinmux_get_gpio_group(pctldev, number);
> +			if (!active)
> +				return -EOPNOTSUPP;
> +			if (airoha_pinmux_groups_conflict(group, active))
> +				goto conflict;
> +		}
> +
> +		if (!claimed)
> +			continue;
> +		active =3D airoha_pinmux_get_func_group(pctldev, setting.func,
> +						    setting.group);
> +		if (!active)
> +			return -EINVAL;
> +		if (!airoha_pinmux_groups_conflict(group, active))
> +			continue;
> +
> +conflict:
> +		dev_err(pctldev->dev,
> +			"group %s conflicts with shared mux bits of group %s\n",
> +			group->name, active->name);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does airoha_pinmux_check_conflicts() reject valid two-group HSUART
configurations (groups =3D "hsuart", "hsuart_cts_rts") with -EBUSY on SoCs
that enable check_mux_conflicts?

On AN7581 and AN7583, hsuart_pins contains only the TX/RX pins and
hsuart_cts_rts_pins contains only the CTS/RTS pins, so enabling HSUART with
hardware flow control requires selecting both groups. However, in
uart_func_group, the "hsuart" entry includes GPIO_HSUART_CTS_RTS_MODE_MASK
in regmap[0].mask with val =3D GPIO_HSUART_MODE_MASK, whereas
"hsuart_cts_rts" sets the same mask with val =3D GPIO_HSUART_MODE_MASK |
GPIO_HSUART_CTS_RTS_MODE_MASK. When pinctrl_commit_state() enables the
second group after claiming the first, airoha_pinmux_groups_conflict() sees
differing values on GPIO_HSUART_CTS_RTS_MODE_MASK and fails the state
transition with -EBUSY.

[ ... ]

> +static int airoha_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +			       unsigned int selector, unsigned int group)
> +{
> +	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct airoha_pinctrl_func_group *config;
> +	int i, err;
> +
> +	config =3D airoha_pinmux_get_func_group(pctldev, selector, group);
> +	if (!config)
> +		return -EINVAL;
> +
> +	guard(mutex)(&pinctrl->mux_lock);
> +	if (pinctrl->check_mux_conflicts) {
> +		struct group_desc *grp;
> +
> +		/* The core permits GPIO-category muxes alongside GPIO owners. */
> +		grp =3D pinctrl_generic_get_group(pctldev, group);
> +		if (!pinmux_generic_function_is_gpio(pctldev, selector)) {
> +			for (i =3D 0; i < grp->grp.npins; i++) {
> +				struct pin_desc *pin;
> +
> +				pin =3D pin_desc_get(pctldev, grp->grp.pins[i]);
> +				if (!pin)
> +					return -EINVAL;
> +				scoped_guard(mutex, &pin->mux_lock) {
> +					if (pin->gpio_owner)
> +						return -EBUSY;
> +				}
> +			}
> +		}
> +
> +		err =3D airoha_pinmux_check_conflicts(pctldev, config);
> +		if (err)
> +			return err;
>  	}
> =20
> -	return -EINVAL;
> +	dev_dbg(pctldev->dev, "enable function %s group %s\n",
> +		pinmux_generic_get_function_name(pctldev, selector),
> +		config->name);
> +
> +	return airoha_pinmux_apply_group(pinctrl, config);
>  }
> =20
>  static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
> @@ -468,6 +647,8 @@ static int airoha_pinmux_set_direction(struct pinctrl=
_dev *pctrl_dev,
>  }
> =20
>  static const struct pinmux_ops airoha_pmxops =3D {
> +	.gpio_request_enable =3D airoha_gpio_request_enable,
> +	.function_is_gpio =3D pinmux_generic_function_is_gpio,

[Severity: Medium]
Can setting .function_is_gpio allow a second consumer to bypass pinmux
ownership and corrupt pin->mux_setting when a pin is already claimed by an
explicit GPIO-category pinctrl state?

When a pin's active pin->mux_setting has PINFUNCTION_FLAG_GPIO (via
PINCTRL_GPIO_FUNC_DESC), a second consumer calling pinmux_enable_setting()
on a group containing that pin causes pin_request() to set gpio_ok =3D true,
skip the mux_owner check, and increment pin->mux_usecount to 2:

drivers/pinctrl/pinmux.c:pin_request() {
    ...
	if (gpio_range || ops->strict) {
		if (desc->mux_usecount && !gpio_ok) {
			dev_err(pctldev->dev,
				"pin %s already requested by %s; cannot claim for %s\n",
				desc->name, desc->mux_owner, owner);
			goto out;
		}
    ...
}

pinmux_enable_setting() then overwrites pin->mux_setting with the new
setting before calling airoha_pinmux_set_mux(). Because
airoha_pinmux_set_mux() only checks pin->gpio_owner, if the pin has no GPIO
descriptor owner, airoha_pinmux_check_conflicts() sees the already
overwritten pin->mux_setting and overwrites the first device's hardware mux
without detecting the conflict. Conversely, if airoha_pinmux_set_mux()
returns -EBUSY, pinmux_enable_setting()'s error path clears
pin->mux_setting to NULL while pin_free() only decrements pin->mux_usecount
to 1, hiding the first owner's active mux from subsequent conflict checks
and preventing pinmux_disable_setting() from releasing the pin.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110094339.7491=
10-1-zhengping.zhang@airoha.com?part=3D2
