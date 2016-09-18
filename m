From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Sun, 18 Sep 2016 13:30:24 +0200
Message-ID: <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
References: <20160916135808.GA17518@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33531 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760146AbcIRLa0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2016 07:30:26 -0400
Received: by mail-oi0-f44.google.com with SMTP id r126so159574581oib.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2016 04:30:26 -0700 (PDT)
In-Reply-To: <20160916135808.GA17518@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

On Fri, Sep 16, 2016 at 3:58 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> However, things are getting weird when you have that requested pin
> assigned to one device, and you try to export the GPIO on that pin
> (through sysfs for example,

DON'T use sysfs. Use the new chardev ABI which is by the way enabled
by default.

(But you will face the same issue there I guess.)

> but given the implementation, I think that
> it would work alike by calling gpiod_request).

Yes

> In this case, you get no error, and the GPIO is indeed exported,
> allowing the user to change the direction and / or value of the pin,
> taking away that pin from its device.

If and only if the pin controller does not specify .strict in
struct pinmux_ops.

> I have the feeling that the core should prevent that, making sure that
> the gpiod_request returns EBUSY in such a case, but I'm not really
> sure whether it's the case or not, and if it is, where that check is
> happening.

- Did you try specifying .strict for the pinmux?

- Did you read Documentation/pinctrl.txt, section titled
  "GPIO mode pitfalls"?

Yours,
Linus Walleij
