From: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
Date: Mon, 14 Apr 2014 10:21:09 +0200
Message-ID: <201404141021.09250.jbe@pengutronix.de>
References: <1397460641.23515.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37970 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbaDNIRs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Apr 2014 04:17:48 -0400
In-Reply-To: <1397460641.23515.3.camel@phoenix>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Monday 14 April 2014 09:30:41 Axel Lin wrote:
> From f52622585aeb4cf785c78548e440993a1e9625b1 Mon Sep 17 00:00:00 200=
1
> From: Axel Lin <axel.lin@ingics.com>
> Date: Mon, 14 Apr 2014 15:20:15 +0800
> Subject: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove(=
)
>
> The memory for ts is allocated by devm_kzalloc now, so the kfree is n=
ot
> required.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Good catch.

Acked-by: Juergen Beisert <jbe@pengutronix.de>

--=20
Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Juergen Beisert =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
Linux Solutions for Science and Industry =C2=A0 =C2=A0 =C2=A0| http://w=
ww.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
