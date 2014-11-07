From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 3/3][v6] serial_mctrl_gpio: use gpiod_set_array function
Date: Fri, 7 Nov 2014 18:34:38 +0900
Message-ID: <CAAVeFuKOUN95wEf1cugQWXnk_Qkk+A9PHwzFv-cufNbrQ6OAxg@mail.gmail.com>
References: <4411649.XDFZ6bkb1u@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:45694 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbaKGJe6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Nov 2014 04:34:58 -0500
Received: by mail-ig0-f175.google.com with SMTP id h3so12454138igd.14
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2014 01:34:58 -0800 (PST)
In-Reply-To: <4411649.XDFZ6bkb1u@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Wed, Nov 5, 2014 at 1:12 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Make the serial_mctrl_gpio driver the first user of the new gpiod_set_array
> function. All modem control output signals are now set simultaneously.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Nice use of gpiod_set_array(), with hopefully more to come.
