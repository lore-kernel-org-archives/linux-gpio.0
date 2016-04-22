From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 02/23] arc: select GPIOLIB directly
Date: Fri, 22 Apr 2016 10:46:16 +0530
Message-ID: <5719B3A0.4060001@synopsys.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:34893 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752841AbcDVFSI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2016 01:18:08 -0400
In-Reply-To: <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: =?UTF-8?Q?Michael_B=c3=bcsch?= <m@bues.ch>, linux-snps-arc@lists.infradead.org

On Wednesday 20 April 2016 02:28 PM, Linus Walleij wrote:
> Instead of indirectly selecting GPIOLIB via the
> ARCH_REQUIRE_GPIOLIB symbol, just select GPIOLIB.
>=20
> Cc: Michael B=C3=BCsch <m@bues.ch>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Various arch maintainers:

It would be nice to get the cover latter as well to get more context. T=
he whole
series didn't seem to be CCed to lkml either. Anyhow I found some refer=
ence on
linux-gpio patchworks and seems like a nice cleanup.

So for arch/arc/*

Acked-by: Vineet Gupta <vgupt@synopsys.com>

Thx,
-Vineet

>=20
> either ACK this and I will merge it into the GPIO tree for v4.7
> anticipating no clashes, or you wait until I have the enabling patch
> upstream (patch 1 in this series, removing deps on
> ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
> merge it to your arch trees yourselves for late v4.7
> (post GPIO tree merge) or for v4.8.
>=20
> You can also ask me for an immutable branch if you prefer that, I
> will put the enabling patch on a branch and the patch for your arch
> on top and ask you to pull it.
>=20
> Select your option from the menu, silence probably means I will
> merge it to the GPIO tree. Unless you are X86 or ARM in which case
> I will be cautious.
> ---
>  arch/arc/plat-axs10x/Kconfig | 2 +-
>  arch/arc/plat-tb10x/Kconfig  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kcon=
fig
> index 426ac4b8bb39..c54d1ae57fe0 100644
> --- a/arch/arc/plat-axs10x/Kconfig
> +++ b/arch/arc/plat-axs10x/Kconfig
> @@ -13,7 +13,7 @@ menuconfig ARC_PLAT_AXS10X
>  	select OF_GPIO
>  	select MIGHT_HAVE_PCI
>  	select GENERIC_IRQ_CHIP
> -	select ARCH_REQUIRE_GPIOLIB
> +	select GPIOLIB
>  	help
>  	  Support for the ARC AXS10x Software Development Platforms.
> =20
> diff --git a/arch/arc/plat-tb10x/Kconfig b/arch/arc/plat-tb10x/Kconfi=
g
> index d14b3d3c5dfd..149e0917645d 100644
> --- a/arch/arc/plat-tb10x/Kconfig
> +++ b/arch/arc/plat-tb10x/Kconfig
> @@ -21,7 +21,7 @@ menuconfig ARC_PLAT_TB10X
>  	select PINCTRL
>  	select PINCTRL_TB10X
>  	select PINMUX
> -	select ARCH_REQUIRE_GPIOLIB
> +	select GPIOLIB
>  	select GPIO_TB10X
>  	select TB10X_IRQC
>  	help
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
