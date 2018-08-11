From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug in
 adp5588_gpio_direction_input()
Date: Sat, 11 Aug 2018 10:03:49 +0800
Message-ID: <f741be3e-bc4d-9ea3-a2a7-d05fdc9cef5e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: michael.hennerich@analog.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

The driver may sleep with holding a spinlock.

The function call paths (from bottom to top) in Linux-4.16 are:

[FUNC] mutex_lock_nested
drivers/gpio/gpio-adp5588.c, 113: mutex_lock_nested in 
adp5588_gpio_direction_input
drivers/gpio/gpio-adp5588.c, 224: adp5588_gpio_direction_input in 
adp5588_irq_set_type
kernel/irq/manage.c, 686: [FUNC_PTR]adp5588_irq_set_type in 
__irq_set_trigger
kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq

Note that [FUNC_PTR] means a function pointer call is used.

I do not find a good way to fix, so I only report.
This is found by my static analysis tool (DSAC).


Best wishes,
Jia-Ju Bai
