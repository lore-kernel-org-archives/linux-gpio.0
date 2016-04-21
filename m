From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH 07/23] cris: do away with ARCH_REQUIRE_GPIOLIB
Date: Thu, 21 Apr 2016 16:05:41 +0200
Message-ID: <20160421140541.GQ2555@axis.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-8-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:46224 "EHLO
	bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbcDUOFx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2016 10:05:53 -0400
Content-Disposition: inline
In-Reply-To: <1461142701-21096-8-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael =?iso-8859-1?Q?B=FCsch?= <m@bues.ch>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, linux-cris-kernel@axis.com

On Wed, Apr 20, 2016 at 10:58:05AM +0200, Linus Walleij wrote:
> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
> as this can now be selected directly.
>=20
> Cc: Michael B=FCsch <m@bues.ch>
> Cc: Mikael Starvik <starvik@axis.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Cc: linux-cris-kernel@axis.com
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

/^JN - Jesper Nilsson
--=20
               Jesper Nilsson -- jesper.nilsson@axis.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
