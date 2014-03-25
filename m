From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: dwapb: drop irq_setup_generic_chip()
Date: Tue, 25 Mar 2014 21:37:50 +0100
Message-ID: <CACRpkdbu6LKLntP2J=ypLTrAYscvzf5WjPYb-E+RKH_vAPEYHg@mail.gmail.com>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>
	<1395345324-18299-2-git-send-email-bigeasy@linutronix.de>
	<CACRpkdY3ctcLNhpSWtuqj=d48_fqDyNzG9nGAorpAbwjAnOJUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:42530 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755031AbaCYUhv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 16:37:51 -0400
Received: by mail-ob0-f169.google.com with SMTP id va2so1275932obc.28
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2014 13:37:50 -0700 (PDT)
In-Reply-To: <CACRpkdY3ctcLNhpSWtuqj=d48_fqDyNzG9nGAorpAbwjAnOJUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>
Cc: Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

Aha Jamie not even on the original thread. Here.

On Tue, Mar 25, 2014 at 9:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Mar 20, 2014 at 8:55 PM, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>
>> This looks kinda wrong I didn't manage to fully test it.
>> The driver calls irq_alloc_domain_generic_chips() which creates a gc and
>> adds it to gc_list. The driver later then calls irq_setup_generic_chip()
>> which also initializes the gc and adds it to the gc_list() and this
>> corrupts the list.
>> I can't find a single chip in tree which uses both functions so I think
>> that irq_setup_generic_chip() can be dropped.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Jamie: comments?
>
> Can you instead of this try to use my new generic gpiolib
> irqchip helpers that I just merged to the GPIO tree?
>
> Yours,
> Linus Walleij
