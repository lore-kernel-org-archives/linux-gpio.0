From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/2] gpio: gpio-wcove: fix GPIO irq status mask
Date: Thu, 20 Apr 2017 17:52:36 -0700
Message-ID: <ebfb2d69-a54a-b7b6-d49d-a88c7873dba2@linux.intel.com>
References: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1514 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S948299AbdDUAz7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Apr 2017 20:55:59 -0400
In-Reply-To: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

Hi Andy,

Thanks for the review.


On 04/19/2017 01:41 PM, Andy Shevchenko wrote:
> On Fri, Apr 14, 2017 at 8:29 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> According to Whiskey cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
> cove -> Cove
Will fix it in next version.
>
>> battery IO. So we should skip this bit when checking for GPIO irq pending
> irq -> IRQ
Ditto.
>
>> status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
>> loop until irq "pending" status becomes 0. This patch fixes this issue.
> Ditto.
>
>> +#define GPIO_IRQ0_MASK         0x7f
>> +#define GPIO_IRQ1_MASK         0x3f
> GENMASK()
Ditto.
>
>> -               pending = p[0] | (p[1] << 8);
>> +               pending = (p[0] & GPIO_IRQ0_MASK) |
>> +                       ((p[1] & GPIO_IRQ1_MASK) << 7);
> I would leave this on one line despite 80 characters limit (actually
> how long is it?).
It comes to 84 characters. Should I leave it as it is ?
>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

