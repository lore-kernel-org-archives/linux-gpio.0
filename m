From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Fix warning when HW interrupts are rescheduled
 by the softirq tasklet
Date: Tue, 7 Jul 2015 13:00:30 +0300
Message-ID: <559BA33E.1030200@ti.com>
References: <1410251533-4990-1-git-send-email-LW@KARO-electronics.de> <CACRpkdbTXtx+EU4Dw1fxeThRUG4s5XvcJnAJ9PJd8i4KKGC65A@mail.gmail.com> <5421670D.10200@ti.com> <CACRpkdYCsdMcJY7Y0gK4_zPxiWRFKkzi2TaZUi1Vn7Kp0Cbgzg@mail.gmail.com> <5422B8F0.9060803@ti.com> <CACRpkdYtjQC_hCiqSB7fidct6CjJ5kMbj0PegW3MEuouBajv+g@mail.gmail.com> <54244243.3090904@ti.com> <CACRpkdahDFpP_3eJuAweYua4Cp2iJAd1BDUQHJ90O_bU3cuheg@mail.gmail.com> <CAH9NwWefBmpMua3oxjDOmMuEjRkutFPdAfVGCm8FtwjQi4Rpgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:42631 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755533AbbGGKAr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 7 Jul 2015 06:00:47 -0400
In-Reply-To: <CAH9NwWefBmpMua3oxjDOmMuEjRkutFPdAfVGCm8FtwjQi4Rpgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Christian,

On 07/07/2015 09:29 AM, Christian Gmeiner wrote:
> Hi all
> 
> 2014-09-26 11:07 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Thu, Sep 25, 2014 at 6:26 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>> On 09/25/2014 11:07 AM, Linus Walleij wrote:
>>>> On Wed, Sep 24, 2014 at 2:28 PM, Grygorii Strashko
>>>> <grygorii.strashko@ti.com> wrote:
>>>>> On 09/24/2014 02:17 PM, Linus Walleij wrote:
>>>>
>>>>>> So PCA cannot use gpiochip_set_chained_irqchip()?
>>>>>
>>>>> Yes. It can't - pca is i2c device.
>>>>
>>>> ? I don't get this statement.
>>>>
>>>> Why does the fact that it is an I2C device matter?
>>>> We have several devices that are in fact on top of
>>>> I2C (albeit as MFD cells) like gpio-tc3589x.c.
>>>
>>> gpio-tc3589x.c doesn't call gpiochip_set_chained_irqchip()
>>
>> Ah yeah you're right of course. I considered adding a separate
>> registration function for the sleeping handlers, like
>> gpiochip_set_threaded_irqchip() that would handle
>> setting up the nested case.
>>
>>>> Yes, but the .map function isn't called until a client
>>>> wants to use an IRQ. And that won't happen until after
>>>> we exit the whole .probe() function.
>>>
>>> .map function is called from irq_create_mapping() which,
>>> in turn, can be called as from irq_domain_add_simple() -
>>> as result .map will be always called from gpiochip_irqchip_add().
>>
>> Ah yeah you're right, I was just wrong here :-/
>>
>>>> Well it happens in one single driver, and was done by me.
>>>> Maybe I should either disallow that, as that means we're adding
>>>> multiple parents (which is what you want, right?) or actually
>>>> implement it in a way so that multiple parents can be handled
>>>> by the helpers, by adding the parents to a list or something.
>>>
>>> Sorry, but It seems the simplest way is to allow drivers to manage
>>> parent IRQs for the complex cases. So, I vote for custom .map()
>>> callback, but It could be not too simple to implement it, because
>>> private driver data need to be passed as parameter to this callback
>>> somehow.
>>
>> Yeah. Well what I'm thinking as subsystem maintainer, is that
>> when I added the generic GPIOlib irqchip helpers we managed to
>> smoke out a large:ish set of subtle bugs that different drivers
>> had created independently of each other.
>>
>> So centralizing code is very important if at all possible to bring
>> down the maintainer burden.
>>
>> So for that reason I'm looking a second and a third time at these
>> things before going ahead with custom code in drivers...
>>
>>> === Simple one - driver need to set parent_irq before adding gpiochip ===
>>>
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index 8aa84d5..292840b 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -447,8 +447,11 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>>>          irq_set_lockdep_class(irq, &gpiochip_irq_lock_class);
>>>          irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
>>>          /* Chips that can sleep need nested thread handlers */
>>> -       if (chip->can_sleep)
>>> +       if (chip->can_sleep) {
>>>                  irq_set_nested_thread(irq, 1);
>>> +               if (chip->parent_irq)
>>> +                       irq_set_parent(irq, chip->parent_irq);
>>> +       }
>>
>> Yeah I need to think of something like this...
>>
> 
> I did run into exact the same situation with a 4.1.1 kernel :)
> 
> [  312.863047] ------------[ cut here ]------------
> [  312.867681] WARNING: CPU: 1 PID: 12 at kernel/irq/manage.c:696
> irq_nested_primary_handler+0x30/0x38()
> [  312.876901] Primary handler called for nested irq 301
> [  312.881953] Modules linked in: uinput ipv6 smsc95xx usbnet mii
> imx2_wdt etnaviv(C) matrix_keypad matrix_keymap ar1021_i2c
> [  312.893067] CPU: 1 PID: 12 Comm: ksoftirqd/1 Tainted: G        WC
>     4.1.1 #9
> [  312.900378] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [  312.906906] Backtrace:
> [  312.909377] [<c0013298>] (dump_backtrace) from [<c0013488>]
> (show_stack+0x20/0x24)
> [  312.916947]  r6:00000009 r5:ffffffff r4:00000000 r3:dc8ba301
> [  312.922673] [<c0013468>] (show_stack) from [<c05743c4>]
> (dump_stack+0x70/0xc0)
> [  312.929924] [<c0574354>] (dump_stack) from [<c002b7b8>]
> (warn_slowpath_common+0x88/0xc0)
> [  312.938029]  r5:000002b8 r4:00000000
> [  312.941678] [<c002b730>] (warn_slowpath_common) from [<c002b8ac>]
> (warn_slowpath_fmt+0x40/0x48)
> [  312.950391]  r8:00000000 r7:c07b1314 r6:0000012d r5:eea07720 r4:c3048840
> [  312.957233] [<c002b870>] (warn_slowpath_fmt) from [<c0075798>]
> (irq_nested_primary_handler+0x30/0x38)
> [  312.966467]  r3:0000012d r2:c06b9128
> [  312.970113] [<c0075768>] (irq_nested_primary_handler) from
> [<c0075200>] (handle_irq_event_percpu+0x70/0x2d0)
> [  312.979967] [<c0075190>] (handle_irq_event_percpu) from
> [<c00754ac>] (handle_irq_event+0x4c/0x6c)
> [  312.988854]  r10:00000002 r9:00000018 r8:00000000 r7:c07b1314
> r6:c3048840 r5:eea07720
> [  312.996812]  r4:eea076c0
> [  312.999395] [<c0075460>] (handle_irq_event) from [<c0078204>]
> (handle_simple_irq+0xa4/0xc8)
> [  313.007760]  r6:c07c5404 r5:eea07720 r4:eea076c0 r3:00000003
> [  313.013536] [<c0078160>] (handle_simple_irq) from [<c0077cd4>]
> (resend_irqs+0x50/0x7c)
> [  313.021468]  r5:c07c5404 r4:0000012d
> [  313.025119] [<c0077c84>] (resend_irqs) from [<c002f99c>]
> (tasklet_action+0x94/0x140)
> [  313.032877]  r6:00000000 r5:c07c5444 r4:c07c5440 r3:c0077c84
> [  313.038655] [<c002f908>] (tasklet_action) from [<c002eea8>]
> (__do_softirq+0xa0/0x3c8)
> [  313.046500]  r8:c07c1908 r7:00000006 r6:00000001 r5:00000040
> r4:c07ba098 r3:c002f908
> [  313.054387] [<c002ee08>] (__do_softirq) from [<c002f208>]
> (run_ksoftirqd+0x38/0x54)
> [  313.062058]  r10:00000002 r9:00000000 r8:c07c1908 r7:00000000
> r6:00000001 r5:00000001
> [  313.070017]  r4:ee893980
> [  313.072605] [<c002f1d0>] (run_ksoftirqd) from [<c004b1e4>]
> (smpboot_thread_fn+0x1f8/0x2f0)
> [  313.080906] [<c004afec>] (smpboot_thread_fn) from [<c0047744>]
> (kthread+0xe8/0x104)
> [  313.088578]  r10:00000000 r8:00000000 r7:c004afec r6:ee893980
> r5:00000000 r4:ee893a40
> [  313.096558] [<c004765c>] (kthread) from [<c000fac8>]
> (ret_from_fork+0x14/0x2c)
> [  313.103796]  r7:00000000 r6:00000000 r5:c004765c r4:ee893a40
> [  313.109560] ---[ end trace 96052cda48865769 ]---
> 
> 
> Linus, what is the state of the your last thinking about this topic?

Could you try if below change works for you, pls (not tested):

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d233eb3..ac29308 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -570,6 +570,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
                                "could not connect irqchip to gpiochip\n");
                        return ret;
                }
+
+               gpiochip_set_chained_irqchip(&chip->gpio_chip, &pca953x_irq_chip,
+                                            client->irq, NULL);
        }
 
        return 0;
-- 
regards,
-grygorii
