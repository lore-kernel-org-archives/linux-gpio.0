From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: nomadik: make core support explicitly non-modular
Date: Sat, 27 Aug 2016 13:13:54 +0200
Message-ID: <CACRpkdYqFEhB43mjPJ9OX0egwURuCW_vx5Y+5xVPEiQ8=rx3Jw@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34742 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751643AbcH0LNz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2016 07:13:55 -0400
Received: by mail-oi0-f47.google.com with SMTP id l203so142574396oib.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2016 04:13:55 -0700 (PDT)
In-Reply-To: <20160823211944.18554-4-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alessandro Rubini <rubini@unipv.it>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/nomadik/Kconfig:config PINCTRL_NOMADIK
> drivers/pinctrl/nomadik/Kconfig:        bool "Nomadik pin controller driver"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
