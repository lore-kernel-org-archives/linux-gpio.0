From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] gpio: Add support for PTX1K CBC FPGA spare GPIOs
Date: Fri, 21 Oct 2016 10:44:05 +0200
Message-ID: <CACRpkdY9obGN1gLHcf5KWKjL_y7tQ4krbc1XihV_rKe_BPSRgA@mail.gmail.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853614-22409-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:34208 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753283AbcJUIoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 04:44:06 -0400
Received: by mail-qk0-f177.google.com with SMTP id f128so133109537qkb.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2016 01:44:06 -0700 (PDT)
In-Reply-To: <1475853614-22409-3-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Debjit Ghosh <dghosh@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

On Fri, Oct 7, 2016 at 5:20 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> From: Georgi Vlaev <gvlaev@juniper.net>
>
> Add support for the GPIO block in Juniper's CBC FPGA.
>
> A number of GPIOs exported by different kind of boards
> is supported.
>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Guenter Roeck <groeck@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

Again pretty much the same comments.

The drivers not supporting IRQ will be pretty quick and
easy to fix up I guess, the IRQ drivers will require some
effort. An approach is to split these in two: one for the basic
GPIO and a separate add-on patch for the IRQ functionality.

Yours,
Linus Walleij
