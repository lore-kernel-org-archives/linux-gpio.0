From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 0/2] gpiolib exception & gpio-pca953x set_multiple support
Date: Fri, 4 Dec 2015 17:21:18 +0800
Message-ID: <56615B0E.4020508@electromag.com.au>
References: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:48264 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755895AbbLDJV3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 04:21:29 -0500
In-Reply-To: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>, gnurou@gmail.com, linux-gpio@vger.kernel.org

Sorry for the bad cover. Script got away from me.
Should have contained.

First patch prevents a fault that was occuring when the gpio bit was BUSY.
Call stack was as follows:
[<802dfbb8>] (strnlen) from [<802e1170>] (string+0x40/0x10c)
[<802e1170>] (string) from [<802e2fcc>] (vsnprintf+0x178/0x39c)
[<802e2fcc>] (vsnprintf) from [<802e34e0>] (pointer+0x2f0/0x548)
[<802e34e0>] (pointer) from [<802e2f80>] (vsnprintf+0x12c/0x39c)
[<802e2f80>] (vsnprintf) from [<802e374c>] (vscnprintf+0x14/0x2c)
[<802e374c>] (vscnprintf) from [<8006d9d0>] (vprintk_emit+0xd8/0x558)
[<8006d9d0>] (vprintk_emit) from [<8006dfd4>] (vprintk_default+0x34/0x3c)
[<8006dfd4>] (vprintk_default) from [<800e1284>] (printk+0x88/0x90)
[<800e1284>] (printk) from [<802fffc0>] (__dynamic_pr_debug+0x58/0x68)
[<802fffc0>] (__dynamic_pr_debug) from [<80309380>] (gpiod_request+0xf0/0x180)
[<80309380>] (gpiod_request) from [<803095f4>] (gpiod_get_index+0xd8/0x2fc)
[<803095f4>] (gpiod_get_index) from [<7f043be0>] (emit_gpiod_of_get+0x30/0xe4 [EmitDrv])
[<7f043be0>] (emit_gpiod_of_get [EmitDrv]) from [<7f043d0c>] (emit_gpiod_of_array_get+0x78/0xa0 [EmitDrv])
[<7f043d0c>] (emit_gpiod_of_array_get [EmitDrv]) from [<7f04945c>] (adc_mod_probe+0x128/0x338 [AdcMod])
[<7f04945c>] (adc_mod_probe [AdcMod]) from [<7f043228>] (emit_probe+0x12c/0x224 [EmitDrv])
[<7f043228>] (emit_probe [EmitDrv]) from [<7f043824>] (emit_iio_probe_alloc+0x6c/0xe0 [EmitDrv])
[<7f043824>] (emit_iio_probe_alloc [EmitDrv]) from [<7f04913c>] (adc_mod_drv_probe+0x24/0x28 [AdcMod])
[<7f04913c>] (adc_mod_drv_probe [AdcMod]) from [<80350980>] (platform_drv_probe+0x54/0xb4)
[<80350980>] (platform_drv_probe) from [<8034e754>] (driver_probe_device+0x2ec/0x45c)
[<8034e754>] (driver_probe_device) from [<8034e960>] (__driver_attach+0x9c/0xa0)
[<8034e960>] (__driver_attach) from [<8034c4d8>] (bus_for_each_dev+0x70/0xa4)
[<8034c4d8>] (bus_for_each_dev) from [<8034df98>] (driver_attach+0x2c/0x30)
[<8034df98>] (driver_attach) from [<8034dad0>] (bus_add_driver+0x1c8/0x27c)
[<8034dad0>] (bus_add_driver) from [<8034f4e4>] (driver_register+0x88/0x108)
[<8034f4e4>] (driver_register) from [<803508ac>] (__platform_driver_register+0x64/0x6c)
[<803508ac>] (__platform_driver_register) from [<7f04c048>] (adc_mod_init+0x48/0x6c [AdcMod])
[<7f04c048>] (adc_mod_init [AdcMod]) from [<8000984c>] (do_one_initcall+0xc8/0x200)
[<8000984c>] (do_one_initcall) from [<800e154c>] (do_init_module+0x70/0x1e0)
[<800e154c>] (do_init_module) from [<8009e59c>] (load_module+0x1cb4/0x2170)
[<8009e59c>] (load_module) from [<8009ec64>] (SyS_finit_module+0x8c/0xbc)
[<8009ec64>] (SyS_finit_module) from [<80010800>] (ret_fast_syscall+0x0/0x3c)
Code: e24cb004 e3510000 e241e001 0a000011 (e5d01000)


Second patch adds support for set multiple bits in one i2c transaction.
This speeds up setting 'sets' of output bits.





-- 
Regards
Phil Reid

