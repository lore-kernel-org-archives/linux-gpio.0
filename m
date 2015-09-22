From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/9] gpiolib-of: Rename gpio_hog functions to be generic
Date: Mon, 21 Sep 2015 17:48:57 -0700
Message-ID: <CACRpkda+m9gy=fpigRfGnXBHgpjd71zLGyA0md0FsyXbMEaxaA@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34160 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390AbbIVAs6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 20:48:58 -0400
Received: by obbda8 with SMTP id da8so96206823obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 17:48:57 -0700 (PDT)
In-Reply-To: <1439561466-14350-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:10 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The gpio hogging functions are currently only used for gpio-hogging. But
> these functions are widely generic ones which parse gpio device nodes in
> the DT.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

This patch applied after a small rebasing.

BTW: at this point, please base your subsequent submissions on my
"devel" branch from linux-gpio as I am starting to apply some stuff.

Yours,
Linus Walleij
