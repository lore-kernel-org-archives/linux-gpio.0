From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 01/14] pinctrl: at91: use __maybe_unused to hide pm
 functions
Date: Wed, 2 Mar 2016 17:06:58 +0100
Message-ID: <56D70FA2.30608@atmel.com>
References: <1456934350-1389172-1-git-send-email-arnd@arndb.de>
 <1456934350-1389172-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456934350-1389172-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Ludovic Desroches <ludovic.desroches@atmel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Le 02/03/2016 16:58, Arnd Bergmann a =E9crit :
> The at91-pio4 pinctrl driver uses SET_SYSTEM_SLEEP_PM_OPS() to
> conditionally set the correct suspend/resume options, but they
> become unused when CONFIG_PM is disabled:
>=20
> drivers/pinctrl/pinctrl-at91-pio4.c:827:12: error: 'atmel_pctrl_suspe=
nd' defined but not used [-Werror=3Dunused-function]
> drivers/pinctrl/pinctrl-at91-pio4.c:847:12: error: 'atmel_pctrl_resum=
e' defined but not used [-Werror=3Dunused-function]
>=20
> This adds __maybe_unused annotations so the compiler knows
> it can silently drop them instead of warning.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Indeed, nice like this:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks, bye.


> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pi=
nctrl-at91-pio4.c
> index ee69db6ae1c7..4429312e848d 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -824,7 +824,7 @@ static struct pinctrl_desc atmel_pinctrl_desc =3D=
 {
>  	.pmxops		=3D &atmel_pmxops,
>  };
> =20
> -static int atmel_pctrl_suspend(struct device *dev)
> +static int __maybe_unused atmel_pctrl_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct atmel_pioctrl *atmel_pioctrl =3D platform_get_drvdata(pdev);
> @@ -844,7 +844,7 @@ static int atmel_pctrl_suspend(struct device *dev=
)
>  	return 0;
>  }
> =20
> -static int atmel_pctrl_resume(struct device *dev)
> +static int __maybe_unused atmel_pctrl_resume(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct atmel_pioctrl *atmel_pioctrl =3D platform_get_drvdata(pdev);
>=20


--=20
Nicolas Ferre
