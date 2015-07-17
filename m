From: Vitaly Andrianov <vitalya@ti.com>
Subject: Re: [PATCH v2] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Fri, 17 Jul 2015 10:51:29 -0400
Message-ID: <55A91671.2000202@ti.com>
References: <1435861890-23147-1-git-send-email-vitalya@ti.com> <CACRpkdb0ORjwAyA5r4khK0Xa3_N0vpRjrXq76pe+GTFjLux+2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:52125 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757844AbbGQOq2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 10:46:28 -0400
In-Reply-To: <CACRpkdb0ORjwAyA5r4khK0Xa3_N0vpRjrXq76pe+GTFjLux+2w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Muralidharan Karicheri <m-karicheri2@ti.com>



On 07/17/2015 08:16 AM, Linus Walleij wrote:
> On Thu, Jul 2, 2015 at 8:31 PM, Vitaly Andrianov <vitalya@ti.com> wrote:
>
>> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
>> "binten" register (offset 8). Previous versions of GPIO only
>> used bit 0, which enables GPIO 0-15 interrupts.
>>
>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>> History
>>
>> v2.
>> - use GENMASK to set binten. Thanks to Nori Sekhar's.
>
> This version applied for v4.3 with Sekhar's review tag.
>
> Yours,
> Linus Walleij
>
Thank you.
