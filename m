From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: [PATCH v2] gpio: TS-4800: remove useless bgpio_init flags
Date: Wed, 10 Feb 2016 12:20:34 -0500
Message-ID: <1455124834-18224-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, kernel@savoirfairelinux.com, julien.grossholtz@savoirfairelinux.com
List-Id: linux-gpio@vger.kernel.org

No flags are required for bgpio_init in the TS-4800 gpio driver. This
patch set zero instead. The driver will have the same behaviour since
the & operator between the flags already resulted to zero.

Fixes: 5041e791440a ("gpio: add TS-4800 fpga GPIO support")

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 drivers/gpio/gpio-ts4800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index c4908a4..9da79e4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -48,8 +48,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
 			    base_addr + OUTPUT_REG_OFFSET, NULL,
-			    base_addr + DIRECTION_REG_OFFSET, NULL,
-			    BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+			    base_addr + DIRECTION_REG_OFFSET, NULL, 0);
 	if (retval) {
 		dev_err(&pdev->dev, "bgpio_init failed\n");
 		return retval;
-- 
2.5.0
