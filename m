Return-Path: <SRS0=R7Pu=X4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C455C10F14
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Oct 2019 08:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4106E21A4C
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Oct 2019 08:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tOEVT8Iy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfJCIJG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 3 Oct 2019 04:09:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39053 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfJCIJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 04:09:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id 72so1061535lfh.6
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMrC6d21Lqn1wZBnE86G7d6SIcKdg0qKRD2HBEpYoyM=;
        b=tOEVT8IyAOa4ukUpUOX2W3pgVYBXAqF+Uh0q353e43wgEVXOASJDzb3XOTyqsvkXX4
         9l+p/334j6o3xBdZEskfPVUR61HZDUcndtpaqajbqadxQe9YEd4YrRJFdKGOk34IZfyP
         b4STYnDn34Z1guriLHjraRxH5XlbEimyPAkBdvtyepw6skGZMcLIXwHOq61ODRbdG7Ej
         xFvBaar2TSYoUysJdhELO8bWxwaqZ7TstflHKM/CYJ5oB31OLj2P1znBoybSt8nT5imN
         M2El6j8NPI1E9YU1d2XbYVefjC9bIVSMbujp6ESYp+h5ikUmyiCAuip1boQ5rpqiIMGt
         XLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMrC6d21Lqn1wZBnE86G7d6SIcKdg0qKRD2HBEpYoyM=;
        b=SpsRCLZ83/FPeWYSyu5mnOmK+Yz8IQGJJ7ElNPYqiUTYx++YTim9vb0FNL13GCebIh
         LHHhRYPk2MNXv0YMZ54qzRwVCwnoS9JwNC2dfxdn62FOo+zKAWpN+g0CqNWb6vO5mPyM
         YLFBDjS6nL8QzjvnQaE2hk59BKw66aHNJKY1yCGDhIi3AXQRlVFlAt0HNX62KoWwVsQb
         3Ur6VvTsG3/7j2g/IM55ubQkTE/JHETeflTiKwf6bxwMcY8vXy62yC7FNsil27Estomp
         gY6URDFCUuh94OzLFNykgCk3PGiaTSBOZe0GJYeQ5+/PA2WmMmVUVcd65onXzZGWxozC
         dHjQ==
X-Gm-Message-State: APjAAAVlfRRH2igrGsYz9aUZyT7UhOE3ZqdNZwsIZdPVOdfPhl2rgeDz
        y+U1uU2JrTHZdIROVF2QPj+6cV4+ybf/MsD4SVyA0g==
X-Google-Smtp-Source: APXvYqysZ9SvfBfMjepy5wsmaNF5xPTiuQn/H+64GDkc23geu2XtaBPeTDv8o2ZXUOHBwmmygVByzvj9ul+PpiakIFY=
X-Received: by 2002:a19:14f:: with SMTP id 76mr4814026lfb.92.1570090143512;
 Thu, 03 Oct 2019 01:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
 <2261eadf98584d13a490f2abd8777d4a@AcuMS.aculab.com> <20190906091212.GF21254@piout.net>
 <b010053340ef48dfa244ff48c8decd38@AcuMS.aculab.com>
In-Reply-To: <b010053340ef48dfa244ff48c8decd38@AcuMS.aculab.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 10:08:51 +0200
Message-ID: <CACRpkdZeBTWZ3NYR-aoTL0whXZLZxCJ+rB_jzCChgA5iKVOk=A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: at91-pio4: implement .get_multiple and .set_multiple
To:     David Laight <David.Laight@aculab.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 11:46 AM David Laight <David.Laight@aculab.com> wrote:
> > On 06/09/2019 09:05:36+0000, David Laight wrote:

> > It does improve gpio switching synchronisation when they are in the same
> > bank as it will remove the 250ns delay. Of course, if you need this
> > delay between clk and data, then the consumer driver should ensure the
> > delay is present.
>
> With multiple requests the output pin changes will always be in the
> same order and will be separated by (say) 250ns.
> This is a guaranteed synchronisation.

Do you mean that hardware will guarantee this synchronization?
Linux device driver code cannot rely on that. We will simply
grab two individual GPIO lines (not get_multiple()) then issue
set() on the clock, ndelay(250) and then set() data.

It doesn't matter much because bitbanging is always extremely
slow anyways so one will get lots of delay, which is why
e.g. spi-gpio doesn't insert any delay IIRC.

The point is that the lines need be grabbed individually so
the delay between can be controlled.

> IIRC both SMBus and I2C now quote 0ns setup time.
> Changing both clock and data with the same IOW isn't enough to
> guarantee this.
> (In practise the I2C setup time required by a device is probably
> slightly negative (In order to support 0ns inputs) so a very small
> -ve setup will (mostly) work.)

If you are referring to drivers/i2c/busses/i2c-gpio.c it does seem
to do proper delays using bit_data->udelay from the bitbang
library.

Yours,
Linus Walleij
