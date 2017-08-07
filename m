From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] Documentation: bindings: Add ti,lmp92001
Date: Mon, 7 Aug 2017 11:23:42 +0200
Message-ID: <CACRpkda7XC8QnTLhFv21eR5X=LHiBJisx2jXgnVE7JC7rb9Ebg@mail.gmail.com>
References: <1501579073-4764-1-git-send-email-s.abhisit@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:35134 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752555AbdHGJXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:23:43 -0400
Received: by mail-io0-f169.google.com with SMTP id m88so776243iod.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:23:43 -0700 (PDT)
In-Reply-To: <1501579073-4764-1-git-send-email-s.abhisit@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: s.abhisit@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>

On Tue, Aug 1, 2017 at 11:17 AM,  <s.abhisit@gmail.com> wrote:


> + - #gpio-cells : Should be two.  The first cell is the pin number and the
> +  second cell is used to specify the gpio polarity:
> +        0 = Active high
> +        1 = Active low

Just reference the standard bindings?

> +- ti,lmp92001-gpio-dir: bit mask for direction and drive logic default. Since
> +  the direction and the internal pull-down are shared register and similar to
> +  open-collector drive:
> +        0 = [O]utput and also meaning drive it to low
> +        1 = [I]nput and also meaning open, to drive it to high is required to
> +        have an external resistor

NACK this is totally wrong.

When using GPIO descriptors, consumers specify open drain/collector, not
producers. The same applies to this: the consumers should specify it not
the producer.

You need to either add a pin control interface/driver or extend the GPIO
bindings for consumers to do this, I thin pin control is the right thing here.
It's gonna be complicated but much better.

Yours,
Linus Walleij
