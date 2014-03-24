From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] IXP4xx: Fix Goramo Multilink GPIO conversion.
Date: Mon, 24 Mar 2014 16:27:47 +0100
Message-ID: <CACRpkdaNdQjgAJv=mxn6MXS+kGKFoE4wmNHxYt_5WdM9sa6vxA@mail.gmail.com>
References: <m3siq9iyt2.fsf@intrepid.localdomain>
	<m3bnwxiwhj.fsf@intrepid.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:57032 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752754AbaCXP1r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 11:27:47 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so5976291oag.40
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 08:27:47 -0700 (PDT)
In-Reply-To: <m3bnwxiwhj.fsf@intrepid.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Halasa <khc@pm.waw.pl>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?ISO-8859-1?Q?Simon_K=E5gstr=F6m?= <simon.kagstrom@netinsight.net>, "arm@kernel.org" <arm@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 23, 2014 at 1:34 AM, Krzysztof Halasa <khc@pm.waw.pl> wrote=
:

> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'set_scl':
> arch/arm/mach-ixp4xx/goramo_mlr.c:82: error: implicit declaration of =
function 'gpio_line_set'
>
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'output_control':
> arch/arm/mach-ixp4xx/goramo_mlr.c:111: error: implicit declaration of=
 function 'gpio_line_config'
> arch/arm/mach-ixp4xx/goramo_mlr.c:111: error: 'IXP4XX_GPIO_OUT' undec=
lared
>
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'hss_dcd_irq':
> arch/arm/mach-ixp4xx/goramo_mlr.c:155: error: implicit declaration of=
 function 'gpio_line_get'
>
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
> arch/arm/mach-ixp4xx/goramo_mlr.c:416: error: 'IXP4XX_GPIO_OUT' undec=
lared
> arch/arm/mach-ixp4xx/goramo_mlr.c:421: error: 'IXP4XX_GPIO_IN' undecl=
ared
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khc@pm.waw.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mea culpa.

Arnd: can you apply this one patch directly for ARM SoC fixes and
Cc: stable@vger.kernel.org on this one?

Alternatively can you send this for fixes to arm@kernel.org with Cc:
stable added Krzysztof?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
