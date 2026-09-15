Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C8477E51
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465889; cv=none; b=PLC26nqb/X4z8ofBXqwutgBzCftU5h0OMp3xMP6OI7Sl6WrUf+PTkC7jnecscKLjxzpAumw7uKGPPRxwUroEgaomRCoY7V8towdRThdBpjVpMwRYim+DLibvCO5BOmjLyhox73b70hSMuDy/pRshHvHpqJfmFvakM9ey3JpWSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465889; c=relaxed/simple;
	bh=6QOKSNzzKstjzy2ZsAUor+LGD+07Lbep+OqrZNt/rm8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDd//DP/UTFTFDY0pyi0QziXs4+06H6GDgsWEzAgj3wXJmg0BGjUdjR/FHvLMmGwENleLXex8SxPtvIUo1aJeQALzEdv/RH23crAJ0cXtC7Lwm2kcIXIu6LcSN48V4wBGhFlQCrxOADqUpsmlKz3BtUSqn0oGPAJ4x5O10NChlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYz1VHUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYz1VHUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468381F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465887;
	bh=/Xnj1xYLi33DxcwDiZhVff7+r5fNwBZKKFxj6i9zMi4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WYz1VHUBiJzR9goLOkvRxZXVo8k+P3Jjid9sR+sVWgkD/weM/k0KG8wgUKSzxuq//
	 DPIOuubf4Gjx5Y6zwqb6/mG+6wF3LJkPLIlV8VlpdtthagHgCam/kO9XXCvisPEUZv
	 aU0sf3XANYUZzrywQpuve4FI3mEh7+xokbcC7/lUke4TsUECnmQ6qoFsrYruZ8CseU
	 bmsz1XPAAKncCNLjJBP1Si3bY9YxIKjsgsTgAAe/ynf+UOeL45EIJRrcGPLNT97/aZ
	 xGzaoG6OD2aNzAsqcGD2Xskp1gqCcxDDZDFqm7HwUYu0M9kB8cDjhtE5EwrJZzE9I7
	 +m9M9d3B8m4gw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so100276e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 02:51:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjlr1vCBGxXWsSkJ/ffXdYwidQ1lRKqzWroA6K/OpKl04fLjs4/KrJR8fAb1mlXVLi+wBm4DlHcY8k@vger.kernel.org
X-Gm-Message-State: AFuF++lkmZbGz0rVP2NsuTO7qaH296mtBM40wrSNO1PbJwrMlJVJnXBe
	43Iu21wTrcF/h0DhR8a3pf0y4F3eAXskLsGbPhPdTzRHxUUiJIMJWfVfDcyOJOHVB9ZbaCZCA1E
	n4WGyxeT6DUZp6eHWKpPZwPxSSm3vQj35Mos0PnKMog==
X-Received: by 2002:a05:6512:3188:b0:5b8:999f:717f with SMTP id
 2adb3069b0e04-5b8b50040dbmr49553e87.63.1789465885979; Tue, 15 Sep 2026
 02:51:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:51:24 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:51:24 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915092046.931449-3-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-3-alban.bedel@lht.dlh.de>
Date: Tue, 15 Sep 2026 05:51:24 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
X-Gm-Features: AcwNN1WgL7zIm0y_CqrSnak31fGQ_sYZ-QdMPfKBRnKztSjYe9cYpQInRI3xglo
Message-ID: <CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 11:20:46 +0200, Alban Bedel <alban.bedel@lht.dlh.de> said:
> Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
> marketed as an LED dimmer it is a bit limited in this regard as it
> only has 2 PWM for 16 pins. As explained in the datasheet it can also
> be used as an open-drain GPIO controller, and that's how it is used on
> the hardware I have at hand. This chip doesn't really map to what the
> gpio-regmap driver expect so it is implemented as it own driver. This
> approch also allow to later add support for the LED dimmer if desired.
>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
>  drivers/gpio/Kconfig        |  10 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-cat9532.c | 173 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 184 insertions(+)
>  create mode 100644 drivers/gpio/gpio-cat9532.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a48586bb8edba..05b7af675677b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1180,6 +1180,16 @@ config GPIO_ADNP
>  	  enough to represent all pins, but the driver will assume a
>  	  register layout for 64 pins (8 registers).
>
> +config GPIO_CAT9532
> +	tristate "CAT9532 GPIO support"
> +	select REGMAP_I2C
> +	help
> +	  GPIO driver for ON Semiconductor CAT9532 LED dimmer.
> +	  Say yes here to enable the GPIO driver for the CAT9532 chip.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gpio-cat9532.
> +
>  config GPIO_FXL6408
>  	tristate "FXL6408 I2C GPIO expander"
>  	select GPIO_REGMAP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index dc9e6d643b5bc..e94d2f57a1f93 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
>  obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_BY_PINCTRL)		+= gpio-by-pinctrl.o
>  obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
> +obj-$(CONFIG_GPIO_CAT9532)		+= gpio-cat9532.o
>  obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
>  obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
>  obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
> diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532.c
> new file mode 100644
> index 0000000000000..973ff74a15b89
> --- /dev/null
> +++ b/drivers/gpio/gpio-cat9532.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/gpio/driver.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +struct cat9532 {
> +	struct regmap *regmap;
> +	struct gpio_chip gpio;
> +
> +	spinlock_t lock;
> +	unsigned int direction;
> +};
> +
> +#define CAT9532_REG_INPUT0	0
> +#define CAT9532_REG_LS0		6
> +
> +/* Set output to Hi-Z, LED is OFF */
> +#define CAT9532_LED_OUT_HIZ	0
> +/* Set output low  */
> +#define CAT9532_LED_OUT_LOW	1
> +#define CAT9532_LED_OUT_MASK	3
> +
> +static const struct regmap_config cat9532_regmap_cfg = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 9,
> +	/*
> +	 * Auto increment can be enabled by setting bit 4 in the
> +	 * register address, but we don't really need bulk access.
> +	 */
> +	.use_single_read = true,
> +	.use_single_write = true,
> +	.can_sleep = true,
> +};

This looks like it would perfectly fit the gpio-regmap helper and allow for
code reuse. Maybe except for the locally tracked direction. How reliable is it?
What if the GPIOs were put into some specific state by the bootloader?

Bart
