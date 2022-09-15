Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74769ECAAD8
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Sep 2022 02:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiIOCN1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 14 Sep 2022 22:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiIOCNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 22:13:25 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504678FD52
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 19:13:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 46BB89005D1;
        Thu, 15 Sep 2022 10:13:23 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/3] pinctrl: export function get_pinctrl_dev_from_devname()
Date:   Thu, 15 Sep 2022 10:13:19 +0800
Message-Id: <20220915021320.80364-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915021320.80364-1-jay.xu@rock-chips.com>
References: <20220915021320.80364-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh8fVh8eQh4aGEMaSk8fHlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTI6Mgw4CD0iNi0dFQoVMw4r
        KQFPCgJVSlVKTU1ISUtDS0tIQkpPVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlPTUs3Bg++
X-HM-Tid: 0a833eec179f2eafkusn46bb89005d1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export get_pinctrl_dev_from_devname() as GPL and add to pinctrl head file.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/core.c          | 1 +
 include/linux/pinctrl/pinctrl.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9e57f4c62e60..af5194c42dc4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -118,6 +118,7 @@ struct pinctrl_dev *get_pinctrl_dev_from_devname(const char *devname)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(get_pinctrl_dev_from_devname);
 
 struct pinctrl_dev *get_pinctrl_dev_from_of_node(struct device_node *np)
 {
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 487117ccb1bc..a9923ccda574 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -219,5 +219,6 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
 extern const char *pinctrl_dev_get_devname(struct pinctrl_dev *pctldev);
 extern void *pinctrl_dev_get_drvdata(struct pinctrl_dev *pctldev);
+extern struct pinctrl_dev *get_pinctrl_dev_from_devname(const char *devname);
 
 #endif /* __LINUX_PINCTRL_PINCTRL_H */
-- 
2.25.1

