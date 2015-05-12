From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH] gpio: pinctrl: Initialize Armada-XP GPIO/Pinctrl drivers at arch_initcall
Date: Tue, 12 May 2015 14:39:42 +1200
Message-ID: <1431398382-1894-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39247 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbbELCli (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 22:41:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Fabian Frederick <fabf@skynet.be>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Joshua Scott <joshua.scott@alliedtelesis.co.nz>

The Armada-XP contains a set of GPIO pins. These pins may be used to take
other hardware out of reset. However, the drivers used are currently not
initialized until quite late in the boot process (module_platform_driver).

This patch replaces the use of module_platform_driver with arch_initcall
in the two drivers that are used to control the GPIO pins. This allows for
drivers using subsys_initcall or later to access to the pins.


Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/gpio/gpio-mvebu.c                 | 13 ++++++++++++-
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c | 12 +++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 1a54205..3dd7e23 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -860,4 +860,15 @@ static struct platform_driver mvebu_gpio_driver = {
 	.suspend        = mvebu_gpio_suspend,
 	.resume         = mvebu_gpio_resume,
 };
-module_platform_driver(mvebu_gpio_driver);
+
+static int __init mvebu_gpio_driver_init(void)
+{
+	return platform_driver_register(&mvebu_gpio_driver);
+}
+arch_initcall(mvebu_gpio_driver_init);
+
+static void __exit mvebu_gpio_driver_exit(void)
+{
+	platform_driver_unregister(&mvebu_gpio_driver);
+}
+module_exit(mvebu_gpio_driver_exit);
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
index 578db9f..609c732 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
@@ -518,7 +518,17 @@ static struct platform_driver armada_xp_pinctrl_driver = {
 	.resume = armada_xp_pinctrl_resume,
 };
 
-module_platform_driver(armada_xp_pinctrl_driver);
+static int __init armada_xp_pinctrl_init(void)
+{
+	return platform_driver_register(&armada_xp_pinctrl_driver);
+}
+arch_initcall(armada_xp_pinctrl_init);
+
+static void __exit armada_xp_pinctrl_exit(void)
+{
+	platform_driver_unregister(&armada_xp_pinctrl_driver);
+}
+module_exit(armada_xp_pinctrl_exit);
 
 MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
 MODULE_DESCRIPTION("Marvell Armada XP pinctrl driver");
-- 
1.9.1

