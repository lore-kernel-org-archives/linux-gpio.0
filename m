From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Fri, 29 Aug 2014 09:34:35 +0200
Message-ID: <54002D0B.8080509@metafoo.de>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>	<1408355696-9998-2-git-send-email-lars@metafoo.de>	<CACRpkdbWt-ns3xDFYR1P7i40J57x0z51MmPoZ36WOq2j0638Yw@mail.gmail.com>	<53F5F461.8060104@metafoo.de> <CACRpkdYXSj5suu+-mosReFKKJVf_ibaD2R4QG=BWdpBc9nzF4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-116.synserver.de ([212.40.185.116]:1094 "EHLO
	smtp-out-111.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751709AbaH2Hei (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Aug 2014 03:34:38 -0400
In-Reply-To: <CACRpkdYXSj5suu+-mosReFKKJVf_ibaD2R4QG=BWdpBc9nzF4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWE=?= =?UTF-8?B?bm4=?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 08/29/2014 09:20 AM, Linus Walleij wrote:
> On Thu, Aug 21, 2014 at 3:30 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:
>> On 08/21/2014 02:40 PM, Linus Walleij wrote:
>>>
>>> On Mon, Aug 18, 2014 at 4:54 AM, Lars-Peter Clausen <lars@metafoo.de>
>>> wrote:
>>>
>>>> When looking up the IRQ the bank offset needs to be taken into account.
>>>> Otherwise interrupts for banks other than bank 0 get incorrectly reported
>>>> as
>>>> interrupts for bank 0.
>>>>
>>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>>> ---
>>>> Changes since v1:
>>>>           * Use lookup table instead of switch-case.
>>>
>>>
>>> I tried to apply this, but it doesn't apply on top of the other patch
>>> "gpio: zynq: Fix IRQ handlers" that I have queued for fixes.
>>
>>
>> Works fine for me. Did you try to apply both patch 1 and 2 of this series or
>> just patch 2?
>
> Yes, and on my fixes branch, as well as on Torvald's master (which now
> has patch 1/2) this happens:
>
> ]$ git am --signoff zynq2.patch
> Applying: gpio: zynq: Take bank offset into account when reporting a IRQ
> error: patch failed: drivers/gpio/gpio-zynq.c:461
> error: drivers/gpio/gpio-zynq.c: patch does not apply
> Patch failed at 0001 gpio: zynq: Take bank offset into account when
> reporting a IRQ
>
> Can you please test applying this patch only on upstream this and figure
> out what is wrong?

I think there is some confusion here, maybe two different series got mixed 
up. Patch 1 of this series is "gpio: zynq: Reduce level of indention in 
zynq_gpio_irqhandler()", which you just applied, but which is not in Linus' 
tree or the public gpio tree yet.

- Lars
