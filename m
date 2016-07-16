From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?=
	<jeremy.lefaure@lse.epita.fr>
Subject: [PATCH 2/2] pinctrl: nsp: add missing dependency on CONFIG_OF
Date: Sat, 16 Jul 2016 19:16:17 +0200
Message-ID: <20160716171617.6745-3-jeremy.lefaure@lse.epita.fr>
References: <20160716171617.6745-1-jeremy.lefaure@lse.epita.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from blatinox.fr ([51.254.120.209]:43844 "EHLO vps202351.ovh.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751698AbcGPRYm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 16 Jul 2016 13:24:42 -0400
In-Reply-To: <20160716171617.6745-1-jeremy.lefaure@lse.epita.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?= <jeremy.lefaure@lse.epita.fr>

There is a build error when CONFIG_OF is disabled (tested with
COMPILE_TEST enabled):

drivers/pinctrl/bcm/pinctrl-nsp-mux.c:356:20: error:
=E2=80=98pinconf_generic_dt_node_to_map_group=E2=80=99 undeclared here =
(not in a
function)
  .dt_node_to_map =3D pinconf_generic_dt_node_to_map_group,

This commit adds a dependency on CONFIG_OF for PINCTRL_NSP_MUX
Kconfig symbol to fix this problem.

Signed-off-by: J=C3=A9r=C3=A9my Lefaure <jeremy.lefaure@lse.epita.fr>
---
 drivers/pinctrl/bcm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 6351028..2a2df55 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -102,7 +102,7 @@ config PINCTRL_NS2_MUX
=20
 config PINCTRL_NSP_MUX
 	bool "Broadcom NSP IOMUX driver"
-	depends on (ARCH_BCM_NSP || COMPILE_TEST)
+	depends on OF && (ARCH_BCM_NSP || COMPILE_TEST)
 	select PINMUX
 	select GENERIC_PINCONF
 	default ARCH_BCM_NSP
--=20
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
