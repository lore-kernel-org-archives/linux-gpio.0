From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Thu, 21 Aug 2014 07:40:04 -0500
Message-ID: <CACRpkdbWt-ns3xDFYR1P7i40J57x0z51MmPoZ36WOq2j0638Yw@mail.gmail.com>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
	<1408355696-9998-2-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:43673 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbaHUMkF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Aug 2014 08:40:05 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so7495847oag.40
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2014 05:40:04 -0700 (PDT)
In-Reply-To: <1408355696-9998-2-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 18, 2014 at 4:54 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> When looking up the IRQ the bank offset needs to be taken into account.
> Otherwise interrupts for banks other than bank 0 get incorrectly reported as
> interrupts for bank 0.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>         * Use lookup table instead of switch-case.

I tried to apply this, but it doesn't apply on top of the other patch
"gpio: zynq: Fix IRQ handlers" that I have queued for fixes.

Can you please take a look in the GPIO tree or linux-next and
check that this applied on top of that patch?

Collect all ACKs when you're at it.

Yours,
Linus Walleij
