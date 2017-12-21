From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Thu, 21 Dec 2017 14:02:01 +0100
Message-ID: <2142688.oNeEzK9Weu@debian64>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:42391 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751881AbdLUNCE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 08:02:04 -0500
In-Reply-To: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Cooks <andrew.cooks@opengear.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, alan@mizrahi.com.ve

On Thursday, December 21, 2017 8:25:03 AM CET Andrew Cooks wrote:
> I'm working on gpio for an AMD Family 16h Model 30h system[1]. 
> The SoC is the same as the GX412-TC used in the PC Engines APU2. 
> 
> There is an out-of-tree gpio driver (gpio-amd) for this SoC in the
> meta-amd yocto layer[2]. Another driver (gpio-sb8xx) was submitted
> for upstream inclusion, but was knocked back with the suggestion
> that pinctrl is the way forward[3].
> 
> I would much prefer to use a mainline driver for the system I'm 
> working on, so I'm looking at the pinctrl-amd driver to see
> whether it applies to our SoC, or whether it could be extended,
> or used as starting point for a new driver.
> 
> The out-of-tree drivers apply to the GX412-TC SoC and uses PCI
> for probing:

Just a FYI: due to these difficulties with getting a gpio driver
upstream, Alan Mizrahi upstreamed an in-kernel led-apu.c driver [0]
that sort of bypasses the whole pinctrl vs gpio issue.

|#define APU1_FCH_ACPI_MMIO_BASE 0xFED80000
|#define APU1_FCH_GPIO_BASE      (APU1_FCH_ACPI_MMIO_BASE + 0x01BD)
|#define APU1_LEDON              0x08
|#define APU1_LEDOFF             0xC8
|#define APU1_NUM_GPIO           3
|#define APU1_IOSIZE             sizeof(u8)
|
|#define APU2_FCH_ACPI_MMIO_BASE 0xFED80000
|#define APU2_FCH_GPIO_BASE      (APU2_FCH_ACPI_MMIO_BASE + 0x1500)
|#define APU2_GPIO_BIT_WRITE     22
|#define APU2_APU2_NUM_GPIO      4
|#define APU2_IOSIZE             sizeof(u32)

If you are just after LEDs or gpio-keys you probably can go the same
route?

Thanks,
Christian

[0] <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/leds-apu.c>
