From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 15:43:18 +0100
Message-ID: <CACRpkdYiQ=eQpUNspRH27x=9soExn-Mx5Rhc7USqAk7g5DNG_A@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<20151024184253.GC22220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34844 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464AbbJ3OnT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:43:19 -0400
Received: by oifu63 with SMTP id u63so60862742oif.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 07:43:18 -0700 (PDT)
In-Reply-To: <20151024184253.GC22220@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sat, Oct 24, 2015 at 8:42 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

> What happens if we have two I2C gpio expanders with the same I2C
> addresses connected to different I2C busses? If I see this correctly
> they would both show up with the same name. Is there an easy and
> race-free way to see which GPIO chip is connected to which I2C bus?

My spontaneous question is: how does ethernet interfaces or whatever
handle this nowadays to get unique device names?

Currently we are probe-order dependent. It would be good to fix
the plug-order business from day 1 but how?

Yours,
Linus Walleij
