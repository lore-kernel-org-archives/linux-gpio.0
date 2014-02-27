From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for
 compile testing
Date: Thu, 27 Feb 2014 10:16:43 +0100
Message-ID: <CACRpkdZg5uoP5LurL5vOPCaKQu2B=neybuo=gwM_JT7UAhRkjg@mail.gmail.com>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:36594 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965AbaB0JQo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Feb 2014 04:16:44 -0500
Received: by mail-vc0-f180.google.com with SMTP id ks9so2157629vcb.39
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2014 01:16:44 -0800 (PST)
In-Reply-To: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Markus Mayer <mmayer@broadcom.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Feb 21, 2014 at 2:42 PM, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:

> This change makes it easier to configure a kernel for a real machine =
by
> not showing the option to enable it at all if COMPILE_TEST is off.
>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Markus: can you ACK this patch?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
