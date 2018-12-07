From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] pinctrl: rza1: report if devm_kasptrinf() fails
Date: Fri, 7 Dec 2018 10:32:50 +0100
Message-ID: <20181207093250.GF5597@w540>
References: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Nicholas, Linus,
   I'm sorry I might have missed this

On Sat, Nov 24, 2018 at 05:30:33PM +0100, Nicholas Mc Guire wrote:
> devm_kasprintf() may return NULL on failure of internal allocation
> thus the assignments are not safe if not checked. On error
> rza1_pinctrl_register() respectively rza1_parse_gpiochip() return
> negative values so -ENOMEM in the (unlikely) failure case of
> devm_kasprintf() should be fine here.

devm_kasprintf() returns -ENOMEM in case of failure (which I agree it's
unlikely, but still...), so I guess it's fine returning -ENOMEM as well
here.

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> ---
>
> Problem was located with an experimental coccinelle script
>
> The dev_err() for this unlikely case is added so that a failures of
> rza1_pinctrl_register() respectively rza1_parse_gpiochip() can be
> understood as currently the negative return value is simply passed up
> the call stack but it would be hard to identify the cause.
>
> Patch was compile tested with: shmobile_defconfig (implies PINCTRL_RZA1=y)
>
> Patch is against 4.20-rc3 (localversion-next is next-20181123)
>
>  drivers/pinctrl/pinctrl-rza1.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 14eb576..2533df4 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -1225,6 +1225,11 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>  	chip->base	= -1;
>  	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
>  					 np);
> +	if (!chip->label) {
> +		dev_err(rza1_pctl->dev, "Failed to allocate label\n");
> +		return -ENOMEM;
> +	}
> +
>  	chip->ngpio	= of_args.args[2];
>  	chip->of_node	= np;
>  	chip->parent	= rza1_pctl->dev;
> @@ -1326,6 +1331,11 @@ static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
>  		pins[i].number = i;
>  		pins[i].name = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL,
>  					      "P%u-%u", port, pin);
> +		if (!pins[i].name) {
> +			dev_err(rza1_pctl->dev,
> +				"RZ/A1 pin controller allocation failed\n");
> +			return -ENOMEM;
> +		}
>
>  		if (i % RZA1_PINS_PER_PORT == 0) {
>  			/*
> --
> 2.1.4
>

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJcCj5CAAoJEHI0Bo8WoVY8GWkQAMdxSwBLDjqqsyQa4jagrqXR
86g7qMcuS80cgIS8PvECs6b4vtOQkXqkVU3atMTWF87u/FG40UataWBN+28QJN9b
NIsVaIbIPmmBnl8kIpItFleGs5ehnIxMrAtqgdvlU2cwPSMKilpc77+UB6WxVQrZ
EIJFh5NKBuKa9dpYVZrUFLijpUbUWkvVyqul78ADLWgeARY7Hk+kvunhZ/1bghiW
3rEdHNpE6/kksY5vdoXCGX3RDhyoCVl8dW1D5Ds8yIYcCWbVj67mWkPpKAxTIAWD
L5TGxQt9H31MhjD71ceRiCGhUxBv9xVeIqnApWwkE1/P3KXXRsvBHWvggHlwb8YI
AD5bWA9UZkij+dJI+xcnqe0WMP7d0I/YzISDzhpA0slRXy7trF8epQS6TwL1niqu
twDXlnlAvc0mlhtvEYXa0/H0C2f2sC+1MSLeYOvYwKxof+6RVH6b66vC7F4gFgfv
+7iBdcl/kyDzXldmG2wW/g6Td4oIWH+iWrfFam3ug0swVScJdd1eEAva+THIsst3
dtiBrFkp383su7KQyWCBfMEz+qMc5CeRAiWG42myie+47CGqdTviJF9nIECmNmQy
dIbH3p3WEo2axe1iaw+E6HZ6bRcBG4fvsZB6Aa0n58zkbfscjPLm/AjnLlmEshQY
VSkIWJTnhUvYUU+aDwKz
=MN9T
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
