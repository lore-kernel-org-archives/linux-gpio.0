From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 1/2] gpio: simplify adding threaded interrupts
Date: Thu, 5 Jan 2017 14:36:11 -0600
Message-ID: <789f8247-41cc-76a1-6fc8-a1caf45963bc@ti.com>
References: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
 <1777087.OkzDx8qNW5@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:35274 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032921AbdAEUhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2017 15:37:02 -0500
In-Reply-To: <1777087.OkzDx8qNW5@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Lars Poeschel <poeschel@lemonage.de>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>, Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Semen Protsenko <semen.protsenko@globallogic.com>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Patrice Chotard <patrice.chotard@st.com>



On 11/30/2016 08:20 AM, Alexander Stein wrote:
> Am Donnerstag, 24. November 2016, 13:38:53 schrieb Linus Walleij:
>> This tries to simplify the use of CONFIG_GPIOLIB_IRQCHIP when
>> using threaded interrupts: add a new call
>> gpiochip_irqchip_add_nested() to indicate that we're dealing
>> with a nested rather than a chained irqchip, then create a
>> separate gpiochip_set_nested_irqchip() to mirror
>> the gpiochip_set_chained_irqchip() call to connect the
>> parent and child interrupts.
>>
>> In the nested case gpiochip_set_nested_irqchip() does nothing
>> more than call irq_set_parent() on each valid child interrupt,
>> which has little semantic effect in the kernel, but this is
>> probably still formally correct.
>>
>> Update all drivers using nested interrupts to use
>> gpiochip_irqchip_add_nested() so we can now see clearly
>> which these users are.
>>
>> The DLN2 driver can drop its specific hack with
>> .irq_not_threaded as we now recognize whether a chip is
>> threaded or not from its use of gpiochip_irqchip_add_nested()
>> signature rather than from inspecting .can_sleep.
>>
>> We rename the .irq_parent to .irq_chained_parent since this
>> parent IRQ is only really kept around for the chained
>> interrupt handlers.
> 
> I've tested this on a board using both gpio-mcp23s08.c and gpio-pca953x.c and 
> coulnd't detect any change/regression in dmesg. Is this to be expected?
> If so
> Tested-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 

commit d245b3f9bd36f02fd641cba9931d8b4c77126e74
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Thu Nov 24 10:57:25 2016 +0100

    gpio: simplify adding threaded interrupts

causes below back-trace during boot on TI dra72-evm-revc with 
CONFIG_LOCKDEP=y. 
Looks like wrapper need to be added the same way as for _gpiochip_irqchip_add.

    0.494325] SCSI subsystem initialized
[    0.494741] libata version 3.00 loaded.
[    0.521864] gpiochip_find_base: found new base at 494
[    0.521891] gpio gpiochip9: (pcf8575): added GPIO chardev (254:9)
[    0.522464] gpiochip_setup_dev: registered GPIOs 494 to 509 on device: gpiochip9 (pcf8575)
[    0.522594] ------------[ cut here ]------------
[    0.522613] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3124 gpiochip_irq_map+0x40/0xa4
[    0.522619] DEBUG_LOCKS_WARN_ON(!key)
[    0.522623] Modules linked in:
[    0.522639] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc2-00327-gcca402b #122
[    0.522645] Hardware name: Generic DRA72X (Flattened Device Tree)
[    0.522663] [<c011013c>] (unwind_backtrace) from [<c010c300>] (show_stack+0x10/0x14)
[    0.522674] [<c010c300>] (show_stack) from [<c04a0038>] (dump_stack+0xac/0xe0)
[    0.522687] [<c04a0038>] (dump_stack) from [<c0137024>] (__warn+0xd8/0x104)
[    0.522701] [<c0137024>] (__warn) from [<c0137084>] (warn_slowpath_fmt+0x34/0x44)
[    0.522713] [<c0137084>] (warn_slowpath_fmt) from [<c04dd76c>] (gpiochip_irq_map+0x40/0xa4)
[    0.522726] [<c04dd76c>] (gpiochip_irq_map) from [<c01acc68>] (irq_domain_associate+0x70/0x1c0)
[    0.522738] [<c01acc68>] (irq_domain_associate) from [<c01ad534>] (irq_create_mapping+0x64/0xcc)
[    0.522748] [<c01ad534>] (irq_create_mapping) from [<c04dd580>] (_gpiochip_irqchip_add+0xd8/0x1a8)
[    0.522760] [<c04dd580>] (_gpiochip_irqchip_add) from [<c04e59c8>] (pcf857x_probe+0x260/0x38c)
[    0.522771] [<c04e59c8>] (pcf857x_probe) from [<c06341c0>] (i2c_device_probe+0x200/0x25c)
[    0.522784] [<c06341c0>] (i2c_device_probe) from [<c055d2b4>] (driver_probe_device+0x200/0x2d4)
[    0.522797] [<c055d2b4>] (driver_probe_device) from [<c055b7dc>] (bus_for_each_drv+0x64/0x98)
[    0.522809] [<c055b7dc>] (bus_for_each_drv) from [<c055cfd0>] (__device_attach+0xb0/0x118)
[    0.522821] [<c055cfd0>] (__device_attach) from [<c055c5f8>] (bus_probe_device+0x88/0x90)
[    0.522832] [<c055c5f8>] (bus_probe_device) from [<c055a964>] (device_add+0x3e4/0x59c)
[    0.522844] [<c055a964>] (device_add) from [<c063675c>] (i2c_new_device+0x144/0x1a4)
[    0.522854] [<c063675c>] (i2c_new_device) from [<c0636d90>] (i2c_register_adapter+0x278/0x5a4)
[    0.522865] [<c0636d90>] (i2c_register_adapter) from [<c0638f34>] (omap_i2c_probe+0x4bc/0x6a0)
[    0.522875] [<c0638f34>] (omap_i2c_probe) from [<c055f258>] (platform_drv_probe+0x4c/0xb0)
[    0.522887] [<c055f258>] (platform_drv_probe) from [<c055d2b4>] (driver_probe_device+0x200/0x2d4)
[    0.522899] [<c055d2b4>] (driver_probe_device) from [<c055d448>] (__driver_attach+0xc0/0xc4)
[    0.522911] [<c055d448>] (__driver_attach) from [<c055b730>] (bus_for_each_dev+0x6c/0xa0)
[    0.522922] [<c055b730>] (bus_for_each_dev) from [<c055c894>] (bus_add_driver+0x18c/0x214)
[    0.522932] [<c055c894>] (bus_add_driver) from [<c055e280>] (driver_register+0x78/0xf8)
[    0.522942] [<c055e280>] (driver_register) from [<c010188c>] (do_one_initcall+0x3c/0x174)
[    0.522955] [<c010188c>] (do_one_initcall) from [<c0b00eb0>] (kernel_init_freeable+0x208/0x2d4)
[    0.522966] [<c0b00eb0>] (kernel_init_freeable) from [<c07ec560>] (kernel_init+0x8/0x114)
[    0.522978] [<c07ec560>] (kernel_init) from [<c01078f0>] (ret_from_fork+0x14/0x24)
[    0.522989] ---[ end trace 11f50039c91e23f5 ]---

 
regards,
-grygorii
