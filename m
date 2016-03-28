From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: arm:collie_defconfig broken since commit ff2b135922 ("gpio: make
 the gpiochip a real device")
Date: Mon, 28 Mar 2016 12:31:45 -0700
Message-ID: <20160328193145.GA12059@roeck-us.net>
References: <56F8BB39.5010708@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47945 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754206AbcC1Tbp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2016 15:31:45 -0400
Content-Disposition: inline
In-Reply-To: <56F8BB39.5010708@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

On Sun, Mar 27, 2016 at 10:03:53PM -0700, Guenter Roeck wrote:
> Hi,
> 
> arm:collie_defconfig is broken since commit ff2b135922 ("gpio: make the gpiochip a real device").
> 
> Test is quite simple:
> 
> Build arm:collie_defconfig, run with
> 	qemu-system-arm -M collie -kernel arch/arm/boot/zImage --append "console=ttySA1" -monitor null -nographic
> 
> Prior to the above commit, there is console output (the image crashes because it
> doesn't have a root file system, but that is irrelevant). After the commit, the
> console is silent.
> 
> Let me know if I can do anything to help tracking down the problem.
> 
After adding a check and WARN() into gpio_add_data(), the reason is obvious.

Here is the log:

WARNING: CPU: 0 PID: 0 at drivers/gpio/gpiolib.c:473
gpiochip_add_data+0x5b0/0x694
gpio subsystem not initialized
CPU: 0 PID: 0 Comm: swapper Not tainted 4.6.0-rc1-dirty #1
Hardware name: Sharp-Collie
[<c000dc9c>] (unwind_backtrace) from [<c000c4ec>] (show_stack+0x10/0x14)
[<c000c4ec>] (show_stack) from [<c0016824>] (__warn+0xcc/0xf4)
[<c0016824>] (__warn) from [<c0016884>] (warn_slowpath_fmt+0x38/0x48)
[<c0016884>] (warn_slowpath_fmt) from [<c015fbdc>] (gpiochip_add_data+0x5b0/0x694)
[<c015fbdc>] (gpiochip_add_data) from [<c033c980>] (sa1100_init_gpio+0x2c/0x15c)
[<c033c980>] (sa1100_init_gpio) from [<c032e3d4>] (init_IRQ+0x14/0x1c)
[<c032e3d4>] (init_IRQ) from [<c032bac0>] (start_kernel+0x200/0x42c)
[<c032bac0>] (start_kernel) from [<c0008048>] (0xc0008048)

Turns out gpio_add_data() is called before gpiolib_dev_init(), and the gpio
subsytem doesn't like that at all.

Guenter

> Thanks,
> Guenter
> 
> ---
> Bisect log:
> 
> # bad: [f55532a0c0b8bb6148f4e07853b876ef73bc69ca] Linux 4.6-rc1
> # good: [b562e44f507e863c6792946e4e1b1449fbbac85d] Linux 4.5
> git bisect start 'HEAD' 'v4.5'
> # bad: [6b5f04b6cf8ebab9a65d9c0026c650bb2538fd0f] Merge branch 'for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
> git bisect bad 6b5f04b6cf8ebab9a65d9c0026c650bb2538fd0f
> # good: [96b9b1c95660d4bc5510c5d798d3817ae9f0b391] Merge tag 'tty-4.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
> git bisect good 96b9b1c95660d4bc5510c5d798d3817ae9f0b391
> # good: [18f038e6bfb715310526ac05e4f20e55683471de] staging: dgnc: cleanup properly
> git bisect good 18f038e6bfb715310526ac05e4f20e55683471de
> # bad: [10fdfee7f7fd8d4a6a8455ac4c9fbbc51d79b9f7] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> git bisect bad 10fdfee7f7fd8d4a6a8455ac4c9fbbc51d79b9f7
> # good: [3d15cfdb1b77536c205d8e49c0312219ddf162ec] Merge tag 'linux-kselftest-4.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> git bisect good 3d15cfdb1b77536c205d8e49c0312219ddf162ec
> # bad: [ccbd805aa934dd1b863ef115a9c55f119b2388cf] Revert "Share upstreaming patches"
> git bisect bad ccbd805aa934dd1b863ef115a9c55f119b2388cf
> # bad: [db303a9053c8a81717cb6497f4cf63b773b21ca8] gpio: arizona: Use devm_gpiochip_add_data() for gpio registration
> git bisect bad db303a9053c8a81717cb6497f4cf63b773b21ca8
> # bad: [ed07247dbf5b0a23b0289c9e8e4a2ceb9b8f2e9d] gpio: Remove unused asm/gpio.h files
> git bisect bad ed07247dbf5b0a23b0289c9e8e4a2ceb9b8f2e9d
> # bad: [2f890cf0dfe421ecd2095d8cabb89e7207b499ee] gpio: ath79: Make the driver removable
> git bisect bad 2f890cf0dfe421ecd2095d8cabb89e7207b499ee
> # good: [daec0beda6fd7a741e4381741b3f7ff15970fdf6] Merge branch 'error-return-from-get' into devel
> git bisect good daec0beda6fd7a741e4381741b3f7ff15970fdf6
> # bad: [40c159b776f882f2e2cbe20c9e29832841e5c0f9] gpio: add a userspace character device ABI
> git bisect bad 40c159b776f882f2e2cbe20c9e29832841e5c0f9
> # bad: [34ffd85d9c46cde3dc987cac82bff370a937ac4b] gpio: refer to gpio device in prints and debugfs
> git bisect bad 34ffd85d9c46cde3dc987cac82bff370a937ac4b
> # bad: [ff2b1359229927563addbf2f5ad480660c350903] gpio: make the gpiochip a real device
> git bisect bad ff2b1359229927563addbf2f5ad480660c350903
> # first bad commit: [ff2b1359229927563addbf2f5ad480660c350903] gpio: make the gpiochip a real device
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
