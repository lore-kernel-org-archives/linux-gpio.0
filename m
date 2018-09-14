From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Fri, 14 Sep 2018 10:24:56 +0200
Message-ID: <b83a80af-84a8-5b3c-3c8d-2b1ba2d7ba83@xs4all.nl>
References: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
 <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
 <20180913074742.7cdvfiosb3nyc4ui@M43218.corp.atmel.com>
 <e09b80e7-9f48-b528-ca1d-c6f3e0fa3c6e@xs4all.nl>
 <20180913090214.rgijf53aloakjuug@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913090214.rgijf53aloakjuug@M43218.corp.atmel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hans.verkuil@cisco.com, linus.walleij@linaro.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
List-Id: linux-gpio@vger.kernel.org

On 09/13/2018 11:02 AM, Ludovic Desroches wrote:
> On Thu, Sep 13, 2018 at 10:42:49AM +0200, Hans Verkuil wrote:
>> On 09/13/18 09:47, Ludovic Desroches wrote:
>>> Hi Hans,
>>>
>>> On Wed, Sep 12, 2018 at 05:30:35PM +0200, Hans Verkuil wrote:
>>>> Hi Ludovic,
>>>>
>>>> On 09/12/2018 04:58 PM, Ludovic Desroches wrote:
>>>>> Hi,
>>>>>
>>>>> Using next-20180912, my kernel hangs during the boot. Git bisect tell me
>>>>> that the cause of my issue is the commit "gpiolib: override
>>>>> irq_enable/disable"
>>>>>
>>>>> I dug further and this patch can have some side effects. When booting, I
>>>>> have an infinite loop when trying to enable a gpio irq. I don't know if
>>>>> the pinctrl-at91 driver is the only one concerned or not.
>>>>>
>>>>> The pattern leading to this issue is quite simple: we have several gpio
>>>>> controllers sharing the same irq_chip structure. Installing the
>>>>> irq_enable/irq_disable hook works well the first time. The second time,
>>>>> since the irq_enable has been altered to use gpiochip_irq_enable,
>>>>> this latest function will call itself again and again by calling
>>>>> irq_enable.
>>>>>
>>>>> I think it should be better to have one irq_chip structure per gpio
>>>>> controller. I am going to do a patch for pinctrl-at91. Excepting if you
>>>>> think it has to be solved in a different way.
>>>>>
>>>>>
>>>>> Ludovic
>>>>>
>>>>
>>>> Can you try this patch first?
>>>
>>> Yes it works, I also have this kind of change in mind.
>>
>> Good. I think this patch needs to go in regardless, since this makes it
>> a lot more robust. My main question is whether this situation is indicative
>> of a bad driver design, or if this is normal behavior that this code just
>> has to support.
>>
>>> I am not sure which solution is the best. Of course I prefer this one as
>>> I don't have to modify the pinctrl-at91 driver but if I have to modify
>>> it to not share the same irq_chip structure, I'll handle it. Just let me
>>> know.
>>
>> I tried to figure out where this happens exactly in this driver (sharing the
>> same irq_chip structure), but I'm not quite sure I fully understand it. Can
>> you point out where this happens?
>>
> 
> There are 5 instances of the gpio controller (A, B, C, D, E) and they all use
> the same irqchip since the behaviour is common.
> 
> When adding A as a gpiochip_irqchip (in at91_gpio_of_irq_setup()), we set the
> hooks so:

Ah, now I see: gpio_irqchip is a static struct. That's the bit I missed when I
looked at the code earlier.

Thanks,

	Hans
