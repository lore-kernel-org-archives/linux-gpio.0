From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: stmpe: make it explicitly non-modular
Date: Wed, 11 May 2016 13:48:43 +0200
Message-ID: <CACRpkdZTp8JZM4TQpORBCZDDEYHG4+zO0uJXF5+_iTNDWJHG0A@mail.gmail.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
	<1462838398-10725-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34397 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937AbcEKLso (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 07:48:44 -0400
Received: by mail-oi0-f51.google.com with SMTP id k142so62826223oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 04:48:43 -0700 (PDT)
In-Reply-To: <1462838398-10725-3-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rabin Vincent <rabin@rab.in>

On Tue, May 10, 2016 at 1:59 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_STMPE
> drivers/gpio/Kconfig:   bool "STMPE GPIOs"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Curiously, this driver was using subsys_initcall since day one, so
> we don't have the "normal" module_init replacement in this change
> like we've done in other similar driver updates.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Rabin Vincent <rabin.vincent@stericsson.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
