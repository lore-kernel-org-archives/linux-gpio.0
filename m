Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9053EB64D9
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Jun 2023 11:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344584AbjFOLvU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Jun 2023 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344612AbjFOLtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 07:49:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825BE4C24;
        Thu, 15 Jun 2023 04:45:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68DFD61261;
        Thu, 15 Jun 2023 11:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DEDC433C0;
        Thu, 15 Jun 2023 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686829483;
        bh=C6kdNwz7SKdwzwjbo/TvhWaEK8yVPjbRvzmbV0rHLW0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G1Xrz445AQqpjRpGC8oduGG//d76zk4WDjW3IP82NDYqzPT/OnCuFQj3GedZ57Xs0
         cFS3+7T46veS+o4LRnVg42NMPP9w664v840WRb0/tszMpS/DNaKFfPm84dILIbu2H6
         QudV+M6ll7/QMaeK7l2PzvHGR6gQZOX1GoYwWirI=
Date:   Thu, 15 Jun 2023 13:44:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>
Cc:     michael@walle.cc, arnd@arndb.de,
        kumaravel.thiagarajan@microchip.com,
        tharunkumar.pasumarthi@microchip.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v13 char-misc-next 0/2] Add OTP/EEPROM functionality to
 the PCI1XXXX switch
Message-ID: <2023061511-finless-isolated-8398@gregkh>
References: <20230530140511.3096-1-vaibhaavram.tl@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530140511.3096-1-vaibhaavram.tl@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 07:35:09PM +0530, Vaibhaav Ram T.L wrote:
> Microchip's pci1xxxx is an unmanaged PCIe3.1a switch for consumer,
> industrial, and automotive applications. This switch integrates OTP and
> EEPROM to enable customization of the part in the field. This patch adds
> OTP/EEPROM functionality to the pci1xxxx switch.

This series never made it to lore.kernel.org somehow, why not?

Can you resend it and verify that it makes it to the public mailing
lists, otherwise I can't take it as it looks like a "private" patch.

thanks,

greg k-h
