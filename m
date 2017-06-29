From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset
 calculation
Date: Thu, 29 Jun 2017 12:32:31 -0700
Message-ID: <c294e12e-ae15-d27b-32ef-0c4decde51b7@linux.intel.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VeY0beV-TxXpyc7gSW5jPs0da2wnRt-WrikdQ4CSxKjJw@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:5524 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751591AbdF2TdD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2017 15:33:03 -0400
In-Reply-To: <CAHp75VeY0beV-TxXpyc7gSW5jPs0da2wnRt-WrikdQ4CSxKjJw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

Hi Andy,


On 06/29/2017 05:30 AM, Andy Shevchenko wrote:
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
> For me (disregards to content of the patch) the question is: did we
> ever have a *working* solution looking to the bug fixes on this
> driver?!
We recently enabled this driver to handle some some requirements in IOT 
ref kit board and started seeing all these issues. Given that I am 
seeing issues related to IRQ handling, register mapping, I can safely 
say that this driver was never tested before.
>
> I would suggest to stop applying patches on Intel PMICs without
> Tested-by tag from independent testers.
For the patches I have sent, I have tested it in Apollo lake reference 
board and also sent this patch to testing team for verification. Only 
after confirming that it works, I sent this patch to upstream for review.
>
> Hans, do you have anything to add / comment on this?
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

