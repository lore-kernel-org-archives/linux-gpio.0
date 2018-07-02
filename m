From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] pinctrl: Document pin_config_group_get() return codes like pin_config_get()
Date: Mon,  2 Jul 2018 15:59:37 -0700
Message-ID: <20180702225939.109169-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: iivanov@mm-sol.com, swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The pinconf_generic_dump_one() function makes the assumption that
pin_config_group_get() should return -EINVAL and -ENOTSUPP just like
pin_config_get() does.  Document that so it's more obvious.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/pinctrl/pinconf.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/pinconf.h
index 09eb80f2574a..8dd85d302b90 100644
--- a/include/linux/pinctrl/pinconf.h
+++ b/include/linux/pinctrl/pinconf.h
@@ -28,7 +28,8 @@ struct seq_file;
  *	is not available on this controller this should return -ENOTSUPP
  *	and if it is available but disabled it should return -EINVAL
  * @pin_config_set: configure an individual pin
- * @pin_config_group_get: get configurations for an entire pin group
+ * @pin_config_group_get: get configurations for an entire pin group; should
+ *	return -ENOTSUPP and -EINVAL using the same rules as pin_config_get.
  * @pin_config_group_set: configure all pins in a group
  * @pin_config_dbg_parse_modify: optional debugfs to modify a pin configuration
  * @pin_config_dbg_show: optional debugfs display hook that will provide
-- 
2.18.0.399.gad0ab374a1-goog
