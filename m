From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: spear: make bool drivers explicitly
 non-modular
Date: Tue, 7 Feb 2017 09:42:49 +0530
Message-ID: <20170207041249.GL3131@vireshk-i7>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com>
 <20170206080352.17808-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:36049 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751164AbdBGEMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 23:12:52 -0500
Received: by mail-pg0-f43.google.com with SMTP id v184so34596418pgv.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 20:12:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170206080352.17808-3-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, spear-devel@list.st.com, linux-gpio@vger.kernel.org

On 06-02-17, 03:03, Paul Gortmaker wrote:
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
> ---
>  drivers/pinctrl/spear/pinctrl-plgpio.c    |  7 +------
>  drivers/pinctrl/spear/pinctrl-spear1310.c | 12 ------------
>  drivers/pinctrl/spear/pinctrl-spear1340.c | 12 ------------
>  drivers/pinctrl/spear/pinctrl-spear300.c  | 12 ------------
>  drivers/pinctrl/spear/pinctrl-spear310.c  | 12 ------------
>  drivers/pinctrl/spear/pinctrl-spear320.c  | 12 ------------
>  6 files changed, 1 insertion(+), 66 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
