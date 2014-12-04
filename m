From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: Requesting different interrupt triggers for the same device type
Date: Thu, 4 Dec 2014 14:06:29 +0200
Message-ID: <54804E45.7090808@ti.com>
References: <4282463.CMMRv84cbI@ws-stein> <547EEEAA.4040605@ti.com> <1646345.4akWfRNnkY@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:35010 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753915AbaLDMGe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 4 Dec 2014 07:06:34 -0500
In-Reply-To: <1646345.4akWfRNnkY@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-gpio@vger.kernel.org

On 12/04/2014 10:27 AM, Alexander Stein wrote:
> Hello Grygorii,
> 
> On Wednesday 03 December 2014 13:06:18, Grygorii Strashko wrote:
>> On 12/02/2014 06:45 PM, Alexander Stein wrote:
>>> Hi,
>>>
>>> I have a board which has two PCA9555 attached. Due to hardware wirings each has a different interrupt trigger. One is active low and one is active high and each has a different interrupt parent.
>>> How can I specify this in the device tree? Do I need to set IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH approriately? How can this work, when the driver requests the interrupt like this?
>>>> ret = devm_request_threaded_irq(&client->dev,
>>>> 			client->irq,
>>>> 			NULL,
>>>> 			pca953x_irq_handler,
>>>> 			IRQF_TRIGGER_LOW | IRQF_ONESHOT |
>>>> 			IRQF_SHARED,
>>>> 			dev_name(&client->dev), chip);
>>>
>>> The interrupt flags seem rather fixed. Any comments/hints?
>>
>> See, http://www.spinics.net/lists/linux-gpio/msg02731.html
>> It may help.
> 
> Well, removing that trigger here (and in another driver where INT line is shared) it "works". It seems that each (DT-) driver should remove those explicit flags, no?

Hm. I think yes, in general. But problem is compatibility with non-DT builds and it
should be solved somehow in per-driver specific way.

probably simplest way would be smth. like this:

unsigned long irqflags = 0;

if (!dev->of_node)
	irqflags = IRQF_TRIGGER_LOW;

devm_request_threaded_irq(..,  irqflags | IRQF_ONESHOT | IRQF_SHARED, ..);

regards,
-grygorii




