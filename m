From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] drivers/gpio: some possible sleep-in-atomic bugs
Date: Tue, 12 Dec 2017 11:59:26 +0800
Message-ID: <0bcab5c0-d938-9eb6-d21d-6b8416d75a65@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:41236 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdLLD7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Dec 2017 22:59:37 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, andreas@gaisler.com
Cc: linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

According to drivers/gpio/gpio-grgpio.c, the kernel module may sleep 
under a spinlock.
The function call paths are:
grgpio_remove (acquire the spinlock)
   gpiochip_remove
     gpiochip_sysfs_unregister
       device_unregister --> may sleep
       mutex_lock --> may sleep

grgpio_remove (acquire the spinlock)
   gpiochip_remove
     gpiochip_sysfs_unregister
       gpiod_free
         __gpiod_free
           gpiod_unexport
             device_unregister --> may sleep
             mutex_lock --> may sleep

grgpio_remove (acquire the spinlock)
   irq_domain_remove
     mutex_lock --> may sleep

grgpio_irq_map (acquire the spinlock)
   request_irq --> may sleep

grgpio_irq_unmap (acquire the spinlock)
   free_irq --> may sleep


I do not find a good way to fix them, so I only report.
These possible bugs is found by my static analysis tool (DSAC) and 
checked by my code review.


Thanks,
Jia-Ju Bai
