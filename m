From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Wed, 14 May 2014 09:47:51 +0200
Message-ID: <CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
 <CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com> <CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:38046 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752657AbaENHsN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 May 2014 03:48:13 -0400
Received: by mail-la0-f48.google.com with SMTP id mc6so1112807lab.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2014 00:48:12 -0700 (PDT)
In-Reply-To: <CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

Hello Linus,

On Tue, May 13, 2014 at 11:48 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, May 13, 2014 at 1:45 AM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> Hello Yegor,
>> On Thu, May 8, 2014 at 10:19 AM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>>> I've stumbled upon following issue. When waiting for interrupt with
>>> poll() like described in this example [1], the program returns from
>>> poll() immediately. This thread [2] describes a workaround for this
>>> issue via making read() before invoking poll().
>>>
>>> My system is am335x, kernel 3.15-rc4
>>>
>>> I experience this behavior by both SoC's own GPIO and i2c expander tca6416.
>>>
>>
>> I tested with an OMAP3 board which uses the same GPIO driver than the
>> am335x and I was able to reproduce your issue.
>
> At times like this I always want to warn you for using the GPIO sysfs
> interface which is a scary piece of code.
>
> And also to know what you are doing in userspace. Just hammering
> GPIOs is already a bad idea, reading *interrupts* from GPIOs in
> userspace is an even worse idea.
>
> The basic rule is that the kernel shall handle hardware, and I just
> get the feeling you are doing some userspace driver that should be
> in the kernel instead.

But what do you suggest to use for a system, that has a connector with
for example 8 I/Os made via i2c I/O expander? The system just provides
a general Linux BSP, so that the customer is then responsible for the
final software. The customer is not a kernel hacker and it is very
simple to program via sysfs especially, when you have a wrapper
library,

Is it planned to provide a GPIO interface via IOCTLs for userspace or
something like this?

Yegor
