Return-Path: <SRS0=fLyU=ZL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95674C43215
	for <linux-gpio@archiver.kernel.org>; Tue, 19 Nov 2019 11:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D95821852
	for <linux-gpio@archiver.kernel.org>; Tue, 19 Nov 2019 11:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKSLDG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 19 Nov 2019 06:03:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53931 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfKSLDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 06:03:05 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iX1Hh-0004eq-RG; Tue, 19 Nov 2019 12:03:01 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iX1Hh-0006A0-1I; Tue, 19 Nov 2019 12:03:01 +0100
Date:   Tue, 19 Nov 2019 12:03:00 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Marc Zyngier <marc.zyngier@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        GPIO <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119110300.yy6diigjffu2ix63@pengutronix.de>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
 <20191119105619.4osmin7m5ryqfwih@pengutronix.de>
 <20191119110030.GA25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191119110030.GA25745@shell.armlinux.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Russell,

On Tue, Nov 19, 2019 at 11:00:31AM +0000, Russell King - ARM Linux admin wrote:
> On Tue, Nov 19, 2019 at 11:56:19AM +0100, Uwe Kleine-König wrote:
> > Having a pin configured as GPIO is the boot default setting for many
> > SoCs/pins. So you might get away with not specifying a setting for pin
> > 42, but that's not as robust as configuring that explicitly.
> 
> If only that was universally true - the LX2160A as an example doesn't
> default to GPIO mode...

FTR: My statement is universally true. Note I wrote "many" not "all"
SoCs/pins :-)

SCNR
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
