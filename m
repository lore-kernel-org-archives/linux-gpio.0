From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH v1 3/3] gpiolib: append SFI helpers for GPIO API
Date: Tue, 10 Dec 2013 07:21:51 -0800
Message-ID: <52A7318F.6040901@linux.intel.com>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>  <1386261409-13850-4-git-send-email-andriy.shevchenko@linux.intel.com>  <52A12DCB.10306@nvidia.com> <1386583880.1871.119.camel@smile>  <52A683BA.9090400@nvidia.com> <1386681309.1871.164.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:18947 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750705Ab3LJPYG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Dec 2013 10:24:06 -0500
In-Reply-To: <1386681309.1871.164.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alex Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

Hi,

[snip]

>> I don't know anything about SFI GPIOs, how they are defined, where their 
>> name comes from, and how they are used so my vision may be incomplete. 
>> But AFAICT it all comes down to one of these two scenarios:
>>
>> 1) SFI GPIOs are only used in platform code -> using their pin name is 
>> ok, device argument should be assumed to be NULL for their matching
> Let's stick to this.
>
>> 2) SFI GPIOs are also consumed by device drivers -> you need a way to 
>> match a (device, con_id) pair to your SFI GPIOs so they can be matched 
>> exactly and through the names drivers will request.
> Mostly unlikely we go this way. It would mean we don't need SFI at all.

I'm currently upstreaming Intel-MID's SFI users. This is a forbidden
situation which I'd change before submit the patch.

Br, David Cohen
