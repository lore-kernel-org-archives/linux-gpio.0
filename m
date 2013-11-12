From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: append SFI helpers for GPIO API
Date: Tue, 12 Nov 2013 19:55:49 +0100
Message-ID: <CACRpkdZG=Sa92qGqK4Jt-L1AVRmremK5tgn8O5-5JccUsZDHTA@mail.gmail.com>
References: <1381979015-28980-1-git-send-email-david.a.cohen@linux.intel.com>
	<1382013695.29062.141.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:40455 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753427Ab3KLSzt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2013 13:55:49 -0500
Received: by mail-ob0-f175.google.com with SMTP id va2so6299196obc.6
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2013 10:55:49 -0800 (PST)
In-Reply-To: <1382013695.29062.141.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sfi-devel@simplefirmware.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Len Brown <lenb@kernel.org>

On Thu, Oct 17, 2013 at 2:41 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, 2013-10-16 at 20:03 -0700, David Cohen wrote:
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> To support some (legacy) firmwares and platforms let's make life easier for
>> their customers.
>
>> +int sfi_get_gpio_by_name(const char *name)
>> +{
>> +     struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
>> +     int i;
>> +
>> +     if (!pentry)
>> +             return -1;
>
> ^^^^ It seems an old version.
>
> New version was published while ago and even has an ACK from Linus:
>
> http://www.spinics.net/lists/kernel/msg1545960.html

So what is happening to this thing?

Is there some newer patch I should be merging?

Yours,
Linus Walleij
