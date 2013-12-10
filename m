From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v4 2/2] gpiolib: append SFI helpers for GPIO API
Date: Tue, 10 Dec 2013 11:46:52 +0900
Message-ID: <52A6809C.7020406@nvidia.com>
References: <1386589829-2877-1-git-send-email-andriy.shevchenko@linux.intel.com>	<1386589829-2877-3-git-send-email-andriy.shevchenko@linux.intel.com>	<20131209130439.GE2281@intel.com>	<1386594127.1871.129.camel@smile> <CACRpkdZRE4zrpKBQE+V9_P+y+YfA1wtu7bRDq+NJt1kohCSH1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8465 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab3LJCq4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 21:46:56 -0500
In-Reply-To: <CACRpkdZRE4zrpKBQE+V9_P+y+YfA1wtu7bRDq+NJt1kohCSH1w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On 12/09/2013 10:27 PM, Linus Walleij wrote:
> On Mon, Dec 9, 2013 at 2:02 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Mon, 2013-12-09 at 15:04 +0200, Mika Westerberg wrote:
>>> On Mon, Dec 09, 2013 at 01:50:29PM +0200, Andy Shevchenko wrote:
>
>>>> +struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
>>>> +{
>>>> +   struct sfi_gpio_table_entry *pentry;
>>>> +
>>>> +   pentry = sfi_gpio_get_entry_by_name(name);
>>>> +   if (IS_ERR(pentry))
>>>> +           return pentry;
>>>> +
>>>> +   return gpio_to_desc(pentry->pin_no);
>>>> +}
>>>
>>> Do you really need add a new file just to have the above supported? I mean
>>> that if you place that function to drivers/gpio/gpiolib.c with the
>>> appropriate:
> (...)
>>
>> I won't have linux/sfi.h in the gpiolib.c. If Linus has no objections, I
>> can do that of course.
>
> #ifdef:s are ugly according to Linus (Documentation/CodingStyle)
> and according to this instance of Linus as well. So I actually prefer
> so have a separate file.

Also agree with that. If anything, I'd like to see the DT/ACPI specific 
functions moved into a different file at some point.

> I really like the way this patch set developed to abstract away
> the SFI internals into this gpiolib sidecar, thanks!

Yes - that's a great followup to Mika's work on ACPI and it's nice to 
see this interface adopted (at least on the producer side).

