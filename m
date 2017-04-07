From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Fri, 7 Apr 2017 12:07:26 +0200
Message-ID: <CACRpkdYZVy2t9=K0jVm5=BxhWWUwiNsGDTMVBbSiB9+1+uafJQ@mail.gmail.com>
References: <cover.1490595641.git.nandor.han@ge.com> <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han@ge.com>
 <CACRpkdZB_cxqw0=M4YOhcwdZe7BxJtVKA290yGH-jxPU2MDgBg@mail.gmail.com> <HE1P101MB01883B516828F26921267A4FE60A0@HE1P101MB0188.NAMP101.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35008 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbdDGKH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 06:07:28 -0400
Received: by mail-io0-f177.google.com with SMTP id z13so46617825iof.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 03:07:27 -0700 (PDT)
In-Reply-To: <HE1P101MB01883B516828F26921267A4FE60A0@HE1P101MB0188.NAMP101.PROD.OUTLOOK.COM>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Han, Nandor (GE Healthcare)" <nandor.han@ge.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Malinen, Semi (GE Healthcare)" <semi.malinen@ge.com>

On Wed, Apr 5, 2017 at 3:24 PM, Han, Nandor (GE Healthcare)
<nandor.han@ge.com> wrote:
> [Me]
>> > +       /* bring the chip out of reset */
>> > +       reset_gpio = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
>> > +       if (IS_ERR(reset_gpio))
>> > +               dev_warn(&spi->dev, "could not get reset-gpios\n");
>> > +       else if (reset_gpio)
>> > +               gpiod_put(reset_gpio);
>>
>> I don't think you should put it, other than in the remove()
>> function and in that case you need to have it in the
>> state container.
>
> Can you please be more explicit here.
>
> Currently I'm trying to bring the device out from reset in case reset GPIO is provided.
> I don't see how this could be done in remove()  :)

If you issue gpiod_put() you release the GPIO hande so something else
can go in and grab the GPIO and assert the reset.

This is not what you want to make possible: you want to hold this gpiod handle
as long as the driver is running. devm_gpiod_get_optional() will do the
trick if you don't want to put the handle under explicit control.

Yours,
Linus Walleij
