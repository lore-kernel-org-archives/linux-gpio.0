From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Implement irq_(request|release)_resources
Date: Tue, 27 Oct 2015 17:23:33 +0100
Message-ID: <CACRpkdYjNWiEdM8kthMXhGXBPYE74hy_xa7bBB6XQrAOaBnehA@mail.gmail.com>
References: <1445607381-7794-1-git-send-email-soren.brinkmann@xilinx.com>
	<CACRpkda4QKEJvwkwGLS7OLTP8Nxu5W05tzbcFXA_FPnBsFtKhw@mail.gmail.com>
	<562FA3EE.5040408@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35732 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964831AbbJ0QXd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 12:23:33 -0400
Received: by obctp1 with SMTP id tp1so147446751obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 09:23:33 -0700 (PDT)
In-Reply-To: <562FA3EE.5040408@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, John Linn <linnj@xilinx.com>

On Tue, Oct 27, 2015 at 5:18 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 10/27/2015 05:53 PM, Linus Walleij wrote:
>>
>> On Fri, Oct 23, 2015 at 3:36 PM, Soren Brinkmann
>> <soren.brinkmann@xilinx.com> wrote:
>>
>>> The driver uses runtime PM to leverage low power techniques. For
>>> use-cases using GPIO as interrupt the device needs to be in an
>>> appropriate state.
>>>
>>> Reported-by: John Linn <linnj@xilinx.com>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>> Tested-by: John Linn <linnj@xilinx.com>
>>
>>
>> As pointed out by Grygorii in
>> commit aca82d1cbb49af34b69ecd4571a0fe48ad9247c1:
>>
>>      The PM runtime API can't be used in atomic contex on -RT even if
>>      it's configured as irqsafe. As result, below error report can
>>      be seen when PM runtime API called from IRQ chip's callbacks
>>      irq_startup/irq_shutdown/irq_set_type, because they are
>>      protected by RAW spinlock:
>> (...)
>>      The IRQ chip interface defines only two callbacks which are executed
>> in
>>      non-atomic contex - irq_bus_lock/irq_bus_sync_unlock, so lets move
>>      PM runtime calls there.
>>
>> I.e. these calls are atomic context and it's just luck that it works
>> and this is fragile.
>>
>> Can you please check if you can move it to
>> irq_bus_lock()/irq_sync_unlock()
>> like Grygorii does?
>>
>
> This patch rises the question not only about PM runtime, but also
> about gpiochip_irq_reqres()/gpiochip_irq_relres().

Do you mean that these functions contain calls to non-atomic
functions?

I mainly reacted to this because it was pm_* calls, that you
mentioned explicitly in your patch.

Yours,
Linus Walleij
