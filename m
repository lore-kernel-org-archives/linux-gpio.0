From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 4/5] pinctrl: rza1: Fix selector use for groups and
 functions
Date: Tue, 19 Jun 2018 06:16:22 +0200
Message-ID: <20180619041622.GA4956@w540>
References: <20180615111141.37184-1-tony@atomide.com>
 <20180615111141.37184-5-tony@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615111141.37184-5-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Tony,
   thanks for doing this!

I cannot find the original bug report in linux-gpio, so I'll comment
on this single patch only.

On Fri, Jun 15, 2018 at 04:11:40AM -0700, Tony Lindgren wrote:
> We must use a mutex around the generic_add functions and save the
> function and group selector in case we need to remove them. Otherwise
> the selector use will be racy for deferred probe at least.
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/pinctrl/pinctrl-rza1.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -1005,7 +1005,7 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	struct device_node *child;
>  	const char *grpname;
>  	const char **fngrps;
> -	int ret, npins;
> +	int ret, npins, gsel, fsel;

Nit: can you move this 3 lines up to keep the variable declarations in reverse
xmas tree order? or if you prefer declare one variable per line...

With this minor comment fixed:
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
>  	npins = rza1_dt_node_pin_count(np);
>  	if (npins < 0) {
> @@ -1055,18 +1055,19 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	fngrps[0] = grpname;
>
>  	mutex_lock(&rza1_pctl->mutex);
> -	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, npins,
> -					NULL);
> -	if (ret) {
> +	gsel = pinctrl_generic_add_group(pctldev, grpname, grpins, npins,
> +					 NULL);
> +	if (gsel < 0) {
>  		mutex_unlock(&rza1_pctl->mutex);
> -		return ret;
> +		return gsel;
>  	}
>
> -	ret = pinmux_generic_add_function(pctldev, grpname, fngrps, 1,
> -					  mux_confs);
> -	if (ret)
> +	fsel = pinmux_generic_add_function(pctldev, grpname, fngrps, 1,
> +					   mux_confs);
> +	if (fsel < 0) {
> +		ret = fsel;
>  		goto remove_group;
> -	mutex_unlock(&rza1_pctl->mutex);
> +	}
>
>  	dev_info(rza1_pctl->dev, "Parsed function and group %s with %d pins\n",
>  				 grpname, npins);
> @@ -1083,15 +1084,15 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	(*map)->data.mux.group = np->name;
>  	(*map)->data.mux.function = np->name;
>  	*num_maps = 1;
> +	mutex_unlock(&rza1_pctl->mutex);
>
>  	return 0;
>
>  remove_function:
> -	mutex_lock(&rza1_pctl->mutex);
> -	pinmux_generic_remove_last_function(pctldev);
> +	pinmux_generic_remove_function(pctldev, fsel);
>
>  remove_group:
> -	pinctrl_generic_remove_last_group(pctldev);
> +	pinctrl_generic_remove_group(pctldev, gsel);
>  	mutex_unlock(&rza1_pctl->mutex);
>
>  	dev_info(rza1_pctl->dev, "Unable to parse function and group %s\n",
> --
> 2.17.1

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbKIOWAAoJEHI0Bo8WoVY8BpcP/ifscM5Rik08hO75WLT63ydI
ANtohMzW0ZO26UDxoP8bVzbQGnnbE8sa4mMsChrvWnlmsKoMnnFRvrSFOxIgxni3
ngroB7VXCusuJF2yb7QphbBg9U90wz7RHfB3MCI9pLc20lZmibsTB6M8Nfo0V3js
GWFMwGM8byfi01HfwLlbERcEHP7MIqi06SMcVl2RKQqkPoFL4WW0ALJKJQfSzg39
18fjOpIDvSGn/pSwuvK9EFw3suwBvWcU0Zswk9wvBwmcoG6tOUmgjW5ChcYgMCr2
uuFCbSYj5gt14ClJ6ZNTYKqIDQAcelOa5rItT+QHcotpsaf3q1rvWCwy7VhweCR4
I8auul9lY3Lw1bbBBlMzVXALNiSr1Mms4DooodiP2gYN7iKI5NKjHYOySIVoP6Tb
Wrw3nlOd2CoR1OMkSpb4M/KEPA8kN0efayM4bKCXI/RJwFP15V6AfV4w962Xha4S
4gzSypHERfrmLg7u8G/AtclE5a5PxNUnVl+WoGw3WJTEEAeo83sAZg2dG2ChkDSC
nnp/5WiG+FZPqHIdFC5t/LXE9RHC8z9ywyvKk8CzsiLeTHKGFz85eAyeqfCLiEj4
N7yXmkqi15GnXdYN6/hVFpDPl7DGPUaiVQoomkTfQnfWr4q0p6QjqCEQBSlhxKDH
sNPG6xkWz/zKvk3Pm4KW
=2S2G
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
