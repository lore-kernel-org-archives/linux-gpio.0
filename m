From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] gpiolib: Add gpio name information to /sys/kernel/debug/gpio
Date: Mon, 10 Aug 2015 12:02:13 +0200
Message-ID: <CACRpkdajd5B6qUa6mi_0m53eMtLenoAWUCnmq-mOC+EhXfzpTA@mail.gmail.com>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
	<1438680203-13432-7-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33809 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932560AbbHJKCO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 06:02:14 -0400
Received: by oip136 with SMTP id 136so83082330oip.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 03:02:13 -0700 (PDT)
In-Reply-To: <1438680203-13432-7-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Add some information about gpio names to the debugfs gpio file. name and
> label of a GPIO are then displayed next to each other. This way it is
> easy to see what the real name of GPIO is and what the driver requested
> it for.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

This patch looks correct in the context.

Yours,
Linus Walleij
