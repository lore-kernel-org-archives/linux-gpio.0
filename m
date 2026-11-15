Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740503;
	b=qI498j0a0adib6BpInlE59IcG1mQFgyPOoB8aiqocKAG52nLS5WGOtyXQDtX4+Hyww6j
	 ZyBCh532tf3eBqHVCHbgkOv1+0dxAGjFWpst4/IihOhxd957FRjCuSi6lkpJJr/yYzO5H
	 C/eLzB40HHM4pfELGwrHXTAWUrDFSlOovGB5QdTI1rOuCVtKKIfyKeFKJEg9Mw2sCM8Mu
	 RzcQrf5cM5KHpOfoB3LiHCb+ZDqzXh6mAZAYTIYPfkJ/59jGTrKLRjBA0MkrztAqSo2FR
	 vsiE0dPfpVl/bbznBnMRrhHDfmEC8lXXGQNgG7iQNkAs1bB0B3Jt+rCYQO5CJIyMhAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740503;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4y8YfBFn/sD3+H60Q9x+7MvRVBt7bYEBbpGLtyPrw/k=;
	b=HdGxLiHtA8Z2e+3CJrQTGxUVNIFVaDA4wiy3JvX9WLkFtBZVoIJ7/JjY3vlZoxtRfA52
	 zdTcXUR+c2vbmvIlroUfJCQjNQ0MjdoIRSEedP+iVbj1H8spA7426AzxdFANa1oKu8B2q
	 yX1iGB6WXdu4decQAOFuxW60Mekr4kSmKbrcotuK1Cd95JKaEPdaaqMe3zvGx4WHl9FPD
	 QB0ko5+CkfetVf3oTd9/sWqqbYTsqHz2fdCFJR7ClbYaAI4vQnXKA0tcZotzvuGPJtNXP
	 J/5RshrmaRz7btvsvNk6F3Xq/cBC8vR/RCdWh8iiNLAuD+BeRPMCM8gzNfvYte+Y4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsmk7Ywu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE47606A323;
	Sun, 15 Nov 2026 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsmk7Ywu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F54C1F000C4;
	Sun, 15 Nov 2026 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740502;
	bh=4y8YfBFn/sD3+H60Q9x+7MvRVBt7bYEBbpGLtyPrw/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bsmk7Ywu9oTI8gVLc4ZFOmJwjE3FekOcCHSvSK82jAQ4uWbXi1WsLTCBMwiwMkzDd
	 tSdZc5arnO0nTBnP2lUr9ay4FNzYRYr6QySAAzbL0L+ZJm8NJH8+Y7c1JqetrbpL+i
	 X2hJexnDevQ2HVv9868QIhM4V0zHHkhhVKuKQ/iOwaXSRaOS9FjWzvLsqFX8GbCzLN
	 9JjGfyVlEEY0ZCzTpBX49wwR22fyun7eOet06OHBFGk2RNZiUytZF8x6Cn6Pq/qtx0
	 HHPvnceDe/D48QAtFUB3VZ2UqcW1mjMBuc77Tj2T2M+zVdVxuEcdbueQQIQwpW0qwU
	 Q18KLJ/Euqvmw==
Message-ID: <sashiko-outbox-215435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] pinctrl: berlin: add optional pinconf support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-5-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-5-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:01:42 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] pinctrl: berlin: memory leak on error in
  berlin_pinctrl_dt_node_to_map()
- [Medium] pinctrl: berlin: wrong errno -EOPNOTSUPP in
  berlin_pinconf_group_get()
- [Low] pinctrl: berlin: map over-allocation in
  berlin_pinctrl_dt_node_to_map()
- [Low] pinctrl: berlin: berlin_pinconf_group_get() fails when slew rate
  is 0
--

commit 8d9a060e7649872ae247085353d00ffa248ae051
Author: Jisheng Zhang <jszhang@kernel.org>

pinctrl: berlin: add optional pinconf support

This commit adds generic pin configuration support (bias, drive strength,
input enable, Schmitt trigger, and slew rate) to the Berlin pinctrl driver
for 8-bit and 10-bit group configuration registers.

> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/ber=
lin.c
> index a0ae75b1d705d..0edf9d5a2a7b7 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
[ ... ]
> @@ -75,11 +95,19 @@ static int berlin_pinctrl_dt_node_to_map(struct pinct=
rl_dev *pctrl_dev,
>  		return -EINVAL;
>  	}
> =20
> +	ret =3D pinconf_generic_parse_dt_config(node, pctrl_dev, &configs,
> +					      &num_configs);
> +	if (ret < 0) {
> +		dev_err(pctrl->dev, "%s: could not parse node property\n",
> +			node->name);
> +		return ret;
> +	}
> +
>  	ret =3D pinctrl_utils_reserve_map(pctrl_dev, map, &reserved_maps,
> -					num_maps, ngroups);
> +					num_maps, ngroups * (num_configs + 1));

[Severity: Low]
Does this over-allocate *map when num_configs > 1?
pinctrl_utils_add_map_configs() packs all num_configs entries for a group
into a single PIN_MAP_TYPE_CONFIGS_GROUP map slot, so each group uses at
most two map entries (ngroups * (!!num_configs + 1) in total), leaving
ngroups * (num_configs - 1) reserved entries unused.

>  	if (ret) {
>  		dev_err(pctrl->dev, "can't reserve map: %d\n", ret);
> -		return ret;
> +		goto exit;
>  	}
> =20
>  	of_property_for_each_string(node, "groups", prop, group_name) {
> @@ -88,11 +116,22 @@ static int berlin_pinctrl_dt_node_to_map(struct pinc=
trl_dev *pctrl_dev,
>  						function_name);
>  		if (ret) {
>  			dev_err(pctrl->dev, "can't add map: %d\n", ret);
> -			return ret;
> +			goto exit;
> +		}
> +
> +		if (num_configs) {
> +			ret =3D pinctrl_utils_add_map_configs(pctrl_dev, map,
> +					&reserved_maps, num_maps, group_name,
> +					configs, num_configs,
> +					PIN_MAP_TYPE_CONFIGS_GROUP);
> +			if (ret < 0)
> +				goto exit;
>  		}
>  	}
> =20
> -	return 0;
> +exit:
> +	kfree(configs);
> +	return ret;
>  }

[Severity: Medium]
Does the error path leak *map and any per-group config arrays already
duplicated by pinctrl_utils_add_map_configs()?

When ops->dt_node_to_map() returns a negative error code, the caller
dt_to_map_one_config() in drivers/pinctrl/devicetree.c returns immediately
without freeing the partially constructed map.  If
pinctrl_utils_add_map_mux() or pinctrl_utils_add_map_configs() fails in the
loop after pinctrl_utils_reserve_map() allocated *map, jumping to exit only
frees the temporary configs array and leaks *map along with any configs
duplicated for earlier groups.  Calling pinctrl_utils_free_map(pctrl_dev,
*map, *num_maps) when ret < 0 would clean these up.

> @@ -177,6 +216,190 @@ static const struct pinmux_ops berlin_pinmux_ops =
=3D {
>  	.set_mux		=3D &berlin_pinmux_set,
>  };
> =20
> +static int berlin_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
> +				    unsigned int group, unsigned long *configs)
> +{
> +	enum pin_config_param param =3D pinconf_to_config_param(*configs);
> +	struct berlin_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> +	const struct berlin_desc_group *group_desc =3D pctrl->desc->groups + gr=
oup;
> +	bool enabled;
> +	u32 val;
> +	int ret;
> +	u8 conf_bits =3D group_desc->conf_bits;
> +
> +	if (!conf_bits)
> +		return -EOPNOTSUPP;
[ ... ]
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (conf_bits =3D=3D 10)
> +			enabled =3D val & PINCFG_SL_10BIT;
> +		else
> +			enabled =3D val & PINCFG_SL_8BIT;
> +		val =3D enabled ? 1 : 0;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	*configs =3D pinconf_to_config_packed(param, val);
> +	return enabled ? 0 : -EINVAL;
> +}

[Severity: Low]
Does querying PIN_CONFIG_SLEW_RATE fail with -EINVAL whenever the slew rate
bit is 0?

berlin_pinconf_group_set() accepts 0 as a valid slew-rate argument to clear
PINCFG_SL_10BIT or PINCFG_SL_8BIT, but berlin_pinconf_group_get() sets
enabled from that bit and returns -EINVAL when enabled is false, so a slew
rate of 0 cannot be read back (for example via debugfs pinconf-groups).
Setting enabled =3D true as in the PIN_CONFIG_DRIVE_STRENGTH case would all=
ow
both 0 and 1 to be reported.

> +
> +static int berlin_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
> +				    unsigned int group, unsigned long *configs,
> +				    unsigned int nconfigs)
> +{
> +	struct berlin_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> +	const struct berlin_desc_group *group_desc =3D pctrl->desc->groups + gr=
oup;
> +	u8 conf_bits =3D group_desc->conf_bits;
> +	u32 mask =3D 0, val =3D 0;
> +	int i;
> +
> +	if (!conf_bits)
> +		return -EOPNOTSUPP;
[ ... ]
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}

[Severity: Medium]
Should berlin_pinconf_group_get() and berlin_pinconf_group_set() return
-ENOTSUPP instead of -EOPNOTSUPP when !conf_bits or when param is not
supported?

With .is_generic =3D true, reading debugfs pinconf-groups calls
pinconf_generic_dump_one(), which queries every generic parameter in
conf_items[] and only treats -EINVAL and -ENOTSUPP as legal responses:

drivers/pinctrl/pinconf-generic.c:pinconf_generic_dump_one() {
	...
		ret =3D pin_config_group_get(dev_name(pctldev->dev),
					   pindesc->name, &config);
		/* These are legal errors */
		if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTSUPP)
			continue;
		if (ret) {
			seq_printf(s, "ERROR READING CONFIG SETTING %d ", i);
			continue;
		}
	...
}

Returning -EOPNOTSUPP causes debugfs pinconf-groups to print "ERROR READING
CONFIG SETTING" for every unsupported parameter and for any group with
conf_bits =3D=3D 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D4
