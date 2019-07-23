Return-Path: <SRS0=KICV=VU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3683DC7618B
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 14:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14D4621901
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 14:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732623AbfGWOdl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Jul 2019 10:33:41 -0400
Received: from verein.lst.de ([213.95.11.211]:42317 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728318AbfGWOdl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 10:33:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4351B68BFE; Tue, 23 Jul 2019 16:33:37 +0200 (CEST)
Date:   Tue, 23 Jul 2019 16:33:36 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Christoph Hellwig <hch@lst.de>, Stefan Wahren <wahrenst@gmx.net>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
Message-ID: <20190723143336.GA32294@lst.de>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net> <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de> <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net> <20190723093442.GA27239@lst.de> <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 03:32:11PM +0200, Nicolas Saenz Julienne wrote:
> You state in "arm: use swiotlb for bounce buffer on LPAE configs" that "The DMA
> API requires that 32-bit DMA masks are always supported". If I understand it
> correctly this device breaks that assumption. Which implies we need a bounce
> buffer system in place for any straming DMA user.

Yes, you do.

> It seems we're unable to use dma-direct/swiotlb, so I enabled arm's dmabounce
> on all devices hooked into RPi's limited interconnect, which fixes this issue.
> Any thoughts on this?

There is no reason swiotlb could not handle the case, but at least for
now dmabounce seems like the better option given that it is well
integrated into the arm code.

Your patch looks good to me.
