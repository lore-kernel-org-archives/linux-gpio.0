Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C42C47083
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Jun 2021 11:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD3E6140C
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Jun 2021 11:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhFDLys (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 4 Jun 2021 07:54:48 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:38483 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhFDLys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 07:54:48 -0400
Received: by mail-wm1-f46.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso7732666wmi.3;
        Fri, 04 Jun 2021 04:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+D9StzdN0vpopnheERzUXaZ4q93k/9Dx6vRNCqWeUrg=;
        b=GH7N2wRtV/K+Wap9/nuBByV6soY17GWg07RYNaFVloCbx/tx+5jYLNdEdl32JQ6gtf
         8GDtqGR3sYeUEgbdy7RPiD2Pg3URvxPjaZFwYX6S9Kce7/iZQqbT6vJN65qRR29UaERH
         p1Cp3peuc+COiX75KBMzWmKKfZl2AeWEDYOFMlqDWv5KDzTMQ3ISCRwjjBqk7LWNwL03
         raMjKMct52L7H1LDq6NN4gSh+gk49+OsmYNpRD6ALALiR2RaiCWHxlMHLpNHwcSqFks1
         3wJeI05nGKC5XCM40MkXlUipd/443yPQe1Ijsl4lDwZtxO9wP7F+Q4Ug2pIjRl//f/Ku
         o/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+D9StzdN0vpopnheERzUXaZ4q93k/9Dx6vRNCqWeUrg=;
        b=Z5BwQIJ5FIIpXWJpCjLr64eI654xpEe63Dl+m6bBssKmQatk1mjry5FwwOONFGylro
         vd5/oiTs7zB9yW0pOxrlwjS+D2/GjmXwOA0uIGAG9LGWOlnuTabnCOQr2MXrIkKbqZw3
         /hcdQ8B6+W7SgXJ6BuBWSvcPZol7X+pdMbIF1rkiF5togbWukYS55jjGRlvTnl12OQRT
         o1+NET6gSZ0Ss8M1Azgm2S+Qi+HCTckYaRsJwEvJfoMF+R1x1o2e5Acpnw8xazeFng2m
         Jg+1jsGA2z0TbIPhZLT9jZh6crgOXsCsHGPDh2Su6txS4VzxaOXDaPooSEgFV77FdYNx
         dReg==
X-Gm-Message-State: AOAM5327QgIOWLD0x48mJTJnKU3II18WVWHZeTtS2nMXyz2C4c0eXv17
        65Occ0C3Y9VqMQMsIaaDoMY=
X-Google-Smtp-Source: ABdhPJxrFLUv28ChAPK1F4+Ght3tufcz5mIblaM9Y4oGsPIrIk0pIMkKQrC9kYMnI5du4Z0xZ6vLkg==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr3238101wmj.109.1622807521197;
        Fri, 04 Jun 2021 04:52:01 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:00 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 0/6] pinctrl: ralink: move all pinmux arch stuff into driver code
Date:   Fri,  4 Jun 2021 13:51:53 +0200
Message-Id: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ralink architecture have all pinmux config for different SoCs in architecture
headers. This SoCs configs are:
 - CONFIG_SOC_RT288X
 - CONFIG_SOC_RT305X
 - CONFIG_SOC_RT3883
 - CONFIG_SOC_MT7620
 - CONFIG_SOC_MT7621

We currently have 'drivers/pinctrl/ralink/' with common code to all of them
in 'pinctrl-rt2880.c' file. Pinctrl data was being passed in SoC initilization
to the driver. Instead of doing that just move all related code to the driver
itself. We maintain for all of them compatible string to avoid to make more
changes in dts's an so on. If a new compatible string is neccessary to be
defined for each different SoC, we can change them after this series are
applied.

I have only tested MT7621 platform using GNUBee PC1 board. I don't have
other boards to test other SoC changes.

This series are rebased on the master branch of linux-pinctrl git tree so
I expect this to be merged through pinctrl tree. Thomas, if 'linux-mips' 
is preferred to merge this series just let me know and I can rebase them
to make you things easier.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (6):
  pinctrl: ralink: move ralink architecture pinmux header into the
    driver
  pinctrl: ralink: move MT7621 SoC pinmux config into a new
    'pinctrl-mt7621.c' file
  pinctrl: ralink: move RT3883 SoC pinmux config into a new
    'pinctrl-rt3883.c' file
  pinctrl: ralink: move RT305X SoC pinmux config into a new
    'pinctrl-rt305x.c' file
  pinctrl: ralink: move MT7620 SoC pinmux config into a new
    'pinctrl-mt7620.c' file
  pinctrl: ralink: move RT288X SoC pinmux config into a new
    'pinctrl-rt288x.c' file

 arch/mips/include/asm/mach-ralink/mt7620.h    |  53 +-
 arch/mips/include/asm/mach-ralink/rt288x.h    |   9 -
 arch/mips/include/asm/mach-ralink/rt305x.h    |  24 -
 arch/mips/include/asm/mach-ralink/rt3883.h    |  34 --
 arch/mips/ralink/mt7620.c                     | 320 ------------
 arch/mips/ralink/mt7621.c                     |  88 ----
 arch/mips/ralink/prom.c                       |   1 -
 arch/mips/ralink/rt288x.c                     |  21 -
 arch/mips/ralink/rt305x.c                     |  77 ---
 arch/mips/ralink/rt3883.c                     |  45 --
 drivers/pinctrl/ralink/Kconfig                |  25 +
 drivers/pinctrl/ralink/Makefile               |   6 +
 .../pinctrl/ralink/pinctrl-mt7620.c           | 472 +++---------------
 drivers/pinctrl/ralink/pinctrl-mt7621.c       | 116 +++++
 drivers/pinctrl/ralink/pinctrl-rt2880.c       |  30 +-
 drivers/pinctrl/ralink/pinctrl-rt288x.c       |  60 +++
 drivers/pinctrl/ralink/pinctrl-rt305x.c       | 136 +++++
 drivers/pinctrl/ralink/pinctrl-rt3883.c       | 107 ++++
 .../pinctrl/ralink}/pinmux.h                  |   3 +-
 19 files changed, 536 insertions(+), 1091 deletions(-)
 copy arch/mips/ralink/mt7620.c => drivers/pinctrl/ralink/pinctrl-mt7620.c (51%)
 create mode 100644 drivers/pinctrl/ralink/pinctrl-mt7621.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt288x.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt305x.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt3883.c
 rename {arch/mips/include/asm/mach-ralink => drivers/pinctrl/ralink}/pinmux.h (91%)

-- 
2.25.1

