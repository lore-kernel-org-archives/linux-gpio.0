From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Sun, 4 Sep 2016 22:53:45 +0200
Message-ID: <CACRpkdYYvxmBn+gZnYb5ugK9m5nW2kdGuK8hJ3OjyBWgT-xi6w@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <CACRpkdZJy9gZwH9__qXAf6nURN7xV6CbOaGC-JL6X5rDHN55VQ@mail.gmail.com>
 <20160830214253.GP1041@n2100.armlinux.org.uk> <CACRpkdbNn0VXf7bHcfAq2qe2WpiZUxO-HRvikh4nv-svgJf+pg@mail.gmail.com>
 <20160902170057.GE1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36333 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754561AbcIDUxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2016 16:53:47 -0400
Received: by mail-oi0-f41.google.com with SMTP id w78so36712224oie.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Sep 2016 13:53:46 -0700 (PDT)
In-Reply-To: <20160902170057.GE1041@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Fri, Sep 2, 2016 at 7:00 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> Linus,
>
> There's a change I'd like to merge into patch 5 - overall it looks
> like the below, and allows us to use gpio-reg with the PXA mainstone
> MST_PCMCIA[01] registers.  Some of these GPIO signals have hardware
> interrupts associated with them, but not all.
>
> Do you approve?

Yes of course.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
