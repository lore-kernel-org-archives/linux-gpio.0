From: Joel Stanley <joel@jms.id.au>
Subject: Re: [RESEND PATCH linux] aspeed: pinctrl: Allow disabling Port D and
 Port E loopback mode
Date: Thu, 16 Feb 2017 11:51:35 +1030
Message-ID: <CACPK8XeaWAcMANFcYMSo_-_s2Hh0oiTRW=EP+Ah+9GVy0qasOA@mail.gmail.com>
References: <20170215065514.16673-1-raltherr@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:36280 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750718AbdBPBV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2017 20:21:56 -0500
In-Reply-To: <20170215065514.16673-1-raltherr@google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rick Altherr <raltherr@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Wed, Feb 15, 2017 at 5:25 PM, Rick Altherr <raltherr@google.com> wrote:
> Port D and port E GPIO loopback modes are commonly enabled via hardware
> straps for use with front-panel buttons.  When the BMC is powered
> off or fails to boot, the front-panel buttons are directly connected to
> the host chipset via the loopback to allow direct power-on and reset
> control. Once the BMC has booted, the loopback mode must be disabled for
> the BMC to take over control of host power-on and reset.
>
> Disabling these loopback modes requires writing to the hardware strap
> register which violates the current design of assuming the system
> designer chose the strap settings for a specific reason and they should
> be treated as read-only. Only the two bits of the strap register related
> to these loopback modes are allowed to be written and comments have been
> added to explain why.

I had to clarify this on IRC. The Aspeed soc is flexible if you want
no-passthrough when powered off and want to enable it at  runtime with
normal SCU registers.
However if you want passthrough when powered off, and then disable it
at runtime, you need to change the strap. Hence the patch.

> Signed-off-by: Rick Altherr <raltherr@google.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 76f62bd45f02..5b49952e5fad 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -198,9 +198,19 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                  * them. This may mean that certain functions cannot be
>                  * deconfigured and is the reason we re-evaluate after writing
>                  * all descriptor bits.
> +                *
> +                * Port D and port E GPIO loopback modes are the only exception
> +                * as those are commonly used with front-panel buttons to allow
> +                * normal operation of the host when the BMC is powered off or
> +                * fails to boot. Once the BMC has booted, the loopback mode
> +                * must be disabled for the BMC to control host power-on and
> +                * reset.
>                  */
> -               if ((desc->reg == HW_STRAP1 || desc->reg == HW_STRAP2) &&
> -                               desc->ip == ASPEED_IP_SCU)
> +               if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
> +                   !(desc->mask & (BIT(21) | BIT(22))))
> +                       continue;
> +
> +               if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
>                         continue;
>
>                 ret = regmap_update_bits(maps[desc->ip], desc->reg,
> --
> 2.11.0.483.g087da7b7c-goog
>
