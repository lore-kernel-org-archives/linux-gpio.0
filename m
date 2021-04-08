Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACC3C433B4
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 22:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB0EB6115C
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 22:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhDHWSs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Apr 2021 18:18:48 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41416 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232265AbhDHWSr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 18:18:47 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lUcyv-00Fc6F-3w; Fri, 09 Apr 2021 00:18:33 +0200
Date:   Fri, 9 Apr 2021 00:18:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, bert@biot.com
Subject: Re: [RFC PATCH 0/2] MIIM regmap and RTL8231 GPIO expander support
Message-ID: <YG+BObnBEOZnoJ1K@lunn.ch>
References: <cover.1617914861.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617914861.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> - Providing no compatible for an MDIO child node is considered to be equivalent
>   to a c22 ethernet phy, so one must be provided. However, this node is then
>   not automatically probed.

It cannot be automatically probed, since register 2 and 3 do not
contain an ID, which PHYs do. So you need to explicitly list in on the
MDIO bus, and when the of_mdiobus_register() is called, the device
will be instantiated.

Is it okay to provide a binding without a driver?
>   If some code is required, where should this be put?
>   Current devicetree structure:
>     mdio-bus {
>         compatible = "vendor,mdio";
>         ...
> 
>         expander0: expander@0 {
>             /*
>              * Provide compatible for working registration of mdio device.
>              * Device probing happens in gpio1 node.
>              */
>             compatible = "realtek,rtl8231-expander";
>             reg = <0>;
>         };
> 
>     };
>     gpio1 : ext_gpio {
>         compatible = "realtek,rtl8231-mdio";
>         gpio-controller;
>         ...
>     };

I don't understand this split. Why not

     mdio-bus {
         compatible = "vendor,mdio";
         ...
 
         expander0: expander@0 {
             /*
              * Provide compatible for working registration of mdio device.
              * Device probing happens in gpio1 node.
              */
             compatible = "realtek,rtl8231-expander";
             reg = <0>;
	     gpio-controller;
         };
     };

You can list whatever properties you need in the node. Ethernet
switches have interrupt-controller, embedded MDIO busses with PHYs on
them etc.

> - MFD driver:
>   The RTL8231 is not just a GPIO expander, but also a pin controller and LED
>   matrix controller. Regmap initialisation could probably be moved to a parent
>   MFD, with gpio, led, and pinctrl cells. Is this a hard requirement if only a
>   GPIO controller is provided?

You need to think about forward/backwards compatibility. You are
defining a binding now, which you need to keep. Do you see how an MFD
could be added without breaking backwards compatibility?

      Andrew
