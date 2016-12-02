From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [RFC v2 3/3] pinctrl: imx: add of_notifier for dynamic pinctrl changes
Date: Fri,  2 Dec 2016 17:35:20 +0100
Message-ID: <20161202163520.22927-4-gary.bisson@boundarydevices.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161202163520.22927-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, pantelis.antoniou@konsulko.com, vladimir_zapolskiy@mentor.com, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: linux-gpio@vger.kernel.org

Currently the implementation is limited:
- can only add a new function
- if function already exists, it is discarded
- requires the dtso to know about this architecture

Another option would be to do like the pinctrl-single where each
group has its own function. Therefore it is easy to manage them.

Currently there's no easy way to add/remove groups to an existing
function.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This implementation is far from ideal. It must be seen as a starting
point more than anything else.

The goal was to have the simplest patch possible. Here a group cannot
be added to an existing function. But a new function can be created.

There's currently no way to remove the group that has been added.

Regards,
Gary
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 103 ++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index e832a2c..5951a31 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -811,6 +811,106 @@ static void imx_free_resources(struct imx_pinctrl *ipctl)
 	imx_free_pingroups(ipctl->info);
 }
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+static int imx_pinctrl_add_function(struct device_node *np,
+				    struct imx_pinctrl_soc_info *info)
+{
+	struct imx_pmx_func *func;
+	u32 i = 0;
+
+	for (i = 0; i < info->nfunctions; i++) {
+		struct imx_pmx_func *func;
+
+		func = radix_tree_lookup(&info->ftree, i);
+		if (!func)
+			continue;
+
+		if (!strcmp(func->name, np->name)) {
+			dev_err(info->dev, "function %s already exists!\n",
+				np->name);
+			return -EINVAL;
+		}
+	}
+
+	/* Create a new function */
+	func = devm_kzalloc(info->dev, sizeof(*func), GFP_KERNEL);
+	if (!func)
+		return -ENOMEM;
+
+	mutex_lock(&info->mutex);
+	radix_tree_insert(&info->ftree, info->nfunctions, func);
+	info->ngroups += of_get_child_count(np);
+	mutex_unlock(&info->mutex);
+
+	imx_pinctrl_parse_functions(np, info, info->nfunctions);
+
+	mutex_lock(&info->mutex);
+	info->nfunctions++;
+	mutex_unlock(&info->mutex);
+
+	return 0;
+}
+
+static inline struct platform_device *imx_get_device(struct device_node *np)
+{
+	struct platform_device *pdev = of_find_device_by_node(np->parent);
+
+	if (!pdev)
+		pdev = of_find_device_by_node(np->parent->parent);
+
+	return pdev;
+}
+
+static int of_pinctrl_notify(struct notifier_block *nb, unsigned long action,
+			     void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct platform_device *pdev;
+	struct imx_pinctrl *ipctl;
+	int ret;
+
+	/* Looking for a pinctrl group node */
+	if (!of_property_read_bool(rd->dn, "fsl,pins"))
+		return NOTIFY_OK; /* not for us */
+
+	switch (of_reconfig_get_state_change(action, rd)) {
+	case OF_RECONFIG_CHANGE_ADD:
+		pdev = imx_get_device(rd->dn);
+		if (!pdev) {
+			pr_err("%s: couldn't find device\n", __func__);
+			return NOTIFY_OK;
+		}
+
+		ipctl = dev_get_drvdata(&pdev->dev);
+		if (!pdev) {
+			dev_err(&pdev->dev, "driver data not found\n");
+			return NOTIFY_OK;
+		}
+
+		ret = imx_pinctrl_add_function(rd->dn->parent, ipctl->info);
+		if (ret < 0)
+			dev_err(&pdev->dev, "couldn't add function: %d\n", ret);
+
+		break;
+	case OF_RECONFIG_CHANGE_REMOVE:
+		pdev = imx_get_device(rd->dn);
+		if (!pdev) {
+			pr_err("%s: couldn't find device\n", __func__);
+			return NOTIFY_OK;
+		}
+		dev_err(&pdev->dev, "removing a function isn't supported\n");
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+static struct notifier_block pinctrl_of_notifier = {
+	.notifier_call = of_pinctrl_notify,
+};
+#else
+extern struct notifier_block pinctrl_of_notifier;
+#endif /* CONFIG_OF_DYNAMIC */
+
 int imx_pinctrl_probe(struct platform_device *pdev,
 		      struct imx_pinctrl_soc_info *info)
 {
@@ -906,6 +1006,9 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 		goto free;
 	}
 
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_register(&pinctrl_of_notifier));
+
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return 0;
-- 
2.9.3
