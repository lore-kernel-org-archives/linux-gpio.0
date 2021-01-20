Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEEAC433DB
	for <linux-gpio@archiver.kernel.org>; Wed, 20 Jan 2021 17:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7401C233E2
	for <linux-gpio@archiver.kernel.org>; Wed, 20 Jan 2021 17:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388514AbhATRBr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:01:47 -0500
Received: from verein.lst.de ([213.95.11.211]:56756 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732743AbhATRBR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 12:01:17 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 06C7468B02; Wed, 20 Jan 2021 18:00:33 +0100 (CET)
Date:   Wed, 20 Jan 2021 18:00:32 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        linux-kernel@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 0/4] configfs: implement committable items and add
 sample code
Message-ID: <20210120170032.GA22929@lst.de>
References: <20210115111311.31601-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115111311.31601-1-brgl@bgdev.pl>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Joel,

if you are fine with this version I think we should let Bartosz pick
this up through whatever tree he needs it for.  I'd be more comfortable
if you ACKed this as you know the original design better than I do.
