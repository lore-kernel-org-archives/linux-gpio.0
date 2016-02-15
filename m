From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT] gpio: mpc8xxx: Fixup setting gpio direction output
Date: Tue, 16 Feb 2016 00:21:55 +0100
Message-ID: <CACRpkdazD4zM+CbBvc7a_2nLhmp1pDyS-FqcE9FJ=F8q8Y9jPQ@mail.gmail.com>
References: <1455196399.18445.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:32945 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752305AbcBOXV4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 18:21:56 -0500
Received: by mail-ob0-f174.google.com with SMTP id jq7so48861659obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 15:21:55 -0800 (PST)
In-Reply-To: <1455196399.18445.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Liu Gang <Gang.Liu@nxp.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 11, 2016 at 2:13 PM, Axel Lin <axel.lin@ingics.com> wrote:

> For devtype with specific gpio_dir_out implementation, current code looks
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
> Setting gc->direction_output to gc->direction_output looks strange.
> This patch also slightly changes the code for better readability.
>
> Fixes: commit 42178e2a1e42 ("drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic")
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Liu please comment on this patch.

Yours,
Linus Walleij
