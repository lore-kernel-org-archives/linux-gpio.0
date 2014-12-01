From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Mon, 1 Dec 2014 14:59:18 +0100
Message-ID: <CACRpkdbywe9rsz+-0n6R_pHVRQkqbhoCmSnSBWL1mZiRxF5wHg@mail.gmail.com>
References: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
	<CACRpkdZNYMX0qK4desZGY-tDp=VzBamzoU11d8Kf4U+bKbunYQ@mail.gmail.com>
	<CAD6h2NQUoRTtwDxjyryzua9N3oK6vB+iF1MtX6w_2F99x2BjKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:37352 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753457AbaLAN7T (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 08:59:19 -0500
Received: by mail-ig0-f173.google.com with SMTP id r2so13031421igi.6
        for <linux-gpio@vger.kernel.org>; Mon, 01 Dec 2014 05:59:18 -0800 (PST)
In-Reply-To: <CAD6h2NQUoRTtwDxjyryzua9N3oK6vB+iF1MtX6w_2F99x2BjKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Yunlei He <heyunlei@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wangbintian <bintian.wang@huawei.com>, peifeiyue@huawei.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On Fri, Nov 28, 2014 at 6:00 PM, Haojian Zhuang
<haojian.zhuang@linaro.org> wrote:

> It's a bit different.
>
> The commit 51e13c2475 is used to fix this scenario. There're 8 gpio
>  pins in GPIO CHIP #19. There're pin muxing on gpio152 -
>  gpio155. And there're _no_ pin muxing on gpio156 - gpio159. When
> user tries to request gpio159, he'll meet failure since the pinctrl device
> can't cover gpio159. But the pinctrl device is already register for
> gpio152. In order to distinguish whether the pinctrl device registered,
> I added pinctrl_ready_for_gpio_range(gpio).
>
> In another scenario, there's no back-end pinctrl device for GPIO
> CHIP #0. So pinctrl_request_gpio() always returns EPROBE_DEFER.
> The commit 51e13c2475 can't cover this.
>
> I suggest to write code in below.

This looks much simpler. Anyway: Xinwei whatever you come up
with, include Haojian on To: and get is ACK on the solution.

Yours,
Linus Walleij
