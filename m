From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] gpiolib: append SFI helpers for GPIO API
Date: Mon, 9 Dec 2013 14:27:09 +0100
Message-ID: <CACRpkdZRE4zrpKBQE+V9_P+y+YfA1wtu7bRDq+NJt1kohCSH1w@mail.gmail.com>
References: <1386589829-2877-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1386589829-2877-3-git-send-email-andriy.shevchenko@linux.intel.com>
	<20131209130439.GE2281@intel.com>
	<1386594127.1871.129.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34867 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933351Ab3LIN1L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 08:27:11 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so3681521obc.24
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2013 05:27:11 -0800 (PST)
In-Reply-To: <1386594127.1871.129.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On Mon, Dec 9, 2013 at 2:02 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, 2013-12-09 at 15:04 +0200, Mika Westerberg wrote:
>> On Mon, Dec 09, 2013 at 01:50:29PM +0200, Andy Shevchenko wrote:

>> > +struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
>> > +{
>> > +   struct sfi_gpio_table_entry *pentry;
>> > +
>> > +   pentry = sfi_gpio_get_entry_by_name(name);
>> > +   if (IS_ERR(pentry))
>> > +           return pentry;
>> > +
>> > +   return gpio_to_desc(pentry->pin_no);
>> > +}
>>
>> Do you really need add a new file just to have the above supported? I mean
>> that if you place that function to drivers/gpio/gpiolib.c with the
>> appropriate:
(...)
>
> I won't have linux/sfi.h in the gpiolib.c. If Linus has no objections, I
> can do that of course.

#ifdef:s are ugly according to Linus (Documentation/CodingStyle)
and according to this instance of Linus as well. So I actually prefer
so have a separate file.

But what is happening with this series? Should it be merged
through the GPIO tree? I need the SFI maintainers (Len Brown)
ACK for that.

I really like the way this patch set developed to abstract away
the SFI internals into this gpiolib sidecar, thanks!

Yours,
Linus Walleij
