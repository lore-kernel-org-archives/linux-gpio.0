From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] drivers/gpio: make gpio-tps65910.c explicitly non-modular
Date: Tue, 5 Apr 2016 15:27:04 +0200
Message-ID: <CACRpkdYhBpsR+10h0_HdX6qmNvs9tuRFZLTYy7ZVCAgGj_VhgA@mail.gmail.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
	<1459536578-3017-6-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34297 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758772AbcDEN1G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:27:06 -0400
Received: by mail-ob0-f175.google.com with SMTP id bg3so9135813obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:27:05 -0700 (PDT)
In-Reply-To: <1459536578-3017-6-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Graeme Gregory <gg@slimlogic.co.uk>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 1, 2016 at 8:49 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_TPS65910
> drivers/gpio/Kconfig:   bool "TPS65910 GPIO"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init was not in use by this code, the init ordering
> remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Graeme Gregory <gg@slimlogic.co.uk>
> Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
