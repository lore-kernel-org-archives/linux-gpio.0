From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 2/2] pinctrl: rockchip: only enable gpio clock when it setting
Date: Thu, 13 Aug 2015 16:50:06 +0200
Message-ID: <1632762.z1JEYVnjv5@diego>
References: <1439287924-6988-1-git-send-email-hl@rock-chips.com> <2167165.ooWgarx4Ov@diego> <CACRpkdYYdqm+CfejMA6yrDheNA=3H13zsW2XuKqqYDRNMS=07w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53288 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752922AbbHMOuS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 10:50:18 -0400
In-Reply-To: <CACRpkdYYdqm+CfejMA6yrDheNA=3H13zsW2XuKqqYDRNMS=07w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lin Huang <hl@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Am Donnerstag, 13. August 2015, 16:11:38 schrieb Linus Walleij:
> On Thu, Aug 13, 2015 at 2:37 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> >> Patch applied with Doug's test tags etc.
> >=20
> > did you  also take the first patch?
> >=20
> > Aka bot should probably stay together (hence Stephen's Ack for the =
clock
> > change), as the dynamically controlling the gpio clocks exposes the
> > pclk_pd_pmu.
>=20
> OK wasn't obvious to me, patch 1/2 applied to the pinctrl tree now.

Thanks for picking patch 1/2 too.

Both me and Lin seem to have forgotten to mention this in this new revi=
sion=20
(sorry about that), as it was discussed in a previous revision only.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
