From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] pinctrl: generic: Parse pinmux init nodes if node status is okay
Date: Fri, 28 Oct 2016 16:54:21 +0530
Message-ID: <1477653861-11921-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:14252 "EHLO
        hkmmgate102.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752497AbcJ1LkK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2016 07:40:10 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

During pinmux registration, pinmux table is parsed from DT
for making the pinmux table configuration of pins.

Parse the only those node whose status is not disabled.
This will help on reusing the pin configuration table across
platform and disabling the node by status property if that node
is not needed on given platform.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/pinconf-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 5020ae5..ce3335a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -381,7 +381,7 @@ int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto exit;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_available_child_of_node(np_config, np) {
 		ret = pinconf_generic_dt_subnode_to_map(pctldev, np, map,
 					&reserved_maps, num_maps, type);
 		if (ret < 0)
-- 
2.1.4

