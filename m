From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH] gpio: max732x: Add IRQF_SHARED to irq flags
Date: Thu, 23 Apr 2015 17:15:52 +0300
Message-ID: <CAJOTznXaqHOivrEXj6EiSuYPX_j6rD-zLShzSFgCbX9zGnVVDw@mail.gmail.com>
References: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
	<5537FC21.9050602@mentor.com>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og121.obsmtp.com ([64.18.0.139]:53881 "EHLO
	exprod5og121.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966036AbbDWOPz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2015 10:15:55 -0400
Received: by layy10 with SMTP id y10so13721005lay.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2015 07:15:53 -0700 (PDT)
In-Reply-To: <5537FC21.9050602@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Apr 22, 2015 at 10:53 PM, Vladimir Zapolskiy wrote:
> is it still the case that for shared interrupts a hard IRQ handler is
> mandatory to have?
>
> Here I rely on
> http://lists.kernelnewbies.org/pipermail/kernelnewbies/2011-March/001118.html
>
> With best wishes,
> Vladimir
>

Vladimir,

A hard IRQ handler is not mandatory to have for shared interrupts. It just can
make things a bit faster. In fact, there is a lot of drivers that implement the
same behavior as my patch proposes (requesting threaded interrupt with
IRQF_SHARED flag and default IRQ handler). Well, there *may* be some cases
when hard IRQ handler is mandatory, but it's definitely not this case.

Basically, what happens when interrupt arrives from the line that has multiple
devices on it -- is that all the interrupt handlers (for devices on that line)
are being executed. Then each handler reads interrupt register from associated
device and decides if interrupt was from it's device. In my case reading is
happening via I2C interface, which can take a while to finish, hence it's not
recommended to perform I2C operations in hard IRQ handlers.

The general approach for I2C drivers is to do request_threaded_irq() with
NULL specified for hard IRQ handler (so irq_default_primary_handler() will be
used, which just wakes bottom half handler). Driver should read interrupt
register (via I2C) in threaded IRQ handler, do corresponding actions and send
acknowledge to device, so device can release interrupt line. In my case
acknowledge is happening automatically on I2C read operation. Also it's
important to provide IRQF_ONESHOT flag when requesting threaded irq:
this way irq line will be disabled before running threaded handler.

Hope it answers your question.

Best regards,
  Sam Protsenko
