From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Thu, 13 Sep 2018 11:07:42 +0200
Message-ID: <a6ab8cfd-f245-5607-f720-8e5b607e7136@xs4all.nl>
References: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
 <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
 <20180913074742.7cdvfiosb3nyc4ui@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913074742.7cdvfiosb3nyc4ui@M43218.corp.atmel.com>
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

(apologies if this is a repost, there was an email hickup when I sent it
the first time)

On 09/13/18 09:47, Ludovic Desroches wrote:
> Hi Hans,
> 
> On Wed, Sep 12, 2018 at 05:30:35PM +0200, Hans Verkuil wrote:
>> Hi Ludovic,
>>
>> On 09/12/2018 04:58 PM, Ludovic Desroches wrote:
>>> Hi,
>>>
>>> Using next-20180912, my kernel hangs during the boot. Git bisect tell me
>>> that the cause of my issue is the commit "gpiolib: override
>>> irq_enable/disable"
>>>
>>> I dug further and this patch can have some side effects. When booting, I
>>> have an infinite loop when trying to enable a gpio irq. I don't know if
>>> the pinctrl-at91 driver is the only one concerned or not.
>>>
>>> The pattern leading to this issue is quite simple: we have several gpio
>>> controllers sharing the same irq_chip structure. Installing the
>>> irq_enable/irq_disable hook works well the first time. The second time,
>>> since the irq_enable has been altered to use gpiochip_irq_enable,
>>> this latest function will call itself again and again by calling
>>> irq_enable.
>>>
>>> I think it should be better to have one irq_chip structure per gpio
>>> controller. I am going to do a patch for pinctrl-at91. Excepting if you
>>> think it has to be solved in a different way.
>>>
>>>
>>> Ludovic
>>>
>>
>> Can you try this patch first?
> 
> Yes it works, I also have this kind of change in mind.

Good. I think this patch needs to go in regardless, since this makes it
a lot more robust. My main question is whether this situation is indicative
of a bad driver design, or if this is normal behavior that this code just
has to support.

> I am not sure which solution is the best. Of course I prefer this one as
> I don't have to modify the pinctrl-at91 driver but if I have to modify
> it to not share the same irq_chip structure, I'll handle it. Just let me
> know.

I tried to figure out where this happens exactly in this driver (sharing the
same irq_chip structure), but I'm not quite sure I fully understand it. Can
you point out where this happens?

One concern I have with the approach taken in this driver is that while placing
the hooks works fine (with this patch), but when the gpiochip that contains
the old callbacks for this irqchip is removed, the hooks are also removed for
all gpiochips using this irqchip. I don't think there is anything I can do
about that without hacking struct irq_chip.

So from that perspective it's better to have separate irq_chip structs. But
if there are (a lot?) more drivers doing this, than I need to look for a
better solution.

Regards,

	Hans

> 
> Thanks
> 
> Regards
> 
> Ludovic
> 
>>
>> Thanks!
>>
>> 	Hans
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> ---
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index efce534a269b..e09e4e439928 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1859,6 +1859,8 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
>>  	}
>>  	if (WARN_ON(gpiochip->irq.irq_enable))
>>  		return;
>> +	if (irqchip->irq_enable == gpiochip_irq_enable)
>> +		return;
>>  	gpiochip->irq.irq_enable = irqchip->irq_enable;
>>  	gpiochip->irq.irq_disable = irqchip->irq_disable;
>>  	irqchip->irq_enable = gpiochip_irq_enable;
