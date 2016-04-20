From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH 05/23] avr32: do away with ARCH_REQUIRE_GPIOLIB
Date: Wed, 20 Apr 2016 11:09:31 +0200
Message-ID: <20160420090931.GA21027@samfundet.no>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-6-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:48606 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbcDTJJi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 05:09:38 -0400
Content-Disposition: inline
In-Reply-To: <1461142701-21096-6-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael =?iso-8859-1?Q?B=FCsch?= <m@bues.ch>, Haavard Skinnemoen <hskinnemoen@gmail.com>

Around Wed 20 Apr 2016 10:58:03 +0200 or thereabout, Linus Walleij wrot=
e:
> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
> as this can now be selected directly.
>=20
> Cc: Michael B=FCsch <m@bues.ch>
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

> ---
> Various arch maintainers:
>=20
> either ACK this and I will merge it into the GPIO tree for v4.7
> anticipating no clashes, or you wait until I have the enabling patch
> upstream (patch 1 in this series, removing deps on
> ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
> merge it to your arch trees yourselves for late v4.7
> (post GPIO tree merge) or for v4.8.

I'll go for this option, thank you (-:

> You can also ask me for an immutable branch if you prefer that, I
> will put the enabling patch on a branch and the patch for your arch
> on top and ask you to pull it.
>=20
> Select your option from the menu, silence probably means I will
> merge it to the GPIO tree. Unless you are X86 or ARM in which case
> I will be cautious.
> ---
>  arch/avr32/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
> index b6878eb64884..18b88779e701 100644
> --- a/arch/avr32/Kconfig
> +++ b/arch/avr32/Kconfig
> @@ -74,7 +74,7 @@ config PLATFORM_AT32AP
>  	select SUBARCH_AVR32B
>  	select MMU
>  	select PERFORMANCE_COUNTERS
> -	select ARCH_REQUIRE_GPIOLIB
> +	select GPIOLIB
>  	select GENERIC_ALLOCATOR
>  	select HAVE_FB_ATMEL
--=20
mvh
Hans-Christian Noren Egtvedt
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
