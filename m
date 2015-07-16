From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Thu, 16 Jul 2015 21:08:21 +0800
Message-ID: <CABymUCPc_EA57fRDdVH7z5tRXQiPHRiczs_MKXBeq0pVCctceg@mail.gmail.com>
References: <1435545357-4494-1-git-send-email-jun.nie@linaro.org>
	<1435545357-4494-2-git-send-email-jun.nie@linaro.org>
	<CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33603 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751677AbbGPNIW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:08:22 -0400
Received: by lbbyj8 with SMTP id yj8so43352617lbb.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 06:08:21 -0700 (PDT)
In-Reply-To: <CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

2015-07-16 16:17 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Jun 29, 2015 at 4:35 AM, Jun Nie <jun.nie@linaro.org> wrote:
>
>> Add ZTE zx296702 GPIO controller support
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> Patch applied with Shawn's ACK.
>
> Kudos for using GPIOLIB_IRQCHIP, well done.
>
>> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
>> +               chip->uses_pinctrl = true;
>
> I see this follows the PL061 pattern, maybe we should start doing this
> in the gpiolib core.

A structure with all functions and flags can be feed to a new function
that calls gpiochip_add(). We can abstract logic of struct gpio_chip
members value assignment. For example, a struct gpio_chip with these
members assigned at compiling stage can be copied directly to
instantiation memory space and call gpiochip_add(). We can do this in
driver too.

For interrupt stuff, it is hard to abstract because argument vary much
from driver to driver and different functions are called in different
drivers. A structure can also serve more or less to abstract function
calls, but not much.

What's your thoughts?

>
> Yours,
> Linus Walleij
