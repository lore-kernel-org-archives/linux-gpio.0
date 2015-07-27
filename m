From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Mon, 27 Jul 2015 11:51:50 +0200
Message-ID: <CACRpkdZToXL11wFKuDEWqVd8XKHzX8bfZWFUS2z+CTk4s-w9Rg@mail.gmail.com>
References: <1435545357-4494-1-git-send-email-jun.nie@linaro.org>
	<1435545357-4494-2-git-send-email-jun.nie@linaro.org>
	<CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
	<CABymUCPc_EA57fRDdVH7z5tRXQiPHRiczs_MKXBeq0pVCctceg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34900 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbbG0Jvv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 05:51:51 -0400
Received: by obbop1 with SMTP id op1so55496227obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 02:51:51 -0700 (PDT)
In-Reply-To: <CABymUCPc_EA57fRDdVH7z5tRXQiPHRiczs_MKXBeq0pVCctceg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

On Thu, Jul 16, 2015 at 3:08 PM, Jun Nie <jun.nie@linaro.org> wrote:
> 2015-07-16 16:17 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:

>>> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
>>> +               chip->uses_pinctrl = true;
>>
>> I see this follows the PL061 pattern, maybe we should start doing this
>> in the gpiolib core.
>
> A structure with all functions and flags can be feed to a new function
> that calls gpiochip_add(). We can abstract logic of struct gpio_chip
> members value assignment. For example, a struct gpio_chip with these
> members assigned at compiling stage can be copied directly to
> instantiation memory space and call gpiochip_add(). We can do this in
> driver too.

Hm anything that will result in a lot of code lines saved in drivers
is by definition good. This could be a good start.

> For interrupt stuff, it is hard to abstract because argument vary much
> from driver to driver and different functions are called in different
> drivers. A structure can also serve more or less to abstract function
> calls, but not much.

Yeah I really tried my best with gpiolib_irqchip_add() and managed
to cut down on all the simple IRQ drivers. Don't think we get
any further with these.

Yours,
Linus Walleij
