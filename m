From: Rob Jones <rob.jones@codethink.co.uk>
Subject: [PATCH 3/4] drivers/base: devres.c: use devm_kmemdup() from with devm_kstrdup()
Date: Thu, 19 Jun 2014 16:46:04 +0100
Message-ID: <1403192765-3258-4-git-send-email-rob.jones@codethink.co.uk>
References: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@codethink.co.uk, ian.molton@codethink.co.uk, ben.dooks@codethink.co.uk, heiko@sntech.de, rob.jones@codethink.co.uk
List-Id: linux-gpio@vger.kernel.org

Avoid code duplication by using devm_kmemdup() to copy data instead
of having a separate loop within devm_kstrdup().

Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
Signed-off-by: Rob Jones <rob.jones@codethink.co.uk>
---
 drivers/base/devres.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 9d0f64c..cf19664 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -802,17 +802,10 @@ EXPORT_SYMBOL_GPL(devm_kmalloc);
  */
 char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
 {
-	size_t size;
-	char *buf;
-
 	if (!s)
 		return NULL;
 
-	size = strlen(s) + 1;
-	buf = devm_kmalloc(dev, size, gfp);
-	if (buf)
-		memcpy(buf, s, size);
-	return buf;
+	return devm_kmemdup(dev, s, (strlen(s) + 1), gfp);
 }
 EXPORT_SYMBOL_GPL(devm_kstrdup);
 
-- 
1.7.10.4
