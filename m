From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and suspend resume
Date: Wed, 2 Sep 2015 14:02:44 +0800
Message-ID: <CAGS+omBnoitju07KQ1Y7JHTbce6+DO4WqWHTaKz5D+T157zEJA@mail.gmail.com>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com> <55DB4609.5040904@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DB4609.5040904@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "maoguang.meng@mediatek.com" <maoguang.meng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi maoguang,

On Tue, Aug 25, 2015 at 12:27 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 14/08/15 09:38, maoguang.meng@mediatek.com wrote:
>>
>> From: Maoguang Meng <maoguang.meng@mediatek.com>
>>
>> This patch implement irq_set_wake to get who is wakeup source and
>> setup on suspend resume.
>>
>> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>>
[snip]

Can you please respond to Sudeep's questions:

> Does this pinmux controller:
>
> 1. Support wake-up configuration ? If not, you need to use
>    IRQCHIP_SKIP_SET_WAKE. I don't see any value in writing the
>    mask_{set,clear} if the same registers are used for {en,dis}able
>
> 2. Is in always on domain ? If not, you need save/restore only to
>    resume back the functionality. Generally we can set
>    IRQCHIP_MASK_ON_SUSPEND to ensure non-wake-up interrupts are
>    disabled during suspend and re-enabled in resume path. You just
>    save/restore raw values without tracking the wake-up source.
>
> Also I see that no care is taken to set the port irq as wake enable
> source. It may work with current mainline, but won't with -next. Please
> ensure the port irq to the parent interrupt controller remains
> enabled(i.e set as wake).

>
> Regards,
> Sudeep
