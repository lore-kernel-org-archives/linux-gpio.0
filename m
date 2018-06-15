From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/5] pinctrl fixes for generic functions and groups
Date: Fri, 15 Jun 2018 04:11:36 -0700
Message-ID: <20180615111141.37184-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

Here are fixes to the race issues for generic group and functions
reported by H. Nikolaus Schaller <hns@goldelico.com>. I have not seen
the issue here myself, so please test to see if this is sufficient.

I've also fixed rza1 in addition to pinctrl-single. Please also check
the drivers pinctrl-mt7622.c and pinctrl-ingenic.c if mutex fixes are
needed there.

Regards,

Tony

Tony Lindgren (5):
  pinctrl: core: Return selector to the pinctrl driver
  pinctrl: pinmux: Return selector to the pinctrl driver
  pinctrl: single: Fix group and function selector use
  pinctrl: rza1: Fix selector use for groups and functions
  pinctrl: core: Remove broken remove_last group and pinmux functions

 drivers/pinctrl/core.c           |  5 +-
 drivers/pinctrl/core.h           |  6 ---
 drivers/pinctrl/pinctrl-rza1.c   | 25 ++++-----
 drivers/pinctrl/pinctrl-single.c | 91 +++++++++++++++++++-------------
 drivers/pinctrl/pinmux.c         |  5 +-
 drivers/pinctrl/pinmux.h         |  7 ---
 6 files changed, 74 insertions(+), 65 deletions(-)

-- 
2.17.1
