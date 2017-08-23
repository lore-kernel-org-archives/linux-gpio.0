From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: off by one in rza1_parse_gpiochip()
Date: Wed, 23 Aug 2017 09:20:22 +0200
Message-ID: <CACRpkda45xYjEmOK9n1XSROTTWga28QHQBZ98qFXd-QvpG7ZNA@mail.gmail.com>
References: <20170818103248.ddguatdt5jhm5zx7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818103248.ddguatdt5jhm5zx7@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Geert Uytterhoeven <geert+renesas@glider.be>, jacopo <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2017 at 12:32 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> The rza1_pctl->ports[] array has RZA1_NPORTS (12) elements.  The > here
> should be >= to prevent an out of bounds access.
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 7e30134b3d18..464dbf2f0816 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -1088,7 +1088,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>          */
>         pinctrl_base = of_args.args[1];
>         gpioport = RZA1_PIN_ID_TO_PORT(pinctrl_base);
> -       if (gpioport > RZA1_NPORTS) {
> +       if (gpioport >= RZA1_NPORTS) {
>                 dev_err(rza1_pctl->dev,
>                         "Invalid values in property %s\n", list_name);
>                 return -EINVAL;

Geert/Jacopo, can any of you ACK this?

Yours,
Linus Walleij
