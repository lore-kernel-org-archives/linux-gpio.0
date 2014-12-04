From: He YunLei <heyunlei@huawei.com>
Subject: Re: [PATCH 1/2] gpio: pl061: hook request if gpio-ranges avaiable
Date: Thu, 4 Dec 2014 21:33:58 +0800
Message-ID: <548062C6.60801@huawei.com>
References: <1417494780-3704-1-git-send-email-heyunlei@huawei.com> <1417494780-3704-2-git-send-email-heyunlei@huawei.com> <CACRpkdZbei_gpWR7LfSKb-d=ti9POMR9n9k2z8OMfhgm5BwDFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:27333 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753956AbaLDNeO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Dec 2014 08:34:14 -0500
In-Reply-To: <CACRpkdZbei_gpWR7LfSKb-d=ti9POMR9n9k2z8OMfhgm5BwDFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wangbintian <bintian.wang@huawei.com>, peifeiyue@huawei.com, liguozhu@hisilicon.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On 2014/12/3 21:45, Linus Walleij wrote:
> On Tue, Dec 2, 2014 at 5:32 AM, Yunlei He <heyunlei@huawei.com> wrote:
>
>> Gpio-ranges property is useful to represent which GPIOs correspond
>> to which pins on which pin controllers. But there may be some gpios
>> without pinctrl operation. So check whether gpio-ranges property
>> exists in device node first.
>>
>> Signed-off-by: Yunlei He <heyunlei@huawei.com>
>> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
>
> Yep simple and elegant.
>
> Patch applied.
>
> However I wonder if it would be possible to move this to the
> gpiolib.c or gpiolib-of.c core so not all drivers with this problem
> has to implement it.
>
> Yours,
> Linus Walleij
>
>
Thanks for your suggest, I can move this judgement to the gpiolib.c in function
gpio_request() along with a symbol uses_pinctrl in struct gpio_chip. But the symbol
uses_pinctrl still need to assign a value in device initial time. So I think that drivers
do this separately is better.

Yours,
Yunlei

