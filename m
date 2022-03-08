Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C903BC433FE
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Mar 2022 03:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiCHD0u (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 7 Mar 2022 22:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237858AbiCHD0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 22:26:47 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC6DD74
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 19:25:50 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 6ACE71DF60F;
        Tue,  8 Mar 2022 11:25:48 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 0/4] gpio-before-pinctrl
Date:   Tue,  8 Mar 2022 11:25:42 +0800
Message-Id: <20220308032546.2169929-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUNNHUxWTU1ISkpCTB
        5CQ05NVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6KRw5Mj5WATIUAzUqGS4q
        GA4aC01VSlVKTU9NTEtCQk9DQ09DVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpPT003Bg++
X-HM-Tid: 0a7f678fc0bada2bkuws6ace71df60f
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches make the gpio driver able to register independ on pinctrl,
and fix the output set before gpio register issue.

Jianqun Xu (4):
  gpio: rockchip: get regmap by devm_platform_ioremap_resource
  gpio: rockchip: get irq support for both dt and acpi
  gpio: rockchip: allow rockchip-gpio driver works independs on pinctrl
  pinctrl: rockchip: register gpio driver before pinctrl driver

 drivers/gpio/gpio-rockchip.c       | 230 ++++++++++++-----------------
 drivers/pinctrl/pinctrl-rockchip.c |  29 +++-
 2 files changed, 119 insertions(+), 140 deletions(-)

-- 
2.25.1

