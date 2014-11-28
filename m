From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Fri, 28 Nov 2014 13:26:57 +0100
Message-ID: <CACRpkdZNYMX0qK4desZGY-tDp=VzBamzoU11d8Kf4U+bKbunYQ@mail.gmail.com>
References: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:38600 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbaK1MdA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 07:33:00 -0500
Received: by mail-ie0-f177.google.com with SMTP id rd18so5700314iec.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 04:32:59 -0800 (PST)
In-Reply-To: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yunlei He <heyunlei@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bintian.wang@huawei.com, peifeiyue@huawei.com, Haojian Zhuang <haojian.zhuang@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On Fri, Nov 21, 2014 at 7:43 AM, Yunlei He <heyunlei@huawei.com> wrote:

> Gpio-ranges property is useful to represent which GPIOs correspond
> to which pins on which pin controllers. But there may be some gpios
> without pinctrl operation. So check whether gpio-ranges property
> exists in device node first.
>
> Signed-off-by: Yunlei He <heyunlei@huawei.com>
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>

(...)

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

This can be a separate patch. Please send it as such.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 84b49cf..01875d1 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm.h>
> +#include <linux/of_address.h>

What you're checking for is not an address. This would be just
#include <linux/of.h>

>         spin_lock_init(&chip->lock);
> +       if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
> +               chip->gc.request = pl061_gpio_request;
> +               chip->gc.free = pl061_gpio_free;
> +       }
>
> -       chip->gc.request = pl061_gpio_request;
> -       chip->gc.free = pl061_gpio_free;

NAK.

No this does not work. GPIO ranges doe not *have* to come from
the device tree, it is more common that a GPIO driver adds it by
way of gpiochip_add_pin_range().

Haojian has already solved this problem in the pinctrl core.
Inspect commit 51e13c2475913d45a3ec546dee647538a9341d6a
"pinctrl: check pinctrl ready for gpio range"

The call(s) to pinctrl_request_gpio() from
pl061_gpio_request() should already return silently with 0
AFAICT, Haojian do you agree?

Yours,
Linus Walleij
