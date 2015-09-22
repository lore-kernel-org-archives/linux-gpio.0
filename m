From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/9] gpiolib: Use GPIO name from names array for gpio descriptor
Date: Mon, 21 Sep 2015 17:56:23 -0700
Message-ID: <CACRpkdbYMOhuD+YLkEwRTU3kWjhkjEOmfkeu-_0U+C=PiOqbsQ@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34535 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390AbbIVA4X (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 20:56:23 -0400
Received: by obbda8 with SMTP id da8so96299713obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 17:56:23 -0700 (PDT)
In-Reply-To: <1439561466-14350-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This patch adds GPIO names to the GPIO descriptors when initializing the
> gpiochip. It also introduces a check whether any of the new names will
> conflict with an existing GPIO name.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied. To me this is the magic transition patch that make
things really smooth.

Yours,
Linus Walleij
