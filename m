From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: gpio-pca953x: Unhandled interrupts with PCAL9555A
Date: Mon, 13 Jul 2015 00:51:06 +0200
Message-ID: <20150712225106.GA20037@pqgruber.com>
References: <1436298146-26451-1-git-send-email-clemens.gruber@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:54480 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbbGLWvL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jul 2015 18:51:11 -0400
Content-Disposition: inline
In-Reply-To: <1436298146-26451-1-git-send-email-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Hi,

I noticed the following issue after 100001 interrupts occured on the
pca-953x interrupt-controller driver used with a PCAL9555A chip. Its
INT output is connected to a GPIO line of a Freescale i.MX6Q SoC.

irq 47: nobody cared (try booting with the "irqpoll" option)
[  508.320093] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.2.0-rc1-00197-g3b9efb0 #92
[  508.327669] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[  508.334237] [<80016cac>] (unwind_backtrace) from
[<80013494>](show_stack+0x10/0x14)
[  508.342006] [<80013494>] (show_stack) from
[<80534e88>](dump_stack+0x84/0xc4)
[  508.349251] [<80534e88>] (dump_stack) from
[<800816cc>](__report_bad_irq+0x28/0xc4)
[  508.357008] [<800816cc>] (__report_bad_irq) from
[<80081c68>](note_interrupt+0x264/0x2b4)
[  508.365288] [<80081c68>] (note_interrupt) from
[<8007f338>](handle_irq_event_percpu+0xd0/0x138)
[  508.374088] [<8007f338>] (handle_irq_event_percpu) from
[<8007f3e0>](handle_irq_event+0x40/0x64)
[  508.382973] [<8007f3e0>] (handle_irq_event) from
[<800823dc>](handle_level_irq+0xc8/0x148)
[  508.391338] [<800823dc>] (handle_level_irq) from
[<8007e928>](generic_handle_irq+0x2c/0x3c)
[  508.399799] [<8007e928>] (generic_handle_irq) from
[<8029ea20>](mxc_gpio_irq_handler+0x38/0xf8)
[  508.407283] pca953x 1-0020: failed reading register
[  508.413479] [<8029ea20>] (mxc_gpio_irq_handler) from
[<8029eb68>](mx3_gpio_irq_handler+0x88/0xe8)
[  508.422451] [<8029eb68>] (mx3_gpio_irq_handler) from
[<8007e928>](generic_handle_irq+0x2c/0x3c)
[  508.431250] [<8007e928>] (generic_handle_irq) from
[<8007ec20>](__handle_domain_irq+0x7c/0xec)
[  508.439962] [<8007ec20>] (__handle_domain_irq) from
[<800094ac>](gic_handle_irq+0x24/0x5c)
[  508.448327] [<800094ac>] (gic_handle_irq) from
[<80014084>](__irq_svc+0x44/0x7c)
[  508.455817] Exception stack(0x80733f20 to 0x80733f68)
[  508.460882] 3f20: 00000001 00000001 00000000 80737a30 00000000 bf7a0850
c5ed8476 00000076
[  508.469071] 3f40: c5c85253 00000076 00000000 807345f0 00000000 80733f68
80071d40 8039b9bc
[  508.477254] 3f60: 200c0013 ffffffff
[  508.480763] [<80014084>] (__irq_svc) from [<8039b9bc>]
(cpuidle_enter_state+0x12c/0x264)
[  508.488872] [<8039b9bc>] (cpuidle_enter_state) from [<8006cbe4>]
(cpu_startup_entry+0x194/0x284)
[  508.497678] [<8006cbe4>] (cpu_startup_entry) from [<806f5c94>]
(start_kernel+0x3a4/0x3c4)
[  508.505862] handlers:
[  508.508148] [<8007f404>] irq_default_primary_handler threaded [<8029f2f0>]
pca953x_irq_handler
[  508.516812] Disabling IRQ #47

Did any of you experience this type of issue before?

In my patch [1] from last week, I added an option to unmask the interrupts on
the PCAL9555A where they are masked by default. But when I do and if I then
try to trigger as many as possible, they seem not to be handled correctly by
the driver.

In the devicetree I specify:

gpioexp_stat_a: pcal9555a@20 {
   compatible = "nxp,pcal9555a";
   reg = <0x20>;
   gpio-controller;
   #gpio-cells = <2>;
   interrupt-controller;
   #interrupt-cells = <2>;
   interrupt-parent = <&gpio1>;
   interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
   nxp,intr-mask = <0x0000>; /* Do not mask the interrupts */
};

Both the PCA9555 [2] and the PCAL9555A [3] clear the interrupt if we read from
the input port register.
So apart from the PCAL9555A having interrupt mask registers which are set to 1
upon power-on and then cleared by the changes introduced in my patch, it should
not behave differently than the PCA9555.

As the PCAL9555A also has interrupt status registers it would be possible to use
them to find out which line triggered the interrupt, instead of relying on the
previously read input values (as it is done now in pca953x_irq_pending).
But the latter should work both on the PCA9555 and on the PCAL9555A, right?

Am I missing something?

Regards,
Clemens

[1]: https://patchwork.ozlabs.org/patch/492586/
[2]: http://www.nxp.com/documents/data_sheet/PCA9555.pdf
[3]: http://www.nxp.com/documents/data_sheet/PCAL9555A.pdf
