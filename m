From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Allow hogged gpios to be requested
Date: Mon, 10 Aug 2015 11:26:49 +0200
Message-ID: <CACRpkdZAjWf3Echvz6Z2hTOF8Bqs=OqLKUTYc04r9vzFo727jg@mail.gmail.com>
References: <1438680424-698-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34932 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbbHJJ0u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 05:26:50 -0400
Received: by obbop1 with SMTP id op1so119750477obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 02:26:49 -0700 (PDT)
In-Reply-To: <1438680424-698-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Aug 4, 2015 at 11:27 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> It can be useful to claim hogged gpios later, for example from
> userspace. This allows to set defaults for GPIOs using the hogging
> mechanism and override the setup later from userspace or a kernel driver.
>
> This patch adds a check for hogged gpios to allow requesting them. If
> the gpio is not hogged but marked as requested, it still fails with
> -EBUSY.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

To me it feels like a new DT property "gpio-inital-value" or so
need to be defined in addition to the hogging bindings, and that
one just sets the GPIO up without setting the FLAG_IS_HOGGED.

The mechanism needs to be available to non-DT as well
of course, but it could be a first usecase.

So instead of:

line_b {
           gpio-initval;
           gpios = <6 0>;
           output-low;
};

Note: no line-name. And it shouldn't be allowed: we don't
know who will use this in the end.

Yours,
Linus Walleij
