From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is disabled
Date: Thu, 27 Jul 2017 16:38:40 -0300
Message-ID: <CAOMZO5AVoGTRnCfRf6x+nGnH_N_LsW6yswkRrY+UQkFRX=E2yg@mail.gmail.com>
References: <1500503665-21278-1-git-send-email-festevam@gmail.com> <20170719230815.GA38936@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:35707 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751461AbdG0Til (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2017 15:38:41 -0400
Received: by mail-ua0-f181.google.com with SMTP id d29so139250262uai.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2017 12:38:41 -0700 (PDT)
In-Reply-To: <20170719230815.GA38936@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>

On Wed, Jul 19, 2017 at 8:08 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Hmm, I did not realize that GPIO API allowed calls with NULL desc and
> they would be silently accepted and return 0... Not sure if that is the
> best way for the subsystem to behave, but Linus is the boss ;)

That part seems fine.

> Maybe check for NULL explicitly and keep warning if !NULL is passed?

Not sure if this is needed.

Prior to commit 22c403676dbbb7c6 ("gpio: return NULL from
gpiod_get_optional when
GPIOLIB is disabled") it made sense to have the WARN_ON(1) and the comment:

"  /* GPIO can never have been requested */" was true.

After such commit this is no longer true, so that's why IMO we should
just get rid of the WARN_ON and comment.
