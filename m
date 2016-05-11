From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: sodaville: make it explicitly non-modular
Date: Wed, 11 May 2016 13:47:34 +0200
Message-ID: <CACRpkdaSdqs+uZOSSGA45NTB3YYk7HneVCWBb-WG30Bp-KwLdA@mail.gmail.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
	<1462838398-10725-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34570 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbcEKLrf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 07:47:35 -0400
Received: by mail-oi0-f49.google.com with SMTP id k142so62783902oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 04:47:34 -0700 (PDT)
In-Reply-To: <1462838398-10725-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hans J . Koch" <hjk@linutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 10, 2016 at 1:59 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_SODAVILLE
> drivers/gpio/Kconfig:   bool "Intel Sodaville GPIO support"
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
> Since module_pci_driver() uses the same init level as the
> builtin_pci_driver() does, there is no init ordering change
> caused by this commit.
>
> We don't replace module.h with init.h since the file already has that.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Hans J. Koch <hjk@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
