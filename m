From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] meson_sm: add TEST_N pin direction call
Date: Wed,  1 Aug 2018 12:04:08 +0200
Message-ID: <1533117848-28194-1-git-send-email-narmstrong@baylibre.com>
References: <1533117623-27856-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533117623-27856-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Amlogic Meson GX and AXG has a Secure Monitor call to change the
TEST_N pin gpio direction, add it in the supported call list.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/firmware/meson/meson_sm.c       | 1 +
 include/linux/firmware/meson/meson_sm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 0ec2ca8..f407001 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -48,6 +48,7 @@ struct meson_sm_chip gxbb_chip = {
 		CMD(SM_EFUSE_READ,	0x82000030),
 		CMD(SM_EFUSE_WRITE,	0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
+		CMD(SM_TEST_N_DIR,	0x82000046),
 		{ /* sentinel */ },
 	},
 };
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 37a5eae..133b1c3 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -17,6 +17,7 @@ enum {
 	SM_EFUSE_READ,
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
+	SM_TEST_N_DIR,
 };
 
 struct meson_sm_firmware;
-- 
2.7.4
