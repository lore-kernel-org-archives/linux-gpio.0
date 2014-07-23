From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: zynq: Clear pending interrupt when enabling a IRQ
Date: Wed, 23 Jul 2014 16:31:22 +0200
Message-ID: <CACRpkda3p3v7o2itkTPRPr6KFhrUO3M8fvn_2S8oYsd_2oaXaw@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
	<1405677133-8706-2-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:35434 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709AbaGWObW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 10:31:22 -0400
Received: by mail-oa0-f54.google.com with SMTP id n16so1709495oag.13
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 07:31:22 -0700 (PDT)
In-Reply-To: <1405677133-8706-2-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Harini Katakam <harinik@xilinx.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> The Zynq GPIO controller does not disable the interrupt detection when the
> interrupt is masked and only disables the propagation of the interrupt. This
> means when the controller detects an interrupt condition while the interrupt is
> logically disabled (and masked) it will propagate the recorded interrupt event
> once the interrupt is enabled. This will cause the interrupt consumer to see
> spurious interrupts to prevent this first make sure that the interrupt is not
> asserted and then enable it.
>
> E.g. when a interrupt is requested with request_irq() it will be configured
> according to the requested type (edge/level triggered, etc.) after that it will
> be enabled. But the detection circuit might have already registered a false
> interrupt before the interrupt type was correctly configured and once the
> interrupt is unmasked this false interrupt will be propagated and the interrupt
> handler for the just request interrupt will called.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Seems like you know what you're doing.

Patch tentatively applied unless Harini or Soren protests...

Yours,
Linus Walleij
