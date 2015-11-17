From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add IRQ support to ACCES 104-IDIO-16 driver
Date: Tue, 17 Nov 2015 10:08:21 +0100
Message-ID: <CACRpkdY1CBCC7o8MU0Wd4Et1DM6Zbx5CryyquWPjpB-Gmronmw@mail.gmail.com>
References: <20151103125423.GA5460@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34721 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363AbbKQJIW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 04:08:22 -0500
Received: by oies6 with SMTP id s6so1313374oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 01:08:22 -0800 (PST)
In-Reply-To: <20151103125423.GA5460@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 3, 2015 at 1:54 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 series offers Change-of-State detection interrupt
> functionality; if Change-of-State detection is enabled, an interrupt is
> fired off if any input line changes state (i.e. goes from low to high,
> or from high to low). This patch adds support to handle these interrupts
> and allows the user to mask which GPIO lines are affected. The interrupt
> line number for the device may be set via the idio_16_irq module
> parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v2:
>   - Remove includes for <linux/irq.h> and <linux/irqdomain.h>
>   - Rename uppercase variable names to lowercase
>   - Utilize the BIT macro
>   - Move IRQ acknowledgement code to irq_ack callback
>   - Use handle_edge_irq since this device only handles edge IRQs

Looks just good.

Patch applied for v4.5.

Yours,
Linus Walleij
