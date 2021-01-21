Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7624BC433E9
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 07:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461582396F
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 07:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbhAUHlD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:41:03 -0500
Received: from muru.com ([72.249.23.125]:55486 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727223AbhAUHUC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 02:20:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BE01688B3;
        Thu, 21 Jan 2021 07:19:18 +0000 (UTC)
Date:   Thu, 21 Jan 2021 09:06:44 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Emmanuel Vadot <manu@bidouilliste.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: clarify #pinctrl-cells for pinctrl-single,pins
Message-ID: <YAkoBAkaj63voakr@atomide.com>
References: <20210120050342.320704-1-drew@beagleboard.org>
 <20210120090108.bbdee781a237cb931a572323@bidouilliste.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120090108.bbdee781a237cb931a572323@bidouilliste.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Emmanuel Vadot <manu@bidouilliste.com> [210120 08:01]:
> On Tue, 19 Jan 2021 21:03:44 -0800
> Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Document that #pinctrl-cells can be 1 or 2 for pinctrl-single,pins
...

>  Reviewed-by: Emmanuel Vadot <manu@FreeBSD.org>
> 
>  Thanks, now the docs make more sense :)

Looks good to me too:

Reviewed-by: Tony Lindgren <tony@atomide.com>
