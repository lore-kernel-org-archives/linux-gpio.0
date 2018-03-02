From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/2] ARM: pinctrl: stm32: Optimizes and enhances stm32gpio
 irqchip
Date: Fri, 2 Mar 2018 09:49:24 +0100
Message-ID: <1afde55c-8f33-bd80-c144-094c2973197c@st.com>
References: <1519221027-4028-1-git-send-email-radoslaw.pietrzyk@gmail.com>
 <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
 <CACRpkdbmmx7y3xJOOy0Dx62tMonkCgZeVzKYzr1B362QZe0fsA@mail.gmail.com>
 <CAFvLkMRRWZKqChFu+7yEDURtM_ZmmB1RMjj8yUwTZndiwySckA@mail.gmail.com>
 <3526aa4e-a7cb-4108-5449-d77ae5e355ba@st.com>
 <CAFvLkMTN1NrdrT9aQjVmDtUNkwXbB0hEaPzE8Es1Axsch=BYzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFvLkMTN1NrdrT9aQjVmDtUNkwXbB0hEaPzE8Es1Axsch=BYzQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Rados=c5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On 03/02/2018 09:37 AM, Radosław Pietrzyk wrote:
> Linus responded in v2 mail thread that he's gonna take it instead of v1.

I saw that too late :).

Regards
Alex

> 
> 2018-03-02 9:14 GMT+01:00 Alexandre Torgue <alexandre.torgue@st.com>:
>> Hi Radoslaw and Linus,
>>
>>
>> On 03/01/2018 10:24 PM, Radosław Pietrzyk wrote:
>>>
>>> I don't know if Alexandre agrees but It might be better to take v2
>>> where irq_ack is added.
>>
>>
>>
>> Sorry Linus, I agree with Rodoslaw, you need to take V2 as stm32-exti patch
>> is linked to pinctrl v2 patch. I gonna add my acked-by.
>>
>> Regards
>> Alex
>>
>>
>>>
>>> 2018-03-01 22:04 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
>>>>
>>>> On Wed, Feb 21, 2018 at 2:50 PM, Radoslaw Pietrzyk
>>>> <radoslaw.pietrzyk@gmail.com> wrote:
>>>>
>>>>>           - removes unneeded irq_chip.irq_eoi callback
>>>>>           - adds irq_chip.irq_set_wake callback for possible
>>>>>           in the future GPIO wakeup
>>>>>
>>>>> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>>>>
>>>>
>>>> Patch applied with Alexandre's ACK, stripping ARM from the
>>>> commit message, thanks!
>>>>
>>>> Yours,
>>>> Linus Walleij
