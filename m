From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: nomadik: hide unused functions
Date: Fri, 29 Jan 2016 08:30:42 +0100
Message-ID: <20160129073042.GL13664@pengutronix.de>
References: <1453737557-1960171-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453737557-1960171-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>
List-Id: linux-gpio@vger.kernel.org

Hello Arnd,

On Mon, Jan 25, 2016 at 04:59:09PM +0100, Arnd Bergmann wrote:
> The nomadik pinctrl driver has two functions that are only used
> for debugfs output and are otherwise unused:
>=20
> drivers/pinctrl/nomadik/pinctrl-abx500.c:194:12: error: 'abx500_get_p=
ull_updown' defined but not used
> drivers/pinctrl/nomadik/pinctrl-abx500.c:471:12: error: 'abx500_get_m=
ode' defined but not used
>=20
> This makes the function definitions conditional to avoid the
> harmless warnings.
> [...]
> +#ifdef CONFIG_DEBUG_FS
>  static int abx500_get_pull_updown(struct abx500_pinctrl *pct, int of=
fset,
>  				  enum abx500_gpio_pull_updown *pull_updown)

an alternative is to mark the functions with __maybe_unused. I just
noticed that Documentation/CodingStyle even mandates to use that instea=
d
of cpp stuff.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
