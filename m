From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/9] gpio-sysfs: Use gpio descriptor name instead of
 gpiochip names array
Date: Mon, 21 Sep 2015 17:57:46 -0700
Message-ID: <CACRpkdabejwA3jeP6yCUp4vQw1hLryJMgdExsvz1d1Sz4vFkDw@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-5-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35209 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390AbbIVA5q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 20:57:46 -0400
Received: by obbzf10 with SMTP id zf10so95991490obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 17:57:46 -0700 (PDT)
In-Reply-To: <1439561466-14350-5-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The name is now stored in the gpio descriptor as well, for example to
> allow to store names from DT. This patch changes the sysfs gpio files
> to use the gpio descriptor name.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied. This is a very nice patch too.

Yours,
Linus Walleij
