From: Ley Foon Tan <lftan@altera.com>
Subject: Re: [PATCH 20/23] nios2: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Thu, 21 Apr 2016 15:46:51 +0800
Message-ID: <1461224811.3003.2.camel@ubuntu>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	 <1461142701-21096-21-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0067.outbound.protection.outlook.com ([207.46.100.67]:52688
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751092AbcDUIBS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2016 04:01:18 -0400
In-Reply-To: <1461142701-21096-21-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael =?ISO-8859-1?Q?B=FCsch?= <m@bues.ch>, nios2-dev@lists.rocketboards.org

On Wed, 2016-04-20 at 10:58 +0200, Linus Walleij wrote:
> This symbols is not needed to get access to selecting the
> GPIOLIB anymore: any arch can select GPIOLIB.
>=20
> Cc: Michael B=C3=BCsch <m@bues.ch>
> Cc: Ley Foon Tan <lftan@altera.com>
> Cc: nios2-dev@lists.rocketboards.org
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
> ---
Please merge this via GPIO tree. Thanks.

Acked-by: Ley Foon Tan <lftan@altera.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
