From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: pca953x: fix nested irqs rescheduling
Date: Tue, 7 Jul 2015 17:34:49 +0300
Message-ID: <1436279689-23427-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:34013 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757793AbbGGOfP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2015 10:35:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Christian Gmeiner <christian.gmeiner@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

pca953x interrupt controller functionality is implemented using
nested threaded IRQs which require parent_irq to be configured
properly otherwise below warning can be seen if IRQ core
will try re-schedule nested IRQ:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 12 at kernel/irq/manage.c:696 irq_nested_primary_h=
andler+0x30/0x38()
Primary handler called for nested irq 301
Modules linked in: uinput ipv6 smsc95xx usbnet mii imx2_wdt etnaviv(C) =
matrix_keypad matrix_keymap ar1021_i2c
CPU: 1 PID: 12 Comm: ksoftirqd/1 Tainted: G        WC    4.1.1 #9
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
Backtrace:
[<c0013298>] (dump_backtrace) from [<c0013488>] (show_stack+0x20/0x24)
[<c0013468>] (show_stack) from [<c05743c4>] (dump_stack+0x70/0xc0)
[<c0574354>] (dump_stack) from [<c002b7b8>] (warn_slowpath_common+0x88/=
0xc0)
[<c002b730>] (warn_slowpath_common) from [<c002b8ac>] (warn_slowpath_fm=
t+0x40/0x48)
[<c002b870>] (warn_slowpath_fmt) from [<c0075798>] (irq_nested_primary_=
handler+0x30/0x38)
[<c0075768>] (irq_nested_primary_handler) from [<c0075200>] (handle_irq=
_event_percpu+0x70/0x2d0)
[<c0075190>] (handle_irq_event_percpu) from [<c00754ac>] (handle_irq_ev=
ent+0x4c/0x6c)
[<c0075460>] (handle_irq_event) from [<c0078204>] (handle_simple_irq+0x=
a4/0xc8)
[<c0078160>] (handle_simple_irq) from [<c0077cd4>] (resend_irqs+0x50/0x=
7c)
[<c0077c84>] (resend_irqs) from [<c002f99c>] (tasklet_action+0x94/0x140=
)
[<c002f908>] (tasklet_action) from [<c002eea8>] (__do_softirq+0xa0/0x3c=
8)
[<c002ee08>] (__do_softirq) from [<c002f208>] (run_ksoftirqd+0x38/0x54)
[<c002f1d0>] (run_ksoftirqd) from [<c004b1e4>] (smpboot_thread_fn+0x1f8=
/0x2f0)
[<c004afec>] (smpboot_thread_fn) from [<c0047744>] (kthread+0xe8/0x104)
[<c004765c>] (kthread) from [<c000fac8>] (ret_from_fork+0x14/0x2c)
---[ end trace 96052cda48865769 ]---

The issue was reported and described in details by Lothar Wa=C3=9Fmann =
and
Christian Gmeiner in https://lkml.org/lkml/2014/9/9/123.

=46ix it by adding missed call of gpiochip_set_chained_irqchip()
so GPIO IRQ chip helpers will set parent_irq for nested IRQs
properly.

Reported-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
Tested-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-pca953x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d233eb3..50caeb1 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -570,6 +570,10 @@ static int pca953x_irq_setup(struct pca953x_chip *=
chip,
 				"could not connect irqchip to gpiochip\n");
 			return ret;
 		}
+
+		gpiochip_set_chained_irqchip(&chip->gpio_chip,
+					     &pca953x_irq_chip,
+					     client->irq, NULL);
 	}
=20
 	return 0;
--=20
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
