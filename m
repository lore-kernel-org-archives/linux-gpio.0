From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: gpio-pca953x: Unhandled interrupts with PCAL9555A
Date: Thu, 16 Jul 2015 17:09:09 +0300
Message-ID: <55A7BB05.4080106@ti.com>
References: <1436298146-26451-1-git-send-email-clemens.gruber@pqgruber.com>	<20150712225106.GA20037@pqgruber.com> <CACRpkdZYgRbBh5iSbEVZ-0GkgX0Lqo9Eciynj_+RaG4vz0Q+CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:37771 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753122AbbGPOJR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 16 Jul 2015 10:09:17 -0400
In-Reply-To: <CACRpkdZYgRbBh5iSbEVZ-0GkgX0Lqo9Eciynj_+RaG4vz0Q+CA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

Clemens,

On 07/16/2015 04:37 PM, Linus Walleij wrote:
> On Mon, Jul 13, 2015 at 12:51 AM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> 
>> I noticed the following issue after 100001 interrupts occured on the
>> pca-953x interrupt-controller driver used with a PCAL9555A chip. Its
>> INT output is connected to a GPIO line of a Freescale i.MX6Q SoC.
>>
>> irq 47: nobody cared (try booting with the "irqpoll" option)
>> [  508.320093] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
>> 4.2.0-rc1-00197-g3b9efb0 #92
>> [  508.327669] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
>> [  508.334237] [<80016cac>] (unwind_backtrace) from
>> [<80013494>](show_stack+0x10/0x14)
>> [  508.342006] [<80013494>] (show_stack) from
>> [<80534e88>](dump_stack+0x84/0xc4)
>> [  508.349251] [<80534e88>] (dump_stack) from
>> [<800816cc>](__report_bad_irq+0x28/0xc4)
>> [  508.357008] [<800816cc>] (__report_bad_irq) from
>> [<80081c68>](note_interrupt+0x264/0x2b4)
>> [  508.365288] [<80081c68>] (note_interrupt) from
>> [<8007f338>](handle_irq_event_percpu+0xd0/0x138)
>> [  508.374088] [<8007f338>] (handle_irq_event_percpu) from
>> [<8007f3e0>](handle_irq_event+0x40/0x64)
>> [  508.382973] [<8007f3e0>] (handle_irq_event) from
>> [<800823dc>](handle_level_irq+0xc8/0x148)
>> [  508.391338] [<800823dc>] (handle_level_irq) from
>> [<8007e928>](generic_handle_irq+0x2c/0x3c)
>> [  508.399799] [<8007e928>] (generic_handle_irq) from
>> [<8029ea20>](mxc_gpio_irq_handler+0x38/0xf8)
>> [  508.407283] pca953x 1-0020: failed reading register
>> [  508.413479] [<8029ea20>] (mxc_gpio_irq_handler) from

As per your log there is i2c error, which could be the reason of the issue
[  508.407283] pca953x 1-0020: failed reading register


>> [  508.516812] Disabling IRQ #47
>>
>> Did any of you experience this type of issue before?
>>
>> In my patch [1] from last week, I added an option to unmask the interrupts on
>> the PCAL9555A where they are masked by default. But when I do and if I then
>> try to trigger as many as possible, they seem not to be handled correctly by
>> the driver.
>>
>> In the devicetree I specify:
>>
>> gpioexp_stat_a: pcal9555a@20 {
>>     compatible = "nxp,pcal9555a";
>>     reg = <0x20>;
>>     gpio-controller;
>>     #gpio-cells = <2>;
>>     interrupt-controller;
>>     #interrupt-cells = <2>;
>>     interrupt-parent = <&gpio1>;
>>     interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
>>     nxp,intr-mask = <0x0000>; /* Do not mask the interrupts */
>> };
>>
>> Both the PCA9555 [2] and the PCAL9555A [3] clear the interrupt if we read from
>> the input port register.
>> So apart from the PCAL9555A having interrupt mask registers which are set to 1
>> upon power-on and then cleared by the changes introduced in my patch, it should
>> not behave differently than the PCA9555.
>>
>> As the PCAL9555A also has interrupt status registers it would be possible to use
>> them to find out which line triggered the interrupt, instead of relying on the
>> previously read input values (as it is done now in pca953x_irq_pending).
>> But the latter should work both on the PCA9555 and on the PCAL9555A, right?
>>
>> Am I missing something?
>>
> 
> You need to mail the driver maintainers and/or people that were working
> on it recently. None of the maintainers have this hardware.
> 
> Use git log drivers/gpio-pca953x.c
> 
> It seems Grygorii has a patch for this (to my untrained eye) that is
> merged for fixes, subject "gpio: pca953x: fix nested irqs rescheduling"

Not sure. I assume this issue is observed with above patch applied. Right?

-- 
regards,
-grygorii
