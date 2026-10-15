Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF5752121D
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067103; cv=none; b=Hzz7ncujUl/4HZkljMb9F4revpPeI9qEZ/xsH2BTK59Kqn8qxlgP6SfMOCYWWGN3oMk4rSvS3YWzxQ84yCfvpkrM/risquDtjU2pH0WRq9WRdXMipIvDBg5vObs8q62kntNE8RjhsP1LQdc9JuJhYj3L5aLsGgOvmnrxo4GN0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067103; c=relaxed/simple;
	bh=/wfRzpEhzmKDk5Q1Tg0JL3kbB2zDdbSwGEi12JEc9jo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXaODPgLGeZuAoHHBeQaoyPSdAo+S/GLsm0NUEze29BcaFi8zCrzDMzqhTpK4TtazaWKDdEkkFC7Y/BCekG3M9hcMbhOS34nlrXisksyZbY8UdKUk+VvkhETZkSuNmwn5aX7ZunqDf2wY1jlkqozhDbPirlilesayXu9CJ2CJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY2H1XZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY2H1XZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EED1F000C6
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067102;
	bh=XWBbbDlf4EIwAAVhrNOPgxfdQorqL6I+zOwc8slJsqA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oY2H1XZyIbnqyuy9ZYrkW/bwtfEtmpmrrrPgH0gEKO4rjAbAF4Rr29YEmejrYxWkL
	 vR1qzJK9JwqSwFkWuV75Vj6fRh2/a3c5qJw3kqhSYbJ1OybRZNmmBXeu0QKcm+UwSJ
	 98U8hVMRPVTGDdXhpXuegBO/edEZfS+yzfys3I1AI/LC+PU+sCvYQvAAEfdb690GbB
	 VBJbRGyUY7ESh4zEY//CizYpMIEsoqucX4/9700sly8oG0kJMARc0x+PA3xMCkQG5e
	 vClriT9LqQzK4gxJwvP5C7xmmH6X8+3FyL3+jifzi7wEKb74FE3Z+NpFE/dJGluTJK
	 jBN7s0IqI5qRA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so3663458e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 05:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXSkqbpWKLP+3dfTV//DyXHns6fLMSwMizuFNPHpTWtlFoRpvp5UqZ2ycO5vyBNmYq6k/Qe8TAq2Ed@vger.kernel.org
X-Gm-Message-State: AFq9FYKKTNUzkMzXaZ3JzalihiejMOXiCcH1c8/PX9vK7igCFzfc8cZi
	gy/uX1MAJ4ilCByLUPajSg9gXdKrSnssOiz7S0FbrW+xIQmA7Z7wc+jwBmSObk0sIKClW2poUlE
	1/jHngAx0K3Dcv//VB3zbfUsKxS/iZF8JFUkQYhr2rA==
X-Received: by 2002:a05:6512:3989:b0:5ba:37c8:a485 with SMTP id
 2adb3069b0e04-5bcde6bdfd9mr6220298e87.22.1792067101328; Thu, 15 Oct 2026
 05:25:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:25:00 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:25:00 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com>
Date: Thu, 15 Oct 2026 12:25:00 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
X-Gm-Features: AclHuK8GH8etn3uUshACOzvmzHuZTS1r4ysvL-52dRD2_mweQZCACUKo2mAjagE
Message-ID: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, stefandoesinger@gmail.com, krzk@kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 09:20:48 +0200, Navid Ghahremani
<ghahramani.navid@gmail.com> said:
> Expose the six banks using the generic GPIO implementation and enable
> the register clock before accessing the bank.
>
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  drivers/gpio/Kconfig          | 12 ++++++
>  drivers/gpio/Makefile         |  1 +
>  drivers/gpio/gpio-zx279128s.c | 79 +++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/gpio/gpio-zx279128s.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a48586bb8e..3ae51a3c10 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -902,6 +902,18 @@ config GPIO_ZEVIO
>  	help
>  	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
>
> +config GPIO_ZX279128S
> +	tristate "ZTE zx279128s GPIO support"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	select GPIO_GENERIC
> +	help
> +	  Say yes here to support the GPIO controller of the ZTE zx279128s
> +	  SoC. It has several banks of 16 lines each, which boards such as
> +	  the ZTE ZXHN H3600 use for LEDs, buttons and reset lines.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called gpio-zx279128s.
> +
>  config GPIO_ZYNQ
>  	tristate "Xilinx Zynq GPIO support"
>  	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index dc9e6d643b..a57ed7ec71 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -223,5 +223,6 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
>  obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
>  obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
>  obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
> +obj-$(CONFIG_GPIO_ZX279128S)		+= gpio-zx279128s.o
>  obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
>  obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
> diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
> new file mode 100644
> index 0000000000..71eb6b5d82
> --- /dev/null
> +++ b/drivers/gpio/gpio-zx279128s.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ZTE zx279128s GPIO controller
> + *
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The registers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supported
> + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
> +
> +static int zx279128s_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_generic_chip_config config = { };

Don't initialize it here, instead...

> +	struct device *dev = &pdev->dev;
> +	struct gpio_generic_chip *chip;
> +	void __iomem *base;
> +	struct clk *clk;
> +	int ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
> +
> +	config.dev = dev;
> +	config.sz = 4;
> +	config.dat = base + ZX279128S_GPIO_DATA;
> +	config.set = base + ZX279128S_GPIO_SET;
> +	config.clr = base + ZX279128S_GPIO_CLEAR;
> +	config.dirout = base + ZX279128S_GPIO_DIR;
> +

... do:

	config = (struct gpio_generic_chip){
		.dev = dev,
		...
	};

> +	ret = gpio_generic_chip_init(chip, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
> +
> +	chip->gc.ngpio = 16;
> +
> +	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
> +}
> +
> +static const struct of_device_id zx279128s_gpio_of_match[] = {
> +	{ .compatible = "zte,zx279128s-gpio" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, zx279128s_gpio_of_match);
> +
> +static struct platform_driver zx279128s_gpio_driver = {
> +	.probe = zx279128s_gpio_probe,
> +	.driver = {
> +		.name = "zx279128s-gpio",
> +		.of_match_table = zx279128s_gpio_of_match,
> +	},
> +};
> +module_platform_driver(zx279128s_gpio_driver);
> +
> +MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx279128s GPIO controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.55.0
>
>

Looks pretty good, I love small drivers like this.

Bart
