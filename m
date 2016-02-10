From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: TS-4800: remove useless bgpio_init flags
Date: Wed, 10 Feb 2016 12:17:26 -0500 (EST)
Message-ID: <1215789090.353270.1455124646607.JavaMail.zimbra@savoirfairelinux.com>
References: <1455123514-17152-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:49699 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751562AbcBJRR3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 12:17:29 -0500
In-Reply-To: <1455123514-17152-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus walleij <linus.walleij@linaro.org>
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, kernel@savoirfairelinux.com

From: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>
To: "linus walleij" <linus.walleij@linaro.org>
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Dan Carpenter" <dan.carpenter@oracle.com>, kernel@savoirfairelinux.com, "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>
Sent: Wednesday, February 10, 2016 11:58:34 AM
Subject: [PATCH] gpio: TS-4800: remove useless bgpio_init flags

No flags are required for bgpio_init in the TS-4800 gpio driver. This
patch set zero instead. The driver will have the same behaviour since
the | operator between the flags already resulted to zero.

There is a typo here, I will send it again.

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
