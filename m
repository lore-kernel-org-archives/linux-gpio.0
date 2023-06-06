Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C03C77B7A
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Jun 2023 09:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjFFJe1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbjFFJeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 05:34:13 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D3910F4
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 02:33:50 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 3cf5f6e5-044d-11ee-abf4-005056bdd08f;
        Tue, 06 Jun 2023 12:33:48 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 6 Jun 2023 12:33:47 +0300
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: moorefield: Fix open-drain pin mode
 configuration
Message-ID: <ZH79e1hglvJxGZhf@surfacebook>
References: <20230605154523.11799-1-andriy.shevchenko@linux.intel.com>
 <20230606051547.GX45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606051547.GX45886@black.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, Jun 06, 2023 at 08:15:47AM +0300, Mika Westerberg kirjoitti:
> On Mon, Jun 05, 2023 at 06:45:22PM +0300, Andy Shevchenko wrote:
> > Currently the pin may not be configured as open-drain in some
> > cases because the argument may be 0 for the boolean types of
> > the pin configurations. Fix this by ignoring the argument.
> > 
> > With that, allow to actually restore pin to the push-pull mode.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thank you!

> BTW, looking at the two drivers they seem to have a lot of
> commonalities. Perhaps it makes sense to consolidate?

Yes, that's the plan, perhaps for the next cycle.

-- 
With Best Regards,
Andy Shevchenko


