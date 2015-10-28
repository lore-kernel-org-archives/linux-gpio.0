From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: pinconf: remove needless loop
Date: Wed, 28 Oct 2015 19:00:49 +0200
Message-ID: <1446051649.6332.59.camel@linux.intel.com>
References: <1446042599-15093-1-git-send-email-laurent.meunier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:41719 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750731AbbJ1RDN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 28 Oct 2015 13:03:13 -0400
In-Reply-To: <1446042599-15093-1-git-send-email-laurent.meunier@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Meunier <laurent.meunier@st.com>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org

On Wed, 2015-10-28 at 15:29 +0100, Laurent Meunier wrote:
> This removes a needless loop which was catched in pinconf.c.

I'm not a fan of irregular verbs, but here we are: catched -> caught.

>=20
> Suggested-by: Andriy Shevchenko <andriy.shevchenko@intel.com>

Sometimes the broken Evolution uses wrong address. Please add "linux."
part after "@". Also, I prefer to use Andy since it's how I'm known
here.

Otherwise:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Laurent Meunier <laurent.meunier@st.com>
> ---
> =C2=A0drivers/pinctrl/pinconf.c | 13 +++++--------
> =C2=A01 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index 1fc09dc..19af718 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c
> @@ -414,7 +414,7 @@ static int pinconf_dbg_config_print(struct
> seq_file *s, void *d)
> =C2=A0	struct pinctrl_dev *pctldev;
> =C2=A0	const struct pinconf_ops *confops =3D NULL;
> =C2=A0	struct dbg_cfg *dbg =3D &pinconf_dbg_conf;
> -	int i, j;
> +	int i;
> =C2=A0	unsigned long config;
> =C2=A0
> =C2=A0	mutex_lock(&pinctrl_maps_mutex);
> @@ -428,13 +428,10 @@ static int pinconf_dbg_config_print(struct
> seq_file *s, void *d)
> =C2=A0		if (strcmp(map->name, dbg->state_name))
> =C2=A0			continue;
> =C2=A0
> -		for (j =3D 0; j < map->data.configs.num_configs; j++)
> {
> -			if (!strcmp(map->data.configs.group_or_pin,
> -					dbg->pin_name)) {
> -				/* We found the right pin / state */
> -				found =3D map;
> -				break;
> -			}
> +		if (!strcmp(map->data.configs.group_or_pin, dbg-
> >pin_name)) {
> +			/* We found the right pin */
> +			found =3D map;
> +			break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0

--=20
Andy Shevchenko <andriy.shevchenko@intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
