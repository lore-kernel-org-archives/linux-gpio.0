From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 6/7] gpio: dwapb: use a second irq chip
Date: Mon, 07 Apr 2014 11:59:52 +0200
Message-ID: <53427718.30406@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de> <1395505004-22650-7-git-send-email-bigeasy@linutronix.de> <5331F6D5.7070809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:49963 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753510AbaDGJ7z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 05:59:55 -0400
In-Reply-To: <5331F6D5.7070809@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, atull@altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, delicious.quinoa@gmail.com

On 03/25/2014 10:36 PM, Sebastian Hesselbarth wrote:
>> @@ -242,17 +244,28 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>>  	irq_gc->reg_base = gpio->regs;
>>  	irq_gc->private = gpio;
>>  
>> -	ct = irq_gc->chip_types;
>> -	ct->chip.irq_ack = irq_gc_ack_set_bit;
>> -	ct->chip.irq_mask = irq_gc_mask_set_bit;
>> -	ct->chip.irq_unmask = irq_gc_mask_clr_bit;
>> -	ct->chip.irq_set_type = dwapb_irq_set_type;
>> -	ct->chip.irq_enable = dwapb_irq_enable;
>> -	ct->chip.irq_disable = dwapb_irq_disable;
>> -	ct->chip.irq_request_resources = dwapb_irq_reqres;
>> -	ct->chip.irq_release_resources = dwapb_irq_relres;
>> -	ct->regs.ack = GPIO_PORTA_EOI;
>> -	ct->regs.mask = GPIO_INTMASK;
>> +	for (i = 0; i < 2; i++) {
>> +
>> +		ct = &irq_gc->chip_types[i];
>> +		ct->chip.irq_ack = irq_gc_ack_set_bit;
>> +		ct->chip.irq_mask = irq_gc_mask_set_bit;
>> +		ct->chip.irq_unmask = irq_gc_mask_clr_bit;
>> +		ct->chip.irq_set_type = dwapb_irq_set_type;
>> +		ct->chip.irq_enable = dwapb_irq_enable;
>> +		ct->chip.irq_disable = dwapb_irq_disable;
>> +		ct->chip.irq_request_resources = dwapb_irq_reqres;
>> +		ct->chip.irq_release_resources = dwapb_irq_relres;
>> +		ct->regs.ack = GPIO_PORTA_EOI;
>> +		ct->regs.mask = GPIO_INTMASK;
>> +
>> +		if (i == 0) {
>> +			ct->type = IRQ_TYPE_LEVEL_MASK;
>> +			ct->handler = handle_level_irq;
>> +		} else {
>> +			ct->type = IRQ_TYPE_EDGE_BOTH;
>> +			ct->handler = handle_edge_irq;
>> +		}
> 
> Sebastian,
> 
> IMHO the loop looks strange, especially with the (i == 0) check.

how so?

> How about unrolling it again and assign both chip_types independently?

If more code makes you happy so be it. I will post the series soon with
the loop unrolled.

> Sebastian

Sebastian
