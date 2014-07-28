From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: number gpio ranges starting from 0
Date: Mon, 28 Jul 2014 12:14:19 +0200
Message-ID: <CACRpkda0K0JcA46AjcW===G1Rm5PSDC9jUCWf2Y9YpM2jLFtkw@mail.gmail.com>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
	<1405358677-23657-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:39424 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751811AbaG1KOU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jul 2014 06:14:20 -0400
Received: by mail-oi0-f54.google.com with SMTP id i138so5769348oig.13
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2014 03:14:20 -0700 (PDT)
In-Reply-To: <1405358677-23657-3-git-send-email-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Mon, Jul 14, 2014 at 7:24 PM, Chen-Yu Tsai <wens@csie.org> wrote:

> The pinctrl-sunxi driver originally used the pin number as the gpio
> range offset. This resulted in large, bogus gpio numbers for the
> new sun6i-a31-r pinctrl devices.
>
> This patch makes the driver number the gpios ranges starting from an
> offset of 0, by subtracting the pin_base number from the pin number.
> This also makes the system-wide gpio number match the pin number.
>
> Tested on sun8i with sysfs exported gpios.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
