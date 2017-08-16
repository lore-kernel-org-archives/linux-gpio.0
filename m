From: Jiandi An <anjiandi@codeaurora.org>
Subject: Re: [PATCH 2/3] [v3] pinctrl: qcom: disable GPIO groups with no pins
Date: Wed, 16 Aug 2017 14:31:54 -0500
Message-ID: <b99e9fc2-2531-20d6-6b25-830f7583e2bc@codeaurora.org>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-3-git-send-email-timur@codeaurora.org>
 <CACRpkdZj+tnMcEpic6PrQS-qMJDodmc_uFJVudxc=USCTXpyKg@mail.gmail.com>
 <d0b16753-b202-5756-1cba-1cd083af52ed@codeaurora.org>
 <7c278367-bf3b-6a26-e31f-ee696cb5534e@codeaurora.org>
 <66bfbee6-245d-fddb-f6cb-a2c3c06ffc9b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <66bfbee6-245d-fddb-f6cb-a2c3c06ffc9b@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org



On 08/16/2017 01:32 PM, Timur Tabi wrote:
> On 08/16/2017 01:10 PM, Jiandi An wrote:
>>
>> Technically the same check added in msm_gpio_irq_mask() and
>> msm_gpio_irq_unmask() should be added in msm_gpio_irq_ack(),
>> msm_gpio_irq_set_type(), and msm_gpio_irq_set_wake() if it's
>> registered with irq domain.
>
> I assume that if the GPIO is never unmasked, then msm_gpio_irq_ack()
> will never be called.
>
> msm_gpio_irq_set_type() and msm_gpio_irq_set_wake() might be called, so
> I can add checks for those functions.  I'm hoping that won't be
> necessary, however.  The GPIO and IRQ code is too entangled for me to
> figure out whether unclaimed GPIOs can still have their interrupts
> programmed.
>

That is why the suggestion is instead of patching in each of the op
function of registered irq_chip for the unavailable gpio that won't
have use for all that anyways, simply don't register irq for the
unavailable gpio.  What's the use of registering  irq if you know
the gpio is unavailable and not going to use any of the irq_chip
functions.  It's unnecessarily adding an irq_desc in the list.

Technically machine_kexec_mask_interrupts() is not blindly disable
all IRQs.  If you don't register irq, it won't be in the irq_desc
list.

-- 
Jiandi An
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a 
Linux Foundation Collaborative Project.
