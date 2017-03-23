From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: Add support for GMMR GPIO
 opregion
Date: Thu, 23 Mar 2017 14:21:59 +0100
Message-ID: <9859f7a4-13ce-5908-2fef-390a20be42c8@redhat.com>
References: <20170322153858.19656-1-hdegoede@redhat.com>
 <1490202054.19767.173.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:10858 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751277AbdCWNWC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 09:22:02 -0400
In-Reply-To: <1490202054.19767.173.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi,

On 22-03-17 18:00, Andy Shevchenko wrote:
> On Wed, 2017-03-22 at 16:38 +0100, Hans de Goede wrote:
>> On some Cherry Trail devices the ASL uses the GMMR GPIO to access
>> GPIOs so as to serialize MMIO accesses to GPIO registers with the
>> OS, because:
>>
>> "Due to a silicon issue, a shared lock must be used to prevent
>> concurrent
>> accesses across the 4 GPIO controllers.
>>
>> See Intel Atom Z8000 Processor Series Specification Update (Rev. 005),
>> errata #CHT34, for further information."
>>
>> This commit adds support for this opregion, this fixes a number of
>> ASL errors on my Ezpad mini3 tablet and makes the otg port device/host
>> muxing which is controlled in firmware on this model work properly.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
>> +static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
>> +	acpi_physical_address address, u32 bits, u64 *value,
>> +	void *handler_context, void *region_context)
>> +{
>> +	struct chv_pinctrl *pctrl = region_context;
>> +	unsigned long flags;
>> +	acpi_status ret = AE_OK;
>> +
>> +	raw_spin_lock_irqsave(&chv_lock, flags);
>> +
>> +	if (function == ACPI_WRITE)
>> +		chv_writel((u32)(*value), pctrl->regs +
>> (u32)address);
>> +	else if (function == ACPI_READ)
>> +		*value = readl(pctrl->regs + (u32)address);
>> +	else
>> +		ret = AE_BAD_PARAMETER;
>> +
>> +	raw_spin_unlock_irqrestore(&chv_lock, flags);
>> +
>
>> +	return AE_OK;
>
> return ret;
>
> Didn't notice before, sorry.

No problem, v3 coming up.

Regards,

Hans
