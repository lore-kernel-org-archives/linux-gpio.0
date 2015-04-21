From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH v3] pinmux: allow exlusive pin allocation among GPIO and
 peripheral funtions via flag strict in struct pinctrl_desc
Date: Tue, 21 Apr 2015 13:25:14 +0800
Message-ID: <CAJxxZ0OuWqVqeU6c=x-mutSoG7r_OPF+pqaK07Ah41EcbJxf3Q@mail.gmail.com>
References: <1428549187-9377-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36817 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193AbbDUFZO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 01:25:14 -0400
Received: by oift201 with SMTP id t201so145495929oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2015 22:25:14 -0700 (PDT)
In-Reply-To: <1428549187-9377-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

PING

On Thu, Apr 9, 2015 at 11:13 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
> for both GPIO and peripheral function. So, add flag strict in struct
> pinctrl_desc to check both gpio_owner and mux_owner before approving the
> pin request.
>
> v2-changes:
> - if strict flag is set, check gpio_owner and mux_onwer in if and else clause
>
> v3-changes:
> - add kerneldoc for this struct
> - augment Documentation/pinctrl.txt
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  Documentation/pinctrl.txt       |    7 +++++++
>  drivers/pinctrl/pinctrl-adi2.c  |    1 +
>  drivers/pinctrl/pinmux.c        |   13 +++++++++++++
>  include/linux/pinctrl/pinctrl.h |    3 +++
>  4 files changed, 24 insertions(+)
>
> diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
> index 5e9909c..59e0aa7 100644
> --- a/Documentation/pinctrl.txt
> +++ b/Documentation/pinctrl.txt
> @@ -850,6 +850,13 @@ possible that the GPIO, pin config and pin multiplex registers are placed into
>  the same memory range and the same section of the data sheet, although that
>  need not be the case.
>
> +(B.1)
> +In some processors, although the physical pins are designed in the same way
> +as (B), the GPIO function still can't be enabled at the same time as the
> +peripheral functions. So, a flag strict in struct pinctrl_desc is defined
> +to check both gpio_owner and mux_owner before approving the pin request.
> +Pinctrl driver should set this flag according to its hardware capability.
> +
>  From a kernel point of view, however, these are different aspects of the
>  hardware and shall be put into different subsystems:
>
> diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
> index 8434439..fbd4926 100644
> --- a/drivers/pinctrl/pinctrl-adi2.c
> +++ b/drivers/pinctrl/pinctrl-adi2.c
> @@ -710,6 +710,7 @@ static struct pinctrl_desc adi_pinmux_desc = {
>         .name = DRIVER_NAME,
>         .pctlops = &adi_pctrl_ops,
>         .pmxops = &adi_pinmux_ops,
> +       .strict = true,
>         .owner = THIS_MODULE,
>  };
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index b874458..2546fa7 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -107,6 +107,13 @@ static int pin_request(struct pinctrl_dev *pctldev,
>                                 desc->name, desc->gpio_owner, owner);
>                         goto out;
>                 }
> +               if (pctldev->desc->strict && desc->mux_usecount &&
> +                   strcmp(desc->mux_owner, owner)) {
> +                       dev_err(pctldev->dev,
> +                               "pin %s already requested by %s; cannot claim for %s\n",
> +                               desc->name, desc->mux_owner, owner);
> +                       goto out;
> +               }
>
>                 desc->gpio_owner = owner;
>         } else {
> @@ -116,6 +123,12 @@ static int pin_request(struct pinctrl_dev *pctldev,
>                                 desc->name, desc->mux_owner, owner);
>                         goto out;
>                 }
> +               if (pctldev->desc->strict && desc->gpio_owner) {
> +                       dev_err(pctldev->dev,
> +                               "pin %s already requested by %s; cannot claim for %s\n",
> +                               desc->name, desc->gpio_owner, owner);
> +                       goto out;
> +               }
>
>                 desc->mux_usecount++;
>                 if (desc->mux_usecount > 1)
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index 66e4697..fc6b034 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -114,6 +114,8 @@ struct pinctrl_ops {
>   *     of the pins field above
>   * @pctlops: pin control operation vtable, to support global concepts like
>   *     grouping of pins, this is optional.
> + * @strict: check both gpio_owner and mux_owner strictly before approving
> +       the pin request
>   * @pmxops: pinmux operations vtable, if you support pinmuxing in your driver
>   * @confops: pin config operations vtable, if you support pin configuration in
>   *     your driver
> @@ -132,6 +134,7 @@ struct pinctrl_desc {
>         const struct pinctrl_ops *pctlops;
>         const struct pinmux_ops *pmxops;
>         const struct pinconf_ops *confops;
> +       bool strict;
>         struct module *owner;
>  #ifdef CONFIG_GENERIC_PINCONF
>         unsigned int num_custom_params;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
