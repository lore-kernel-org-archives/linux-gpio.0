From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Serialize all register access
Date: Thu, 13 Aug 2015 13:24:13 +0200
Message-ID: <CACRpkdYj_gBQpRqPP4S3c-cPhzRGnGUahh+1L8G5qUxwG=cx0g@mail.gmail.com>
References: <1438595198-44230-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34078 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbbHMLYN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 07:24:13 -0400
Received: by oip136 with SMTP id 136so24625868oip.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2015 04:24:13 -0700 (PDT)
In-Reply-To: <1438595198-44230-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 3, 2015 at 11:46 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> There is a hardware issue in Intel Braswell/Cherryview where concurrent
> GPIO register access might results reads of 0xffffffff and writes might get
> dropped.
>
> Prevent this from happening by taking the serializing lock for all places
> where it is possible that more than one thread might be accessing the
> hardware concurrently.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

When we are on the topic of this spinlock, I noticed that you
take it in some IRQ functions:

static void chv_gpio_irq_ack(struct irq_data *d)
{
        struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
        struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
        int pin = chv_gpio_offset_to_pin(pctrl, irqd_to_hwirq(d));
        u32 intr_line;

        spin_lock(&pctrl->lock);
(...)

The Realtime tree have recently started to push raw spinlocks
into GPIO drivers that handle IRQs. Can you look into this
for the Intel drivers, I think maybe this needs to be a raw
spinlock to play nicely with realtime.

Cf:
http://marc.info/?l=linux-gpio&m=143749603401220&w=2

Yours,
Linus Walleij
