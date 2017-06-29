From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset
 calculation
Date: Thu, 29 Jun 2017 15:24:22 +0200
Message-ID: <893836dc-9f7d-da72-7fa0-909ec0025d5e@redhat.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VeY0beV-TxXpyc7gSW5jPs0da2wnRt-WrikdQ4CSxKjJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54728 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752614AbdF2NYZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2017 09:24:25 -0400
In-Reply-To: <CAHp75VeY0beV-TxXpyc7gSW5jPs0da2wnRt-WrikdQ4CSxKjJw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

Hi,

On 29-06-17 14:30, Andy Shevchenko wrote:
> +Cc: Hans
> 
> On Mon, Jun 26, 2017 at 8:37 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> According to Whiskey Cove PMIC GPIO controller specification, for GPIO
>> pins 0-12, GPIO input and output register control address range from,
>>
>> 0x4e44-0x4e50 for GPIO outputs control register
>>
>> 0x4e51-0x4e5d for GPIO input control register
>>
>> But, currently when calculating the GPIO register offsets in to_reg()
>> function, all GPIO pins in the same bank uses the same GPIO control
>> register address. This logic is incorrect. This patch fixes this
>> issue.
> 
>>
>> This patch also adds support to selectively skip register modification
>> for virtual GPIOs.
>>
>> In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
>> These virtual GPIOs are used by the ACPI code as means to access various
>> non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
>> manipulate the physical GPIO pin register. A similar patch has been
>> merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
>> find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
>> Do not write regular gpio registers for virtual GPIOs")
> 
> For me (disregards to content of the patch) the question is: did we
> ever have a *working* solution looking to the bug fixes on this
> driver?!
> 
> I would suggest to stop applying patches on Intel PMICs without
> Tested-by tag from independent testers.
> 
> Hans, do you have anything to add / comment on this?

Yes, I noticed the driver .name = "bxt_wcove_gpio", I myself have
a device with a Cherry Trail Whiskey Cove variant. For those reading
along here which SoC / platform a PMIC is used on (Cherry Trail vs
Broxton) may seem unrelevant. But Intel has a per platform variant
of its Crystal Cove and Whiskey Cove PMICs and the platform variants
are really just completely different PMICs, using incompatible
registermaps for one. So I would really like us to stop referring
to these devices as Whiskey Cove (or wcove) and instead name them
"Cherry Trail Whiskey Cove" or cht_wc, "Bay Trail Crystal Cove" /
byt_crc, etc. and do so consistently!

E.g. I've recently learned that there are Cherry Trail devices
with Crystal Cove PMICs (Dell Venue 8 pro 5855) and enabling
the Crystal Cove PMIC ACPI Opregion on those wrecks havoc because
it causes the wrong registers to get modified. Specifically
the regulator control registers have slightly different addresses
so we are modifying the wrong regulators! <sarcasm> Which is not a
problem, right ? </sarcasm>

Anyways back to the topic. Kuppuswamy do you have access to
*Cherry Trail* Whiskey Cove documentation and can you check that
the GPIO ctrl and irq registers are the same there ? IOW can
you check if we can re-use this driver for the
Cherry Trail Whiskey Cove PMIC ?  If not then the .c file
should really be renamed to drivers/gpio/gpio-bxt-wcove.c

And future patches should also use gpio-bxt-wcove in their
subject.

With that said, the patch looks good to me.

Regards,

Hans
