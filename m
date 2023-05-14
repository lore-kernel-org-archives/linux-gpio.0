Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62435C77B7D
	for <linux-gpio@archiver.kernel.org>; Sun, 14 May 2023 21:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbjENVKq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 14 May 2023 17:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjENVKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 May 2023 17:10:45 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8143410D9
        for <linux-gpio@vger.kernel.org>; Sun, 14 May 2023 14:10:43 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id c70aa805-f29b-11ed-b972-005056bdfda7;
        Mon, 15 May 2023 00:10:39 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Mon, 15 May 2023 00:10:39 +0300
To:     Lizhe <sensor1010@163.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drivers/pinconf.c: Remove redundant check for the
 existence of the member
Message-ID: <ZGFOT9cWNTzJDXo7@surfacebook>
References: <20230514165932.251200-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514165932.251200-1-sensor1010@163.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, May 15, 2023 at 12:59:32AM +0800, Lizhe kirjoitti:
> "pin_config_set" in pinconf_ops.
> 
> In the function of registering pinctrl_dev, pinctrl_init_controller(),
> a non-null check has already been performed on the members
> pin_config_set and pin_config_group_set in the ops structure.

NAK.

Try to analyse what `if (!foo && !bar)` means from the logic perspective and
deduce from that the problem in your proposal.

P.S. It's not the first wrong proposed change from you. Dunno if you even
trying to read the code...

-- 
With Best Regards,
Andy Shevchenko


