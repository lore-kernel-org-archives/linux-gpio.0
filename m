From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 1/2] pinctrl: Allow to create link between controller and consumer
Date: Wed, 22 May 2019 17:29:24 +0200
Message-ID: <20190522152925.12419-2-benjamin.gaignard@st.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, alexandre.torgue@st.com, amelie.delaunay@st.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@linaro.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: linux-gpio@vger.kernel.org

Pin controller may want to create a link between itself and its clients
to be sure of suspend/resume call ordering.
Introduce create_link field in pinctrl_desc structure to let pinctrl core
knows that controller expect to create a link.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pinctrl/core.c          | 11 +++++++++++
 include/linux/pinctrl/pinctrl.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c6ff4d5fa482..40b647f3dc7d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1216,6 +1216,15 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
 }
 EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
 
+static void pinctrl_link_add(struct pinctrl_dev *pctldev,
+			     struct device *consumer)
+{
+	if (pctldev->desc->create_link)
+		device_link_add(consumer, pctldev->dev,
+				DL_FLAG_PM_RUNTIME |
+				DL_FLAG_AUTOREMOVE_CONSUMER);
+}
+
 /**
  * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
@@ -1261,6 +1270,8 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		if (ret < 0) {
 			goto unapply_new_state;
 		}
+
+		pinctrl_link_add(setting->pctldev, p->dev);
 	}
 
 	p->state = state;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 8f5dbb84547a..11a42ccf4b0a 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -125,6 +125,7 @@ struct pinctrl_ops {
  *	the hardware description
  * @custom_conf_items: Information how to print @params in debugfs, must be
  *	the same size as the @custom_params, i.e. @num_custom_params
+ * @create_link: If true create a link between pinctrl and it consumer
  */
 struct pinctrl_desc {
 	const char *name;
@@ -139,6 +140,7 @@ struct pinctrl_desc {
 	const struct pinconf_generic_params *custom_params;
 	const struct pin_config_item *custom_conf_items;
 #endif
+	bool create_link;
 };
 
 /* External interface to pin controller */
-- 
2.15.0
