From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 18/21] regulator: fixed/gpio: Pull inversion/OD into gpiolib
Date: Sat, 17 Feb 2018 10:59:57 +0100
Message-ID: <87a7w87x7m.fsf@belgarion.home>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
        <20180212131717.27193-19-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:52649 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751067AbeBQKAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Feb 2018 05:00:01 -0500
In-Reply-To: <20180212131717.27193-19-linus.walleij@linaro.org> (Linus
        Walleij's message of "Mon, 12 Feb 2018 14:17:14 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, Mike Rapoport <mike@compulab.co.il>, Philipp Zabel <philipp.zabel@gmail.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>

Linus Walleij <linus.walleij@linaro.org> writes:

> This pushes the handling of inversion semantics and open drain
> settings to the GPIO descriptor and gpiolib. All affected board
> files are also augmented.

Hi Linus,

Could we split the patch into chunks, one for i2c, one for pxa, etc ...
I fear that exceptionally I have a couple of competing patches for the pxa tree,
and a conflict might arise between 3 trees (I2C, MTD, PXA).

Otherwise it looks good for the PXA part.

Cheers.

-- 
Robert
