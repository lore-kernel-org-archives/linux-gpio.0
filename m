From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/9] pinctrl: amd: make it explicitly non-modular
Date: Mon, 13 Jun 2016 08:29:46 +0200
Message-ID: <CACRpkdY12cSZOiz8f7if4McToeXZhd_N3YNLqahso1q_pQBf=Q@mail.gmail.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com> <1465267388-17884-6-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35907 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933368AbcFMG3r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 02:29:47 -0400
Received: by mail-oi0-f43.google.com with SMTP id p204so193626322oih.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 23:29:47 -0700 (PDT)
In-Reply-To: <1465267388-17884-6-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>

On Tue, Jun 7, 2016 at 4:43 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> config PINCTRL_AMD
>         bool "AMD GPIO pin control"
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
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Ken Xue <Ken.Xue@amd.com>
> Cc: Jeff Wu <Jeff.Wu@amd.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
