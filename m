From: Ludovic Desroches <ludovic.desroches@o2linux.fr>
Subject: [PATCH] pinctrl: generic: update references to Documentation/pinctrl.txt
Date: Sun,  6 Aug 2017 16:00:05 +0200
Message-ID: <20170806140005.7135-1-ludovic.desroches@o2linux.fr>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@o2linux.fr>
List-Id: linux-gpio@vger.kernel.org

Update deprecated references to Documentation/pinctrl.txt since it has been
moved to Documentation/driver-api/pinctl.rst.

Signed-off-by: Ludovic Desroches <ludovic.desroches@o2linux.fr>
Fixes: 5a9b73832e9e ("pinctrl.txt: move it to the driver-api book")
---

Hi,

Last time I wanted to have a look at the pinctrl documentation, I didn't find
it, I had to browse git logs to find the new place.

I don't know if it is better to update all the places where
Documentation/pinctrl.txt was mentionned at once or if I have to split this
patch.
Other variant of this patch can be to reintroduce a Documentation/pinctrl.txt
file indicating the new location as it is done for several files already.

Please tell me your preference and I'll update the patch according to.

Regards

Ludovic


 Documentation/gpio/gpio-legacy.txt      | 2 +-
 MAINTAINERS                             | 2 +-
 include/linux/device.h                  | 2 +-
 include/linux/pinctrl/pinconf-generic.h | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpio/gpio-legacy.txt b/Documentation/gpio/gpio-legacy.txt
index b34fd94f7089..5eacc147ea87 100644
--- a/Documentation/gpio/gpio-legacy.txt
+++ b/Documentation/gpio/gpio-legacy.txt
@@ -459,7 +459,7 @@ pin controller?
 
 This is done by registering "ranges" of pins, which are essentially
 cross-reference tables. These are described in
-Documentation/pinctrl.txt
+Documentation/driver-api/pinctl.rst
 
 While the pin allocation is totally managed by the pinctrl subsystem,
 gpio (under gpiolib) is still maintained by gpio drivers. It may happen
diff --git a/MAINTAINERS b/MAINTAINERS
index 672b5d5402f0..3a47d9facf0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10450,7 +10450,7 @@ L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/
-F:	Documentation/pinctrl.txt
+F:	Documentation/driver-api/pinctl.rst
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
diff --git a/include/linux/device.h b/include/linux/device.h
index c29dd5ec7f6a..5db26b9c0fcc 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -843,7 +843,7 @@ struct dev_links_info {
  * 		hibernation, system resume and during runtime PM transitions
  * 		along with subsystem-level and driver-level callbacks.
  * @pins:	For device pin management.
- *		See Documentation/pinctrl.txt for details.
+ *		See Documentation/driver-api/pinctl.rst for details.
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 231d3075815a..e91d1b6a260d 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -81,8 +81,8 @@
  * 	it.
  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
  * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- * 	indicate low level. (Please see Documentation/pinctrl.txt, section
- * 	"GPIO mode pitfalls" for a discussion around this parameter.)
+ *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
+ *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
  *	the driver which alternative power source to use.
-- 
2.13.3

