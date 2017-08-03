From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is disabled
Date: Thu, 3 Aug 2017 15:22:24 +0200
Message-ID: <CACRpkdYWo56+mB8A-BGQN6RF=Ux8_VZvvRpMQt92B2W6dpz2TA@mail.gmail.com>
References: <1500503665-21278-1-git-send-email-festevam@gmail.com> <20170719230815.GA38936@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36741 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbdHCNW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 09:22:26 -0400
Received: by mail-it0-f43.google.com with SMTP id 77so9047275itj.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 06:22:26 -0700 (PDT)
In-Reply-To: <20170719230815.GA38936@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>

On Thu, Jul 20, 2017 at 1:08 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Hmm, I did not realize that GPIO API allowed calls with NULL desc and
> they would be silently accepted and return 0... Not sure if that is the
> best way for the subsystem to behave, but Linus is the boss ;)

NULL gpiods are supported for
gpiod_get_[index_]optional() usecasese only.

See commit:
commit 54d77198fdfbc4f0fe11b4252c1d9c97d51a3264
"gpio: bail out silently on NULL descriptors"

> Maybe check for NULL explicitly and keep warning if !NULL is passed?

A better solution is maybe if gpiod_get_[index_]optional() could
return something akin to a dummy regulator if the GPIO is not
there?

Then we can stop allowing NULL gpiods.

Optional regulators also have some tricksy corner cases like this...

Yours,
Linus Walleij
