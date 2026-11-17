Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923650;
	b=4vBx52HdBbgcGHuK8rHUi75KrsQI1zyvNRvPevke/MbrWHaEoT6YeLJbmKaUKNjXHRMQ
	 2CqRyCfr7/vt6B+e9qSsR/JHgnw/iFdc8CPfKs7AcrGgKQajPbFtGr28YbGPQYZnFUn4J
	 ZHsEcn/M8JyL3AVgM/NoVkTWI8LrlqNH8nH0UXssd7lX5sKE94DjWBoBs8Kh1vxSLSOtG
	 ENCy4KT6GR5yrd5HSVY3JDJR9AdWHWt7GN0NDgajTyWKSf0izXgcnmN6BF4S9gkiv39ff
	 vd1UXLuT6b0bvrcLQhtYuu76gLywt9gQ7GuFU8LbYFjtl8HZTlG9QBntVLKaTrpGLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923650;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kn4paL7msMkOQ0Yy8qxhjJ2SB6j2nayBwty9MQVkUYY=;
	b=RERW7VC4SzNi8KxkTT6IV8FXaq5ZQKkZRoZ3vo+DqNRS7AP5mBFzx28vDqwDzuq6VawG
	 FcgxvVmBeak0ARAzzlwydrvRt+ZXRCERQ45hedCbbqXpp9bXNZNmJr8kWoBkG5wchx81n
	 Y/ri+KEft9vzLYqwo97e8DC5Acv4VxgIJL+w6pkyFcCT1GCcXRSWGOlNBEsCuPUTDKEA/
	 c61b3wpffCvPZh1Brt2TXJdFWGMiL4dPqwi5/fQIDebWgg0HmR+IPn7ycn8I30mLLVyv0
	 FxS8i9IbhPsJ3wYRGEJbK/ZGCS1CEkf6DLaeejLmS9JezcCyTtB6gutg8UHUBRs8ICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BctFTCIV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 03631606A329;
	Tue, 17 Nov 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BctFTCIV
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 17C051F000CC;
	Tue, 17 Nov 2026 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923649;
	bh=Kn4paL7msMkOQ0Yy8qxhjJ2SB6j2nayBwty9MQVkUYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BctFTCIVaO3q9cDaX5aXSwPrEldXrYYy3Qejg8T0RygJbuANtmltOX3+H+JkupAmM
	 BvSaLZu0YJOFJsePljchqBc4Aj70CwqQF8f+TL4AtEFXhcf4/mrJoIzFMegt5YNnMS
	 dtleKx9zSGzpY6np9JqzjMxM/C/ncVxCT1sxs07A0b5lmJY9lDqNRO/N8GB+eyeBG7
	 msMejstzkxd/gK7BeEZ+D4g+WXWTz8jnvofnss0q52XjFuLGenalYJt1tCc2o5zYOi
	 xTVDL3fZL1cDphQFpVdg1qaLnIHzk7x0oyq46efJyn+/MIA18LLGPj2AX6CpL9wzf6
	 nI8yDIJUteZRA==
Date: Tue, 17 Nov 2026 14:54:06 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: CL Wang <cl634@andestech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Message-ID: <22ifazqg6afr6rcybqg6foah3v554xu4px2c4et35y5xzpg74h@kesthgcvnlgk>
References: <20261116040914.368298-1-cl634@andestech.com>
 <20261116040914.368298-3-cl634@andestech.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116040914.368298-3-cl634@andestech.com>

On Mon, Nov 16, 2026 at 12:09:13PM +0800, CL Wang wrote:
> Add a driver for the Andes ATCGPIO100 GPIO controller, found on
> AndesCore-based platforms such as AE350.
> 
> The controller provides up to 32 lines. The data path is built on the
> generic MMIO GPIO library (gpio-mmio), and the number of lines and the
> optional pull, interrupt and debounce features are read from the
> configuration register at probe time.
> 
> The driver supports:
>  - Input and output, reading the output latch back for output lines
>  - Pull-up and pull-down bias
>  - Edge (rising, falling, both) and level (high, low) interrupts
>  - Hardware input debounce with a period shared by all lines
>  - Wakeup through the parent interrupt for lines that their consumers
>    mark as wakeup sources
>  - System suspend and resume
> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---

...

> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/find.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>

Uwe would probably say you should only pull in the individual headers
that you require from include/linux/device-id/.

...

> +
> +	config = (struct gpio_generic_chip_config) {
> +		.dev = &priv->pdev->dev,
> +		.sz = 4,
> +		.dat = priv->base + REG_DATA_IN,
> +		.set = priv->base + REG_DATA_OUT,
> +		.dirout = priv->base + REG_CHAN_DIR,
> +		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
> +	};

I think you could save even more code by using the gpio-regmap helper
here instead. Could you see if that's possible here?

> +
> +	ret = gpio_generic_chip_init(&priv->chip, &config);
> +	if (ret)
> +		return dev_err_probe(&priv->pdev->dev, ret,
> +				     "Failed to init generic GPIO chip\n");
> +
> +	return 0;
> +}
> +
> +static void atcgpio_init_controller(struct atcgpio_priv *priv)
> +{
> +	u32 cfg;
> +
> +	cfg = atcgpio_read(priv, REG_CONFIG);
> +	priv->pull_option = !!(cfg & CONFIG_PULL_OPTION);
> +	priv->int_option = !!(cfg & CONFIG_INT_OPTION);
> +	priv->debounce_option = !!(cfg & CONFIG_DEBOUNCE_OPTION);
> +	priv->chan_num = CONFIG_CHAN_NUM_GET(cfg);
> +	if (priv->chan_num > ATCGPIO_CHAN_NUM_MAX || !priv->chan_num) {
> +		dev_warn(&priv->pdev->dev,

Use a local variable to store the adress of dev for better readability.

> +			 "Invalid hardware GPIO number %d, forcing to %d\n",
> +			 priv->chan_num,
> +			 ATCGPIO_CHAN_NUM_MAX);
> +		priv->chan_num = ATCGPIO_CHAN_NUM_MAX;
> +	}
> +
> +	if (!priv->extclk_rate && !priv->pclk_rate) {
> +		dev_warn(&priv->pdev->dev,
> +			 "Disabling debounce: missing reference clock\n");
> +		priv->debounce_option = 0;
> +	}
> +
> +	if (priv->debounce_option)
> +		atcgpio_write(priv, REG_DEBOUNCE_EN, 0);
> +
> +	if (priv->int_option) {
> +		atcgpio_write(priv, REG_CHAN_INT_EN, 0);
> +		atcgpio_write(priv, REG_INT_MODE0, 0);
> +		atcgpio_write(priv, REG_INT_MODE1, 0);
> +		atcgpio_write(priv, REG_INT_MODE2, 0);
> +		atcgpio_write(priv, REG_INT_MODE3, 0);
> +		atcgpio_write(priv, REG_CHAN_INT_STATE, GENMASK(31, 0));
> +	}
> +}
> +
> +static int atcgpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_irq_chip *gc_irq;
> +	struct atcgpio_priv *priv;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);

Use devm_kzalloc_obj(). Same elsewhere.

Bart
