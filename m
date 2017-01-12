From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/2] gpio: davinci: Remove gpio2regs function to
 accommodate multi instances
Date: Thu, 12 Jan 2017 07:22:19 +0530
Message-ID: <2683ca92-e1c3-7b87-cd8c-bf6095b09ff9@ti.com>
References: <1483518389-6200-1-git-send-email-j-keerthy@ti.com>
 <1483518389-6200-2-git-send-email-j-keerthy@ti.com>
 <CACRpkdaWA0+kqeWvHDMwiVGGc0Ucywbx62OnKisuTKsShMbgnw@mail.gmail.com>
 <55d29408-2ccc-d6a1-8ef6-5418ba8df0b7@ti.com>
 <CACRpkdYzq0o3Y2BoccPVK4Ro1NWdspqcF12GO0c7wwhz3WPVoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYzq0o3Y2BoccPVK4Ro1NWdspqcF12GO0c7wwhz3WPVoA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org



On Wednesday 11 January 2017 09:23 PM, Linus Walleij wrote:
> On Wed, Jan 11, 2017 at 1:40 PM, Keerthy <j-keerthy@ti.com> wrote:
>> On Wednesday 11 January 2017 04:34 PM, Linus Walleij wrote:
>>> On Wed, Jan 4, 2017 at 9:26 AM, Keerthy <j-keerthy@ti.com> wrote:
>>>
>>>> gpio2regs is written making an assumption that driver supports only
>>>> one instance of gpio controller. Removing this and adding a generic
>>>> array so as to support multiple instances of gpio controllers.
>>>>
>>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>>
>>>
>>>> -               regs = gpio2regs(base);
>>>> +               regs = gpio_base + offset_array[i];
>>>
>>>
>>> I understand this.
>>>
>>>> -       struct davinci_gpio_regs __iomem *g = gpio2regs(hw);
>>>> +       struct davinci_gpio_controller *chips =
>>>> +                               (struct davinci_gpio_controller
>>>> *)d->host_data;
>>>> +       struct davinci_gpio_regs __iomem *g = chips[hw / 32].regs;
>>>
>>>
>>> And this, if each instans has 32 GPIOs.
>>>
>>>> -               g = gpio2regs(0);
>>>> +               g = chips[0].regs;
>>>
>>>
>>> Also makes sense.
>>>
>>>> -               g = gpio2regs(gpio);
>>>> +               g = chips[bank / 2].regs;
>>>
>>>
>>> But what is this? I don't understand that /2 at all. Please insert a
>>> comment explaining it so I can figure it out. Are there two banks
>>> per instance?
>>
>>
>> Yes! There are register sets for 32 GPIOs. 2 banks of 16 GPIOs are covered
>> by each set of registers hence /2. Shall i add a comment and send this patch
>> alone separately?
>
> Yeah.
>
> I am currently confused by several patch sets for davinci in my inbox,
> can you rebase on my devel branch when I push it and resend
> *all* you have cooking for DaVinci?

Sure Linus i will do that.

Thanks,
Keerthy

>
> Yours,
> Linus Walleij
>
