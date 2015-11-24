From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] pinctrl: use CONFIG_PINCTRL_* to gurad subdirectories
Date: Tue, 24 Nov 2015 20:45:21 +0900
Message-ID: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:37271 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753061AbbKXLpp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2015 06:45:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jisheng Zhang <jszhang@marvell.com>, spear-devel@list.st.com, Antoine Tenart <antoine.tenart@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Viresh Kumar <vireshk@kernel.org>, linux-arm-kernel@lists.infradead.org



Masahiro Yamada (3):
  pinctrl: berlin: guard sub-directory with CONFIG_PINCTRL_BERLIN
  pinctrl: mvebu: guard sub-directory with CONFIG_PINCTRL_MVEBU
  pinctrl: spear: guard sub-directory with CONFIG_PINCTRL_SPEAR

 drivers/pinctrl/Makefile        | 6 +++---
 drivers/pinctrl/berlin/Makefile | 2 +-
 drivers/pinctrl/mvebu/Makefile  | 2 +-
 drivers/pinctrl/spear/Makefile  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1

