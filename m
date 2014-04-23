From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 3/4] gpio: make handler_data configurable while using gpiolib_irqchip
Date: Thu, 24 Apr 2014 06:55:49 +0800
Message-ID: <CAGsJ_4wmd-ejfHF+MXbO3JSppUDYcEVKeO1WxRM16FtSFEBxpA@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
 <1397544229-20545-4-git-send-email-21cnbao@gmail.com> <CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:57338 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545AbaDWW4J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 18:56:09 -0400
Received: by mail-pb0-f52.google.com with SMTP id rq2so1255450pbb.39
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 15:56:09 -0700 (PDT)
In-Reply-To: <CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

2014-04-24 4:13 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:
>
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> since it is called handler_data, drivers should have the ability to
>> set handler_data based on real hardware.
>> GPIOLIB_IRQCHIP doesn't use handler_data by itself, so it will not
>> break GPIO core.
>>
>> Signed-off-by: Barry Song <Baohua.Song@csr.com>
>
> NAK, the whole idea with the function gpiochip_set_chained_irqchip()
> is that its sets things up so that the gpiochip is passed as handler
> data on the parent IRQ, akin to how the gpiochip is passed as
> chip data on the cascaded IRQs.

i think it is a really bad idea as the parent handler might not want
the whole chip if the chip has several parents and each parent want a
separate handler_data.
this patch doesn't break your way as the parameter is void *, drivers
which use your way don't need any change. but for drivers which want
more special handler_data, it supports better.

>
> Yours,
> Linus Walleij
-barry
