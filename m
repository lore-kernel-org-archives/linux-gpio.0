From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] pinctrl: Don't create a pinctrl handle if no pinctrl entries exist
Date: Thu, 16 Jun 2016 13:39:09 +0100
Message-ID: <1466080749-23567-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8625 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753919AbcFPMjX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2016 08:39:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>

When pinctrl_get() is called for a device, it will return a valid handle
even if the device itself has no pinctrl state entries defined in
device-tree. This is caused by the function pinctrl_dt_to_map() which
will return success even if the first pinctrl state, 'pinctrl-0', is not
found in the device-tree node for a device.

According to the pinctrl device-tree binding documentation, pinctrl
states must be numbered starting from 0 and so 'pinctrl-0' should always
be present if a device uses pinctrl and therefore, if 'pinctrl-0' is not
present it seems valid that we should not return a valid pinctrl handle.

Fix this by returning an error code if the property 'pinctrl-0' is not
present for a device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

I was wondering if this meant we are creating pinctrl handles for
devices on boot that don't use pinctrl (when
calling pinctrl_bind_pins()). However, although devm_pinctrl_get()
does return successful for all devices, the subsequent call to
pinctrl_lookup_state() (to get the default state) will fail and so
we will destroy the pinctrl handle afterall.

 drivers/pinctrl/devicetree.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index fe04e748dfe4..f41c16e11a11 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -195,8 +195,11 @@ int pinctrl_dt_to_map(struct pinctrl *p)
 		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
 		prop = of_find_property(np, propname, &size);
 		kfree(propname);
-		if (!prop)
+		if (!prop) {
+			if (state == 0)
+				return -ENODEV;
 			break;
+		}
 		list = prop->value;
 		size /= sizeof(*list);
 
-- 
2.1.4

