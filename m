From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] gpio: pca953x: make inclusion of <linux/of_platform.h>
 unconditional
Date: Fri, 11 Dec 2015 09:05:36 +0000
Message-ID: <566A91E0.7030902@codethink.co.uk>
References: <1449655574-6550-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:43369 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbbLKJFk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 04:05:40 -0500
In-Reply-To: <1449655574-6550-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 09/12/15 10:06, Linus Walleij wrote:
> After adding the DT matching in
> commit 6f29c9afbe636fc0e35c82a11eaf45c3b85eb07a
> "gpio: pca935x: fix of-only probed devices"
> compilation fails like this:
>=20
> CC [M]  drivers/gpio/gpio-pca953x.o
> gpio-pca953x.c: In function =E2=80=98pca953x_probe=E2=80=99:
> gpio-pca953x.c:693:11: error: implicit declaration of
> function =E2=80=98of_match_device=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]
> match =3D of_match_device(pca953x_dt_ids, &client->dev);
>         ^
> gpio-pca953x.c:693:9: warning: assignment makes pointer from
> integer without a cast [-Wint-conversion]
> match =3D of_match_device(pca953x_dt_ids, &client->dev);
>         ^
> cc1: some warnings being treated as errors
> ../scripts/Makefile.build:264: recipe for target
> 'drivers/gpio/gpio-pca953x.o' failed
>=20
> After removing the conditional inclusion guards compilation
> works fine again. Might be a module problem so that
> fix.
>=20
> Cc: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.=
c
> index 14729657a112..2eaf235a39e5 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -18,9 +18,7 @@
>  #include <linux/i2c.h>
>  #include <linux/platform_data/pca953x.h>
>  #include <linux/slab.h>
> -#ifdef CONFIG_OF_GPIO
>  #include <linux/of_platform.h>
> -#endif
>  #include <linux/acpi.h>

I think you also need #include <linux/of_device.h>

--=20
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
