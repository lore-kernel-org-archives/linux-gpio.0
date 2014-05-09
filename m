From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] gpio: mvebu: Remove initcall-based driver initialization
Date: Fri, 9 May 2014 10:08:48 -0300
Message-ID: <20140509130848.GB764@arch.cereza>
References: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CACRpkdbXq_0C-d+uJ8yz8esHDvmY4A+MM8XE4G2TKFpbdKTBNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:45600 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751136AbaEINJV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 09:09:21 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbXq_0C-d+uJ8yz8esHDvmY4A+MM8XE4G2TKFpbdKTBNw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>

On 09 May 11:09 AM, Linus Walleij wrote:
> On Thu, Apr 24, 2014 at 10:54 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
>=20
> > There's no reason to use an initcall to initialize this driver,
> > and regular module_platform_driver() can be used instead.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>=20
> Has anyone tested this on real hardware? That is the only test that
> counts on initcalls as it happens.
>=20

Yup, tested on my mvebu boards, don't remember which one.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
