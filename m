Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52C6C64E8A
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Dec 2020 09:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D0392222E
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Dec 2020 09:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgLBJcz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 2 Dec 2020 04:32:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8554 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbgLBJcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:32:55 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmDJ330DdzhkFb;
        Wed,  2 Dec 2020 17:31:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Dec 2020
 17:32:05 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v1 0/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Date:   Wed, 2 Dec 2020 17:32:20 +0800
Message-ID: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is the GPIO driver for HiSilicon's ARM SoC.
It provide patches for device driver, MAINTAINER file, and enable gpio-hisi
at defconfig.

Thanks
Jiaxing

Luo Jiaxing (3):
  gpio: gpio-hisi: Add HiSilicon GPIO support
  MAINTAINERS: Add maintainer for HiSilicon GPIO driver
  arm64: defconfig: enable GPIO_HISI

 MAINTAINERS                  |   7 +
 arch/arm64/configs/defconfig |   1 +
 drivers/gpio/Kconfig         |  11 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-hisi.c     | 356 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 376 insertions(+)
 create mode 100644 drivers/gpio/gpio-hisi.c

-- 
2.7.4

