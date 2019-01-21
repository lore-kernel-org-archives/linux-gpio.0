From: Ramon Fried <ramon.fried@linux.intel.com>
Subject: [PATCH] pinctrl.txt: Remove outdated information
Date: Mon, 21 Jan 2019 16:38:22 +0200
Message-ID: <20190121143822.20225-1-ramon.fried@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Ramon Fried <ramon.fried@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Returning -EAGAIN is no longer supported by pin_config_group_set()
since ad42fc6c8479 ("pinctrl: rip out the direct pinconf API")

Remove the relevant section from the documentation.

Signed-off-by: Ramon Fried <ramon.fried@linux.intel.com>
---
 Documentation/driver-api/pinctl.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
index 6cb68d67fa75..2bb1bc484278 100644
--- a/Documentation/driver-api/pinctl.rst
+++ b/Documentation/driver-api/pinctl.rst
@@ -274,15 +274,6 @@ configuration in the pin controller ops like this::
 		.confops = &foo_pconf_ops,
 	};
 
-Since some controllers have special logic for handling entire groups of pins
-they can exploit the special whole-group pin control function. The
-pin_config_group_set() callback is allowed to return the error code -EAGAIN,
-for groups it does not want to handle, or if it just wants to do some
-group-level handling and then fall through to iterate over all pins, in which
-case each individual pin will be treated by separate pin_config_set() calls as
-well.
-
-
 Interaction with the GPIO subsystem
 ===================================
 
-- 
2.17.1
