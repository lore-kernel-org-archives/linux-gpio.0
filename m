From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3][v6] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Fri, 14 Nov 2014 10:58:05 +0100
Message-ID: <CACRpkdaVDR1wrx5F5_XYiVnwThDkRVC9e12DSO_u-g=QtL87eA@mail.gmail.com>
References: <1714329.9fHI1iKR0j@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:56567 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754727AbaKNJ6G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 04:58:06 -0500
Received: by mail-ie0-f180.google.com with SMTP id rl12so2109326iec.25
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2014 01:58:05 -0800 (PST)
In-Reply-To: <1714329.9fHI1iKR0j@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Tue, Nov 4, 2014 at 5:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Add a set_multiple function to the MPC8xxx GPIO chip driver and thereby allow
> for actual performance improvements when setting multiple outputs
> simultaneously. In my case the time needed to configure an FPGA goes down from
> 48 s to 20 s.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
