Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321654;
	b=YOaYxi//0e18ion1UawA2Y+FBF6ZJP+v1J8qRyrkUhiQIyFjWd/iwbm43f8sT0GroedR
	 qAFLYdmCvd15zfo7WVcdWJvAHpAUgo080j9mnXA+/r6tM9ODkxPzXDhA6KPSmcv0AqjlG
	 cmAS6OYOJeR28Oh7koMxsGzd6A/sZtG6uHqGR1QZSlIiYmh3W+LXU3YgipMysgvWXc2uZ
	 kwzpyIl8roKVcfVreIUVGdgWxqevdL5RI7NvQQ1zKQEist44LKxgcaL72zq5n86tD+Llw
	 6Q/vXdd9RfS7qN3N8z+Gv0lkVW7xz9KiFIrSrin7tdlmEhRQUCc2LyFGDbKoMcWXq1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321654;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sy0r9F+Az0xK7r4VzTWIINl0ay8Dddv38l9X2AM0tA0=;
	b=N5Q++X6wmdpSohq66xx3w92T+1+y0tUdM+iBps1WdfE/M+ay4cI0mOQ1yNiSDVhM134Z
	 iPIf1rqWtBUVVE74fn9iDFTwh0+f2pJnHHB/DV0yW+dAqZiX1Gu64uP9fZQeMKoGaDl5A
	 eV0vtBQJN6MzA2Pw6lq1BrxMVVxMXsJ3O4/3RzZwAxwdq/ZIGdCuxUwSFImkGGaLTmNl/
	 BnevBG/fQeluI6tm80OIGSxuqE8vK/W7DbREHn3u4tw6cPwD2JXQPKP9AMw9l+9FxanxP
	 T3OKwiU035q2pNaWs9tDBfOIUUksbyxYr76KRU5xI0k9lM6Bjd1AQRfeU+OBtDxgT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inDkL2P9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ABD606A31C;
	Tue, 10 Nov 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inDkL2P9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E621F008A1;
	Tue, 10 Nov 2026 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321653;
	bh=Sy0r9F+Az0xK7r4VzTWIINl0ay8Dddv38l9X2AM0tA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=inDkL2P9bFpO4QRyW2PxkJKYTnr8VOnW+MS3ZGP1czOGkHybRJTKjKTL0qtJBmA9h
	 JFFpeXzQk8QkLJMbQmw2UwMUH3gV0gZFadZnSaz7KTtzzyz5TUithWcBwNF16kiGBN
	 c4nZFqYFKQfJoJQ/LFNYb45q46A0PSyMR8i/PgFtR2sQG9BBQeVBGeirY/I4woEZl+
	 1jc3g3qDd25WFe+ufed6D/970sTMu95zu69RkxmZHmBRB5KzQzHep6kHGF1HfTVMeJ
	 EE5869wAZPicFdBdJAcVApwnC6PxTG2RDamTsiExxTwPkpGOIU15aSRQ4cqIzNFUKG
	 imK4cZ7CyrTUA==
Message-ID: <sashiko-outbox-207202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maciej Strozek" <mstrozek@opensource.cirrus.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 14:40:52 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] pinctrl: cirrus: cs42l43: unbalanced fwnode put in
  cs42l43_pin_probe() [1]
--

commit 1aa7ff7b2b9b125f7c2e43385c49822080f93214
Author: Maciej Strozek <mstrozek@opensource.cirrus.com>

pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs

This commit adds support for driving speaker and microphone mute LEDs via
cs42l43 GPIOs when described by ACPI properties.

> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/c=
irrus/pinctrl-cs42l43.c
> index a1c839b355578..44a9a759e0f65 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c

[ ... ]

> @@ -598,6 +748,12 @@ static int cs42l43_pin_probe(struct platform_device =
*pdev)
>  		return dev_err_probe(priv->dev, ret,
>  				     "Failed to register gpiochip\n");
> =20
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +	ret =3D cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
> +	if (ret)
> +		return ret;
> +#endif
> +
>  	return 0;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but does assigning fwnode via
device_set_node() in cs42l43_pin_probe() cause an unbalanced
fwnode_handle_put() [1] when the platform device is released?

Earlier in cs42l43_pin_probe(), fwnode is initialized from the parent MFD
device or looked up from the "pinctrl" child node, and then assigned to
priv->dev:

drivers/pinctrl/cirrus/pinctrl-cs42l43.c:cs42l43_pin_probe() {
	...
	if (is_of_node(fwnode)) {
		struct fwnode_handle *child;

		child =3D fwnode_get_named_child_node(fwnode, "pinctrl");
		if (child) {
			ret =3D devm_add_action_or_reset(&pdev->dev,
				cs42l43_fwnode_put, child);
			if (ret)
				return ret;

			if (!child->dev)
				child->dev =3D priv->dev;
			fwnode =3D child;
		}
	}

	priv->gpio_chip.fwnode =3D fwnode;

	device_set_node(priv->dev, fwnode);
	...
}

Unlike device_add_software_node(), device_set_node() does not acquire a
reference on fwnode, whereas platform_device_release() unconditionally drop=
s a
reference on non-software nodes when the platform device is freed:

drivers/base/platform.c:platform_device_release() {
	...
	if (!is_software_node(dev_fwnode(dev)))
		fwnode_handle_put(pa->pdev.dev.fwnode);
	...
}

When the "pinctrl" child node is present, its single reference from
fwnode_get_named_child_node() is already released by cs42l43_fwnode_put() v=
ia
devres; otherwise fwnode belongs to cs42l43->dev with no extra reference
taken.  When the platform device is later unregistered,
platform_device_release() puts pdev->dev.fwnode an extra time, underflowing
the fwnode reference count and risking a use-after-free.

[1] https://sashiko.dev/#/bug/linux-a633bdf8-b5fe-4770-b14c-d3532525ae12

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110142058.3545=
18-1-mstrozek@opensource.cirrus.com?part=3D1
