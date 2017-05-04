From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 0/2] mcp23s08 regmap cache
Date: Thu,  4 May 2017 15:24:09 +0200
Message-ID: <20170504132411.10973-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36909 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751484AbdEDNYY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2017 09:24:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Hi,

I have two follow-up patches for the mcp23s08 driver,
that depend on my previous patchset adding pinctrl
support. After this regmap conversion is complete :)

-- Sebastian

Sebastian Reichel (2):
  pinctrl: mcp23s08: switch to regmap caching
  pinctrl: mcp23s08: drop OF_GPIO dependency

 drivers/pinctrl/Kconfig            |   1 -
 drivers/pinctrl/pinctrl-mcp23s08.c | 287 +++++++++++++++++++++++++------------
 2 files changed, 192 insertions(+), 96 deletions(-)

-- 
2.11.0

