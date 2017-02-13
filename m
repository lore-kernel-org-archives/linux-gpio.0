From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: spear: make bool drivers explicitly non-modular
Date: Mon, 13 Feb 2017 14:24:19 +0100
Message-ID: <CACRpkdYXTDDteyjWm3GOsmgdhzw7nM-8tGe7t9Reo+vznX99OA@mail.gmail.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com> <20170206080352.17808-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35270 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753431AbdBMNYb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 08:24:31 -0500
Received: by mail-it0-f47.google.com with SMTP id 203so186331281ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2017 05:24:31 -0800 (PST)
In-Reply-To: <20170206080352.17808-3-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Viresh Kumar <vireshk@kernel.org>, spear-devel <spear-devel@list.st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 6, 2017 at 9:03 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get the exact same change, so they are handled in batch.
>
> Changes are (1) use init.h header in place of module.h header,
> (2) delete module_exit related code, (3) delete MODULE_DEVICE_TABLE,
> and (4) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.
>
> None of these drivers were using module_init() so we don't have to
> worry about the init ordering getting changed with this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: spear-devel@list.st.com
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
