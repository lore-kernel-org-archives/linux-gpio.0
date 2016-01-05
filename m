From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] pinctrl: qcom: fix up errorpath
Date: Tue, 5 Jan 2016 09:21:46 -0800
Message-ID: <CAJAp7OicKuvribnjTvdCdXCbMpnC9fpgjF9sPdgeLGy5eo-sUg@mail.gmail.com>
References: <1451985969-17717-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:36854 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859AbcAERVs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 12:21:48 -0500
Received: by mail-lf0-f44.google.com with SMTP id z124so293188118lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 09:21:47 -0800 (PST)
In-Reply-To: <1451985969-17717-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Jan 5, 2016 at 1:26 AM, Linus Walleij <linus.walleij@linaro.org=
> wrote:
> This fixes up:
> commit 464231fb1fb1360399a2eb11479c47e39facb030
> "pinctrl: ssbi-gpio: Be sure to clamp return value"
> commit b9164f049339006fafe8a52396e0f1997552214a
> "gpio: ssbi-mpp: Be sure to clamp return value"
> as I managed to screw up some of the logic when clamping
> the return values.
>

Thanks, sorry for being slow with the review in the first place.

Reviewed-by: Bj=C3=B6rn Andersson <bjorn@kryo.se>

Regards,
Bjorn

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 4 ++--
>  drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinct=
rl/qcom/pinctrl-ssbi-gpio.c
> index 394ca34bec4a..7bea0df06fb1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -487,10 +487,10 @@ static int pm8xxx_gpio_get(struct gpio_chip *ch=
ip, unsigned offset)
>         } else {
>                 ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE=
_LINE_LEVEL, &state);
>                 if (!ret)
> -                       ret =3D state;
> +                       ret =3D !!state;
>         }
>
> -       return !!ret;
> +       return ret;
>  }
>
>  static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset,=
 int value)
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctr=
l/qcom/pinctrl-ssbi-mpp.c
> index 23089d541230..629642b73489 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> @@ -506,9 +506,9 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip,=
 unsigned offset)
>
>         ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LE=
VEL, &state);
>         if (!ret)
> -               ret =3D state;
> +               ret =3D !!state;
>
> -       return !!ret;
> +       return ret;
>  }
>
>  static void pm8xxx_mpp_set(struct gpio_chip *chip, unsigned offset, =
int value)
> --
> 2.4.3
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
