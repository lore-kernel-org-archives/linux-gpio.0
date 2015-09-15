From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and suspend
 resume
Date: Tue, 15 Sep 2015 18:48:07 +0100
Message-ID: <55F859D7.1000803@arm.com>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
 <55DB4609.5040904@arm.com>
 <CAGS+omBnoitju07KQ1Y7JHTbce6+DO4WqWHTaKz5D+T157zEJA@mail.gmail.com>
 <1441535972.22230.5.camel@mhfsdcap03> <55EEAA24.6080706@arm.com>
 <55EF11E6.7030307@arm.com> <1442051454.5661.12.camel@mhfsdcap03>
 <55F6AC87.4040301@arm.com>
 <CAKdAkRSFE2KJOzbUarxAQMNwHOkkyGHXmRLGhn55VTvG-SJ4Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:52090 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751634AbbIORsN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Sep 2015 13:48:13 -0400
In-Reply-To: <CAKdAkRSFE2KJOzbUarxAQMNwHOkkyGHXmRLGhn55VTvG-SJ4Kg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, maoguang meng <maoguang.meng@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>



On 15/09/15 03:52, Dmitry Torokhov wrote:
> On Mon, Sep 14, 2015 at 4:16 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]

>>
>> This is wrong assumption in the driver. enable_irq_wake doesn't
>> implicitly enable the IRQ. So the disable_irq should be moved to else.
>> And the resume patch also needs to be fixed accordingly, otherwise you
>> may get unbalanced irq. But this should not be the reason for fixing the
>> pinctrl suspend/resume.
>>
>
> Elan driver does not want to enable servicing IRQs, it just wants to
> configure them as wakeup sources. Hence the current elan_suspend() is
> fine. When system wakes up and the device is resumed and the driver is
> ready to service interrupts it will enable IRQ again.
>

Fair enough. But I am struggling to understand how this fits into
existing IRQ infrastructure. Few controllers that don't have wakeup
source configuration facility can set IRQCHIP_SKIP_SET_WAKE and just
leave the interrupts enabled in suspend path to wake it up. So IMO,
the above strategy might not work on such controllers.

> IOW enable_irq_wake() and enable_irq() are 2 completely different
> calls and it is perfectly fine to disable IRQ and then ebale it as a
> wakeup source.

I agree that they are entirely different APIs, I am not sure if we can
support different interrupt controller with such strategy.

Since the irq/pm core handle disabling device IRQs and section "System
Wakeup Interrupts, enable_irq_wake() and disable_irq_wake()" in
Documentation/power/suspend-and-interrupts.txt gives me different
understanding, we can check with tglx on how to handle this.

Regards,
Sudeep
