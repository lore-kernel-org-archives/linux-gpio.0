From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 09/23] m68k: do away with ARCH_REQUIRE_GPIOLIB
Date: Thu, 21 Apr 2016 11:12:45 +1000
Message-ID: <5718290D.7030705@westnet.com.au>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-10-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:4586
	"EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751532AbcDUBMN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 20 Apr 2016 21:12:13 -0400
In-Reply-To: <1461142701-21096-10-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: =?UTF-8?Q?Michael_B=c3=bcsch?= <m@bues.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

On 20/04/16 18:58, Linus Walleij wrote:
> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
> as this can now be selected directly.
>=20
> Cc: Michael B=C3=BCsch <m@bues.ch>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Since this affects ColdFire I am happy to give an ack:

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg


> Various arch maintainers:
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
>  arch/m68k/Kconfig.cpu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 0dfcf1281e9c..c1beb5ae181f 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -22,11 +22,11 @@ config M68KCLASSIC
> =20
>  config COLDFIRE
>  	bool "Coldfire CPU family support"
> -	select ARCH_REQUIRE_GPIOLIB
>  	select ARCH_HAVE_CUSTOM_GPIO_H
>  	select CPU_HAS_NO_BITFIELDS
>  	select CPU_HAS_NO_MULDIV64
>  	select GENERIC_CSUM
> +	select GPIOLIB
>  	select HAVE_CLK
> =20
>  endchoice
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
