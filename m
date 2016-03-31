From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Add support for level triggered interrupts
Date: Thu, 31 Mar 2016 10:41:24 +0200
Message-ID: <CACRpkdZKX28G_MvvNhGB7v0Mwsfhbq3gnkmNiCM9UzRsmdJCxw@mail.gmail.com>
References: <1458752487-32767-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:32922 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbcCaIlZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:41:25 -0400
Received: by mail-oi0-f49.google.com with SMTP id d205so51292848oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:41:25 -0700 (PDT)
In-Reply-To: <1458752487-32767-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 23, 2016 at 6:01 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> The interrupt for the corresponding pin is configured to trigger when the
> pin state changes compared to a preconfigured state (Bit set in INTCON).
> This state is set by setting/clearing the bit in DEFVAL.
> In the interrupt handler we need also to check if the bit in INTCON is set
> for level triggered interrupts.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied.

I'm a bit concerned that you now support both edge and level trigged
IRQs but this driver is using handle_simple_irq() in the
gpiochip_irqchip_add() call. I guess it "just works" because
the hardware will latch the edge IRQ and clear it when reading the
status register.

I guess you have tested it with both edge and level IRQs?

Yours,
Linus Walleij
