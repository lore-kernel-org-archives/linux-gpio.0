From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] gpio: pch: add slab include
Date: Tue, 27 May 2014 15:45:49 +0200
Message-ID: <1401198349.4491.12.camel@chaos.site>
References: <1401196664-14223-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34549 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752087AbaE0Npy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 27 May 2014 09:45:54 -0400
In-Reply-To: <1401196664-14223-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>

Hi Linus,

Le Tuesday 27 May 2014 =C3=A0 15:17 +0200, Linus Walleij a =C3=A9crit :
> After change 3ff35cbcfa4bc7d7dbdd0279e32ea677567ded02
> "gpio-pch: Fix Kconfig dependencies"
> which enabled COMPILE_TEST as an alternative for the PCH
> driver, we get build failures like this:
>=20
> drivers/gpio/gpio-pch.c: In function 'pch_gpio_probe':
> drivers/gpio/gpio-pch.c:359:2: error: implicit declaration
> of function 'kzalloc' [-Werror=3Dimplicit-function-declaration]
> drivers/gpio/gpio-pch.c:359:7: warning: assignment makes
> pointer from integer without a cast [enabled by default]
> drivers/gpio/gpio-pch.c:442:2: error: implicit declaration
> of function 'kfree' [-Werror=3Dimplicit-function-declaration]
>=20
> Fix this by including <linux/slab.h> explicitly.
>=20
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pch.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
> index 83a156397474..d6eac9b17db9 100644
> --- a/drivers/gpio/gpio-pch.c
> +++ b/drivers/gpio/gpio-pch.c
> @@ -20,6 +20,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/slab.h>
> =20
>  #define PCH_EDGE_FALLING	0
>  #define PCH_EDGE_RISING		BIT(0)

Same patch already sent by Arnd Bergmann yesterday and acked by me.

But thanks anyway :-)

--=20
Jean Delvare
SUSE L3 Support

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
