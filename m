Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F5EC433EF
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Mar 2022 06:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbiCHGUh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Mar 2022 01:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiCHGUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 01:20:36 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7BE340F8
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 22:19:39 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 23A861DF654;
        Tue,  8 Mar 2022 14:19:37 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH RESEND 0/4] gpio-before-pinctrl
Date:   Tue,  8 Mar 2022 14:19:31 +0800
Message-Id: <20220308061935.2441447-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUNPQh9WQkhDHUwZHh
        0eGkpIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6MRw5Hz4MDTJDPBcvKz40
        DwswC0pVSlVKTU9NTElLSExMTkNDVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpOS083Bg++
X-HM-Tid: 0a7f682ee1d8da2bkuws23a861df654
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches make the gpio driver able to register independ on pinctrl,
and fix the output set before gpio register issue.

Jianqun Xu (4):
  gpio: rockchip: get regmap by devm_platform_ioremap_resource
  gpio: rockchip: get irq support for both dt and acpi
  gpio: rockchip: support driver to work independs on pinctrl
  pinctrl: rockchip: register gpio driver before pinctrl driver

 drivers/gpio/gpio-rockchip.c       | 228 ++++++++++++-----------------
 drivers/pinctrl/pinctrl-rockchip.c |  90 ++++--------
 drivers/pinctrl/pinctrl-rockchip.h |   2 +-
 3 files changed, 123 insertions(+), 197 deletions(-)

-- 
2.25.1

