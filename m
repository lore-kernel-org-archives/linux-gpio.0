From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] gpiolib-acpi: add _DEP support for Acer One 10
Date: Tue, 14 Jun 2016 23:38:52 +0200
Message-ID: <2b7fdb9a-0c7a-e120-c2c9-acde736f420e@intel.com>
References: <1463368705.22433.15.camel@rzhang1-mobl4>
 <CACRpkdbheZ55Hc5egwrbQOBQaDjkq+_-N3Hm0+b=Vqmau5=a1w@mail.gmail.com>
 <20160614100139.GI1740@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44637 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbcFNVi5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Jun 2016 17:38:57 -0400
In-Reply-To: <20160614100139.GI1740@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Zhang, Rui" <rui.zhang@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-acpi <linux-acpi@intel.com>, "stace75@gmail.com" <stace75@gmail.com>

On 6/14/2016 12:01 PM, Mika Westerberg wrote:
> On Tue, Jun 14, 2016 at 09:33:30AM +0200, Linus Walleij wrote:
>> Mika, Rafael: this came from Intel, can you review it? Should it be applied?
> Looks reasonable so unless Rafael objects you can add my,
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

No objections.

>> Yours,
>> Linus Walleij
>>
>> On Mon, May 16, 2016 at 5:18 AM, Zhang, Rui <rui.zhang@intel.com> wrote:
>>
>>>  From 8590bdcacc94a1ab260b4ea2e6e747b0bc1d9bf8 Mon Sep 17 00:00:00 2001
>>> From: Zhang Rui <rui.zhang@intel.com>
>>> Date: Wed, 11 May 2016 09:02:28 +0800
>>> Subject: [PATCH] gpiolib-acpi: add _DEP support for Acer One 10
>>>
>>> On Acer One 10, the ACPI battery driver can not be probed because
>>> it depends on the GPIO controller as well as the I2C controller to work,
>>>          Device (BATC)
>>>          {
>>>              Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)
>>>              ...
>>>              Name (_DEP, Package (0x03)  // _DEP: Dependencies
>>>              {
>>>                  I2C1,
>>>                  GPO2,
>>>                  GPO0
>>>              })
>>>              ...
>>>          }
>>>
>>> The I2C dependency also exists on other platforms and has been fixed by commit
>>> 40e7fcb19293 ("ACPI: Add _DEP support to fix battery issue on Asus T100TA"),
>>> this patch resolves the GPIO dependency for Acer One 10.
>>>
>>> Link:https://bugzilla.kernel.org/show_bug.cgi?id=115191
>>> CC: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Tested-by: Stace A. Zacharov <stace75@gmail.com>
>>> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
>>> ---
>>>   drivers/gpio/gpiolib-acpi.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>>> index 682070d..4b809b0 100644
>>> --- a/drivers/gpio/gpiolib-acpi.c
>>> +++ b/drivers/gpio/gpiolib-acpi.c
>>> @@ -836,6 +836,7 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
>>>          }
>>>
>>>          acpi_gpiochip_request_regions(acpi_gpio);
>>> +       acpi_walk_dep_device_list(handle);
>>>   }
>>>
>>>   void acpi_gpiochip_remove(struct gpio_chip *chip)
>>> --
>>> 1.9.1
>>>
>>>

