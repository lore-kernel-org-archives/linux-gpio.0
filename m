Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D4244F54B;
	Tue, 22 Sep 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070924; cv=none; b=ZU7/Bh7YlNsJAce3YoHLBhorUWTgac4NQG4vhgU4/J2U9dGXCnEAE8NDtnX7JxLY3uDvtJ5RT0pNZptxgk0+ZOlv/n4GO2fjGOBI7Hynn2zDGSYTgz15pY2wvSDdnoAe3GZHrcLc4AFyhj87kquu5PXRVPU3rNZXtS3Shgw/BAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070924; c=relaxed/simple;
	bh=1USIA3QuKT3HfWYjrwytG+eI3HrgQopFvJxZ0ymZ0DU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BNMiYeJExEwEP8g1PYYW36ojyRUTVomZO4OZegs0UmAnT7GoROYECB8CzV0Y3nd8yuV/T2BL24HgWTOPGb12GWbKwOTUaZBdLcTSqgZ5PI9HUZT04BUaJOCk6Bu8mX06S0+rHlyz1IAVa9CW4Vh/DvaFqvRCgGNctH8yaB0JZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8CxvtKGULJqIpkOAA--.42672S3;
	Tue, 22 Sep 2026 17:55:18 +0800 (CST)
Received: from [10.161.0.102] (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAx3c6CULJqSbcjAA--.10868S2;
	Tue, 22 Sep 2026 17:55:15 +0800 (CST)
Message-ID: <52183cd9-4b43-456d-896d-ee2fea6d5d72@loongson.cn>
Date: Tue, 22 Sep 2026 17:55:13 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
To: shankerwangmiao@gmail.com, Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
In-Reply-To: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c6CULJqSbcjAA--.10868S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGqx8fgGjgAAsD
X-Coremail-Antispam: 1Uk129KBj93XoWxuFW7uF1UCw43Xw43Kr45Arc_yoWxtry7pF
	Z0kFW3Cr4DJr4xKFsa93WxuFya9an7JF43GrnrK3s8ua45uFyxZrW3KFyY9FyDArZ3uF1S
	vF15tFnrGFyDA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8loGPUUUUU==

Hi:

On 2026/8/11 16:07, Miao Wang via B4 Relay wrote:
> Previously, the driver has been introduced to support the Loongson 2K
> BMC running on the Loongson Servers, which is essential to prevent
> the system from hanging when the BMC is being reset and the default
> efi-framebuffer is being used. However, there are some drawbacks in the
> driver.
> 
> Firstly, the driver tries to read and write to the connected PCI-E host
> controller registers, assuming that the BMC is connected to LS7A PCI-E
> host controller. This assumption should be true for real products, but
> to prevent from accidentally reading and writing to the wrong PCI-E host
> controller, this driver should be modified to check this before
> accessing the registers.
> 
> Secondly, the driver uses non-exported functions to tell the vt
> subsystem to redraw the screen, preventing the driver from being
> compiling as a module. This can be fixed by using the exported
> functions instead.
> 
> Thirdly, the driver directly accesses the GPIO controller registers
> using hard-coded addresses, which might conflict with the loaded GPIO
> controller driver for the same GPIO controller. This is fixed in this
> series by using the GPIO subsystem APIs instead. To associate a GPIO pin
> with a certian PCI device, it should be declared in the firmware level,
> i.e. in the ACPI table or the device tree, and thus the firmware
> interface should be discussed and coordinated with Loongson personnels.
> Despite of this, the proposed solution in this series should be the
> minimum necessary change to express such association. Furthermore, the
> conventional GPIO pin number and the controller address are also
> provided, to be used as a fallback when the GPIO pin is not declared.
> 
> Finally, there is a minor issue in the driver where it changes the
> mode string describing the screen resolution during probing, which
> prevents the device from being probed again if -EPROBE_DEFER is
> returned by the probe function.
> 
> I have tested the changes in this series on a single-socket Loongson
> 3C6000 server with a Loongson 2K BMC, and the driver works as expected
> when the corresponding GPIO driver is additionally loaded.
> 
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
> Changes in v9:
> - Extend the kernel docs for gpio_device_get_fwnode() to describe the
>    usage of this function, as suggested by Bartosz.
> - Link to v8: https://lore.kernel.org/r/20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com

I’m deeply sorry for the delayed response due to personal reasons.

Regarding Patch-1, I don’t mind using your current version as is—it’s 
more complete. However, I received another email from lkp[1] a few days 
ago, and I still hope this patch can be merged sooner.

The current discussion is focused on the GPIO-related patch, but in 
reality, it isn’t closely tied to the other patches; it’s more of an 
optimization. If possible, I personally think we could set it aside for 
now and treat it as a separate set of feature optimization patches.

[1]: https://lore.kernel.org/all/202608230816.ifMzE0No-lkp@intel.com/
> 
> Changes in v8:
> - Address issues found by the Sashiko AI review bot
>    - Fix the error path of the probe function, preventing unintentionally
>      returning 0 on failure
>    - Reorder the patches in the series to make the change to the Kconfig
>      entry for ls2kbmc to be the last patch, to satisfy the AI bot's
>      concern on failure to clean up when the driver is built as a module
>      and is being removed.
> - Link to v7: https://lore.kernel.org/r/20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com
> 
> Changes in v7:
> - When parsing the mode string, require the mode string to start with
>    "video=", reverting the change in v5. Add a comment to describe the
>    reason for this change to satisfy the AI bot's concern.
> - When printing the invalid mode string, use %*pE to print the string
>    to prevent the string from printing garbage characters, as suggested
>    by the AI bot.
> - When calculating the stride, check that the multiplication of width
>    and depth does not overflow, as suggested by the AI bot.
> - Add gpio_device_get_fwnode() into gpiolib.c as a library function to
>    get the fwnode of a GPIO device, as suggested by Bartosz.
> - Adjust the coding style of the patch as suggested by Bartosz.
> - Link to v6: https://lore.kernel.org/r/20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com
> 
> Changes in v6:
> - Ajdust the Kconfig entry for IPMI_LS2K, moving the dependency on
>    MFD_LS2K_BMC_CORE to the IPMI_SI Kconfig entry, as discussed with
>    and agreed by Corey.
> - Link to v5: https://lore.kernel.org/r/20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com
> 
> Changes in v5:
> - Address issues found by the Sashiko AI review bot
>    - Maintain the compatibility with possible unexpected mode string when
>      parsing, although such mode string is actually not expected, to
>      satisfy the AI bot's concern.
>    - Add a comment to point out that the adjustment of the Kconfig entry
>      for ls2kbmc is in the following patch, to satisfy the AI bot's
>      concern.
> - Link to v4: https://lore.kernel.org/r/20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com
> 
> Changes in v4:
> - Use a better way to get the GPIO device fwnode.
> - Add a comment to describe a problem found by AI bot which is actually
>    intended.
> - Link to v3: https://lore.kernel.org/r/20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com
> 
> Changes in v3:
> - Check the return value of devm_add_action_or_reset when registering
>    the cleanup hook of the work queue
> - Use swnode to create the link between the device to the GPIO chip,
>    and prevent borrowing the legacy GPIO APIs
> - Link to v2: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com
> 
> Changes in v2:
> - Several fixes suggested by the Sashiko AI review bot
> - Add a cleanup function for the wq on removal of the device
> - Relax the reverse dependency from CONFIG_IPMI_LS2K to
>    CONFIG_MFD_LS2K_BMC_CORE to allow the driver to be built as a module
> - Link to v1: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com
> 
> ---
> Miao Wang (8):
>        mfd: ls2kbmc: Make a copy when parsing mode string
>        mfd: ls2kbmc: Sanity check for the connected pci port
>        mfd: ls2kbmc: Redraw using exported functions
>        mfd: ls2kbmc: Cancel the work queue on removal
>        ipmi: ls2k: adjust dependency to its mfd driver
>        gpiolib: add gpio_device_get_fwnode() helper
>        mfd: ls2kbmc: Capture the reset event of BMC through GPIO
>        mfd: ls2kbmc: Able to be compiled as a module
> 
>   drivers/char/ipmi/Kconfig   |   2 +-
>   drivers/gpio/gpiolib.c      |  17 +++
>   drivers/mfd/Kconfig         |   2 +-
>   drivers/mfd/ls2k-bmc-core.c | 247 ++++++++++++++++++++++++++++++++++----------
>   include/linux/gpio/driver.h |   1 +
>   5 files changed, 210 insertions(+), 59 deletions(-)
> ---
> base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
> change-id: 20260626-ls2kbmc-mod-5209193009b2
> 
> Best regards,

-- 
Thanks.
Binbin

