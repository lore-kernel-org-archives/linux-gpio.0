From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Read triggering type from HW if not
 set when requested
Date: Tue, 12 May 2015 13:55:00 +0200
Message-ID: <CACRpkdaC9dUQQC8Q5bPDcwwgJZmqnqZ04H0EJR46K8sMzx0zGQ@mail.gmail.com>
References: <1431426937-225742-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36386 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932433AbbELLzB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:55:01 -0400
Received: by obbkp3 with SMTP id kp3so3274646obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 04:55:00 -0700 (PDT)
In-Reply-To: <1431426937-225742-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jagadish Krishnamoorthy <jagadish.krishnamoorthy@intel.com>, Freddy Paul <freddy.paul@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 12, 2015 at 12:35 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> If a driver does not set interrupt triggering type when it calls
> request_irq(), it means use the pin as the hardware/firmware has
> configured it. There are some drivers doing this. One example is
> drivers/input/serio/i8042.c that requests the interrupt like:
>
>         error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
>                             "i8042", i8042_platform_device);
>
> It assumes the interrupt is already properly configured. This is true in
> case of interrupts connected to the IO-APIC. However, some Intel
> Braswell/Cherryview based machines use a GPIO here instead for the internal
> keyboard controller.
>
> This is a problem because even if the pin/interrupt is properly configured,
> the irqchip ->irq_set_type() will never be called as the triggering flags
> are 0. Because of that we do not have correct interrupt flow handler set
> for the interrupt.
>
> Fix this by adding a custom ->irq_startup() that checks if the interrupt
> has no triggering type set and in that case read the type directly from the
> hardware and install correct flow handler along with the mapping.
>
> Reported-by: Jagadish Krishnamoorthy <jagadish.krishnamoorthy@intel.com>
> Reported-by: Freddy Paul <freddy.paul@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
