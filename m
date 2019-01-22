From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 1/2] pinctrl: remove pinctrl/machine.h inclusion from pinctrl/pinconf.h
Date: Tue, 22 Jan 2019 23:18:21 +0200
Message-ID: <20190122211822.7016-2-vz@mleia.com>
References: <20190122211822.7016-1-vz@mleia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122211822.7016-1-vz@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Meunier <laurent.meunier@st.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Russell King <linux@arm.linux.org.uk>, Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

The change adds explicit inclusion of linux/pinctrl/machine.h header
to the only needed pinctrl-madera-core.c file, and therefore inclusion
of pinctrl/machine.h header from pinctrl/pinconf.h can be removed.

The change is preparatory to a follow-up reversal of commit f07512e615dd
("pinctrl/pinconfig: add debug interface").

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes from v1 to v2:
* new change to mitigate a compile time warning caused by a removal of
  implicit header inclusion, the issue was reported against v1 change.

This change might be percepted as a bit awkward, but I leave a room to
extend it to other drivers, if it becomes needed. However apparently
only pinctrl/cirrus/pinctrl-madera-core.c misses explicit inclusion of
linux/pinctrl/machine.h header.

 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 1 +
 include/linux/pinctrl/pinconf.h              | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index a5dda832024a..7c9694593f79 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/pinconf.h
index 8dd85d302b90..109468d9d849 100644
--- a/include/linux/pinctrl/pinconf.h
+++ b/include/linux/pinctrl/pinconf.h
@@ -14,8 +14,6 @@
 
 #ifdef CONFIG_PINCONF
 
-#include <linux/pinctrl/machine.h>
-
 struct pinctrl_dev;
 struct seq_file;
 
-- 
2.20.1
