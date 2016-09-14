From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 18/33] pcmcia: sa1100: provide generic CF support
Date: Wed, 14 Sep 2016 10:52:39 +0200
Message-ID: <CACRpkda7qHx4JVdVv+q3=twTup9rDD2ke8K-tSH9CkhZMQqemg@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJl3-0000nS-Nw@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34358 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751621AbcINIxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 04:53:13 -0400
Received: by mail-oi0-f45.google.com with SMTP id m11so11572245oif.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2016 01:52:40 -0700 (PDT)
In-Reply-To: <E1beJl3-0000nS-Nw@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Mon, Aug 29, 2016 at 12:25 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> Provide generic non-voltage sensing socket support for StrongARM
> platforms using the gpiolib and regulator subsystems to obtain the
> resources to control the socket.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
(...)

> +static int sa11x0_drv_pcmcia_probe(struct platform_device *pdev)
> +{
> +       struct soc_pcmcia_socket *skt;
> +       struct device *dev = &pdev->dev;
> +
> +       if (dev->id == -1)
> +               return sa11x0_drv_pcmcia_legacy_probe(pdev);

There is a typo there, it should be pdev->id rather than dev->id.

After fixing this, my legacy h3600 PCMCIA started probing again.

(It revealed another bug in fetching GPIOs but it is an orthogobal
problem altogether, looking into it.)

Yours,
Linus Walleij
