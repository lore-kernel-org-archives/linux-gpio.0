From: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Subject: Re: [PATCH] gpio: zynq: initialize clock even without CONFIG_PM
Date: Thu, 2 Jun 2016 18:43:57 +0200
Message-ID: <5750624D.8010506@gmail.com>
References: <20160601110259.GA30501@laureti-dev>
 <CACRpkdYeRn7oxOnYv44R8+FMG4CdMrFQ9sjyZC6SDT-OY4Yezg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36591 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751840AbcFBQoB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 12:44:01 -0400
Received: by mail-wm0-f65.google.com with SMTP id a20so5739770wma.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 09:44:01 -0700 (PDT)
In-Reply-To: <CACRpkdYeRn7oxOnYv44R8+FMG4CdMrFQ9sjyZC6SDT-OY4Yezg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Helmut Grohne <h.grohne@intenta.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>

On 06/02/2016 02:30 PM, Linus Walleij wrote:
> On Wed, Jun 1, 2016 at 1:03 PM, Helmut Grohne <h.grohne@intenta.de> wrote:
>
>> When the PM initialization was moved in the commit referenced below, the
>> code enabling the clock was removed from the probe function. On
>> CONFIG_PM=y kernels, this is not a problem as the pm resume hook enables
>> the clock, but when power management is disabled, all those pm_*
>> functions are noops and the clock is never enabled resulting in a
>> dysfunctional gpio controller.
>>
>> Put the clock initialization back to support CONFIG_PM=n.
>>
>> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
>> Fixes: 3773c195d387 ("gpio: zynq: Do PM initialization earlier to support gpio hogs")
>
> This does not apply to my kernel tree, can you rebase it on
> v4.7-rc1?
>
> Sould it be tagged for stable and sent to fixes?
>
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

I just ran into that problem when using v4.7-rc1 for our Zynq-7015 based 
custom board running without CONFIG_PM. It relies on MIO based GPIO for 
hardware identification, which immediately ceased to work.

Rebasing Helmut's patch for v4.7-rc1 fixes this issue, so I can confirm 
it works!

Regards,
Helmut Buchsbaum


