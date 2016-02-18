From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] MIPS: jz4740: remove broken irq_to_gpio() call
Date: Fri, 19 Feb 2016 00:19:18 +0100
Message-ID: <CACRpkda=TFuUWzV_pLKoVhCZp1zWbEjoGmCey_w87bsuQZZ=jg@mail.gmail.com>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-1-git-send-email-arnd@arndb.de>
	<20160216160609.GA15268@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34942 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947241AbcBRXTT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 18:19:19 -0500
Received: by mail-oi0-f49.google.com with SMTP id x21so873247oix.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 15:19:19 -0800 (PST)
In-Reply-To: <20160216160609.GA15268@linux-mips.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Linux MIPS <linux-mips@linux-mips.org>, "# v4 . 3+" <stable@vger.kernel.org>, Alban Bedel <albeu@free.fr>, Thomas Gleixner <tglx@linutronix.de>, Paul Burton <paul.burton@imgtec.com>

On Tue, Feb 16, 2016 at 5:06 PM, Ralf Baechle <ralf@linux-mips.org> wrote:

>> -#define IRQ_TO_BIT(irq) BIT(irq_to_gpio(irq) & 0x1f)
>> +#define IRQ_TO_BIT(irq) BIT((irq - JZ4740_IRQ_GPIO(0)) & 0x1f)
>>
>>  static void jz_gpio_check_trigger_both(struct jz_gpio_chip *chip, unsigned int irq)
>>  {
>
> I've already committed an identical fix locally.
>
>   Ralf

I took that fix out of linux-next and applied to the GPIO tree so I can apply
the rest of the patches without build problems. If you keep it
around without changing it, git should cope I guess.

Yours,
Linus Walleij
