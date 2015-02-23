From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] pinctrl: baytrail: Assorted fixes
Date: Mon, 23 Feb 2015 14:53:09 +0200
Message-ID: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

This series contains set of fixes that are necessary in order to get some
new Intel Baytrail based devices, in particular the GPIO part of those,
working.

The first patch fixes GPIO request problem that was found on Zotac ZBOX
pico 320.

Second and third patch deal with Lenovo Thinkpad 10 digitizer problem.

In addition to that we now save and restore pin context over system sleep
as was observed on Minnowboard MAX (but applies to other Baytrail based
devices which support S3).

Mika Westerberg (4):
  pinctrl: baytrail: Relax GPIO request rules
  pinctrl: baytrail: Clear interrupt triggering from pins that are in GPIO mode
  pinctrl: baytrail: Rework interrupt handling
  pinctrl: baytrail: Save pin context over system sleep

 drivers/pinctrl/intel/pinctrl-baytrail.c | 254 +++++++++++++++++++++++--------
 1 file changed, 188 insertions(+), 66 deletions(-)

-- 
2.1.4
