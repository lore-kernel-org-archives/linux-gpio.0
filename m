From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: [patch 18/19] gpio/msm-v2: Avoid redundant lookup of irq_data
Date: Tue, 14 Jul 2015 13:39:34 +0800
Message-ID: <55A4A096.2000405@linux.intel.com>
References: <20150712232317.244138485@linutronix.de>	<20150712232406.260970428@linutronix.de> <CAKb7UviaGO2a=B7_4CbirQU=JLS5D_bNAe-PWzL-8Sp621rkYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:24262 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249AbbGNFji (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Jul 2015 01:39:38 -0400
In-Reply-To: <CAKb7UviaGO2a=B7_4CbirQU=JLS5D_bNAe-PWzL-8Sp621rkYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 2015/7/14 13:28, Ilia Mirkin wrote:
> 
> On Jul 13, 2015 4:42 PM, "Thomas Gleixner" <tglx@linutronix.de
> <mailto:tglx@linutronix.de>> wrote:
>>
>> It's pretty silly to do
>>
>>      irq_data *d = irq_get_irq_data(irq_data->irq);
>>
>> because that results in d = irq_data, but goes through a lookup of the
>> irq_data. Use irq_data directly.
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de
> <mailto:tglx@linutronix.de>>
>> Cc: Linus Walleij <linus.walleij@linaro.org
> <mailto:linus.walleij@linaro.org>>
>> Cc: Alexandre Courbot <gnurou@gmail.com <mailto:gnurou@gmail.com>>
>> Cc: Jiang Liu <jiang.liu@linux.intel.com
> <mailto:jiang.liu@linux.intel.com>>
>> Cc: linux-gpio@vger.kernel.org <mailto:linux-gpio@vger.kernel.org>
>> ---
>>  drivers/gpio/gpio-msm-v2.c |   18 +++++-------------
>>  1 file changed, 5 insertions(+), 13 deletions(-)
>>
>> Index: tip/drivers/gpio/gpio-msm-v2.c
>> ===================================================================
>> --- tip.orig/drivers/gpio/gpio-msm-v2.c
>> +++ tip/drivers/gpio/gpio-msm-v2.c
>> @@ -187,14 +187,6 @@ static int msm_gpio_to_irq(struct gpio_c
>>         return irq_create_mapping(domain, offset);
>>  }
>>
>> -static inline int msm_irq_to_gpio(struct gpio_chip *chip, unsigned irq)
>> -{
>> -       struct irq_data *irq_data = irq_get_irq_data(irq);
>> -
>> -       return irq_data->hwirq;
>> -}
>> -
>> -
>>  /* For dual-edge interrupts in software, since the hardware has no
>>   * such support:
>>   *
>> @@ -238,7 +230,7 @@ static void msm_gpio_update_dual_edge_po
>>w
>>  static void msm_gpio_irq_ack(struct irq_data *d)
>>  {
>> -       int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
>> +       int gpio = d->hw_irq;
> 
> Does this build? It was hwirq above, not hw_irq.

Yeah, should be hwirq.
