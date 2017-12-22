From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 10:37:32 +1000
Message-ID: <44f3de2a-4f1b-bc0c-ee5d-3cdf20a766cf@opengear.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
 <20171221121256.GY27654@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam03on0042.outbound.protection.outlook.com ([104.47.42.42]:51887
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752165AbdLVAhz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 19:37:55 -0500
In-Reply-To: <20171221121256.GY27654@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, Timur Tabi <timur@codeaurora.org>



On 21/12/17 22:12, Mika Westerberg wrote:
> On Thu, Dec 21, 2017 at 11:11:18AM +0100, Linus Walleij wrote:
>>> In contrast, the pinctrl-amd driver only mentions the newer KERNCZ platform
>>> name and uses ACPI for probing without disclosing any Family or Model numbers.
>>>
>>> pinctrl-amd applies to "AMD0030" and "AMDI0030"
>>>
>>> The ACPI HID matching makes it difficult to determine what family and model the
>>> driver applies to, or rather, I have not been able to find such a mapping of HIDs
>>> to family and model numbers. It's also impossible to guess an ACPI _HID
>>> that may or may not exist for the Family 16h Model 30h platform and even if I
>>> allocate a new HID for our ACPI implementation, that HID has little hope of
>>> being accepted into the mainline driver.
>>
>> I didn't understand anything of what you just wrote.
>> I am basically ignorant when it comes to ACPI details.
>>
>> So let's CC the GPIO ACPI maintainer, Mika Westerberg.
> 
> If the hardware is not the same that is already supported by the
> pinctrl-amd, then you definitely should allocate a new separate ACPI
> _HID for it. That's pretty much what we do with every new SoC because
> they typically don't have identical pin lists among other things.
> 

Right. I wonder if my reasons for objecting to using ACPI _HID in this way (as the existing drivers do) are being overlooked, or if there's something missing in my understanding.

Given the HID "AMDI0030", it is difficult for anyone besides AMD to determine what SoC that is intended to match. Joe Random Developer would not be able to find the datasheet for the SoC and verify that this driver works correctly, or whether it is used by any firmware at all.

However, my specific problem is the inverse. Given a SoC without vendor-supplied HID or DSDT ASL (ie. I'm writing the DSDT ASL), I don't know what HID to allocate for the driver and DSDT, and I'm too low in the food chain to allocate the one true HID for this SoC that every firmware developer and driver developer should use. This is not a problem for out-of-tree patches, but it blocks me from contributing usable support for a new SoC.

So my objection is that the coupling between the driver and ACPI firmware, caused by these special HID strings, is both unnecessary and disempowering. If an appropriate ID register exists in the MMIO space, I think that would solve this issue.

I'm hoping to confirm whether my assessment is correct.

Thanks

a.
