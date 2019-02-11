From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] gpio: sprd: Add missing break in switch statement
Date: Mon, 11 Feb 2019 12:50:01 -0600
Message-ID: <20190211185001.GA19472@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Fix the following warning by adding a missing break:

drivers/gpio/gpio-eic-sprd.c: In function ‘sprd_eic_irq_set_type’:
drivers/gpio/gpio-eic-sprd.c:403:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   switch (flow_type) {
   ^~~~~~
drivers/gpio/gpio-eic-sprd.c:435:2: note: here
  default:
  ^~~~~~~

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpio/gpio-eic-sprd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index e41223c05f6e..f0223cee9774 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -432,6 +432,7 @@ static int sprd_eic_irq_set_type(struct irq_data *data, unsigned int flow_type)
 		default:
 			return -ENOTSUPP;
 		}
+		break;
 	default:
 		dev_err(chip->parent, "Unsupported EIC type.\n");
 		return -ENOTSUPP;
-- 
2.20.1
