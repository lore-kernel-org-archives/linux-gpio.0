Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA4EC04EBE
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 15:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1417F21924
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 15:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbgJHPIy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 11:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbgJHPIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 11:08:54 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D77C061755;
        Thu,  8 Oct 2020 08:08:54 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 27787301;
        Thu,  8 Oct 2020 15:08:53 +0000 (UTC)
Date:   Thu, 8 Oct 2020 09:08:51 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1] gpiolib: Update indentation in driver.rst for code
 excerpts
Message-ID: <20201008090851.3041aa1d@lwn.net>
In-Reply-To: <20201007143817.76335-1-andriy.shevchenko@linux.intel.com>
References: <20201007143817.76335-1-andriy.shevchenko@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed,  7 Oct 2020 17:38:17 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> When TABs are being used to indent the code excerpts inside
> the bullet lists some of the tools fail to recognize it and
> continue interpreting the special characters inside
> the quoted excerpt.

Which tools are those?  The docs build itself seems to work fine...?

Thanks,

jon
