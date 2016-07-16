From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?=
	<jeremy.lefaure@lse.epita.fr>
Subject: [PATCH 0/2] pinctrl: add missing dependencies on CONFIG_OF
Date: Sat, 16 Jul 2016 19:16:15 +0200
Message-ID: <20160716171617.6745-1-jeremy.lefaure@lse.epita.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from blatinox.fr ([51.254.120.209]:43845 "EHLO vps202351.ovh.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751668AbcGPRYm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 16 Jul 2016 13:24:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org

These two patches fix a missing dependency on CONFIG_OF for
PINCTRL_CYGNUS_MUX and PINCTRL_NSP_MUX Kconfig symbols.

Since these two changes concern two different drivers, I split into
two commits:
[PATCH 1/2] pinctrl: cygnus-mux: add missing dependency on CONFIG_OF
[PATCH 2/2] pinctrl: nsp: add missing dependency on CONFIG_OF

Thank you for your time,
J=C3=A9r=C3=A9my Lefaure
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
