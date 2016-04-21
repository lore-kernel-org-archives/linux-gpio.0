From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 21/23] sparc: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Thu, 21 Apr 2016 14:58:30 -0400 (EDT)
Message-ID: <20160421.145830.1101835916715485213.davem@davemloft.net>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-22-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1461142701-21096-22-git-send-email-linus.walleij@linaro.org>
Sender: sparclinux-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, acourbot@nvidia.com, m@bues.ch, sparclinux@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

=46rom: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Apr 2016 10:58:19 +0200

> This symbols is not needed to get access to selecting the
> GPIOLIB anymore: any arch can select GPIOLIB.
>=20
> Cc: Michael B=FCsch <m@bues.ch>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: David S. Miller <davem@davemloft.net>
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
