From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: move const qualifier before struct
Date: Fri,  4 Aug 2017 11:22:31 +0900
Message-ID: <1501813351-29541-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:40713 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751231AbdHDCXO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 22:23:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

Update subsystem wide for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/berlin/berlin.c |  4 ++--
 drivers/pinctrl/core.c          | 14 +++++++-------
 drivers/pinctrl/core.h          |  6 +++---
 drivers/pinctrl/pinconf.c       | 12 ++++++------
 drivers/pinctrl/pinconf.h       | 24 ++++++++++++------------
 drivers/pinctrl/pinmux.c        | 14 +++++++-------
 drivers/pinctrl/pinmux.h        | 29 ++++++++++++++---------------
 include/linux/pinctrl/machine.h |  4 ++--
 8 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 8f0dc02f7624..cc3bd2efafe3 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -206,8 +206,8 @@ static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 static int berlin_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
-	struct berlin_desc_group const *desc_group;
-	struct berlin_desc_function const *desc_function;
+	const struct berlin_desc_group *desc_group;
+	const struct berlin_desc_function *desc_function;
 	int i, max_functions = 0;
 
 	pctrl->nfunctions = 0;
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c5e2c5705058..89b9ca77daea 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -264,7 +264,7 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 }
 
 static int pinctrl_register_pins(struct pinctrl_dev *pctldev,
-				 struct pinctrl_pin_desc const *pins,
+				 const struct pinctrl_pin_desc *pins,
 				 unsigned num_descs)
 {
 	unsigned i;
@@ -907,7 +907,7 @@ static struct pinctrl_state *create_state(struct pinctrl *p,
 }
 
 static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
-		       struct pinctrl_map const *map)
+		       const struct pinctrl_map *map)
 {
 	struct pinctrl_state *state;
 	struct pinctrl_setting *setting;
@@ -995,7 +995,7 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	const char *devname;
 	struct pinctrl_maps *maps_node;
 	int i;
-	struct pinctrl_map const *map;
+	const struct pinctrl_map *map;
 	int ret;
 
 	/*
@@ -1321,7 +1321,7 @@ void devm_pinctrl_put(struct pinctrl *p)
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
 
-int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
+int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
 			 bool dup)
 {
 	int i, ret;
@@ -1402,13 +1402,13 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
  *	function will perform a shallow copy for the mapping entries.
  * @num_maps: the number of maps in the mapping table
  */
-int pinctrl_register_mappings(struct pinctrl_map const *maps,
+int pinctrl_register_mappings(const struct pinctrl_map *maps,
 			      unsigned num_maps)
 {
 	return pinctrl_register_map(maps, num_maps, true);
 }
 
-void pinctrl_unregister_map(struct pinctrl_map const *map)
+void pinctrl_unregister_map(const struct pinctrl_map *map)
 {
 	struct pinctrl_maps *maps_node;
 
@@ -1702,7 +1702,7 @@ static int pinctrl_maps_show(struct seq_file *s, void *what)
 {
 	struct pinctrl_maps *maps_node;
 	int i;
-	struct pinctrl_map const *map;
+	const struct pinctrl_map *map;
 
 	seq_puts(s, "Pinctrl maps:\n");
 
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 1c35de59a658..7880c3adc450 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -179,7 +179,7 @@ struct pin_desc {
  */
 struct pinctrl_maps {
 	struct list_head node;
-	struct pinctrl_map const *maps;
+	const struct pinctrl_map *maps;
 	unsigned num_maps;
 };
 
@@ -243,9 +243,9 @@ extern struct pinctrl_gpio_range *
 pinctrl_find_gpio_range_from_pin_nolock(struct pinctrl_dev *pctldev,
 					unsigned int pin);
 
-int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
+int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
 			 bool dup);
-void pinctrl_unregister_map(struct pinctrl_map const *map);
+void pinctrl_unregister_map(const struct pinctrl_map *map);
 
 extern int pinctrl_force_sleep(struct pinctrl_dev *pctldev);
 extern int pinctrl_force_default(struct pinctrl_dev *pctldev);
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 7fc417e4ae96..92f363793f35 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -37,7 +37,7 @@ int pinconf_check_ops(struct pinctrl_dev *pctldev)
 	return 0;
 }
 
-int pinconf_validate_map(struct pinctrl_map const *map, int i)
+int pinconf_validate_map(const struct pinctrl_map *map, int i)
 {
 	if (!map->data.configs.group_or_pin) {
 		pr_err("failed to register map %s (%d): no group/pin given\n",
@@ -106,7 +106,7 @@ int pin_config_group_get(const char *dev_name, const char *pin_group,
 	return ret;
 }
 
-int pinconf_map_to_setting(struct pinctrl_map const *map,
+int pinconf_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
@@ -143,11 +143,11 @@ int pinconf_map_to_setting(struct pinctrl_map const *map,
 	return 0;
 }
 
-void pinconf_free_setting(struct pinctrl_setting const *setting)
+void pinconf_free_setting(const struct pinctrl_setting *setting)
 {
 }
 
-int pinconf_apply_setting(struct pinctrl_setting const *setting)
+int pinconf_apply_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinconf_ops *ops = pctldev->desc->confops;
@@ -235,7 +235,7 @@ static void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
 	}
 }
 
-void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
+void pinconf_show_map(struct seq_file *s, const struct pinctrl_map *map)
 {
 	struct pinctrl_dev *pctldev;
 
@@ -259,7 +259,7 @@ void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
 }
 
 void pinconf_show_setting(struct seq_file *s,
-			  struct pinctrl_setting const *setting)
+			  const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index bf8aff9abf32..6c722505f893 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -14,11 +14,11 @@
 #ifdef CONFIG_PINCONF
 
 int pinconf_check_ops(struct pinctrl_dev *pctldev);
-int pinconf_validate_map(struct pinctrl_map const *map, int i);
-int pinconf_map_to_setting(struct pinctrl_map const *map,
+int pinconf_validate_map(const struct pinctrl_map *map, int i);
+int pinconf_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting);
-void pinconf_free_setting(struct pinctrl_setting const *setting);
-int pinconf_apply_setting(struct pinctrl_setting const *setting);
+void pinconf_free_setting(const struct pinctrl_setting *setting);
+int pinconf_apply_setting(const struct pinctrl_setting *setting);
 
 int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
 		       unsigned long *configs, size_t nconfigs);
@@ -39,22 +39,22 @@ static inline int pinconf_check_ops(struct pinctrl_dev *pctldev)
 	return 0;
 }
 
-static inline int pinconf_validate_map(struct pinctrl_map const *map, int i)
+static inline int pinconf_validate_map(const struct pinctrl_map *map, int i)
 {
 	return 0;
 }
 
-static inline int pinconf_map_to_setting(struct pinctrl_map const *map,
+static inline int pinconf_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting)
 {
 	return 0;
 }
 
-static inline void pinconf_free_setting(struct pinctrl_setting const *setting)
+static inline void pinconf_free_setting(const struct pinctrl_setting *setting)
 {
 }
 
-static inline int pinconf_apply_setting(struct pinctrl_setting const *setting)
+static inline int pinconf_apply_setting(const struct pinctrl_setting *setting)
 {
 	return 0;
 }
@@ -69,21 +69,21 @@ static inline int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
 
 #if defined(CONFIG_PINCONF) && defined(CONFIG_DEBUG_FS)
 
-void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map);
+void pinconf_show_map(struct seq_file *s, const struct pinctrl_map *map);
 void pinconf_show_setting(struct seq_file *s,
-			  struct pinctrl_setting const *setting);
+			  const struct pinctrl_setting *setting);
 void pinconf_init_device_debugfs(struct dentry *devroot,
 				 struct pinctrl_dev *pctldev);
 
 #else
 
 static inline void pinconf_show_map(struct seq_file *s,
-				    struct pinctrl_map const *map)
+				    const struct pinctrl_map *map)
 {
 }
 
 static inline void pinconf_show_setting(struct seq_file *s,
-			  struct pinctrl_setting const *setting)
+					const struct pinctrl_setting *setting)
 {
 }
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 16b3ae5e4f44..36d5da9dc587 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -61,7 +61,7 @@ int pinmux_check_ops(struct pinctrl_dev *pctldev)
 	return 0;
 }
 
-int pinmux_validate_map(struct pinctrl_map const *map, int i)
+int pinmux_validate_map(const struct pinctrl_map *map, int i)
 {
 	if (!map->data.mux.function) {
 		pr_err("failed to register map %s (%d): no function given\n",
@@ -312,7 +312,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
-int pinmux_map_to_setting(struct pinctrl_map const *map,
+int pinmux_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
@@ -372,12 +372,12 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 	return 0;
 }
 
-void pinmux_free_setting(struct pinctrl_setting const *setting)
+void pinmux_free_setting(const struct pinctrl_setting *setting)
 {
 	/* This function is currently unused */
 }
 
-int pinmux_enable_setting(struct pinctrl_setting const *setting)
+int pinmux_enable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
@@ -458,7 +458,7 @@ int pinmux_enable_setting(struct pinctrl_setting const *setting)
 	return ret;
 }
 
-void pinmux_disable_setting(struct pinctrl_setting const *setting)
+void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
@@ -627,7 +627,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 	return 0;
 }
 
-void pinmux_show_map(struct seq_file *s, struct pinctrl_map const *map)
+void pinmux_show_map(struct seq_file *s, const struct pinctrl_map *map)
 {
 	seq_printf(s, "group %s\nfunction %s\n",
 		map->data.mux.group ? map->data.mux.group : "(default)",
@@ -635,7 +635,7 @@ void pinmux_show_map(struct seq_file *s, struct pinctrl_map const *map)
 }
 
 void pinmux_show_setting(struct seq_file *s,
-			 struct pinctrl_setting const *setting)
+			 const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 248d8ea30e26..a331fcdbedd9 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -14,7 +14,7 @@
 
 int pinmux_check_ops(struct pinctrl_dev *pctldev);
 
-int pinmux_validate_map(struct pinctrl_map const *map, int i);
+int pinmux_validate_map(const struct pinctrl_map *map, int i);
 
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
@@ -25,11 +25,11 @@ int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
 			  struct pinctrl_gpio_range *range,
 			  unsigned pin, bool input);
 
-int pinmux_map_to_setting(struct pinctrl_map const *map,
+int pinmux_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting);
-void pinmux_free_setting(struct pinctrl_setting const *setting);
-int pinmux_enable_setting(struct pinctrl_setting const *setting);
-void pinmux_disable_setting(struct pinctrl_setting const *setting);
+void pinmux_free_setting(const struct pinctrl_setting *setting);
+int pinmux_enable_setting(const struct pinctrl_setting *setting);
+void pinmux_disable_setting(const struct pinctrl_setting *setting);
 
 #else
 
@@ -38,7 +38,7 @@ static inline int pinmux_check_ops(struct pinctrl_dev *pctldev)
 	return 0;
 }
 
-static inline int pinmux_validate_map(struct pinctrl_map const *map, int i)
+static inline int pinmux_validate_map(const struct pinctrl_map *map, int i)
 {
 	return 0;
 }
@@ -63,23 +63,22 @@ static inline int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static inline int pinmux_map_to_setting(struct pinctrl_map const *map,
+static inline int pinmux_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting)
 {
 	return 0;
 }
 
-static inline void pinmux_free_setting(struct pinctrl_setting const *setting)
+static inline void pinmux_free_setting(const struct pinctrl_setting *setting)
 {
 }
 
-static inline int pinmux_enable_setting(struct pinctrl_setting const *setting)
+static inline int pinmux_enable_setting(const struct pinctrl_setting *setting)
 {
 	return 0;
 }
 
-static inline void pinmux_disable_setting(
-			struct pinctrl_setting const *setting)
+static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 }
 
@@ -87,21 +86,21 @@ static inline void pinmux_disable_setting(
 
 #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
 
-void pinmux_show_map(struct seq_file *s, struct pinctrl_map const *map);
+void pinmux_show_map(struct seq_file *s, const struct pinctrl_map *map);
 void pinmux_show_setting(struct seq_file *s,
-			 struct pinctrl_setting const *setting);
+			 const struct pinctrl_setting *setting);
 void pinmux_init_device_debugfs(struct dentry *devroot,
 				struct pinctrl_dev *pctldev);
 
 #else
 
 static inline void pinmux_show_map(struct seq_file *s,
-				   struct pinctrl_map const *map)
+				   const struct pinctrl_map *map)
 {
 }
 
 static inline void pinmux_show_setting(struct seq_file *s,
-				       struct pinctrl_setting const *setting)
+				       const struct pinctrl_setting *setting)
 {
 }
 
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index e5b1716f98cc..7fa5d87190c2 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -152,12 +152,12 @@ struct pinctrl_map {
 
 #ifdef CONFIG_PINCTRL
 
-extern int pinctrl_register_mappings(struct pinctrl_map const *map,
+extern int pinctrl_register_mappings(const struct pinctrl_map *map,
 				unsigned num_maps);
 extern void pinctrl_provide_dummies(void);
 #else
 
-static inline int pinctrl_register_mappings(struct pinctrl_map const *map,
+static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
 					   unsigned num_maps)
 {
 	return 0;
-- 
2.7.4

