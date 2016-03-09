From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT][PATCH v2 1/3] gpio: mpc8xxx: Fixup setting gpio direction output
Date: Wed, 9 Mar 2016 10:42:15 +0700
Message-ID: <CACRpkdZ-5XR23JxA4tfNgwLJ6YZ9cn2wBt=SNiW-kJ6Y=SgHFg@mail.gmail.com>
References: <1456125772.27297.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33758 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898AbcCIDmQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:42:16 -0500
Received: by mail-ob0-f178.google.com with SMTP id fz5so34951773obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:42:15 -0800 (PST)
In-Reply-To: <1456125772.27297.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 22, 2016 at 2:22 PM, Axel Lin <axel.lin@ingics.com> wrote:

> For devtype with specific gpio_dir_out implementation, current code is
> wrong because below code sets both gc->direction_output and
> mpc8xxx_gc->direction_output to the same function.
>
> gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
> mpc8xxx_gc->direction_output = gc->direction_output;
>
> Set mpc8xxx_gc->direction_output = gc->direction_output first to fix it.
> This way mpc8xxx_gc->direction_output actually calls the standard
> bgpio_dir_out() to update register.
>
> Fixes: commit 42178e2a1e42 ("drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic")
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
