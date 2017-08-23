From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Wed, 23 Aug 2017 09:38:21 +0200
Message-ID: <CACRpkdYfHGHNGKKMs+Yqhfeyhs=L0G4K_6OYneDG1RkNpxLXkA@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36766 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753329AbdHWHiW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 03:38:22 -0400
Received: by mail-oi0-f47.google.com with SMTP id g131so9026169oic.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2017 00:38:22 -0700 (PDT)
In-Reply-To: <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 21, 2017 at 3:12 PM, Lukas Wunner <lukas@wunner.de> wrote:

> SPI-attached GPIO controllers typically read out all inputs in one go.
> If callers desire the values of multipe inputs, ideally a single readout
> should take place to return the desired values.  However the current
> driver API only offers a ->get callback but no ->get_multiple (unlike
> ->set_multiple, which is present).  Thus, to read multiple inputs, a
> full readout needs to be performed for every single value (barring
> driver-internal caching), which is inefficient.
>
> In fact, the lack of a ->get_multiple callback has been bemoaned
> repeatedly by the gpio subsystem maintainer:
> http://www.spinics.net/lists/linux-gpio/msg10571.html
> http://www.spinics.net/lists/devicetree/msg121734.html
>
> Introduce the missing callback.  Add corresponding consumer functions
> such as gpiod_get_array_value().  Amend linehandle_ioctl() to take
> advantage of the newly added infrastructure.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Lean, mean, and clean and introducing the interface that I've
been missing for some time. Good work!

Let's hope we can merge this early for v4.15 once v4.14-rc1 is out
and pile some drivers supporting it on top of it too.

I am only worried on how to get __assign_bit() into place in time,
or whether I should carry that patch in the GPIO tree simply?
We *could* add a local version of it and then switch it over
with a follow-up patch...

Could you please patch
Documentation/gpio/consumer.txt
to mention the new functions as well?

Maybe we should have a section in Documentation/gpio/driver.txt,
that doc is a bit incomplete right now.

Yours,
Linus Walleij
