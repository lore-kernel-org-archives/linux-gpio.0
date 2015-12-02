From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH] pinctrl: bcm: Default PINCTRL_BCM281XX to y for
 ARCH_BCM_MOBILE
Date: Wed, 2 Dec 2015 09:42:57 -0800
Message-ID: <565F2DA1.60908@broadcom.com>
References: <1449020490-27084-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:7381 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756118AbbLBRm7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 12:42:59 -0500
In-Reply-To: <1449020490-27084-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Cc: sbranden@broadcom.com, linus.walleij@linaro.org, bcm-kernel-feedback-list@broadcom.com



On 12/1/2015 5:41 PM, Florian Fainelli wrote:
> This driver is mandatory for proper operation on the platforms covered
> by the ARCH_BCM_MOBILE Kconfig symbol, make sure we do that driver on
> for these platforms.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/pinctrl/bcm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index cd11d4d9ad58..b63d7068f26c 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -9,6 +9,7 @@ config PINCTRL_BCM281XX
>   	select PINCONF
>   	select GENERIC_PINCONF
>   	select REGMAP_MMIO
> +	default ARCH_BCM_MOBILE
>   	help
>   	  Say Y here to support Broadcom BCM281xx pinctrl driver, which is used
>   	  for the BCM281xx SoC family, including BCM11130, BCM11140, BCM11351,
>

pinmux and pinctrl related configurations from the bcm281xx pinctrl 
driver are indeed mandatory for ARCH_BCM_MOBILE related platforms for 
some peripherals to function properly. It looks like we are missing some 
required configurations in the DT files though, but I guess that needs 
to be addressed by separate patches.

This change looks good to me!

Reviewed-by: Ray Jui <rjui@broadcom.com>

Thanks!

Ray
