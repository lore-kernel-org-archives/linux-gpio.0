Return-Path: <SRS0=KICV=VU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE3C7618B
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 09:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF3C3227BF
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 09:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfGWJep (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Jul 2019 05:34:45 -0400
Received: from verein.lst.de ([213.95.11.211]:40230 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbfGWJep (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 05:34:45 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id AD04B68AFE; Tue, 23 Jul 2019 11:34:42 +0200 (CEST)
Date:   Tue, 23 Jul 2019 11:34:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
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
        linux-mmc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
Message-ID: <20190723093442.GA27239@lst.de>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net> <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de> <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 08:10:17PM +0200, Stefan Wahren wrote:
> i rebased this series also and got this only on the RPi 4.
> 
> After reverting the following:
> 
> 79a986721de dma-mapping: remove dma_max_pfn
> 7559d612dff0 mmc: core: let the dma map ops handle bouncing
> 
> This crash disappear, but wifi seems to be still broken.
> 
> Would be nice, if you can investigate further.

That means dma addressing on this system doesn't just work for some
memory, and the mmc bounce buffering was papering over that just for
mmc.  Do you have highmem on this system?  

You might want to try this series, which has been submitted upstream:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/arm-swiotlb
