From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: Requesting different interrupt triggers for the same device type
Date: Wed, 3 Dec 2014 13:06:18 +0200
Message-ID: <547EEEAA.4040605@ti.com>
References: <4282463.CMMRv84cbI@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37809 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750840AbaLCLG0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 3 Dec 2014 06:06:26 -0500
In-Reply-To: <4282463.CMMRv84cbI@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

On 12/02/2014 06:45 PM, Alexander Stein wrote:
> Hi,
>
> I have a board which has two PCA9555 attached. Due to hardware wirings each has a different interrupt trigger. One is active low and one is active high and each has a different interrupt parent.
> How can I specify this in the device tree? Do I need to set IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH approriately? How can this work, when the driver requests the interrupt like this?
>> ret = devm_request_threaded_irq(&client->dev,
>> 			client->irq,
>> 			NULL,
>> 			pca953x_irq_handler,
>> 			IRQF_TRIGGER_LOW | IRQF_ONESHOT |
>> 			IRQF_SHARED,
>> 			dev_name(&client->dev), chip);
>
> The interrupt flags seem rather fixed. Any comments/hints?

See, http://www.spinics.net/lists/linux-gpio/msg02731.html
It may help.

regards,
-grygorii
