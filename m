From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug in
 adp5588_gpio_write()
Date: Sat, 11 Aug 2018 10:13:08 +0800
Message-ID: <93f77ccb-a478-fd72-5012-aeba5b6c8253@gmail.com>
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

[FUNC] schedule_timeout
drivers/media/platform/marvell-ccic/cafe-driver.c, 206: schedule_timeout 
in cafe_smbus_write_data
drivers/media/platform/marvell-ccic/cafe-driver.c, 307: 
cafe_smbus_write_data in cafe_smbus_xfer
drivers/i2c/i2c-core-smbus.c, 541: [FUNC_PTR]cafe_smbus_xfer in 
i2c_smbus_xfer
drivers/i2c/i2c-core-smbus.c, 156: i2c_smbus_xfer in 
i2c_smbus_write_byte_data
drivers/gpio/gpio-adp5588.c, 58: i2c_smbus_write_byte_data in 
adp5588_gpio_write
drivers/gpio/gpio-adp5588.c, 115: adp5588_gpio_write in 
adp5588_gpio_direction_input
drivers/gpio/gpio-adp5588.c, 224: adp5588_gpio_direction_input in 
adp5588_irq_set_type
kernel/irq/manage.c, 686: [FUNC_PTR]adp5588_irq_set_type in 
__irq_set_trigger
kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq

[FUNC] mutex_lock_nested
drivers/i2c/busses/i2c-cht-wc.c, 138: mutex_lock_nested in 
cht_wc_i2c_adap_smbus_xfer
drivers/i2c/i2c-core-smbus.c, 541: [FUNC_PTR]cht_wc_i2c_adap_smbus_xfer 
in i2c_smbus_xfer
drivers/i2c/i2c-core-smbus.c, 156: i2c_smbus_xfer in 
i2c_smbus_write_byte_data
drivers/gpio/gpio-adp5588.c, 58: i2c_smbus_write_byte_data in 
adp5588_gpio_write
drivers/gpio/gpio-adp5588.c, 115: adp5588_gpio_write in 
adp5588_gpio_direction_input
drivers/gpio/gpio-adp5588.c, 224: adp5588_gpio_direction_input in 
adp5588_irq_set_type
kernel/irq/manage.c, 686: [FUNC_PTR]adp5588_irq_set_type in 
__irq_set_trigger
kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq

[FUNC] mutex_lock_nested
drivers/i2c/busses/i2c-i801.c, 828: mutex_lock_nested in i801_access
drivers/i2c/i2c-core-smbus.c, 541: [FUNC_PTR]i801_access in i2c_smbus_xfer
drivers/i2c/i2c-core-smbus.c, 156: i2c_smbus_xfer in 
i2c_smbus_write_byte_data
drivers/gpio/gpio-adp5588.c, 58: i2c_smbus_write_byte_data in 
adp5588_gpio_write
drivers/gpio/gpio-adp5588.c, 115: adp5588_gpio_write in 
adp5588_gpio_direction_input
drivers/gpio/gpio-adp5588.c, 224: adp5588_gpio_direction_input in 
adp5588_irq_set_type
kernel/irq/manage.c, 686: [FUNC_PTR]adp5588_irq_set_type in 
__irq_set_trigger
kernel/irq/manage.c, 1350: __irq_set_trigger in __setup_irq
kernel/irq/manage.c, 1238: _raw_spin_lock_irqsave in __setup_irq

Note that [FUNC_PTR] means a function pointer call is used.

I do not find a good way to fix, so I only report.
Maybe adp5588_gpio_direction_input() and adp5588_gpio_write() should not 
be called in adp5588_irq_set_type().
This is found by my static analysis tool (DSAC).


Best wishes,
Jia-Ju Bai
