From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Fri, 29 Aug 2014 09:20:54 +0200
Message-ID: <CACRpkdYXSj5suu+-mosReFKKJVf_ibaD2R4QG=BWdpBc9nzF4A@mail.gmail.com>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
	<1408355696-9998-2-git-send-email-lars@metafoo.de>
	<CACRpkdbWt-ns3xDFYR1P7i40J57x0z51MmPoZ36WOq2j0638Yw@mail.gmail.com>
	<53F5F461.8060104@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:49550 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbaH2HUy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 03:20:54 -0400
Received: by mail-oa0-f51.google.com with SMTP id n16so1492941oag.38
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2014 00:20:54 -0700 (PDT)
In-Reply-To: <53F5F461.8060104@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 21, 2014 at 3:30 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> On 08/21/2014 02:40 PM, Linus Walleij wrote:
>>
>> On Mon, Aug 18, 2014 at 4:54 AM, Lars-Peter Clausen <lars@metafoo.de>
>> wrote:
>>
>>> When looking up the IRQ the bank offset needs to be taken into account.
>>> Otherwise interrupts for banks other than bank 0 get incorrectly reported
>>> as
>>> interrupts for bank 0.
>>>
>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>> ---
>>> Changes since v1:
>>>          * Use lookup table instead of switch-case.
>>
>>
>> I tried to apply this, but it doesn't apply on top of the other patch
>> "gpio: zynq: Fix IRQ handlers" that I have queued for fixes.
>
>
> Works fine for me. Did you try to apply both patch 1 and 2 of this series or
> just patch 2?

Yes, and on my fixes branch, as well as on Torvald's master (which now
has patch 1/2) this happens:

]$ git am --signoff zynq2.patch
Applying: gpio: zynq: Take bank offset into account when reporting a IRQ
error: patch failed: drivers/gpio/gpio-zynq.c:461
error: drivers/gpio/gpio-zynq.c: patch does not apply
Patch failed at 0001 gpio: zynq: Take bank offset into account when
reporting a IRQ

Can you please test applying this patch only on upstream this and figure
out what is wrong?

Yours,
Linus Walleij
