From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH] pinmux: 1 pin is not allowed to be configured for both
 GPIO and peripheral funtion
Date: Wed, 4 Mar 2015 15:57:41 +0800
Message-ID: <CAJxxZ0OLiif3pLJGt8fed4p9VU8t=Zc2Q9tBVmb_GZzhnqkBvg@mail.gmail.com>
References: <1424936504-32662-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34518 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934759AbbCDH5m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2015 02:57:42 -0500
Received: by obcva2 with SMTP id va2so5225272obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2015 23:57:41 -0800 (PST)
In-Reply-To: <1424936504-32662-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

PING

On Thu, Feb 26, 2015 at 3:41 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
> for both GPIO and peripheral function. So, check both gpio_owner and
> mux_owner before approving the pin request.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  drivers/pinctrl/pinmux.c |   28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index b874458..b58b97c 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -99,24 +99,24 @@ static int pin_request(struct pinctrl_dev *pctldev,
>         dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
>                 pin, desc->name, owner);
>
> +       if (desc->gpio_owner) {
> +               dev_err(pctldev->dev,
> +                       "pin %s already requested by %s; cannot claim for %s\n",
> +                       desc->name, desc->gpio_owner, owner);
> +               goto out;
> +       }
> +
> +       if (desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> +               dev_err(pctldev->dev,
> +                       "pin %s already requested by %s; cannot claim for %s\n",
> +                       desc->name, desc->mux_owner, owner);
> +               goto out;
> +       }
> +
>         if (gpio_range) {
>                 /* There's no need to support multiple GPIO requests */
> -               if (desc->gpio_owner) {
> -                       dev_err(pctldev->dev,
> -                               "pin %s already requested by %s; cannot claim for %s\n",
> -                               desc->name, desc->gpio_owner, owner);
> -                       goto out;
> -               }
> -
>                 desc->gpio_owner = owner;
>         } else {
> -               if (desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> -                       dev_err(pctldev->dev,
> -                               "pin %s already requested by %s; cannot claim for %s\n",
> -                               desc->name, desc->mux_owner, owner);
> -                       goto out;
> -               }
> -
>                 desc->mux_usecount++;
>                 if (desc->mux_usecount > 1)
>                         return 0;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
