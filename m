From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: mcp23s08: use struct_size() in devm_kzalloc()
Date: Fri, 4 Jan 2019 11:37:33 -0600
Message-ID: <20190104173733.GA29979@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
 drivers/pinctrl/pinctrl-mcp23s08.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index b03481ef99a1..6b4def13df8f 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -1139,8 +1139,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 		return -ENODEV;
 
 	data = devm_kzalloc(&spi->dev,
-			    sizeof(*data) + chips * sizeof(struct mcp23s08),
-			    GFP_KERNEL);
+			    struct_size(data, chip, chips), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-- 
2.20.1
