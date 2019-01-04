From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: sirf: atlas7: use struct_size() in devm_kzalloc()
Date: Fri, 4 Jan 2019 15:35:08 -0600
Message-ID: <20190104213508.GA20333@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
    int stuff;
    void *entry[];
};

instance = devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 4ba171827428..8a0eee044264 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -6007,8 +6007,8 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* retrieve gpio descriptor data */
-	a7gc = devm_kzalloc(&pdev->dev, sizeof(*a7gc) +
-			sizeof(struct atlas7_gpio_bank) * nbank, GFP_KERNEL);
+	a7gc = devm_kzalloc(&pdev->dev, struct_size(a7gc, banks, nbank),
+			    GFP_KERNEL);
 	if (!a7gc)
 		return -ENOMEM;
 
-- 
2.20.1
