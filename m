Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E062C10F1E
	for <linux-gpio@archiver.kernel.org>; Tue, 20 Dec 2022 13:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbiLTNY1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 20 Dec 2022 08:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiLTNYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2022 08:24:25 -0500
Received: from out-109.mta0.migadu.com (out-109.mta0.migadu.com [IPv6:2001:41d0:1004:224b::6d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C5619C2A
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2022 05:24:24 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1671542662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HluKQUyPDQmXT/c/JMdh4fY6uEULKKHgrMdg1mDDNN8=;
        b=wwpRQfUJVLAa2Q83vUc948GMv3Hmg/3B24wqogC84x1LDd5ZL/Pex3sYzKk3Eex1D9FCDi
        GEchnbk1kHfF318gztbe9cu2ItLwHBzyLfS6H1YtyEdIL8/cFSoG6wIv5taBdewXXzIfbz
        A72Miv5rpmK9c7Q7S4wQT2ULdPVMSnc=
From:   Cixi Geng <cixi.geng@linux.dev>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/3] Make the irqchip immutable
Date:   Tue, 20 Dec 2022 21:23:38 +0800
Message-Id: <20221220132341.19383-1-cixi.geng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Cixi Geng <cixi.geng1@unisoc.com>

Kernel warns about mutable irq_chips:
    "not an immutable chip, please consider fixing!"

Make the struct irq_chip const, flag it as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

changes:
split the patch by each driver. and other comment by baolin in[1]

Cixi Geng (3):
  gpio: eic-sprd: Make the irqchip immutable
  gpio: gpio-pmic-eic-sprd: Make the irqchip immutable
  gpio: gpio-sprd: Make the irqchip immutable

 drivers/gpio/gpio-eic-sprd.c      | 23 ++++++++++++++---------
 drivers/gpio/gpio-pmic-eic-sprd.c | 29 ++++++++++++++++++-----------
 drivers/gpio/gpio-sprd.c          |  8 ++++++--
 3 files changed, 38 insertions(+), 22 deletions(-)

-- 
2.34.1

