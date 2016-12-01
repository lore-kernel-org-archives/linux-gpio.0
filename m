From: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Thu, 1 Dec 2016 13:39:59 +0530
Message-ID: <5339e8ad-0a5a-87a6-5e44-729f8ad13bc8@amd.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
 <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com>
 <CACRpkdbY-2iB9oxHfFOJBmJQq-zmOR1YEg0dy5zdx++tg-acGw@mail.gmail.com>
 <2c12372c-fd6a-8320-2607-5e58ed54d069@amd.com>
 <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-dm3nam03on0087.outbound.protection.outlook.com ([104.47.41.87]:5703
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1756039AbcLAIYp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Dec 2016 03:24:45 -0500
In-Reply-To: <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>



On 11/30/2016 6:40 PM, Linus Walleij wrote:
> On Tue, Nov 29, 2016 at 7:32 AM, Shah, Nehal-bakulchandra
> <Nehal-Bakulchandra.shah@amd.com> wrote:
> 
>> This patch provides support for additional GPIO devices and also provides IRQ sharing for AMD's GPIO devices and set
>> IRQCHIP_SKIP_SET_WAKE flag.
>>
>> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
> 
> (...)
>>         struct amd_gpio *gpio_dev;
>> +       struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
>> +
>> +       ret = kstrtoint(acpi_device_uid(adev), 2, &hwnum);
> 
> I guess this is the unique hardware instance number?
> 
>>         gpio_dev = devm_kzalloc(&pdev->dev,
>>                                 sizeof(struct amd_gpio), GFP_KERNEL);
>> @@ -763,16 +771,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
>>         gpio_dev->gc.set                        = amd_gpio_set_value;
>>         gpio_dev->gc.set_debounce       = amd_gpio_set_debounce;
>>         gpio_dev->gc.dbg_show           = amd_gpio_dbg_show;
>> +       gpio_dev->gc.base               = gpio_dev->gc.ngpio * hwnum;
>>
>> -       gpio_dev->gc.base                       = 0;
> 
> Please don't do this. Instead set .base to -1 so you get dynamic assignment
> of GPIO numbers.
> 
> Suggestion: maybe you could augment gc.label to reflect instance number
> instead?
> 
> That way the stuff from "lsgpio" (tools/gpio/lsgpio.c) will look nice and
> identifiable.
> 
> Apart from that it looks good.
> 
> Yours,
> Linus Walleij
> 



Hi Linus

Thanks for the review. Will resubmit the patch with making .base to -1.

Regarding suggestion for gc.label will take care when submitting patch for more than one gpio controller.

Thanks 
Nehal
