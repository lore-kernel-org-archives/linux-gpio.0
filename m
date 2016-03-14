From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ setup
Date: Mon, 14 Mar 2016 13:40:39 +0100
Message-ID: <CACRpkdbqa2zmQ4ajH6LVQLPcWXJ+hWvHNPY5-L3TeLvA=3yg-g@mail.gmail.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
	<1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
	<20160311094517.GO1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
	<20160314084457.GX1796@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35579 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965093AbcCNMkk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 08:40:40 -0400
Received: by mail-ob0-f170.google.com with SMTP id fp4so174026013obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2016 05:40:40 -0700 (PDT)
In-Reply-To: <20160314084457.GX1796@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>
Cc: "Zheng, Qi" <qi.zheng@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 14, 2016 at 9:44 AM, Westerberg, Mika
<mika.westerberg@intel.com> wrote:
> On Mon, Mar 14, 2016 at 03:24:06AM +0200, Zheng, Qi wrote:

>> > +   intel_gpio_irq_ack(d);
>>
>> > If the pin toggles right here, we still have the same issue, no?
>>
>> Yes. But it is very short time from here to the place IRQ got enabled.
>
> That is still a race.
>
>> To me, it is the only available platform dependent interface to do
> the "ACK" in the flow of request_irq. Maybe you have other better
> option here?
(...)
> Drivers need to deal with the fact that they might get spurious
> interrupts from time to time. You need to check in the interrupt handler
> if the interrupt was from the device you are driving or not.
>
> request_irq() enables the interrupt line and if the pin is already in
> a state that triggers an interrupt, the driver interrupt handler will
> be called.

This looks like something is wrong in the irqchip.

Your set_type() is supporting edges but have all IRQs
handled by handle_simple_irq() rather than handle_edge_irq()
for the edges, which gives a more robust control flow
from IRQ to ACK to calling the handler.

Zheng/Mika: please look at how the level/edge
IRQs are handled in drivers/gpio/gpio-pl061.c
where I *tried* to do things right, switching handler
in .set_type() using irq_set_handler_locked(). I think
you may need to use handle_edge_irq() for the edge IRQs
and handle_level_irq() for the level IRQs just like I do
in the PL061 driver.

(I might be wrong.)

Yours,
Linus Walleij
