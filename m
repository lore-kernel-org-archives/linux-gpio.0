From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 10/23] MIPS: do away with
 ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
Date: Tue, 10 May 2016 10:05:24 +0200
Message-ID: <20160510080524.GC16402@linux-mips.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-11-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:35028 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006AbcEJIFa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 May 2016 04:05:30 -0400
Received: from localhost.localdomain ([127.0.0.1]:58788 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27028568AbcEJIF1WqCkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 May 2016 10:05:27 +0200
Content-Disposition: inline
In-Reply-To: <1461142701-21096-11-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael =?iso-8859-1?Q?B=FCsch?= <m@bues.ch>, linux-mips@linux-mips.org

On Wed, Apr 20, 2016 at 10:58:08AM +0200, Linus Walleij wrote:

> This replaces:
>=20
> - "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB" as this can
>   now be selected directly.
>=20
> - "select ARCH_WANT_OPTIONAL_GPIOLIB" with no dependency: GPIOLIB
>   is now selectable by everyone, so we need not declare our
>   intent to select it.
>=20
> When ordering the symbols the following rationale was used:
> if the selects were in alphabetical order, I moved select GPIOLIB
> to be in alphabetical order, but if the selects were not
> maintained in alphabetical order, I just replaced
> "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB".
>=20
> Cc: Michael B=FCsch <m@bues.ch>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
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

Warning of the snappish maintainer ;-)

=46or this one:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
