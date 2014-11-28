From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Fri, 28 Nov 2014 16:53:19 +0900
Message-ID: <CAAVeFuJjkGNYN-DiYTXnWau1isq3by32+YYTdY0iUOVFWR66Mg@mail.gmail.com>
References: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:33286 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbaK1Hxk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 02:53:40 -0500
Received: by mail-ie0-f179.google.com with SMTP id rp18so5640975iec.38
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2014 23:53:39 -0800 (PST)
In-Reply-To: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yunlei He <heyunlei@huawei.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, bintian.wang@huawei.com, peifeiyue@huawei.com, Haojian Zhuang <haojian.zhuang@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On Fri, Nov 21, 2014 at 3:43 PM, Yunlei He <heyunlei@huawei.com> wrote:
> Gpio-ranges property is useful to represent which GPIOs correspond
> to which pins on which pin controllers. But there may be some gpios
> without pinctrl operation. So check whether gpio-ranges property
> exists in device node first.
>
> Signed-off-by: Yunlei He <heyunlei@huawei.com>
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/pl061-gpio.txt | 2 +-
>  drivers/gpio/gpio-pl061.c                             | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> index a2c416b..577bcf7 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> @@ -7,4 +7,4 @@ Required properties:
>    - bit 0 specifies polarity (0 for normal, 1 for inverted)
>  - gpio-controller : Marks the device node as a GPIO controller.
>  - interrupts : Interrupt mapping for GPIO IRQ.
> -
> +- gpio-ranges : Interaction with the PINCTRL subsystem
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 84b49cf..01875d1 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm.h>
> +#include <linux/of_address.h>
>
>  #define GPIODIR 0x400
>  #define GPIOIS  0x404
> @@ -263,9 +264,11 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>                 return PTR_ERR(chip->base);
>
>         spin_lock_init(&chip->lock);
> +       if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
> +               chip->gc.request = pl061_gpio_request;
> +               chip->gc.free = pl061_gpio_free;
> +       }

With this property required to set gc.request and gc.free, aren't we
going to break old DTs that do know of this property but still expect
pl061_gpio_request() and pl061_gpio_free() to be called?

It seems that to preserve backward-compatibility, your property should
be used to negate the legacy behavior, not enable it.
