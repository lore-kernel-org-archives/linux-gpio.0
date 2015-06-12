From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 06/10] pinctrl: berlin: use proper compatibles
Date: Fri, 12 Jun 2015 11:05:37 +0200
Message-ID: <20150612090537.GB29596@kwain>
References: <1425654328-26298-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425654328-26298-7-git-send-email-antoine.tenart@free-electrons.com>
 <CACRpkda-4SahLjwe09D-Hb8p0nQFdG1Zc_xvLPwLGYQMkJQaXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:45980 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750732AbbFLJFk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2015 05:05:40 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda-4SahLjwe09D-Hb8p0nQFdG1Zc_xvLPwLGYQMkJQaXA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 10, 2015 at 09:13:55AM +0200, Linus Walleij wrote:
> On Fri, Mar 6, 2015 at 4:05 PM, Antoine Tenart
> <antoine.tenart@free-electrons.com> wrote:
>=20
> > The Berlin pin-controller driver was sharing the chip and system
> > controller nodes with the clock and the reset drivers. They all sha=
red
> > the same compatible. With the introduction of the Marvell Berlin MF=
D
> > controller, the Berlin pin-controller driver has now its own node.
> > Update its compatibles to not share anymore the ones of the chip an=
d
> > system controllers.
> >
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
>=20
> Antoine, how is this series going?

The series should be in the berlin tree at the moment.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
