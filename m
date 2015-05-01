From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH] pinctrl: Don't just pretend to protect pinctrl_maps, do it for real
Date: Fri,  1 May 2015 09:01:27 -0700
Message-ID: <1430496088-5374-1-git-send-email-dianders@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:37412 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755063AbbEAQCB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 May 2015 12:02:01 -0400
Received: by igblo3 with SMTP id lo3so40722005igb.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2015 09:01:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrice Chotard <patrice.chotard@st.com>, Stephen Warren <swarren@wwwdotorg.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Way back, when the world was a simpler place and there was no war, no
evil, and no kernel bugs, there was just a single pinctrl lock.  That
was how the world was when (57291ce pinctrl: core device tree mapping
table parsing support) was written.  In that case, there were
instances where the pinctrl mutex was already held when
pinctrl_register_map() was called, hence a "locked" parameter was
passed to the function to indicate that the mutex was already locked
(so we shouldn't lock it again).

A few years ago in (42fed7b pinctrl: move subsystem mutex to
pinctrl_dev struct), we switched to a separate pinctrl_maps_mutex.
...but (oops) we forgot to re-think about the whole "locked" parameter
for pinctrl_register_map().  Basically the "locked" parameter appears
to still refer to whether the bigger pinctrl_dev mutex is locked, but
we're using it to skip locks of our (now separate) pinctrl_maps_mutex.

That's kind of a bad thing(TM).  Probably nobody noticed because most
of the calls to pinctrl_register_map happen at boot time and we've got
synchronous device probing.  ...and even cases where we're
asynchronous don't end up actually hitting the race too often.  ...but
after banging my head against the wall for a bug that reproduced 1 out
of 1000 reboots and lots of looking through kgdb, I finally noticed
this.

Anyway, we can now safely remove the "locked" parameter and go back to
a war-free, evil-free, and kernel-bug-free world.

Fixes: 42fed7ba44e4 ("pinctrl: move subsystem mutex to pinctrl_dev struct")
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/pinctrl/core.c       | 10 ++++------
 drivers/pinctrl/core.h       |  2 +-
 drivers/pinctrl/devicetree.c |  2 +-
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 89dca77..18ee208 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1110,7 +1110,7 @@ void devm_pinctrl_put(struct pinctrl *p)
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
 
 int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
-			 bool dup, bool locked)
+			 bool dup)
 {
 	int i, ret;
 	struct pinctrl_maps *maps_node;
@@ -1178,11 +1178,9 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 		maps_node->maps = maps;
 	}
 
-	if (!locked)
-		mutex_lock(&pinctrl_maps_mutex);
+	mutex_lock(&pinctrl_maps_mutex);
 	list_add_tail(&maps_node->node, &pinctrl_maps);
-	if (!locked)
-		mutex_unlock(&pinctrl_maps_mutex);
+	mutex_unlock(&pinctrl_maps_mutex);
 
 	return 0;
 }
@@ -1197,7 +1195,7 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 int pinctrl_register_mappings(struct pinctrl_map const *maps,
 			      unsigned num_maps)
 {
-	return pinctrl_register_map(maps, num_maps, true, false);
+	return pinctrl_register_map(maps, num_maps, true);
 }
 
 void pinctrl_unregister_map(struct pinctrl_map const *map)
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 75476b3..b24ea84 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -183,7 +183,7 @@ static inline struct pin_desc *pin_desc_get(struct pinctrl_dev *pctldev,
 }
 
 int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
-			 bool dup, bool locked);
+			 bool dup);
 void pinctrl_unregister_map(struct pinctrl_map const *map);
 
 extern int pinctrl_force_sleep(struct pinctrl_dev *pctldev);
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index eda13de..0bbf7d7 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -92,7 +92,7 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 	dt_map->num_maps = num_maps;
 	list_add_tail(&dt_map->node, &p->dt_maps);
 
-	return pinctrl_register_map(map, num_maps, false, true);
+	return pinctrl_register_map(map, num_maps, false);
 }
 
 struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
-- 
2.2.0.rc0.207.ga3a616c

