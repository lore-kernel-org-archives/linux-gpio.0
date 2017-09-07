From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: Re: [PATCH 2/2] pinctrl: sprd: fix off by one bugs
Date: Thu, 7 Sep 2017 19:29:18 +0800
Message-ID: <20170907112917.GA28053@spreadtrum.com>
References: <20170907072926.56oqezwk4r72yjgt@mwanda>
 <20170907073211.zgcgmdfrphtqy3d7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sci-ig2.spreadtrum.com ([222.66.158.135]:17043 "EHLO
        SHSQR01.spreadtrum.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1754495AbdIGL3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2017 07:29:55 -0400
Content-Disposition: inline
In-Reply-To: <20170907073211.zgcgmdfrphtqy3d7@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 四,  9月 07, 2017 at 02:12:05下午 +0300, Dan Carpenter wrote:
> info->groups[] has info->ngroups elements so these comparisons should be
> >= instead of >.
> 
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing my mistakes, please add my tag if it is useful.
Reviewed-by: Baolin Wang <baolin.wang@spreadtrum.com>

> 
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index 673b77bbbc8c..939e1bbf6253 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -400,7 +400,7 @@ static int sprd_pmx_set_mux(struct pinctrl_dev *pctldev,
>  	unsigned long reg;
>  	unsigned int val = 0;
>  
> -	if (group_selector > info->ngroups)
> +	if (group_selector >= info->ngroups)
>  		return -EINVAL;
>  
>  	switch (func_selector) {
> @@ -734,7 +734,7 @@ static int sprd_pinconf_group_get(struct pinctrl_dev *pctldev,
>  	struct sprd_pin_group *grp;
>  	unsigned int pin_id;
>  
> -	if (selector > info->ngroups)
> +	if (selector >= info->ngroups)
>  		return -EINVAL;
>  
>  	grp = &info->groups[selector];
> @@ -753,7 +753,7 @@ static int sprd_pinconf_group_set(struct pinctrl_dev *pctldev,
>  	struct sprd_pin_group *grp;
>  	int ret, i;
>  
> -	if (selector > info->ngroups)
> +	if (selector >= info->ngroups)
>  		return -EINVAL;
>  
>  	grp = &info->groups[selector];
> @@ -813,7 +813,7 @@ static void sprd_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
>  	const char *name;
>  	int i, ret;
>  
> -	if (selector > info->ngroups)
> +	if (selector >= info->ngroups)
>  		return;
>  
>  	grp = &info->groups[selector];
