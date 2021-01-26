Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDAFC433E0
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Jan 2021 18:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8565022472
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Jan 2021 18:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731585AbhAZRWe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:22:34 -0500
Received: from muru.com ([72.249.23.125]:52856 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730248AbhAZHON (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 02:14:13 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E563E8057;
        Tue, 26 Jan 2021 07:13:13 +0000 (UTC)
Date:   Tue, 26 Jan 2021 09:13:07 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: single: set function name when adding
 function
Message-ID: <YA/BA3uGXRhAVaVq@atomide.com>
References: <20210125203542.51513-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125203542.51513-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [210125 20:36]:
> pcs_add_function() fails to set the function name in struct pcs_function
> when adding a new function.  As a result this line in pcs_set_mux():
> 
>         dev_dbg(pcs->dev, "enabling %s function%i\n",
>                 func->name, fselector);
> 
> prints "(null)" for the function:
> 
> pinctrl-single 44e10800.pinmux: enabling (null) function0
> pinctrl-single 44e10800.pinmux: enabling (null) function1
> pinctrl-single 44e10800.pinmux: enabling (null) function2
> pinctrl-single 44e10800.pinmux: enabling (null) function3
> 
> With this fix, the output is now:
> 
> pinctrl-single 44e10800.pinmux: enabling pinmux-uart0-pins function0
> pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function1
> pinctrl-single 44e10800.pinmux: enabling pinmux-i2c0-pins function2
> pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function3

Acked-by: Tony Lindgren <tony@atomide.com>
