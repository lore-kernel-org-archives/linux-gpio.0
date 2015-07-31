From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Fri, 31 Jul 2015 16:42:23 +0800
Message-ID: <CABymUCOaHCjwpETawf==AvY-ZBjh=mbpURHJJJkN7csQ1G83ow@mail.gmail.com>
References: <1435545357-4494-1-git-send-email-jun.nie@linaro.org>
	<1435545357-4494-2-git-send-email-jun.nie@linaro.org>
	<CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
	<CABymUCPc_EA57fRDdVH7z5tRXQiPHRiczs_MKXBeq0pVCctceg@mail.gmail.com>
	<CACRpkdZToXL11wFKuDEWqVd8XKHzX8bfZWFUS2z+CTk4s-w9Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33059 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbbGaImZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 04:42:25 -0400
Received: by lbbyj8 with SMTP id yj8so42053977lbb.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2015 01:42:23 -0700 (PDT)
In-Reply-To: <CACRpkdZToXL11wFKuDEWqVd8XKHzX8bfZWFUS2z+CTk4s-w9Rg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

2015-07-27 17:51 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Jul 16, 2015 at 3:08 PM, Jun Nie <jun.nie@linaro.org> wrote:
>> 2015-07-16 16:17 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>
>>>> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
>>>> +               chip->uses_pinctrl = true;
>>>
>>> I see this follows the PL061 pattern, maybe we should start doing this
>>> in the gpiolib core.
>>
>> A structure with all functions and flags can be feed to a new function
>> that calls gpiochip_add(). We can abstract logic of struct gpio_chip
>> members value assignment. For example, a struct gpio_chip with these
>> members assigned at compiling stage can be copied directly to
>> instantiation memory space and call gpiochip_add(). We can do this in
>> driver too.
>
> Hm anything that will result in a lot of code lines saved in drivers
> is by definition good. This could be a good start.

Above solution only save runtime CPU cycle with a memory copy because
structure with member assigned in compile time also takes code lines.

We can wrap gpiochip_add into new function gpiochip_add_arg() and feed
below info to it and assign the value in the common code. It is make
the function argument list too long. Any better idea? Or you think it
is OK, then I can draft a patch for review.

gpio_chip members: direction_input, direction_output, get, set,
request, free, ngpio, label, dev.

Jun

>
>> For interrupt stuff, it is hard to abstract because argument vary much
>> from driver to driver and different functions are called in different
>> drivers. A structure can also serve more or less to abstract function
>> calls, but not much.
>
> Yeah I really tried my best with gpiolib_irqchip_add() and managed
> to cut down on all the simple IRQ drivers. Don't think we get
> any further with these.
>
> Yours,
> Linus Walleij
