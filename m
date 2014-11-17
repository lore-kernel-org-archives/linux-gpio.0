From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH 1/5] gpio: moxart: convert to use basic mmio gpio library
Date: Mon, 17 Nov 2014 14:58:56 +0100
Message-ID: <CACmBeS3y2rkY_vJHCQfESMFjudJb7OnVeZ7oNAErTGc+xu3B3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:40378 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753019AbaKQN66 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Nov 2014 08:58:58 -0500
Received: by mail-la0-f53.google.com with SMTP id pn19so1375272lab.40
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2014 05:58:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 12 November 2014 13:00, Kamlakant Patel <kamlakant.patel@linaro.org> wrote:
>
> Hi Jonas,
>
> This is an updated version of the previous patch with some fixes.
> Could you please try it out.

Thanks, it works, tested on UC-7112-LX hardware.

I have one additional nit..

The GPIO base number is implicitly changed from 0 to 224
(ARCH_NR_GPIOS (256) - ngpio (32)) which happen because of
bgpio_init() (it sets base -1 / gpiochip_find_base() on
gpiochip_add()). Which is confusing since the valid range (from user
space) used to be 0-31. So on export we now get:

[root@zurkon ~]# echo 24 > /sys/class/gpio/export
    [   61.640000] gpio-24 (?): gpiod_request: status -517
    [   61.650000] export_store: status -19

I see other drivers explicitly set base after bgpio_init(), my
suggestion is that we do the same here e.g. :

> +       bgc->gc.label = "moxart-gpio";
> +       bgc->gc.request = moxart_gpio_request;
> +       bgc->gc.free = moxart_gpio_free;
> +       bgc->gc.get = moxart_gpio_get;
> +       bgc->data = bgc->read_reg(bgc->reg_set);
> +       bgc->gc.ngpio = 32;
> +       bgc->gc.dev = dev;
> +       bgc->gc.owner = THIS_MODULE;

bgc->gc.base = 0;


Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
