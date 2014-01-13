From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCHv9 2/2] ARM: imx_v6_v7_defconfig: Enable backlight gpio
 support.
Date: Mon, 13 Jan 2014 12:04:21 +0800
Message-ID: <20140113040419.GJ23525@S2101-09.ap.freescale.net>
References: <1389366444-29449-1-git-send-email-denis@eukrea.com>
 <1389366444-29449-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db9lp0249.outbound.messaging.microsoft.com ([213.199.154.249]:3092
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751131AbaAMEDS convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 12 Jan 2014 23:03:18 -0500
Content-Disposition: inline
In-Reply-To: <1389366444-29449-2-git-send-email-denis@eukrea.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Denis Carikli <denis@eukrea.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>

On Fri, Jan 10, 2014 at 04:07:24PM +0100, Denis Carikli wrote:
> The eukrea mbimxsd51 has a gpio backlight for its
>   LCD display, so we turn that driver on.
>=20
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Fabio Estevam <fabio.estevam@freescale.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Eric B=E9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>

Applied this one, thanks.

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
