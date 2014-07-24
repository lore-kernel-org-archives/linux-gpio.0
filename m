From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: keystone: add dsp gpio controller driver
Date: Thu, 24 Jul 2014 16:12:24 +0200
Message-ID: <CACRpkdYdUKmR+bZo374AqepDXfsZqBwJ88e4is90-UoUBWdJrA@mail.gmail.com>
References: <1405507426-18992-1-git-send-email-grygorii.strashko@ti.com>
	<CACRpkdYY_a_9G-VLBbv2a22Cg4j0t3Wv4W1h0n6-ccCXgVJXsA@mail.gmail.com>
	<53CFD404.7070704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:51502 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932355AbaGXOMZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 10:12:25 -0400
Received: by mail-oa0-f54.google.com with SMTP id n16so3743479oag.27
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2014 07:12:24 -0700 (PDT)
In-Reply-To: <53CFD404.7070704@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Suman Anna <s-anna@ti.com>, Jaswinder Singh <jaswinder.singh@linaro.org>, Alexander Shiyan <shc_work@mail.ru>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ivan.khoronzhuk@ti.com, Muralidharan Karicheri <m-karicheri2@ti.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 23, 2014 at 5:25 PM, Santosh Shilimkar
<santosh.shilimkar@ti.com> wrote:

> I will try to answer this. This IP is indeed a GPIO block
> but the IO's are used just OUTPUT lines from Linux
> HOST perspective. These IOs are connected to the DSPs
> as input/IRQ lines.

So the DSP is another discrete IC, and could be something
different, so this is board-level information?

I'm really worrying whether this is general purpose or not :-/

Yours,
Linus Walleij
