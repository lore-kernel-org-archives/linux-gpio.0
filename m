From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: Re: [PATCH 1/2] gpio: davinci: Move fetching IRQ to beginning of
 probe
Date: Tue, 12 Jun 2018 20:05:54 +0530
Message-ID: <cac77b7b-b22e-a8ab-d43d-efceb25f4be9@ti.com>
References: <1528276734-1483-1-git-send-email-j-keerthy@ti.com>
 <CACRpkdbsww1m5GMJ9A8dhn5vXfjaozzb2QaZOkWATdOGg83qMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbsww1m5GMJ9A8dhn5vXfjaozzb2QaZOkWATdOGg83qMQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org



On 6/12/2018 6:39 PM, Linus Walleij wrote:
> On Wed, Jun 6, 2018 at 11:18 AM, Keerthy <j-keerthy@ti.com> wrote:
> 
>> Currently IRQ resource fetching is done at the very end of probe.
>> In case the of IRQ resource not being ready, we defer probe
>> and need to revert prior changes. Hence move it to the beginning of
>> the probe so as to avoid reverting.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
> 
> Patch applied for v4.19.

Linus,

There is a minor fix in v3.

https://patchwork.kernel.org/patch/10459591/

Also v3 of Patch 2 Here:

https://lkml.org/lkml/2018/6/12/146

Regards,
Keerthy
> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
