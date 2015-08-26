From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Use raw_spinlock for locking
Date: Wed, 26 Aug 2015 09:28:48 +0200
Message-ID: <CACRpkdbfPpe1gR1SBzp9PxznB9NCcMRU7DU7EE9mHsJE2pb2=g@mail.gmail.com>
References: <1439817210-38828-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36669 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756336AbbHZH2t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:28:49 -0400
Received: by obkg7 with SMTP id g7so163901702obk.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:28:48 -0700 (PDT)
In-Reply-To: <1439817210-38828-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 17, 2015 at 3:13 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When running -rt kernel and an interrupt happens on a GPIO line controlled by
> Intel Cherryview/Braswell pinctrl driver we get:
>
>  BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:917
>  in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapper/0
>  Preemption disabled at:[<ffffffff81092e9f>] cpu_startup_entry+0x17f/0x480
>
>  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.5-rt5 #16
>   ...
>  Call Trace:
>   <IRQ>  [<ffffffff816283c6>] dump_stack+0x4a/0x61
>   [<ffffffff81077e17>] ___might_sleep+0xe7/0x170
>   [<ffffffff8162d6cf>] rt_spin_lock+0x1f/0x50
>   [<ffffffff812e52ed>] chv_gpio_irq_ack+0x3d/0xa0
>   [<ffffffff810a72f5>] handle_edge_irq+0x75/0x180
>   [<ffffffff810a3457>] generic_handle_irq+0x27/0x40
>   [<ffffffff812e57de>] chv_gpio_irq_handler+0x7e/0x110
>   [<ffffffff810050aa>] handle_irq+0xaa/0x190
>   ...
>
> This is because desc->lock is raw_spinlock and is held when chv_gpio_irq_ack()
> is called by the genirq core. chv_gpio_irq_ack() in turn takes pctrl->lock
> which in -rt is an rt-mutex causing might_sleep() rightfully to complain about
> sleeping function called from invalid context.
>
> In order to keep -rt happy but at the same time make sure that register
> accesses get serialized, convert the driver to use raw_spinlock instead.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied. Again splendid job here.

Yours,
Linus Walleij
