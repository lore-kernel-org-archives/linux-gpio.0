From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [BUG] drivers/gpio: some possible sleep-in-atomic bugs
Date: Wed, 13 Dec 2017 17:18:12 +0100
Message-ID: <5A3152C4.4070802@gaisler.com>
References: <0bcab5c0-d938-9eb6-d21d-6b8416d75a65@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.bahnhof.se ([213.80.101.12]:42131 "EHLO mx2.bahnhof.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750916AbdLMQlu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Dec 2017 11:41:50 -0500
In-Reply-To: <0bcab5c0-d938-9eb6-d21d-6b8416d75a65@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jia-Ju Bai <baijiaju1990@gmail.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 2017-12-12 04:59, Jia-Ju Bai wrote:
> According to drivers/gpio/gpio-grgpio.c, the kernel module may sleep
> under a spinlock.
> The function call paths are:
> grgpio_remove (acquire the spinlock)
>    gpiochip_remove
>      gpiochip_sysfs_unregister
>        device_unregister --> may sleep
>        mutex_lock --> may sleep
>
> grgpio_remove (acquire the spinlock)
>    gpiochip_remove
>      gpiochip_sysfs_unregister
>        gpiod_free
>          __gpiod_free
>            gpiod_unexport
>              device_unregister --> may sleep
>              mutex_lock --> may sleep
>
> grgpio_remove (acquire the spinlock)
>    irq_domain_remove
>      mutex_lock --> may sleep
>
> grgpio_irq_map (acquire the spinlock)
>    request_irq --> may sleep
>
> grgpio_irq_unmap (acquire the spinlock)
>    free_irq --> may sleep
>
>
> I do not find a good way to fix them, so I only report.
> These possible bugs is found by my static analysis tool (DSAC) and
> checked by my code review.
Hi!

Thank you for reporting this. I will take a look at it.

-- 
Best Regards,
Andreas Larsson

