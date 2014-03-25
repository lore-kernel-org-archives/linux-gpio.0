From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: dwapb: drop irq_setup_generic_chip()
Date: Tue, 25 Mar 2014 21:37:24 +0100
Message-ID: <CACRpkdY3ctcLNhpSWtuqj=d48_fqDyNzG9nGAorpAbwjAnOJUw@mail.gmail.com>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>
	<1395345324-18299-2-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:61144 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754745AbaCYUhY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 16:37:24 -0400
Received: by mail-ob0-f175.google.com with SMTP id uy5so1260910obc.20
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2014 13:37:24 -0700 (PDT)
In-Reply-To: <1395345324-18299-2-git-send-email-bigeasy@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On Thu, Mar 20, 2014 at 8:55 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> This looks kinda wrong I didn't manage to fully test it.
> The driver calls irq_alloc_domain_generic_chips() which creates a gc and
> adds it to gc_list. The driver later then calls irq_setup_generic_chip()
> which also initializes the gc and adds it to the gc_list() and this
> corrupts the list.
> I can't find a single chip in tree which uses both functions so I think
> that irq_setup_generic_chip() can be dropped.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Jamie: comments?

Can you instead of this try to use my new generic gpiolib
irqchip helpers that I just merged to the GPIO tree?

Yours,
Linus Walleij
