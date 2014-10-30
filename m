From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mxs: warn if functions are not grouped by name
Date: Thu, 30 Oct 2014 15:53:29 +0100
Message-ID: <CACRpkdagD9j1HUrSbQfM1D+663nnKXk=1FEAMr6ksDgm4evrZA@mail.gmail.com>
References: <1413884445-28347-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:33746 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760341AbaJ3Oxb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Oct 2014 10:53:31 -0400
Received: by mail-ig0-f182.google.com with SMTP id hn18so5285656igb.9
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2014 07:53:29 -0700 (PDT)
In-Reply-To: <1413884445-28347-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Oct 21, 2014 at 11:40 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The mxs pinctrl driver cannot handle when functions are not grouped b=
y
> name (which IMO is a bug). This happens for example if a
> imx28-somemachine.dts provides a function that has the same name as a
> function defined in imx28.dtsi.

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
