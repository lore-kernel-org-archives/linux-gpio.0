From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: [PATCH] Pinctrl: imx1: fix wrong pin-name resolving
Date: Sat, 23 May 2015 15:34:58 +0800
Message-ID: <1432366498-4527-1-git-send-email-chris.ruehl@gtsys.com.hk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.fpasia.hk ([202.130.89.98]:32909 "EHLO fpa01n0.fpasia.hk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757176AbbEWHpL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 23 May 2015 03:45:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Chris Ruehl <chris.ruehl@gtsys.com.hk>

Bug in function imx1_pinconf_set() cause crash when
princtrl debug is enabled and the pin_id becomes larger
then the info->pins[] contains.

imx27-pinctrl 10015000.iomuxc: request pin 134 (MX27_PAD_UART2_TXD) for 1000b000.serial
imx27-pinctrl 10015000.iomuxc: request pin 135 (MX27_PAD_UART2_RXD) for 1000b000.serial
imx27-pinctrl 10015000.iomuxc: request pin 131 (MX27_PAD_UART2_CTS) for 1000b000.serial
imx27-pinctrl 10015000.iomuxc: request pin 132 (MX27_PAD_UART2_RTS) for 1000b000.serial
imx27-pinctrl 10015000.iomuxc: enable function uart group uart2-1
imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x86, function 0, gpio 0, direction 1, oconf 0, iconfa 0, iconfb 0
imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x87, function 0, gpio 0, direction 0, oconf 0, iconfa 0, iconfb 0
imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x83, function 0, gpio 0, direction 1, oconf 0, iconfa 0, iconfb 0
imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x84, function 0, gpio 0, direction 0, oconf 0, iconfa 0, iconfb 0
imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=134
imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_RTS
imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=135
imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_RTCK
imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=131
imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_TXD
imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=132
imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_RXD
...
imx27-pinctrl 10015000.iomuxc: write: register 0xf4415508 offset 4 value 0x3
imx27-pinctrl 10015000.iomuxc: write: register 0xf4415510 offset 4 value 0x0
imx27-pinctrl 10015000.iomuxc: write: register 0xf4415518 offset 4 value 0x0
imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0xb5, function 0, gpio 0, direction 1, oconf 0, iconfa 0, iconfb 0
imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=171
Unable to handle kernel paging request at virtual address 6c61765f
pgd = c0004000
6c61765f] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-rc4-next-20150522-dirty #8
Hardware name: GTSYS i.MX27GTSIR (Device Tree Support)
task: ce832000 ti: ce848000 task.ti: ce848000
PC is at strnlen+0x28/0x3c
LR is at string.isra.4+0x34/0xcc
pc : [<c01ae188>]    lr : [<c01af9a4>]    psr: 20000093
sp : ce849a88  ip : ce849a98  fp : ce849a94
r10: c05d7e3a  r9 : c05d81e4  r8 : 00000000
r7 : 6c61765f  r6 : c05d81e4  r5 : ffffffff  r4 : c05d7e3a
r3 : 6c61765f  r2 : 6c61765f  r1 : 6c61765e  r0 : 6c61765f
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel


Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 5ac59fb..8408bd8 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -403,14 +403,16 @@ static int imx1_pinconf_set(struct pinctrl_dev *pctldev,
 			     unsigned num_configs)
 {
 	struct imx1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct imx1_pinctrl_soc_info *info = ipctl->info;
+	struct pin_desc *desc;
 	int i;
 
+	desc = pin_desc_get(pctldev, pin_id);
+
 	for (i = 0; i != num_configs; ++i) {
 		imx1_write_bit(ipctl, pin_id, configs[i] & 0x01, MX1_PUEN);
 
 		dev_dbg(ipctl->dev, "pinconf set pullup pin %s\n",
-			info->pins[pin_id].name);
+			desc->name);
 	}
 
 	return 0;
-- 
1.7.10.4

