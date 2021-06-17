Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_NXDOMAIN,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0906C2B9F4
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Jun 2021 07:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F7AB613BF
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Jun 2021 07:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFQHuA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:50:00 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:55316 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230055AbhFQHt7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 03:49:59 -0400
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Jun 2021 03:49:59 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 12703671-cf3e-11eb-ba24-005056bd6ce9;
        Thu, 17 Jun 2021 10:31:47 +0300 (EEST)
Date:   Thu, 17 Jun 2021 10:31:46 +0300
From:   andy@surfacebook.localdomain
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 1/1] pinctrl: microchip-sgpio: Put fwnode in error
 case during ->probe()
Message-ID: <YMr6Yr2/x+42Oaib@surfacebook.localdomain>
References: <20210606191940.29312-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606191940.29312-1-andy.shevchenko@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sun, Jun 06, 2021 at 10:19:40PM +0300, Andy Shevchenko kirjoitti:
> device_for_each_child_node() bumps a reference counting of a returned variable.
> We have to balance it whenever we return to the caller.

Linus, any comments on this? Can it be applied sooner than later since
it's a fix?

-- 
With Best Regards,
Andy Shevchenko


