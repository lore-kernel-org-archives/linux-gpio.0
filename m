From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: why is gpiolib-legacy.o automatically compiled into gpiolib?
Date: Tue, 20 Jun 2017 18:49:30 +0200
Message-ID: <CACRpkdav=cBcwqHcZLdxktBhW1RD4rFcB2GM3eod_CVDRz4mHA@mail.gmail.com>
References: <20170606065955.Horde.XoxPxs0B5NDB-5t0Ifgyr2E@crashcourse.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33277 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdFTQtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 12:49:31 -0400
Received: by mail-io0-f173.google.com with SMTP id t87so88484472ioe.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 09:49:31 -0700 (PDT)
In-Reply-To: <20170606065955.Horde.XoxPxs0B5NDB-5t0Ifgyr2E@crashcourse.ca>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: rpjday@crashcourse.ca
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 6, 2017 at 12:59 PM,  <rpjday@crashcourse.ca> wrote:

>   for the first time, going through the docs to learn about the descriptor
> interface for GPIO, and while the Doc directory seems to suggest that the
> "legacy" interface is deprecated, the drivers/gpio/Makefile contains the
> line:
>
>   obj-$(CONFIG_GPIOLIB)         += gpiolib-legacy.o
>
> so is that "legacy" file still required for descriptor-based interface?
> i'm sure i'll figure it out if i keep reading, but a quick clarification
> would not go unappreciated.

We cannot remove the legacy API before we have changed all
users and all platforms to use the descriptor API.

Unfortunately this is a daunting task. We do it whenever we can.

All patches increasing the use of global GPIO numbers and
increasing the use of decriptor handles are greatly appreciated.

Linus Walleij
