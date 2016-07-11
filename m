From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to support Merrifield
Date: Mon, 11 Jul 2016 11:13:50 +0200
Message-ID: <CACRpkdYHioyktfNojP6U+NQ4PjAos7d=ZvR0uRK16ZKGbuyXwQ@mail.gmail.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160711045503.GF14693@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:32868 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752669AbcGKJNw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 05:13:52 -0400
Received: by mail-oi0-f48.google.com with SMTP id u201so138897676oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 02:13:52 -0700 (PDT)
In-Reply-To: <20160711045503.GF14693@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Mon, Jul 11, 2016 at 6:55 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Jul 08, 2016 at 02:08:23PM +0300, Andy Shevchenko wrote:
>> +static void mrfld_irq_ack(struct irq_data *d)
>> +{
>> +     struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
>> +     u32 gpio = irqd_to_hwirq(d);
>> +     void __iomem *gisr = gpio_reg(&priv->chip, gpio, GISR);
>> +
>> +     writel(BIT(gpio % 32), gisr);
>
> It just occured me that you actually need to take the lock here. If
> another thread is doing series of updates on the same register this
> might step over what the other thread is doing.

I accept incremental patches, I think it's safe to begin with this merged
and work from there if there are issues.

Yours,
Linus Walleij
