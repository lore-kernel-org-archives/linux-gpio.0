From: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Tue, 2 Dec 2014 15:39:58 +0800
Message-ID: <547D6CCE.90504@hisilicon.com>
References: <1416552238-9908-1-git-send-email-heyunlei@huawei.com> <CACRpkdZNYMX0qK4desZGY-tDp=VzBamzoU11d8Kf4U+bKbunYQ@mail.gmail.com> <CAD6h2NQUoRTtwDxjyryzua9N3oK6vB+iF1MtX6w_2F99x2BjKg@mail.gmail.com> <CACRpkdbywe9rsz+-0n6R_pHVRQkqbhoCmSnSBWL1mZiRxF5wHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:38004 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754037AbaLBHkK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Dec 2014 02:40:10 -0500
In-Reply-To: <CACRpkdbywe9rsz+-0n6R_pHVRQkqbhoCmSnSBWL1mZiRxF5wHg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: liguozhu@hisilicon.com

On 2014/12/1 21:59, Linus Walleij wrote:
> On Fri, Nov 28, 2014 at 6:00 PM, Haojian Zhuang
> <haojian.zhuang@linaro.org> wrote:
>
>> It's a bit different.
>>
>> The commit 51e13c2475 is used to fix this scenario. There're 8 gpio
>>  pins in GPIO CHIP #19. There're pin muxing on gpio152 -
>>  gpio155. And there're _no_ pin muxing on gpio156 - gpio159. When
>> user tries to request gpio159, he'll meet failure since the pinctrl device
>> can't cover gpio159. But the pinctrl device is already register for
>> gpio152. In order to distinguish whether the pinctrl device registered,
>> I added pinctrl_ready_for_gpio_range(gpio).
>>
>> In another scenario, there's no back-end pinctrl device for GPIO
>> CHIP #0. So pinctrl_request_gpio() always returns EPROBE_DEFER.
>> The commit 51e13c2475 can't cover this.
>>
>> I suggest to write code in below.
> This looks much simpler. Anyway: Xinwei whatever you come up
> with, include Haojian on To: and get is ACK on the solution.
>
> Yours,
> Linus Walleij
>
hi Linus:

two patches slove the same problem about GPIO PL061.  You can understand our
patches and merge it in the next kernel version while ensuring that others use
the kernal will not meet with our problem. Because this bug spend  too much
time to debug our board. I will be glad to reduce the kernel bug and help others.

yours
Xinwei   

