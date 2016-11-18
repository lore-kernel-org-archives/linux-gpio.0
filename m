From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: sunxi: Testing the wrong variable
Date: Fri, 18 Nov 2016 14:35:57 +0300
Message-ID: <20161118113557.GA3281@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Rob Herring <robh@kernel.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>, Laxman Dewangan <ldewangan@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Smatch complains that we dereference "map" before testing it for NULL
which is true.  We should be testing "*map" instead.  Also on the error
path, we should free *map and set it to NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 2339d47..5b0acba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -398,13 +398,14 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * map array
 	 */
 	*map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
-	if (!map)
+	if (!*map)
 		return -ENOMEM;
 
 	return 0;
 
 err_free_map:
-	kfree(map);
+	kfree(*map);
+	*map = NULL;
 	return ret;
 }
 
