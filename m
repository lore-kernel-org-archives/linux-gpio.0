From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/9] gpio: Introduce gpio descriptor 'name'
Date: Mon, 21 Sep 2015 17:51:35 -0700
Message-ID: <CACRpkdbkkUVmdbDWOPgm4yro28kb0_zkBcaMVGjCFk3Yr75MTQ@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-3-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34380 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757401AbbIVAvg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 20:51:36 -0400
Received: by obbda8 with SMTP id da8so96240149obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 17:51:35 -0700 (PDT)
In-Reply-To: <1439561466-14350-3-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:10 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The latest gpio hogging mechanism assigns each gpio a 'line-name' in the
> devicetree. The 'name' field is different from the 'label' field.
> 'label' is only used for requested GPIOs to describe its current use by
> driver or userspace.
>
> The 'name' field describes the GPIO itself, not the use. This is most
> likely identical to the label in the schematic on the GPIO line and
> should help to find this particular GPIO.
>
> This is equivalent to the gpiochip->names array. However names should be
> stored in the GPIO descriptor. We will use gpiochip->names in the future
> only as initializer for the GPIO descriptors for drivers that assign
> GPIO names hardcoded. All other GPIO names will be parsed from DT and
> directly assigned to the GPIO descriptor.
>
> This patch adds a helper function to find gpio descriptors by name
> instead of gpio number.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
