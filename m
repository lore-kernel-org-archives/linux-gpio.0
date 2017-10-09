From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Mon, 9 Oct 2017 21:57:58 +0200
Message-ID: <CACRpkdZe6uKqWo6hg4ROjiv4YUWyW0Upy4s6UCMH4ri3v3PF5g@mail.gmail.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <20170928083348.GI4630@lahna.fi.intel.com> <CACRpkdZVSXtj31stVo6QvQ05LN43nEVj_1BccrebbcT7Ee24-A@mail.gmail.com>
 <aabd3920-7170-3883-58a8-695d15664150@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:56933 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755072AbdJIT57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 15:57:59 -0400
Received: by mail-it0-f45.google.com with SMTP id g18so14233136itg.5
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2017 12:57:59 -0700 (PDT)
In-Reply-To: <aabd3920-7170-3883-58a8-695d15664150@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Chris Gorman <chrisjohgorman@gmail.com>

On Mon, Oct 9, 2017 at 8:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> At the moment it was merged there were no user of irq_base except gpio-mockup.c.

OK I feel calmer.

> And actually there are shouldn't as calling irq_create_mapping() in cycle
> will not guarantee sequential Linux IRQ numbers allocation.

Yeah. I always felt that was bad practice.

But we should really kill off that irq_base member from gpio_chip. It looks
dangerous to have arond.

Yours,
Linus Walleij
