Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF01C433E0
	for <linux-gpio@archiver.kernel.org>; Fri, 26 Feb 2021 14:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02BAF64F03
	for <linux-gpio@archiver.kernel.org>; Fri, 26 Feb 2021 14:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBZOYI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 26 Feb 2021 09:24:08 -0500
Received: from aposti.net ([89.234.176.197]:41486 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhBZOYG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Feb 2021 09:24:06 -0500
Date:   Fri, 26 Feb 2021 14:23:11 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2] pinctrl: ingenic: add missing call to of_node_put()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <NY35PQ.UZ27JQ71RLXE2@crapouillou.net>
In-Reply-To: <1614303297-24178-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614303297-24178-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Le ven. 26 févr. 2021 à 9:34, Yang Li <yang.lee@linux.alibaba.com> a 
écrit :
> In one of the error paths of the for_each_child_of_node() loop in
> ingenic_gpio_probe, add missing call to of_node_put().
> 
> Fix the following coccicheck warning:
> ./drivers/pinctrl/pinctrl-ingenic.c:2485:1-23: WARNING: Function
> "for_each_child_of_node" should have of_node_put() before return 
> around
> line 2489.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Changes in v2:
> -add braces for if
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index f274612..c8ecd01 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2485,8 +2485,10 @@ static int __init ingenic_pinctrl_probe(struct 
> platform_device *pdev)
>  	for_each_child_of_node(dev->of_node, node) {
>  		if (of_match_node(ingenic_gpio_of_match, node)) {
>  			err = ingenic_gpio_probe(jzpc, node);
> -			if (err)
> +			if (err) {
> +				of_node_put(node);
>  				return err;
> +			}
>  		}
>  	}
> 
> --
> 1.8.3.1
> 


