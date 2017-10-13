From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] gpio: Introduce ->get_multiple callback
Date: Fri, 13 Oct 2017 14:46:48 +0200
Message-ID: <CACRpkdZqcbp44ODnqTEO7c5s_xMnrYJtRCbaKZcyk+xhz4cPMA@mail.gmail.com>
References: <cover.1507797496.git.lukas@wunner.de> <487b9e42a3c3f5f50f4e9e90cbce65cdbeef0a79.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:51253 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753258AbdJMMqt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2017 08:46:49 -0400
Received: by mail-io0-f176.google.com with SMTP id b186so8858427iof.8
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2017 05:46:49 -0700 (PDT)
In-Reply-To: <487b9e42a3c3f5f50f4e9e90cbce65cdbeef0a79.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rojhalat Ibrahim <imr@rtschenk.de>

On Thu, Oct 12, 2017 at 12:40 PM, Lukas Wunner <lukas@wunner.de> wrote:

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
> advantage of the newly added infrastructure.  Update the documentation.
>
> Cc: Rojhalat Ibrahim <imr@rtschenk.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Changes v1 -> v2:

Applied this v2 version.

Good work! I'm happy :)

We should take a sweep over existing drivers and see
which in-tree drivers that can exploit this and send some
patches for testing.

Yours,
Linus Walleij
