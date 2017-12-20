From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: pinctrl-amd: What hardware does it apply to?
Date: Thu, 21 Dec 2017 08:25:03 +1000
Message-ID: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0084.outbound.protection.outlook.com ([104.47.38.84]:24448
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754428AbdLTWZZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Dec 2017 17:25:25 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>

Hi Linus

I'm working on gpio for an AMD Family 16h Model 30h system[1]. The SoC is the same as the GX412-TC used in the PC Engines APU2. 

There is an out-of-tree gpio driver (gpio-amd) for this SoC in the meta-amd yocto layer[2].
Another driver (gpio-sb8xx) was submitted for upstream inclusion, but was knocked back with the suggestion that pinctrl is the way forward[3].

I would much prefer to use a mainline driver for the system I'm working on, so I'm looking at the pinctrl-amd driver to see whether it applies to our SoC, or whether it could be extended, or used as starting point for a new driver.

The out-of-tree drivers apply to the GX412-TC SoC and uses PCI for probing:

gpio-amd registers a platform driver that applies to { PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_HUDSON2_SMBUS }
gpio-sb8xx applies to { PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_HUDSON2_SMBUS } and { PCI_DEVICE(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_SBX00_SMBUS }

These IDs make it easy to cross reference with the datasheet, and keeps the coupling between ACPI and the driver low. 
These drivers do not provide a mechanism for firmware (ACPI or DT) to specify which gpios are safe to use or how to use them.

In contrast, the pinctrl-amd driver only mentions the newer KERNCZ platform name and uses ACPI for probing without disclosing any Family or Model numbers.

pinctrl-amd applies to "AMD0030" and "AMDI0030"

The ACPI HID matching makes it difficult to determine what family and model the driver applies to, or rather, I have not been able to find such a mapping of HIDs to family and model numbers. It's also impossible to guess an ACPI _HID that may or may not exist for the Family 16h Model 30h platform and even if I allocate a new HID for our ACPI implementation, that HID has little hope of being accepted into the mainline driver.

I would like to extend the generically named, but very specifically implemented pinctrl-amd driver to also work on Family 16h, Model 30h (specifically the FT3b package), and I propose to use the PCI_DEVICE_ID_AMD_16H_M30H_NB_F3 symbol to probe for the device.

Does this seem like a sensible way forward?

Thanks!

Andrew

1. http://support.amd.com/TechDocs/52740_16h_Models_30h-3Fh_BKDG.pdf
2. http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/tree/meta-steppeeagle/recipes-kernel/amd-gpio/files/gpio-amd.c
3. https://lkml.org/lkml/2015/6/20/202
