From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 05/21] regulator: arizona-ldo1: Look up a descriptor and
 pass to the core
Date: Tue, 13 Feb 2018 11:06:31 +0000
Message-ID: <20180213110631.o3zn5bifvypofsyg@localhost.localdomain>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-6-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:52136 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934079AbeBMLGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Feb 2018 06:06:36 -0500
Content-Disposition: inline
In-Reply-To: <20180212131717.27193-6-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>

On Mon, Feb 12, 2018 at 02:17:01PM +0100, Linus Walleij wrote:
> Instead of passing a global GPIO number, pass a descriptor looked
> up with the standard devm_gpiod_get_optional() call.
> 
> We have augmented the GPIO core to look up the regulator special
> GPIO "wlf,ldoena" in a separate patch.
> 
> Cc: patches@opensource.cirrus.com
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/regulator/arizona-ldo1.c       | 19 ++++++-------------
>  include/linux/regulator/arizona-ldo1.h |  3 ---
>  2 files changed, 6 insertions(+), 16 deletions(-)
> 

Does this patch not also need to update the hookups in
arch/arm/mach-s3c64xx/mach-crag6410-module.c? There is
wm5102_reva_pdata and wm5102_pdata both of which use the ldoena
you are removing here?

Thanks,
Charles
