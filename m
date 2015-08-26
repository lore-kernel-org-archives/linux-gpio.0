From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: Use raw_spinlock for locking
Date: Wed, 26 Aug 2015 09:26:31 +0200
Message-ID: <CACRpkdZwhSuOo-2OVfqW6qBJNWkgg1Wf8Ji_4ML+GXqZnu7LwA@mail.gmail.com>
References: <1439816597-60259-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34743 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756248AbbHZH0b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:26:31 -0400
Received: by obbfr1 with SMTP id fr1so163745644obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:26:31 -0700 (PDT)
In-Reply-To: <1439816597-60259-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 17, 2015 at 3:03 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The Intel Baytrail pinctrl driver implements irqchip callbacks which are
> called with desc->lock raw_spinlock held. In mainline this is fine because
> spinlock resolves to raw_spinlock. However, running the same code in -rt we
> get:
>
>  BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:917
>  in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapper/0
>  Preemption disabled at:[<ffffffff81092e9f>] cpu_startup_entry+0x17f/0x480
>
>  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.5-rt5 #13
>   ...
>  Call Trace:
>   <IRQ>  [<ffffffff816283c6>] dump_stack+0x4a/0x61
>   [<ffffffff81077e17>] ___might_sleep+0xe7/0x170
>   [<ffffffff8162d6cf>] rt_spin_lock+0x1f/0x50
>   [<ffffffff812e3b88>] byt_gpio_clear_triggering+0x38/0x60
>   [<ffffffff812e3bc1>] byt_irq_mask+0x11/0x20
>   [<ffffffff810a7013>] handle_level_irq+0x83/0x150
>   [<ffffffff810a3457>] generic_handle_irq+0x27/0x40
>   [<ffffffff812e3a5f>] byt_gpio_irq_handler+0x7f/0xc0
>   [<ffffffff810050aa>] handle_irq+0xaa/0x190
>   ...
>
> This is because in -rt spinlocks are preemptible so taking the driver
> private spinlock in irqchip callbacks causes might_sleep() to trigger.
>
> In order to keep -rt happy but at the same time make sure that register
> accesses get serialized, convert the driver to use raw_spinlock instead.
>
> Also shorten the critical section a bit in few places.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Awesome job Mika, patch applied.

Yours,
Linus Walleij
