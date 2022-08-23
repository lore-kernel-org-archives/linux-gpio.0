Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F538C32772
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Aug 2022 15:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242442AbiHWPgD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Aug 2022 11:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242672AbiHWPfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2022 11:35:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F1C2618CB;
        Tue, 23 Aug 2022 04:23:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC907611AF;
        Tue, 23 Aug 2022 11:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD80C433C1;
        Tue, 23 Aug 2022 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661253775;
        bh=yXjNO8BangCgzGfaP7LghR/B+0ut5KnX0KE1NB1SYrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hk2JIGVfyixbpc27gniWTxaVS04S+4oO3450gkQ/ghRfSP0bbsUCuUKKva5+y6tHO
         KUsX+g//7SRxeAKX6qfxPRf/7Y23b4K46pxRxmhVC9R3wnq/Dp1teZ4VgNkgyCIA/p
         QY5L5WsJns0vkVtsR8hV1aYZClK7xAN6VG0x2AuU=
Date:   Tue, 23 Aug 2022 13:22:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        UNGLinuxDriver@microchip.com, arnd@arndb.de,
        dragan.cvetic@xilinx.com, derek.kiernan@xilinx.com
Subject: Re: [PATCH RFC char-misc-next 1/5] misc: microchip: pci1xxxx: load
 auxiliary bus driver for the PIO function in the multi-function endpoint of
 pci1xxxx device.
Message-ID: <YwS4jBd5uVvMaTSz@kroah.com>
References: <20220804163219.921640-1-kumaravel.thiagarajan@microchip.com>
 <20220804163219.921640-2-kumaravel.thiagarajan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804163219.921640-2-kumaravel.thiagarajan@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 04, 2022 at 10:02:15PM +0530, Kumaravel Thiagarajan wrote:
> pci1xxxx is a PCIe switch with a multi-function endpoint on one of its
> downstream ports. PIO function is one of the functions in the
> multi-function endpoint. PIO function combines a GPIO controller and also
> an interface to program pci1xxxx's OTP & EEPROM. This auxiliary bus driver
> is loaded for the PIO function and separate child devices are enumerated
> for GPIO controller and OTP/EEPROM interface.
> 
> Signed-off-by: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
> ---
>  MAINTAINERS                                   |   8 +
>  drivers/misc/Kconfig                          |   1 +
>  drivers/misc/Makefile                         |   3 +-
>  drivers/misc/mchp_pci1xxxx/Kconfig            |  10 ++
>  drivers/misc/mchp_pci1xxxx/Makefile           |   1 +
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 167 ++++++++++++++++++
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.h |  28 +++
>  7 files changed, 217 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/misc/mchp_pci1xxxx/Kconfig
>  create mode 100644 drivers/misc/mchp_pci1xxxx/Makefile
>  create mode 100644 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>  create mode 100644 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 285ffe0df5cf..ba491e4fc35f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13244,6 +13244,14 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
>  F:	drivers/mtd/nand/raw/atmel/*
>  
> +MICROCHIP PCI1XXXX GP DRIVER
> +M:	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
> +M:	UNGLinuxDriver@microchip.com

Please do not add random email aliases to the MAINTAINERS file, use
people's names and email addresses, otherwise there is no sense of
ownership.

thanks,

greg k-h
