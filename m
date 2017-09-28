From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs
 dynamically
Date: Thu, 28 Sep 2017 09:02:12 -0500
Message-ID: <72bd64f4-a989-93c4-546f-a123dbd80e8c@ti.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <20170928083348.GI4630@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:33517 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753029AbdI1ODN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2017 10:03:13 -0400
In-Reply-To: <20170928083348.GI4630@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, chrisjohgorman@gmail.com



On 09/28/2017 03:33 AM, Mika Westerberg wrote:
> On Fri, Jul 21, 2017 at 11:49:00AM -0500, Grygorii Strashko wrote:
>> Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
>> gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
>> as result, leads to:
>>   - increasing of memory consumption for IRQ descriptors most of which will
>> never ever be used (espessially on platform with a high number of GPIOs).
>> (sizeof(struct irq_desc) == 256 on my tested platforms)
>>   - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
>> GPIO IRQ functionality as IRQ crossbar/router which has only limited
>> number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
>> IRQs).
>>
>> Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
>> instead replace irq_find_mapping() with irq_create_mapping() in
>> gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
>> in gpiochip_to_irq() and gpiochip_irq_map().
>>
>> After this change gpio2irq mapping will happen the following way when GPIO
>> irqchip APIs are used by gpio driver:
>>   - IRQ mappings will be created statically if driver passes first_irq>0
>> vlaue in gpiochip_irqchip_add_key().
>>   - IRQ mappings will be created dynamically from gpio_to_irq() or
>> of_irq_get().
>>
>> Tested on am335x-evm and dra72-evm-revc.
>> - dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
>>    Mem savings 267*256 = 68352 (66kB)
>> - am335x-evm: number of created irq mappings decreased from 188 -> 63
>>    Mem savings 125*256 = 32000 (31kB)
>>
>> [1] https://lkml.org/lkml/2017/6/15/428
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Hi Grygorii,
> 
> It looks like dc749a09ea5e41 ("gpiolib: allow gpio irqchip to map irqs
> dynamically") broke the quirk we added for some Intel Cherryview
> systems [1]. Basically after this keyboard of those systems stopped
> working again.
> 
> Any idea what might be wrong?

Yes. kernel do not map all GPIO IRQs by default now.
I've red related discussion and, as per my understanding (correct me if i'm wrong),
on this platform all GPIO IRQs have to be mapped on fixed range of Linux IRQs.
In this case, It's reasonable to specify first_irq parameter in gpiochip_irqchip_add()
which should force IRQ mapping creation.

> 
> I've CC'd Chris Gorman who reported the issue.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
> 



-- 
regards,
-grygorii
