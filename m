Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CD8C6FA82
	for <linux-gpio@archiver.kernel.org>; Sat, 17 Sep 2022 03:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiIQDco (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 16 Sep 2022 23:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQDcn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 23:32:43 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA677B2A7
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 20:32:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id C4A829003B1;
        Sat, 17 Sep 2022 11:32:39 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 0/2] rockchip pinctrl for acpi
Date:   Sat, 17 Sep 2022 11:32:37 +0800
Message-Id: <20220917033239.626597-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHRofVhkZHUxNQ0JNS01PTlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06TRw*LT0YDBoQSChWKTM2
        KSMaCglVSlVKTU1ISENOTk1LSExLVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpPT0M3Bg++
X-HM-Tid: 0a83498163b32eafkusnc4a829003b1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patch fixes to support acpi by:
1. populate gpio platform before pinctrl to probe
2. get gpiochip by finding from gpiochip list
3. get match data by device api

Jianqun Xu (2):
  pinctrl: rockchip: find gpiochip by name from gpio module
  pinctrl: rockchip: get match data by device_get_match_data

 drivers/pinctrl/pinctrl-rockchip.c | 62 +++++++++++++++++++++---------
 drivers/pinctrl/pinctrl-rockchip.h |  2 +-
 2 files changed, 45 insertions(+), 19 deletions(-)

-- 
v2:
 - add a second patch to support acpi

2.25.1

