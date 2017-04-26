From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: fix GPIO IRQ status mask
Date: Wed, 26 Apr 2017 17:52:09 +0300
Message-ID: <CAHp75Ver8XQZd2sG4QDo+HmUFGHPMthe0jHROv+uJB74gzYJgQ@mail.gmail.com>
References: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
 <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34171 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1955639AbdDZOwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2017 10:52:11 -0400
In-Reply-To: <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Bin Gao <bin.gao@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Wed, Apr 26, 2017 at 5:26 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Apr 24, 2017 at 9:15 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> According to Whiskey Cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
>> battery IO. So we should skip this bit when checking for GPIO IRQ pending
>> status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
>> loop until IRQ "pending" status becomes 0. This patch fixes this issue.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Looks fine to me, tentatively applied.
>
> Bin, Mika, Andy, OK?

Yes, thanks!


-- 
With Best Regards,
Andy Shevchenko
