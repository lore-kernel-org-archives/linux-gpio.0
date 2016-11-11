From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 0/3] pinctrl: sunxi: Support generic pinconf functions
Date: Fri, 11 Nov 2016 17:50:33 +0800
Message-ID: <20161111095036.11803-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4FIS3AQKGQEHQMNUUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi everyone,

This series fixes up generic pinconf support for the sunxi pinctrl driver
library. The driver was doing some bits wrong, like a) storing the pinconf
config value in its struct, and not actually reading the hardware to get
the current config, and b) not using the right arguments for the bias
parameters.

Patch 1 fixes the pin bias parameter arguments.

Patch 2 makes the driver read out pinconf settings from the hardware, and
returns the correct value for unsupported features and disable features.
With this in place it also declares itself as generic pinconf compatible,
which enables us to read the config through the debugfs pinconf interface.

Patch 3 makes the sunxi_pconf_group_set callback use the helper function
introduced in patch 1. 

Changes since v2:

  - Added Maxime's ack.

  - Moved the removal of the cached config value from patch 3 to patch 2
    at Maxime's request.

Changes since v1:

  - Rebased onto the updated sunxi pinctrl driver with support for the
    generic pinconf bindings

  - Use separate value for what is written to the register in the pinconf
    set function, as Maxime requested.

Regards
ChenYu


Chen-Yu Tsai (3):
  pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP} argument
  pinctrl: sunxi: Add support for fetching pinconf settings from
    hardware
  pinctrl: sunxi: Make sunxi_pconf_group_set use sunxi_pconf_reg helper

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 156 +++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |   1 -
 2 files changed, 118 insertions(+), 39 deletions(-)

-- 
2.10.2
