From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 7/7] gpio: brcmstb: implement suspend/resume/shutdown
Date: Tue, 31 Oct 2017 10:52:42 +0100
Message-ID: <CACRpkdZiqJcySSEavz9xbdLv=32Dng_Q17hV9mPGu0LzQ+zCbQ@mail.gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com> <20171024195451.30535-8-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:57220 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbdJaJwo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 05:52:44 -0400
Received: by mail-io0-f194.google.com with SMTP id m81so33665810ioi.13
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 02:52:43 -0700 (PDT)
In-Reply-To: <20171024195451.30535-8-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Oct 24, 2017 at 9:54 PM, Doug Berger <opendmb@gmail.com> wrote:

> This commit corrects problems with the previous wake implementation
> by implementing suspend and resume power management operations and
> the driver shutdown operation.
>
> Wake masks are used to keep track of which GPIO should wake the
> device.  On suspend the GPIO state is saved and the possible wakeup
> sources are explicitly unmasked in the hardware. Non-wakeup sources
> are explicitly masked so IRQCHIP_MASK_ON_SUSPEND is no longer
> necessary.  The saved state of the GPIO is restored upon resume.
> It is important not to write to the GPIO status register since this
> has the effect of clearing bits.  The status register is explicitly
> removed from the register save and restore to ensure this.
>
> The shutdown operation allows the hardware to be put into the same
> quiesced state as the suspend operation and removes the need for
> the reboot notifier.
>
> Unfortunately, there appears to be some confusion about whether
> a pending disabled wake interrupt should wake the system. If a wake
> capable interrupt is disabled using the default "lazy disable"
> behavior and it is triggered before the suspend_device_irq call
> the interrupt hardware will be acknowledged by mask_ack_irq and the
> IRQS_PENDING flag is added to its state. However, the IRQS_PENDING
> flag of wake interrupts is not checked to prevent the transition to
> suspend and the hardware has been acked which prevents its wakeup.
> If the lazy disabled interrupt is triggered after the call to
> suspend_device_irqs then the wakeup logic will abort the suspend.
> The irq_disable method is defined by this GPIO driver to prevent
> lazy disable so that the pending hardware state remains asserted
> allowing the hardware to wake and providing a consistent behavior.
>
> In addition, the IRQ_DISABLE_UNLAZY flag is set for the non-wake
> parent interrupt as a convenience to prevent the need to add code
> to the brcmstb_gpio_irq_handler to support "lazy disable" of the
> non-wake parent interrupt when it is disabled during suspend and
> resume. Chained interrupt parents are not normally disabled, but
> these GPIO devices have different parent interrupts for wake and
> non-wake handling. It is convenient to mask the non-wake parent
> when suspending to preserve the hardware state for proper wakeup
> accounting when the driver is resumed.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Patch applied with the tags.

Yours,
Linus Walleij
