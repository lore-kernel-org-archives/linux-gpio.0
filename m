From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 1/2] pinctrl: meson: introduce a macro to have name/groups seperated
Date: Mon, 8 Jan 2018 15:33:27 +0800
Message-ID: <20180108073328.205769-2-yixun.lan@amlogic.com>
References: <20180108073328.205769-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108073328.205769-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We introduce a macro FUNCTION_EX here, the main motivation is
trying to have the possibility to expand the macro with the same of the
'.name' number but different multiple '.groups/.num_groups' numbers.

With this change, the meson pinctrl drivr is capable of have one uniform
'function' name but with different pin 'groups', as we face the sitiuation
that two pin groups may live inside different hardware domain (EE vs AO domain),
which mean we couldn't put them in one single group.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 12a391109329..d8f705098810 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -124,13 +124,15 @@ struct meson_pinctrl {
 	struct device_node *of_node;
 };
 
-#define FUNCTION(fn)							\
+#define FUNCTION_EX(fn, ex)						\
 	{								\
 		.name = #fn,						\
-		.groups = fn ## _groups,				\
-		.num_groups = ARRAY_SIZE(fn ## _groups),		\
+		.groups = fn ## ex ## _groups,				\
+		.num_groups = ARRAY_SIZE(fn ## ex ## _groups),		\
 	}
 
+#define FUNCTION(fn)	FUNCTION_EX(fn, )
+
 #define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib)	\
 	{								\
 		.name		= n,					\
-- 
2.15.1
