From: Peter Hung <hpeter@gmail.com>
Subject: Re: [PATCH 2/2] gpio-f7188x: filter non-export gpio for F81866
Date: Wed, 13 Jan 2016 09:56:20 +0800
Message-ID: <5695AEC4.7040907@gmail.com>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
 <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
 <20160112153636.GA7731@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36085 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbcAMB4U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2016 20:56:20 -0500
In-Reply-To: <20160112153636.GA7731@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>

Hi Simon,

>> @@ -351,6 +485,15 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
>>   	for (i = 0; i < data->nr_bank; i++) {
>>   		struct f7188x_gpio_bank *bank = &data->bank[i];
>>
>> +		/*
>> +		 * Dont export GPIO sysfs if pin set is not enable by MB
>> +		 * manufacturer.
>
> What does MB stands for ?

The MB is stands for "Motherboard", Due to the limit of 80 words length,
I use the abbreviation.

>> +		 */
>> +		if (sio->type == f81866 && f81866_verify_gpioset(sio->addr, i))
>> +			continue;
>
> This whole filtering mechanism relies on the fact that the multiplexing
> configuration has been correctly applied by the BIOS (if applied at
> all). But I wonder if it is often the case. For example, I have several
> boards for which it is not true. And to make the GPIOs available, I need
> first to fix the multiplexing pin configuration of the Super I/O.
>
> Maybe it would be more correct to rely on the hardware description of a
> board (Device Tree or ACPI) to decide which GPIO bank can be enabled or
> not.

That's good for control by Device Tree or ACPI.

IMO, we shouldn't export GPIOs not enabled if the BIOS had written
wrong configuration to SuperIO, but it's only my opinion. Should I
do filter for this?

Thanks for your advices.
-- 
With Best Regards,
Peter Hung
