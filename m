From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 12 Feb 2019 10:52:44 +0000
Message-ID: <97fe353e-f6a4-7419-5ab3-fd66ce964b06@arm.com>
References: <20190129084411.30495-1-brgl@bgdev.pl>
 <20190129084411.30495-4-brgl@bgdev.pl>
 <656763ec-41b9-cdee-22bd-1f32d74473a0@arm.com>
 <CAMpxmJXdyiSLyx7O5G41GzfJQktOS1JeuRUoHejVB3ZOmCFMLQ@mail.gmail.com>
 <c562c67d-d6e3-15c3-b10b-315e8fb181a5@arm.com>
 <CAMpxmJWyxhjWrUVCePeg=g6uA=LEEbVBHGXTMQJ95jav4Zhyvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJWyxhjWrUVCePeg=g6uA=LEEbVBHGXTMQJ95jav4Zhyvg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/02/2019 10:37, Bartosz Golaszewski wrote:
> wt., 12 lut 2019 o 11:27 Marc Zyngier <marc.zyngier@arm.com> napisał(a):
>>
>> On 12/02/2019 09:19, Bartosz Golaszewski wrote:
>>> wt., 12 lut 2019 o 10:10 Marc Zyngier <marc.zyngier@arm.com> napisał(a):
>>>>
>>>> On 29/01/2019 08:44, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>>
>>>>> Provide a more specialized variant of irq_sim_fire() that allows to
>>>>> specify the type of the fired interrupt. The type is stored in the
>>>>> dummy irq context struct via the set_type callback.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>> ---
>>>>>  include/linux/irq_sim.h |  9 ++++++++-
>>>>>  kernel/irq/irq_sim.c    | 26 ++++++++++++++++++++++----
>>>>>  2 files changed, 30 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
>>>>> index b96c2f752320..647a6c8ffb31 100644
>>>>> --- a/include/linux/irq_sim.h
>>>>> +++ b/include/linux/irq_sim.h
>>>>> @@ -23,6 +23,7 @@ struct irq_sim_work_ctx {
>>>>>
>>>>>  struct irq_sim_irq_ctx {
>>>>>       bool                    enabled;
>>>>> +     unsigned int            type;
>>>>>  };
>>>>>
>>>>>  struct irq_sim {
>>>>> @@ -37,7 +38,13 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
>>>>>  int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
>>>>>                     unsigned int num_irqs);
>>>>>  void irq_sim_fini(struct irq_sim *sim);
>>>>> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
>>>>> +void irq_sim_fire_type(struct irq_sim *sim,
>>>>> +                    unsigned int offset, unsigned int type);
>>>>>  int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
>>>>>
>>>>> +static inline void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
>>>>> +{
>>>>> +     irq_sim_fire_type(sim, offset, IRQ_TYPE_DEFAULT);
>>>>> +}
>>>>> +
>>>>>  #endif /* _LINUX_IRQ_SIM_H */
>>>>> diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
>>>>> index 2bcdbab1bc5a..e3160b5e59b8 100644
>>>>> --- a/kernel/irq/irq_sim.c
>>>>> +++ b/kernel/irq/irq_sim.c
>>>>> @@ -25,6 +25,15 @@ static void irq_sim_irqunmask(struct irq_data *data)
>>>>>       irq_ctx->enabled = true;
>>>>>  }
>>>>>
>>>>> +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
>>>>> +{
>>>>> +     struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
>>>>> +
>>>>> +     irq_ctx->type = type;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>  static void irq_sim_handle_irq(struct irq_work *work)
>>>>>  {
>>>>>       struct irq_sim_work_ctx *work_ctx;
>>>>> @@ -107,6 +116,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
>>>>>       sim->chip.name = "irq_sim";
>>>>>       sim->chip.irq_mask = irq_sim_irqmask;
>>>>>       sim->chip.irq_unmask = irq_sim_irqunmask;
>>>>> +     sim->chip.irq_set_type = irq_sim_set_type;
>>>>>
>>>>>       sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
>>>>>       if (!sim->work_ctx.pending) {
>>>>> @@ -192,21 +202,29 @@ irq_sim_get_ctx(struct irq_sim *sim, unsigned int offset)
>>>>>  }
>>>>>
>>>>>  /**
>>>>> - * irq_sim_fire - Enqueue an interrupt.
>>>>> + * irq_sim_fire_type - Enqueue an interrupt.
>>>>>   *
>>>>>   * @sim:        The interrupt simulator object.
>>>>>   * @offset:     Offset of the simulated interrupt which should be fired.
>>>>> + * @type:    Type of the fired interrupt. Must be one of the following:
>>>>> + *           IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING,
>>>>> + *           IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_LEVEL_HIGH,
>>>>> + *           IRQ_TYPE_LEVEL_LOW, IRQ_TYPE_DEFAULT
>>>>>   */
>>>>> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
>>>>> +void irq_sim_fire_type(struct irq_sim *sim,
>>>>> +                    unsigned int offset, unsigned int type)
>>>>>  {
>>>>>       struct irq_sim_irq_ctx *ctx = irq_sim_get_ctx(sim, offset);
>>>>>
>>>>> -     if (ctx->enabled) {
>>>>> +     /* Only care about relevant flags. */
>>>>> +     type &= IRQ_TYPE_SENSE_MASK;
>>>>> +
>>>>> +     if (ctx->enabled && (ctx->type & type)) {
>>>>
>>>> I wonder how realistic this is, given that you do not track the release
>>>> of a level. In short, mo matter what the type is, you treat everything
>>>> as edge.
>>>>
>>>> What is the point of this?
>>>>
>>>
>>> When userspace wants to monitor GPIO line interrupts, the GPIO
>>> framework requests a threaded interrupt with IRQF_TRIGGER_FALLING,
>>> IRQF_TRIGGER_RISING or both. The testing module tries to act like real
>>> hardware and so if we pass only one of the *_TRIGGER_* flags, we want
>>> the simulated interrupt of corresponding type to be fired.
>>
>> Well, that's not how HW works.
>>
>>>
>>> Another solution - if you don't like this one -  would be to have more
>>> specialized functions: irq_sim_fire_rising() and
>>> irq_sim_fire_falling(). How about that?
>>
>> I think you're missing the point. So far, your API has been "an
>> interrupt has fired", no matter what the trigger is, and that's fine.
>> That's just modeling the output of an abstract interrupt controller into
>> whatever the irqsim is simulating.
>>
>> Now, what you're exposing is "this is how the line changed". Which is an
>> entirely different business, as you're now exposing the device output
>> line. Yes, you can model it with raising/falling, but you need at least
>> resampling for level interrupts, and actual edge detection (raising
>> followed by raising only generates a single interrupt, while
>> raising-falling-raising generates two).
>>
> 
> This logic is later taken care of in the gpio-mockup driver in this
> series. It checks the line state changes and decides if the interrupt
> should be fired.

But that's only for edge, right? I don't really see any level support.

Can you please trim this series to what you actually (1) need, (2)
support. So far, this series feels like a bunch of half-baked ideas.
Interesting ideas, but still half baked. And trying to rush me into
ACKing its of it is not improving the situation.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
