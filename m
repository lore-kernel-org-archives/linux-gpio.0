From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio: make of_get_named_gpiod_flags() private
Date: Sat, 17 May 2014 00:29:40 +0900
Message-ID: <53762EE4.6000808@nvidia.com>
References: <1399175125-6430-1-git-send-email-acourbot@nvidia.com>	<CACRpkdYM5W2oVT0y25u+BhWHpVma5fRP8MgmEH46dAyu8L8-2g@mail.gmail.com>	<CAAVeFuLqF6d+-BHhFzL+w9bFNxbxWV97dsx1Kbd2GD1PNf3UFg@mail.gmail.com> <CACRpkdYPcG-16aeMRKdbqGiz+coXE68p3u_tZNV2cYJgdp6j0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYPcG-16aeMRKdbqGiz+coXE68p3u_tZNV2cYJgdp6j0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 05/17/2014 12:25 AM, Linus Walleij wrote:
> On Tue, May 13, 2014 at 3:23 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Tue, May 13, 2014 at 10:17 PM, Linus Walleij
>> <linus.walleij@linaro.org> wrote:
>
>>>> This results in all references to gpiod_* functions in of_gpio.h being
>>>> gone, which is the way it should be since this file is part of the old
>>>> integer GPIO interface.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>
>>> This patch broke a lot of drivers so I had to take it out again...
>>
>> That's unexpected - what happens with it?
>
> I got a horde of mails from Fengguang's autobuilder, I think you got
> them as well ... else tell me and I'll dig them up.

Mmm, it seems like I didn't get any mail. Could you follow othem r point 
me to where these results are visible?

Thanks,
Alex.
