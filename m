From: Insu Yun <wuninsu@gmail.com>
Subject: [PATCH] gpio-mcp23s08: correctly handling failed allocation
Date: Mon, 15 Feb 2016 21:19:57 -0500
Message-ID: <1455589197-6576-1-git-send-email-wuninsu@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: taesoo@gatech.edu, yeongjin.jang@gatech.edu, insu@gatech.edu, changwoo@gatech.edu, Insu Yun <wuninsu@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Since devm_kzalloc can be failed in memory pressure,
it needs to check and return -ENOMEM

Signed-off-by: Insu Yun <wuninsu@gmail.com>
---
 drivers/gpio/gpio-mcp23s08.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index c767879..ed51dcf 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -803,6 +803,8 @@ static int mcp230xx_probe(struct i2c_client *client,
 			pdata = devm_kzalloc(&client->dev,
 					sizeof(struct mcp23s08_platform_data),
 					GFP_KERNEL);
+			if (!pdata)
+				return -ENOMEM;
 			pdata->base = -1;
 		}
 	}
-- 
1.9.1
