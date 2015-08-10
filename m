From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpiolib-of: Rename gpio_hog functions to be generic
Date: Mon, 10 Aug 2015 11:29:58 +0200
Message-ID: <CACRpkdYpeoo2scKzNuSYbWfWLTBodXJEX3KyRzoRQPuoaeqzKw@mail.gmail.com>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
	<1438680203-13432-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36809 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932161AbbHJJ37 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 05:29:59 -0400
Received: by obnw1 with SMTP id w1so119291018obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 02:29:58 -0700 (PDT)
In-Reply-To: <1438680203-13432-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The gpio hogging functions are currently only used for gpio-hogging. But
> these functions are widely generic ones which parse gpio device nodes in
> the DT.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
(...)
>  /**
> - * of_get_gpio_hog() - Get a GPIO hog descriptor, names and flags for GPIO API
> + * of_parse_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API

It's not a good name, too generic. It could easily be assued this is
for something
wider.

of_parse_own_gpio() or something, indicating that this pertains to the
chip itself and not to outside users, would be better.

Yours,
Linus Walleij
