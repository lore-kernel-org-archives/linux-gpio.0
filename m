Return-Path: <SRS0=xHJw=6Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D65C54E90
	for <linux-gpio@archiver.kernel.org>; Mon, 11 May 2020 14:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1335020643
	for <linux-gpio@archiver.kernel.org>; Mon, 11 May 2020 14:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbgEKOxc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 11 May 2020 10:53:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:36967 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730532AbgEKOxc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 10:53:32 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E630A240003;
        Mon, 11 May 2020 14:53:29 +0000 (UTC)
Date:   Mon, 11 May 2020 16:53:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
Message-ID: <20200511145329.GV34497@piout.net>
References: <20200507114015.24461-1-geert+renesas@glider.be>
 <20200507114525.GE34497@piout.net>
 <87ftccorqd.fsf@soft-dev15.microsemi.net>
 <20200507124419.GG34497@piout.net>
 <CAMuHMdUodZQ--jHT1atL1Cmfq7kqu9c=48LXx5o0PagHVNj+RA@mail.gmail.com>
 <20200511142038.GP34497@piout.net>
 <CAMuHMdXZMeY_Oz5fruxhfmS=6Tro0C3P+RoGiRZHpmACFrYXLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZMeY_Oz5fruxhfmS=6Tro0C3P+RoGiRZHpmACFrYXLg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/05/2020 16:48:01+0200, Geert Uytterhoeven wrote:
> I can connect whatever other system using SPI, i2c, CAN, or Ethernet ;-)
> That doesn't mean I will directly program the other system's pin controller
> over that link, using the standard (MMIO) pinctrl driver.
> 

Yes, my point is that you can access all the SoC registers over SPI and
so you will probably need to also control the pinctrl for example to be
able to actually use the on-SoC switch.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
