From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Wed, 14 May 2014 11:32:45 +0200
Message-ID: <CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
	<CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
	<CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
	<CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:45713 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754413AbaENJcq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 May 2014 05:32:46 -0400
Received: by mail-we0-f172.google.com with SMTP id k48so1638762wev.31
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2014 02:32:45 -0700 (PDT)
In-Reply-To: <CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

On Wed, May 14, 2014 at 9:47 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hello Linus,
>
> On Tue, May 13, 2014 at 11:48 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Tue, May 13, 2014 at 1:45 AM, Javier Martinez Canillas
>> <javier@dowhile0.org> wrote:
>>> Hello Yegor,
>>> On Thu, May 8, 2014 at 10:19 AM, Yegor Yefremov
>>> <yegorslists@googlemail.com> wrote:
>>>> I've stumbled upon following issue. When waiting for interrupt with
>>>> poll() like described in this example [1], the program returns from
>>>> poll() immediately. This thread [2] describes a workaround for this
>>>> issue via making read() before invoking poll().
>>>>
>>>> My system is am335x, kernel 3.15-rc4
>>>>
>>>> I experience this behavior by both SoC's own GPIO and i2c expander tca6416.
>>>>
>>>
>>> I tested with an OMAP3 board which uses the same GPIO driver than the
>>> am335x and I was able to reproduce your issue.
>>
>> At times like this I always want to warn you for using the GPIO sysfs
>> interface which is a scary piece of code.
>>
>> And also to know what you are doing in userspace. Just hammering
>> GPIOs is already a bad idea, reading *interrupts* from GPIOs in
>> userspace is an even worse idea.
>>
>> The basic rule is that the kernel shall handle hardware, and I just
>> get the feeling you are doing some userspace driver that should be
>> in the kernel instead.
>
> But what do you suggest to use for a system, that has a connector with
> for example 8 I/Os made via i2c I/O expander? The system just provides
> a general Linux BSP, so that the customer is then responsible for the
> final software. The customer is not a kernel hacker and it is very
> simple to program via sysfs especially, when you have a wrapper
> library,
>

I was wondering the same. Unfortunately writing a small device driver
that uses gpiolib from the kernel is sometimes not possible for many
companies. Even though writing kernel code is not too different than
user-space C code there are some things to take into account so you
need some special training. Thus having an easy to use interface to
control GPIO from user-space is very handy.

> Is it planned to provide a GPIO interface via IOCTLs for userspace or
> something like this?
>

If Linus agrees that a better GPIO interface that model the GPIO
operations can be developed using a set of ioctl commands or netlink
sockets I'll be very glad to help with the implementation.

On a related note I see that people are asking how they can mux a SoC
pin in GPIO mode in order to use the GPIO sysfs interface. For example
take a look to this thread [0].

When OMAP was not using pinctrl-single but a custom driver for pin
configuration there was a debugfs interface
(/sys/kernel/debug/omap_mux) that allowed to change the pin mux setup.

I agree that this was not pretty since a user-space program could step
into other drivers toes and make devices to stop working. But I wonder
if we can have a similar interface under
/sys/kernel/debug/pinctrl/<pinctrl_dev> where a subset of the pins can
be changed from user-space. Probably not in a secure way...

And after all, users can still modify their DT to mux the needed pins
in GPIO mode which is not that bad either.

Best regards,
Javier

[0]: http://comments.gmane.org/gmane.linux.redhat.fedora.arm/7644
