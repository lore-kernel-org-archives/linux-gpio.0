Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855D29405;
	Fri, 16 Oct 2026 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125725; cv=none; b=dnzwvl24RnoNOFaydr3ed5JS8Kr79ZCzEH7zrLbXSrkUKr6t2caTLbTAdzDDBqsuSnoiB8M9CTuMa4c7v9t1MVwnF9U7uQ7vzRisaDAvzoEoW/DcnWJDZvhSUuI87yxcCxuDG0fZ8IgD0K9LokSDlHNA3XHVFN+Bu1MWJrg1uGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125725; c=relaxed/simple;
	bh=ZrgQAQDYO2bpE92E4Uy/JHmPRnpZRe3zBj3yBY4GyRI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RMXoPAjJ+ybK9ylgzyJVIJwf1+fa6Ss3jWRZ6rLGZoUwC/sW4YzkXeqShmJwRj9pnjkrBXIKTyNheVeeknQ9N6JzMFAznpV2HJLz9uloT1vvBRnHoO2/eUpuK8ONdlFePI9my2ju/gzQE689SY0wCktWaWfapA7MYBhR8S5xV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+2eerLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+2eerLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34C61F000C4;
	Fri, 16 Oct 2026 04:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125724;
	bh=j9KkGyvE/QTHDV5ImFSuUA44UXpfrxq9ohSCuUT545s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+2eerLZqXeTnYyhObBtL1XUCIxjLJfM40yBpwBHObYHSmiTcPRKqqGSfYn51ycbJ
	 iLXiCdmGSeMuGnMNgIySwQz72dT2RysP50o7FO32z7bhI2CeZkKToxd3HfYOU6yjzh
	 7A2MzYQx7rHOnl86HEC9CVWsC3FKGZhrpUazKQxKVsbSvh38EuLiOiMRAawv9DxgYV
	 r85etGlMmqBouKsOFDOK0rXs3csCEhe9YJM7TVGloTM1y2GcZsF4VBWV4Ijio0XSip
	 dSo6+1duaS6vsUwFXQk9GTObwEBoIU7zUQEyy5SdmRyFKCdlWXw3A5+jcxsED4AYP9
	 vBYmqEK84WdbA==
Message-ID: <sashiko-outbox-173797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] gpio: davinci: Add ti,tda54-gpio compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-upstream-tda54-gpio-v2-4-5c4f8b10cdbc@ti.com>
References: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
 <20261016-upstream-tda54-gpio-v2-4-5c4f8b10cdbc@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:42:03 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: davinci: missing IRQ flow handler update for level-triggered=
 unbanked IRQs
--

commit 8228d1919a6fb52d7ab9246eaa1447341a319a9f
Author: Aniket Limaye <a-limaye@ti.com>

gpio: davinci: Add ti,tda54-gpio compatible
   =20
Add the ti,tda54-gpio compatible with extended registers for
level-triggered interrupt support.

> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 8d0ebf4afd169..db1f722693e0e 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -535,6 +535,11 @@ static const struct davinci_gpio_match_data keystone=
_gpio_data =3D {
>  	.get_irq_chip =3D keystone_gpio_get_irq_chip,
>  };
> =20
> +static const struct davinci_gpio_match_data tda54_gpio_data =3D {
> +	.get_irq_chip =3D keystone_gpio_get_irq_chip,
> +	.ext_reg =3D true,

[Severity: High]
Does enabling extended registers for level-triggered interrupts here result
in missing flow handler updates for unbanked interrupts?

For unbanked interrupts, the driver overrides the parent irqchip's
.irq_set_type with gpio_irq_type_unbanked(). While this function configures
the local GPIO hardware for level triggers when g_ext is available:

drivers/gpio/gpio-davinci.c:gpio_irq_type_unbanked() {
	...
	if (g_ext) {
		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_HIGH)
			       ? &g_ext->set_high : &g_ext->clr_high);
		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_LOW)
			       ? &g_ext->set_low : &g_ext->clr_low);
	}

	return 0;
}

It returns 0 without calling the parent's .irq_set_type callback or
dynamically updating the flow handler (e.g., via irq_set_handler_locked()).

Will this cause the parent interrupt controller and the logical IRQ flow
handler to remain configured for default edge triggers, potentially leading
to mishandled level interrupts?

> +};
> +
>  static const struct of_device_id davinci_gpio_ids[];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-upstream-t=
da54-gpio-v2-0-5c4f8b10cdbc@ti.com?part=3D4
