From: Denis Carikli <denis@eukrea.com>
Subject: [PATCHv9 2/2] ARM: imx_v6_v7_defconfig: Enable backlight gpio support.
Date: Fri, 10 Jan 2014 16:07:24 +0100
Message-ID: <1389366444-29449-2-git-send-email-denis@eukrea.com>
References: <1389366444-29449-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpfb1-g21.free.fr ([212.27.42.9]:36826 "EHLO
	smtpfb1-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829AbaAJPIQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2014 10:08:16 -0500
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id A6D2F2D4A8
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2014 16:08:10 +0100 (CET)
In-Reply-To: <1389366444-29449-1-git-send-email-denis@eukrea.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Denis Carikli <denis@eukrea.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>

The eukrea mbimxsd51 has a gpio backlight for its
  LCD display, so we turn that driver on.

Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Eric B=C3=A9nard <eric@eukrea.com>
Signed-off-by: Denis Carikli <denis@eukrea.com>
---
Changelog:
- This patch has been splitted out of my imx-drm v5 patchset:
  http://lists.freedesktop.org/archives/dri-devel/2013-December/050124.=
html
  which will be resubmitted later without that patch.

- This patch is unchanged since the imx-drm v5 patchset,
  where it was first introduced.
---
 arch/arm/configs/imx_v6_v7_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/im=
x_v6_v7_defconfig
index 00746d5..f2b2911 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -188,6 +188,7 @@ CONFIG_LCD_L4F00242T03=3Dy
 CONFIG_LCD_PLATFORM=3Dy
 CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
 CONFIG_BACKLIGHT_PWM=3Dy
+CONFIG_BACKLIGHT_GPIO=3Dy
 CONFIG_FRAMEBUFFER_CONSOLE=3Dy
 CONFIG_LOGO=3Dy
 CONFIG_SOUND=3Dy
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
