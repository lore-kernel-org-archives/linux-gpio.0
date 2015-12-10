From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-idio-16: Clear pending interrupt in IRQ handler
Date: Thu, 10 Dec 2015 19:13:07 +0100
Message-ID: <CACRpkdY53JH978-0_-BtzR9Wc=nvpp_qhJDK8AowTTzhuaPBPQ@mail.gmail.com>
References: <20151203012303.GA13986@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35295 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754650AbbLJSNI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:13:08 -0500
Received: by obc18 with SMTP id 18so64120797obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:13:07 -0800 (PST)
In-Reply-To: <20151203012303.GA13986@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Dec 3, 2015 at 2:23 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 uses a single interrupt to indicate a possible
> change-of-state in any of the digital input lines. As such, only a
> single write to the device's "Clear Interrupt" register is necessary to
> acknowledge the IRQ for all respective GPIO.
>
> This patch moves the "Clear Interrupt" register write operation from the
> irq_ack callback to the IRQ handler function, wherefore each interrupt
> may be cleared respectively by executing a single outb call at the end
> of the idio_16_irq_handler function, rather than multiple redundant outb
> calls as a result of the generic_handle_irq call for each masked GPIO.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Rebased and applied this patch.

Yours,
Linus Walleij
