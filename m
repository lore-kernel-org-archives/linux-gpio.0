From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 3/5] pinctrl: st: fix leaked of_node references
Date: Fri, 12 Apr 2019 14:02:21 +0800
Message-ID: <1555048943-39589-4-git-send-email-wen.yang99@zte.com.cn>
References: <1555048943-39589-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555048943-39589-1-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>, Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The call to of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/pinctrl/pinctrl-st.c:1188:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
./drivers/pinctrl/pinctrl-st.c:1188:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
./drivers/pinctrl/pinctrl-st.c:1199:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
./drivers/pinctrl/pinctrl-st.c:1199:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org (open list)
---
 drivers/pinctrl/pinctrl-st.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index e66af93..195b442 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1170,7 +1170,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	struct property *pp;
 	struct st_pinconf *conf;
 	struct device_node *pins;
-	int i = 0, npins = 0, nr_props;
+	int i = 0, npins = 0, nr_props, ret = 0;
 
 	pins = of_get_child_by_name(np, "st,pins");
 	if (!pins)
@@ -1185,7 +1185,8 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 			npins++;
 		} else {
 			pr_warn("Invalid st,pins in %pOFn node\n", np);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_put_node;
 		}
 	}
 
@@ -1195,8 +1196,10 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	grp->pin_conf = devm_kcalloc(info->dev,
 					npins, sizeof(*conf), GFP_KERNEL);
 
-	if (!grp->pins || !grp->pin_conf)
-		return -ENOMEM;
+	if (!grp->pins || !grp->pin_conf) {
+		ret = -ENOMEM;
+		goto out_put_node;
+	}
 
 	/* <bank offset mux direction rt_type rt_delay rt_clk> */
 	for_each_property_of_node(pins, pp) {
@@ -1229,9 +1232,11 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 		}
 		i++;
 	}
+
+out_put_node:
 	of_node_put(pins);
 
-	return 0;
+	return ret;
 }
 
 static int st_pctl_parse_functions(struct device_node *np,
-- 
2.9.5
