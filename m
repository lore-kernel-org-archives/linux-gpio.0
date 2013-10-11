From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: misc: add gpio wakeup driver
Date: Fri, 11 Oct 2013 14:54:24 +0200
Message-ID: <CACRpkdZWPP+8qJJM60rJvLR7xQvfaHcs-XkabD9zvubTEHFWyA@mail.gmail.com>
References: <1380635719-31171-1-git-send-email-zonque@gmail.com>
	<CACRpkdYhQ+-d1COcvmg_hEJ==cTFpKLNDnvF8kdK4QgXzHenEA@mail.gmail.com>
	<5257E3C6.3050507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:60717 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab3JKMyZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 08:54:25 -0400
Received: by mail-ie0-f169.google.com with SMTP id tp5so8253259ieb.14
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 05:54:24 -0700 (PDT)
In-Reply-To: <5257E3C6.3050507@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Mack <zonque@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>

On Fri, Oct 11, 2013 at 1:40 PM, Daniel Mack <zonque@gmail.com> wrote:

>> Since what the driver will then eventually provide is to
>> flag an IRQ line as wakeup, I wonder if this should not just
>> simply go into the interrupt core, or atleast of/irq.c.
>
> But for that, the IRQ line must be requested exclusively and handled as
> well, no? If not, how would you handle cases where an interrupt is
> marked as wakeup source by the core, but used by another driver which
> calls disable_irq_wake() on it for whatever reason?

Does this driver handle that?

It rather looks like it hogs both the GPIO and IRQ from anyone
else who want it...

Yours,
Linus Walleij
