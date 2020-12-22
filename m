Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2406C433E9
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Dec 2020 13:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B5F323133
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Dec 2020 13:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgLVN5d (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 22 Dec 2020 08:57:33 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:36882 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726868AbgLVN5d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 08:57:33 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kri9e-00DO62-Dz; Tue, 22 Dec 2020 14:56:46 +0100
Date:   Tue, 22 Dec 2020 14:56:46 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/3] arm64: dts: sparx5: Add SGPIO devices
Message-ID: <20201222135646.GF3107610@lunn.ch>
References: <20201113145151.68900-1-lars.povlsen@microchip.com>
 <20201113145151.68900-4-lars.povlsen@microchip.com>
 <20201220224804.GA3107610@lunn.ch>
 <87eejip2xm.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eejip2xm.fsf@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 22, 2020 at 11:09:41AM +0100, Lars Povlsen wrote:
> 
> Andrew Lunn writes:
> 
> > On Fri, Nov 13, 2020 at 03:51:51PM +0100, Lars Povlsen wrote:
> >> +             led@8 {
> >> +                     label = "eth12:green";
> >> +                     gpios = <&sgpio_out0 12 0 GPIO_ACTIVE_HIGH>;
> >> +                     default-state = "off";
> >> +             };
> >> +             led@9 {
> >> +                     label = "eth12:yellow";
> >> +                     gpios = <&sgpio_out0 12 1 GPIO_ACTIVE_HIGH>;
> >> +                     default-state = "off";
> >> +             };
> >
> > Hi Lars
> >
> > I did not see these patches earlier, but i've been looking at the
> > switch driver patches recently, so went digging.
> >
> > Can the Ethernet switch itself control these LEDs for indicating
> > things like packet receive/transmit, link state, and link speed? Or
> > are they purely software controlled?
> >
> >     Thanks
> >         Andrew
> 
> Hi Andrew!
> 
> No, the SGPIO device is separate from the switch device as such. I was
> planning to couple the two by means of "led events" in a later patch.

O.K, good.

In the LED subsystem terminology, such an event would be a
trigger. Link state, and copper speed should already be mostly covered
by phylib triggers. What is missing is link activity.  Does the switch
easily provide you with this information, or do you need to poll the
switch statistics counters every 10ms to blink the LEDs?

     Andrew
