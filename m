Return-Path: <SRS0=2ktD=V5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21D2C433FF
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Aug 2019 05:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABB842173E
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Aug 2019 05:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564639104;
	bh=tPLQMa9INtNp24krrrmSdyM8aYEOtt5HnLd6iOMeg/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2vpmZugnYZzxDH1BC8h94FuDl74PPESepclks94LrNFO0TpfxJGVcNVHYK093juLr
	 G/ElfT41OcRlhrVoSy/SS0++HCvVg4k86Xb9KJzumlNnw+JA8eEeclujG6Q7VkwO1L
	 wsG06TT9jz3g9qtfysmNx1hioU4MXmC++0y0X9OY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbfHAF6Y (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 1 Aug 2019 01:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729345AbfHAF6Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Aug 2019 01:58:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2E122089E;
        Thu,  1 Aug 2019 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564639103;
        bh=tPLQMa9INtNp24krrrmSdyM8aYEOtt5HnLd6iOMeg/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QVazc23f/a1NUp8GF3qUN3kRmuL5tiD1kgX+uukmkVF6ZrKsj9JUS0VyKFCoWO48U
         aBykRklY1xbV2PfKq+/Aa/Cf2eugpCXY9V1MV3/piPu0jKSsPMj8bYMfuweKBgVV2H
         MEmRmKeNtQ/jxA7QNhPVD70PZd0xUE+51bDt+cqE=
Date:   Thu, 1 Aug 2019 07:58:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] usb: udc: lpc32xx: allow compile-testing
Message-ID: <20190801055821.GB24607@kroah.com>
References: <20190731195713.3150463-1-arnd@arndb.de>
 <20190731195713.3150463-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731195713.3150463-3-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 09:56:44PM +0200, Arnd Bergmann wrote:
> The only thing that prevents building this driver on other
> platforms is the mach/hardware.h include, which is not actually
> used here at all, so remove the line and allow CONFIG_COMPILE_TEST.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/gadget/udc/Kconfig       | 3 ++-
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 2 --
>  2 files changed, 2 insertions(+), 3 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
