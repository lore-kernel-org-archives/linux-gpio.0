Return-Path: <SRS0=UY75=2B=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97288C43603
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Dec 2019 13:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73349214D8
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Dec 2019 13:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbfLKNit (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Dec 2019 08:38:49 -0500
Received: from ns.iliad.fr ([212.27.33.1]:33968 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727477AbfLKNis (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 08:38:48 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 85E3120482;
        Wed, 11 Dec 2019 14:38:47 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 7566A20134;
        Wed, 11 Dec 2019 14:38:47 +0100 (CET)
Subject: Re: Trying to understand basic concepts about GPIO reset pin
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
References: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr>
 <20191211132203.GD25745@shell.armlinux.org.uk>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <527faad5-20e1-5559-8ccd-1d37421b5ec3@free.fr>
Date:   Wed, 11 Dec 2019 14:38:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211132203.GD25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Dec 11 14:38:47 2019 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/12/2019 14:22, Russell King - ARM Linux admin wrote: [snip]

Thanks, Russell. Your confirmation helps a lot.
