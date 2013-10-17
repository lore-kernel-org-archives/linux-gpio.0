From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpiolib: append SFI helpers for GPIO API
Date: Thu, 17 Oct 2013 10:06:38 -0700
Message-ID: <5260191E.4060603@linux.intel.com>
References: <1381979015-28980-1-git-send-email-david.a.cohen@linux.intel.com> <1382013695.29062.141.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:38993 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756803Ab3JQRCa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 17 Oct 2013 13:02:30 -0400
In-Reply-To: <1382013695.29062.141.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, sfi-devel@simplefirmware.org, linux-gpio@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Len Brown <lenb@kernel.org>

On 10/17/2013 05:41 AM, Andy Shevchenko wrote:
> On Wed, 2013-10-16 at 20:03 -0700, David Cohen wrote:
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> To support some (legacy) firmwares and platforms let's make life easier for
>> their customers.
>>
>
>
>> +int sfi_get_gpio_by_name(const char *name)
>> +{
>> +	struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
>> +	int i;
>> +
>> +	if (!pentry)
>> +		return -1;
>
> ^^^^ It seems an old version.
>
> New version was published while ago and even has an ACK from Linus:
>
> http://www.spinics.net/lists/kernel/msg1545960.html

Interesting :)
I got this patch cooking in our internal tree for quite some time.
Didn't realize about the new version. I'm waiting it to be merged to
send an Intel Mid patch that depends on that.

Please, ignore this version and consider the one pointed out by Andy.

Br, David Cohen

>
>

