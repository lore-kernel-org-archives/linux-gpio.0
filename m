From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Fix warning when HW interrupts are rescheduled
 by the softirq tasklet
Date: Tue, 23 Sep 2014 15:26:53 +0300
Message-ID: <5421670D.10200@ti.com>
References: <1410251533-4990-1-git-send-email-LW@KARO-electronics.de> <CACRpkdbTXtx+EU4Dw1fxeThRUG4s5XvcJnAJ9PJd8i4KKGC65A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:55480 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751412AbaIWM1K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Sep 2014 08:27:10 -0400
In-Reply-To: <CACRpkdbTXtx+EU4Dw1fxeThRUG4s5XvcJnAJ9PJd8i4KKGC65A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TG90aGFyIFdhw59tYQ==?= =?UTF-8?B?bm4=?= <LW@karo-electronics.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On 09/23/2014 03:04 PM, Linus Walleij wrote:
> On Tue, Sep 9, 2014 at 10:32 AM, Lothar Wa=C3=9Fmann <LW@karo-electro=
nics.de> wrote:
>=20
>> When using e.g. the matrix_keymap driver with the gpio-pca953x drive=
r,
>> the following warning may be issued when a keypress is detected:
>> WARNING: CPU: 0 PID: 3 at kernel/irq/manage.c:677 irq_nested_primary=
_handler+0x18/0x2c()
>> Primary handler called for nested irq 245
>> Modules linked in: evbug ci_hdrc_imx usbmisc_imx ci_hdrc udc_core eh=
ci_hcd phy_mxs_usb
>> CPU: 0 PID: 3 Comm: ksoftirqd/0 Tainted: G        W     3.16.0-karo+=
 #118
>> [<c00142cc>] (unwind_backtrace) from [<c00118f8>] (show_stack+0x10/0=
x14)
>> [<c00118f8>] (show_stack) from [<c001bf10>] (warn_slowpath_common+0x=
64/0x84)
>> [<c001bf10>] (warn_slowpath_common) from [<c001bfc4>] (warn_slowpath=
_fmt+0x30/0x40)
>> [<c001bfc4>] (warn_slowpath_fmt) from [<c004ce08>] (irq_nested_prima=
ry_handler+0x18/0x2c)
>> [<c004ce08>] (irq_nested_primary_handler) from [<c004cb80>] (handle_=
irq_event_percpu+0x50/0x168)
>> [<c004cb80>] (handle_irq_event_percpu) from [<c004ccf8>] (handle_irq=
_event+0x60/0x7c)
>> [<c004ccf8>] (handle_irq_event) from [<c004f02c>] (handle_simple_irq=
+0x78/0xdc)
>> [<c004f02c>] (handle_simple_irq) from [<c004ed14>] (resend_irqs+0x4c=
/0x78)
>> [<c004ed14>] (resend_irqs) from [<c001f3ec>] (tasklet_action+0x74/0x=
d8)
>> [<c001f3ec>] (tasklet_action) from [<c001f760>] (__do_softirq+0xd0/0=
x1f4)
>> [<c001f760>] (__do_softirq) from [<c001f8c4>] (run_ksoftirqd+0x40/0x=
64)
>> [<c001f8c4>] (run_ksoftirqd) from [<c003d464>] (smpboot_thread_fn+0x=
174/0x234)
>> [<c003d464>] (smpboot_thread_fn) from [<c0036dd4>] (kthread+0xb4/0xd=
0)
>> [<c0036dd4>] (kthread) from [<c000f0f0>] (ret_from_fork+0x14/0x24)
>> ---[ end trace a68cf7bc5348c4f7 ]---
>>
>> This happens when an IRQ is detected by the GPIO driver while the GP=
IO
>> client driver (matrix_keypad in this case) has disabled the irq for
>> the GPIO it has acquired. When the HW IRQ is being rescheduled by th=
e
>> softirq thread, the primary IRQ handler is called for the nested IRQ
>> registered by the client driver rather than for the parent IRQ from
>> the GPIO driver.
>>
>> This patch makes sure, that the parent_irq (gpio-pca953x) is
>> rescheduled rather than the nested irq registered by the matrix_keyp=
ad
>> driver.
>> Similar patches are most probably required for a bunch of other
>> drivers too.
>>
>> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
>> ---
>>   drivers/gpio/gpio-pca953x.c |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x=
=2Ec
>> index e2da64a..770ef6b 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -518,6 +518,7 @@ static int pca953x_irq_setup(struct pca953x_chip=
 *chip,
>>                               int irq_base)
>>   {
>>          struct i2c_client *client =3D chip->client;
>> +       struct gpio_chip *gpio_chip =3D &chip->gpio_chip;
>>          int ret, i, offset =3D 0;
>>
>>          if (client->irq && irq_base !=3D -1
>> @@ -567,6 +568,17 @@ static int pca953x_irq_setup(struct pca953x_chi=
p *chip,
>>                                  "could not connect irqchip to gpioc=
hip\n");
>>                          return ret;
>>                  }
>> +
>> +               for (i =3D 0; i < NBANK(chip); i++) {
>> +                       int j;
>> +
>> +                       for (j =3D 0; j < BANK_SZ; j++) {
>> +                               int gpio =3D gpio_chip->base + i * B=
ANK_SZ + j;
>> +                               int irq =3D gpio_to_irq(gpio);
>> +
>> +                               irq_set_parent(irq, client->irq);
>> +                       }
>> +               }
>=20
> While this is fixing the problem, but isn't the right fix to patch
> the function gpiochip_irq_map() in gpiolib.c to call
> irq_set_parent() for each IRQ as it gets mapped?
>=20
> This driver is using the gpiolib irqchip helpers...
>=20
> Then you fix not just this driver but all drivers, plus the complex
> loop and calls to gpio_to_irq() etc goes away.

The problem here is that:
- we don't know parent IRQ number inside gpiolib irqchip;
- there can be more then one Parent IRQ per GPIO chip

in other words, the knowledge about Parent IRQs is specific to drivers =
:(

Might be custom .irq_map() callback can be used to fix this issue?=20

Regards,
-grygorii

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
