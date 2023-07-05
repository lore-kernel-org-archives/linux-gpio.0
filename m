Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C34AEB64DA
	for <linux-gpio@archiver.kernel.org>; Wed,  5 Jul 2023 09:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjGEJlX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbjGEJlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 05:41:22 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F60E54
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 02:41:21 -0700 (PDT)
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 16feab62-1b18-11ee-abf4-005056bdd08f;
        Wed, 05 Jul 2023 12:41:18 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 5 Jul 2023 12:41:17 +0300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable <stable@kernel.org>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Handle non-unique subnode names
Message-ID: <ZKU6vQv_i0xQC6_D@surfacebook>
References: <20230704111858.215278-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704111858.215278-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, Jul 04, 2023 at 12:18:58PM +0100, Biju Das kirjoitti:
> Currently, sd1 and sd0 have unique subnode names 'sd1_mux' and 'sd0_mux'.
> If we change it to a non-unique subnode name such as 'mux' this can lead
> to the below conflicts as the RZ/G2L pin control driver considers only the
> names of the subnodes.
> 
>    pinctrl-rzg2l 11030000.pinctrl: pin P47_0 already requested by 11c00000.mmc; cannot claim for 11c10000.mmc
>    pinctrl-rzg2l 11030000.pinctrl: pin-376 (11c10000.mmc) status -22
>    pinctrl-rzg2l 11030000.pinctrl: could not request pin 376 (P47_0) from group mux  on device pinctrl-rzg2l
>    renesas_sdhi_internal_dmac 11c10000.mmc: Error applying setting, reverse things back
> 
> Fix this by constructing unique names from the node names of both the
> pin control configuration node and its child node, where appropriate.
> 
> Based on the work done by Geert for RZ/V2M pinctrl driver.

...

> +	if (parent) {
> +		name = devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOFn.%pOFn",
> +				      parent, np);

Is devm_*() usage appropriate here?

> +		if (!name) {
> +			ret = -ENOMEM;
> +			goto done;
> +		}
> +	} else {
> +		name = np->name;
> +	}

-- 
With Best Regards,
Andy Shevchenko


