From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is disabled
Date: Wed, 2 Aug 2017 14:27:44 +0200
Message-ID: <CACRpkdZezwWY6hrUvCWbZe2geBV2um1ngc03_55oZV4XqONvUw@mail.gmail.com>
References: <1501258886-12376-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:36473 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753162AbdHBM1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:27:46 -0400
Received: by mail-it0-f44.google.com with SMTP id 77so22883217itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 05:27:45 -0700 (PDT)
In-Reply-To: <1501258886-12376-1-git-send-email-fabio.estevam@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>

On Fri, Jul 28, 2017 at 6:21 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:

> gpiod_get_optional() returns NULL when GPIOLIB is disabled since
> commit 22c403676dbbb7c6 ("gpio: return NULL from gpiod_get_optional when
> GPIOLIB is disabled").
>
> However, many gpiod functions still have WARN_ON(1) in their
> GPIOLIB=n stubs, which causes warnings in drivers even if the
> GPIO descriptor is requested via gpiod_get_optional().
>
> Prior to commit 22c403676dbbb7c6 ("gpio: return NULL from
> gpiod_get_optional when GPIOLIB is disabled") it was indeed true
> the comment: "GPIO can never have been requested" as gpiod_get_optional()
> used to return an error.
>
> After this commit the returned value is NULL, so the comment and
> WARN_ON(1) are no longer accurate.
>
> An example of this kernel warning can be see in this report:
> https://www.spinics.net/lists/kernel/msg2563045.html
>
> Remove the WARN_ON(1) so that drivers can silently work fine
> without kernel warnings when GPIOLIB is disabled.
>
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

I explained in another commend why I see this as a non-issue.

Drivers that call GPIO accessors likely need them to work properly.

If they see these messages I suspect it is because of missing
depends on or select of GPIOLIB in their Kconfig.

Yours,
Linus Walleij
