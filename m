Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36130C6FA86
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Sep 2022 13:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240305AbiIFNSn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Sep 2022 09:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239997AbiIFNSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:18:42 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3684F1A2;
        Tue,  6 Sep 2022 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=abOmnhnyd+sWtL9SSFYhJDEb2jQ0BuhJ03Z3IXa5TEI=; b=SU+8sj/4hl+sw0I48s5fZ3iBM+
        Nk6Tq+n+HmeldWmI2R6oLROiYD/GtVJFqdWaVMy+pYzgwn9+jZkqwSIqgN53v74dLPFV2smVXDvQ0
        f9Grp8po3LJSbx1xkU7N/HfwJiudIM3umIePLrMAP9xa9M1gkFpKvM0S59LulOs8l7D4et4aiQq3M
        NAWoD072DAi4BDe6MkFpMQnYax9+0jmMDept6EyJubKr+NbHSo2wqQFmlM+bb54iZcsG2c21oboie
        TlAiBbDyT9grJNjMXgpodwTW54AcS6EaaD/IgBhtltyQg0YAGDNhk9BX5f7auMFLOOr8w/dapvRJI
        vSAkyB0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34146)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVYTD-0003qY-55; Tue, 06 Sep 2022 14:18:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVYT8-0008IJ-Ka; Tue, 06 Sep 2022 14:18:22 +0100
Date:   Tue, 6 Sep 2022 14:18:22 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH v2 0/7] Add Apple Mac System Management Controller GPIOs
Message-ID: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

[Andy dropped from the Cc lists; he's taking a break.]

This series adds support for the Apple Mac GPIO driver. These GPIOs
are hadled via the System Management Controller.

The first two patches add the DT binding documentation for the new
drivers. No changes from the first posting (I think there's still
some discussion going on about how best to handle these.)

Patch 3 adds apple_rtkit_poll() and has had no changes since v1.

Patch 4 is new, extending the existing FourCC format code to be able
to print other endian FourCC codes.

Patch 5 adds the SMC core and rtkit driver. Changes in v2 include
properly limiting the data size (since it is limited to the width of
the size fields in the mailbox messages, not the shmem size) and also
to properly cleanup after failure to send the initialisation message.

Patch 6 adds the SMC GPIO support. Changes in v2 include some of the
issues Andy pointed out,

Patch 7 is new, adding the SMC nodes to the dtsi.

Patches taken from the Asahi project.

 Documentation/core-api/printk-formats.rst          |  32 ++
 .../devicetree/bindings/gpio/gpio-macsmc.yaml      |  28 ++
 .../devicetree/bindings/mfd/apple,smc.yaml         |  65 +++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  26 ++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 242 +++++++++++
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/apple/Kconfig                     |  49 +++
 drivers/platform/apple/Makefile                    |  11 +
 drivers/platform/apple/smc.h                       |  28 ++
 drivers/platform/apple/smc_core.c                  | 249 +++++++++++
 drivers/platform/apple/smc_rtkit.c                 | 453 +++++++++++++++++++++
 drivers/soc/apple/rtkit.c                          |   6 +
 include/linux/mfd/macsmc.h                         |  86 ++++
 include/linux/soc/apple/rtkit.h                    |  12 +
 lib/vsprintf.c                                     |  35 +-
 18 files changed, 1331 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c
 create mode 100644 drivers/platform/apple/Kconfig
 create mode 100644 drivers/platform/apple/Makefile
 create mode 100644 drivers/platform/apple/smc.h
 create mode 100644 drivers/platform/apple/smc_core.c
 create mode 100644 drivers/platform/apple/smc_rtkit.c
 create mode 100644 include/linux/mfd/macsmc.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
