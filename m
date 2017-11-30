From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Thu, 30 Nov 2017 10:48:51 +0100
Message-ID: <CACRpkdZkwOb4fzmYWs789U4gYLLeZrfhr-hQ6Xo3Q2a+0jr5-g@mail.gmail.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org> <87po80w1px.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:35012 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdK3Jsx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 04:48:53 -0500
Received: by mail-it0-f49.google.com with SMTP id f143so7775048itb.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 01:48:52 -0800 (PST)
In-Reply-To: <87po80w1px.fsf@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

On Thu, Nov 30, 2017 at 10:32 AM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:

> now that you have a hardirq handler, do you even need IRQF_ONESHOT? How
> about using the hardirq handler to mask $this gpio's IRQ, then run
> thread without IRQF_ONESHOT? This would help a in cases where the IRQ
> line is shared.

Yeah maybe ... I'm a bit uncertain even about this.

We have GPIOs on slow (I2C, SPI) expanders, and they
sometimes need to go out and read that to even see what
IRQ that fired.

With this construction I *think* what happens is that it
timestamps it, then figures out (with some slow bus traffic)
if this IRQ was even ours and then calls the thread, if it was.
If it was not our IRQ the timestamp is just left crufting around.

Without shared IRQF_ONESHOT I am worried that something
else (shared) will come in between and pollute my timestamp.

Yours,
Linus Walleij
