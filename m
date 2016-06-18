From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: intel: Use raw_spinlock for locking
Date: Sat, 18 Jun 2016 10:36:55 +0200
Message-ID: <CACRpkdagdL_0iD9SokuSGu2KxDEOnygAfe+M0m66igVb441VAA@mail.gmail.com>
References: <1466065537-82027-1-git-send-email-mika.westerberg@linux.intel.com>
 <CACRpkdYjmoRSKEAFWwwb3MZQgycDKRU=CeEDG3HMUMmCD6U3TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36831 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbcFRIg5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:36:57 -0400
Received: by mail-oi0-f52.google.com with SMTP id p204so148599216oih.3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:36:56 -0700 (PDT)
In-Reply-To: <CACRpkdYjmoRSKEAFWwwb3MZQgycDKRU=CeEDG3HMUMmCD6U3TQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kim Tatt Chuah <kim.tatt.chuah@intel.com>, Thomas Gleixner <tglx@linutronix.de>

On Sat, Jun 18, 2016 at 10:34 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Thu, Jun 16, 2016 at 10:25 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>
>> When running -rt kernel and GPIO interrupt happens we get following
>>
>>  BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:931
>>  in_atomic(): 1, irqs_disabled(): 0, pid: 530, name: irq/14-INT3452:
>>  Preemption disabled at:[<ffffffff810b4dab>] handle_edge_irq+0x1b/0x190
>>
>>  CPU: 0 PID: 530 Comm: irq/14-INT3452: Not tainted 4.6.2-rt5 #1060
>>   0000000000000000 ffff88007a257d58 ffffffff812d8494 0000000000000000
>>   ffff88017a330000 ffff88007a257d78 ffffffff81083a11 ffff88007a252430
>>   ffff88007a252430 ffff88007a257d90 ffffffff8167ef20 000000000000001a
>>  Call Trace:
>>   [<ffffffff812d8494>] dump_stack+0x4f/0x6b
>>   [<ffffffff81083a11>] ___might_sleep+0xe1/0x160
>>   [<ffffffff8167ef20>] rt_spin_lock+0x20/0x50
>>   [<ffffffff81308c6d>] intel_gpio_irq_ack+0x2d/0x80
>>   [<ffffffff810b4e0b>] handle_edge_irq+0x7b/0x190
>>   [<ffffffff810b0d82>] generic_handle_irq+0x22/0x30
>>   [<ffffffff81307abc>] intel_gpio_irq+0xdc/0x150
>>   [<ffffffff810b2293>] irq_forced_thread_fn+0x23/0x70
>>   [<ffffffff810b250b>] irq_thread+0x13b/0x1d0
>>   [<ffffffff8167b844>] ? __schedule+0x2e4/0x5a0
>>   [<ffffffff810b2270>] ? irq_finalize_oneshot.part.37+0xd0/0xd0
>>   [<ffffffff810b25a0>] ? irq_thread+0x1d0/0x1d0
>>   [<ffffffff810b23d0>] ? wake_threads_waitq+0x30/0x30
>>   [<ffffffff8107e624>] kthread+0xd4/0xf0
>>   [<ffffffff8167ec27>] ? _raw_spin_unlock_irq+0x17/0x40
>>   [<ffffffff8167f592>] ret_from_fork+0x22/0x40
>>   [<ffffffff8107e550>] ? kthread_worker_fn+0x190/0x190
>>
>> The reason why this happens is because intel_gpio_irq_ack() is called with
>> desc->lock raw_spinlock locked which cannot sleep but our normal spinlock
>> (which is converted to rtmutex in -rt) is allowed to sleep. This causes
>> might_sleep() to trigger.
>>
>> Fix this by converting the normal spinlock to a raw_spinlock.
>>
>> Reported-by: Kim Tatt Chuah <kim.tatt.chuah@intel.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Patch applied for fixes.

Oh rather for -devel (next), since -rt is out-of-tree.

Yours,
Linus Walleij
