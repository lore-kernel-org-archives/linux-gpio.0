From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: sirf: switch to one gpiolib and
 gpiolib_irqchip helpers
Date: Wed, 23 Apr 2014 20:09:30 +0800
Message-ID: <CAGsJ_4zowXarh0xy2y4oTsTZbnKFDgMfA6JPTK+sSx6ew_Qw4g@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com> <CACRpkdY6N3vh2-a5NwU0ZkXKsf8ArmxLBCL3dMrPTFwvN+x5JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:33935 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbaDWMJv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 08:09:51 -0400
Received: by mail-pb0-f51.google.com with SMTP id uo5so726550pbc.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 05:09:50 -0700 (PDT)
In-Reply-To: <CACRpkdY6N3vh2-a5NwU0ZkXKsf8ArmxLBCL3dMrPTFwvN+x5JQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

2014-04-23 5:47 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:
>
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> This patchset depends on Linus Walleij's "pinctrl: sirf: rename inlined accessor".
>> and "pinctrl: sirf: switch driver to use gpiolib irqchip helpers" is rebased
>> from Linus Walleij's patch too.
>>
>> Barry Song (3):
>>   pinctrl: sirf: wrap all gpio banks into one gpio_chip
>>   gpio: make handler_data configurable while using gpiolib_irqchip
>>   pinctrl: sirf: move to use irq_get_handler_data
>> Linus Walleij (1):
>>   pinctrl: sirf: switch driver to use gpiolib irqchip helpers
>
> As mentioned I can't get this series to apply so please rebase,
> resend and take this opportunity to also add relevant ACKs.

linus, this patchset depends on your "pinctrl: sirf: rename inlined
accessor" you sent to me. it seems it is in neither your devel nor
3.5-rc2.

https://lkml.org/lkml/2014/4/8/156

>
> Yours,
> Linus Walleij

-barry
