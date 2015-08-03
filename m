From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: don't override irq_*_resources() callbacks
Date: Mon, 3 Aug 2015 10:56:18 +0200
Message-ID: <CACRpkdYB0VH2045qC4RX8nG7MAk9MsBZ=jJaOUWJk1UKF6o-nQ@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
	<55BB8C23.1050200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35228 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751998AbbHCI4S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:56:18 -0400
Received: by oihq81 with SMTP id q81so67404665oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:56:18 -0700 (PDT)
In-Reply-To: <55BB8C23.1050200@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Rabin Vincent <rabin@rab.in>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 31, 2015 at 4:54 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 07/31/2015 03:48 PM, Rabin Vincent wrote:

>> +     if (!irqchip->irq_request_resources &&
>> +         !irqchip->irq_release_resources) {
>> +             irqchip->irq_request_resources = gpiochip_irq_reqres;
>> +             irqchip->irq_release_resources = gpiochip_irq_relres;
>> +     }
>
> I think, it will be better to handle req/rel cases separately.

No, I think that could be dangerous. The semantics of the both
functions are intertwined, if we change something in the core
we may break drivers.

It would be better with a mechanism saying "also do this
on irq_request/release resource" so a secondary vtable
for these two. Where the latter would be optional per-callback.

That way the ETRAXFS does not need to reimplement
irq locking.

I'll see what I can come up with.

Yours,
Linus Walleij
