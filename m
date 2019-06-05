From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] driver: core: Allow subsystems to continue deferring probe
Date: Wed,  5 Jun 2019 16:23:12 +0200
Message-ID: <20190605142312.6072-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Linus Walleij <linus.walleij@linaro.org>, linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some subsystems, such as pinctrl, allow continuing to defer probe
indefinitely. This is useful for devices that depend on resources
provided by devices that are only probed after the init stage.

One example of this can be seen on Tegra, where the DPAUX hardware
contains pinmuxing controls for pins that it shares with an I2C
controller. The I2C controller is typically used for communication
with a monitor over HDMI (DDC). However, other instances of the I2C
controller are used to access system critical components, such as a
PMIC. The I2C controller driver will therefore usually be a builtin
driver, whereas the DPAUX driver is part of the display driver that
is loaded from a module to avoid bloating the kernel image with all
of the DRM/KMS subsystem.

In this particular case the pins used by this I2C/DDC controller
become accessible very late in the boot process. However, since the
controller is only used in conjunction with display, that's not an
issue.

Unfortunately the driver core currently outputs a warning message
when a device fails to get the pinctrl before the end of the init
stage. That can be confusing for the user because it may sound like
an unwanted error occurred, whereas it's really an expected and
harmless situation.

In order to eliminate this warning, this patch allows callers of the
driver_deferred_probe_check_state() helper to specify that they want
to continue deferring probe, regardless of whether we're past the
init stage or not. All of the callers of that function are updated
for the new signature, but only the pinctrl subsystem passes a true
value in the new persist parameter if appropriate.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/base/dd.c            | 17 ++++++++++++-----
 drivers/base/power/domain.c  |  2 +-
 drivers/iommu/of_iommu.c     |  2 +-
 drivers/pinctrl/devicetree.c | 10 ++++++----
 include/linux/device.h       |  2 +-
 5 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 0df9b4461766..25ffbadf4187 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -238,23 +238,30 @@ __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
 /**
  * driver_deferred_probe_check_state() - Check deferred probe state
  * @dev: device to check
+ * @persist: Boolean flag indicating whether drivers should keep trying to
+ *   probe after built-in drivers have had a chance to probe. This is useful
+ *   for built-in drivers that rely on resources provided by modular drivers.
  *
  * Returns -ENODEV if init is done and all built-in drivers have had a chance
- * to probe (i.e. initcalls are done), -ETIMEDOUT if deferred probe debug
- * timeout has expired, or -EPROBE_DEFER if none of those conditions are met.
+ * to probe (i.e. initcalls are done) and unless persist is set, -ETIMEDOUT if
+ * deferred probe debug timeout has expired, or -EPROBE_DEFER if none of those
+ * conditions are met.
  *
  * Drivers or subsystems can opt-in to calling this function instead of directly
  * returning -EPROBE_DEFER.
  */
-int driver_deferred_probe_check_state(struct device *dev)
+int driver_deferred_probe_check_state(struct device *dev, bool persist)
 {
 	if (initcalls_done) {
 		if (!deferred_probe_timeout) {
 			dev_WARN(dev, "deferred probe timeout, ignoring dependency");
 			return -ETIMEDOUT;
 		}
-		dev_warn(dev, "ignoring dependency for device, assuming no driver");
-		return -ENODEV;
+
+		if (!persist) {
+			dev_warn(dev, "ignoring dependency for device, assuming no driver");
+			return -ENODEV;
+		}
 	}
 	return -EPROBE_DEFER;
 }
diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 33c30c1e6a30..effa5276a773 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2423,7 +2423,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		mutex_unlock(&gpd_list_lock);
 		dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
 			__func__, PTR_ERR(pd));
-		return driver_deferred_probe_check_state(base_dev);
+		return driver_deferred_probe_check_state(base_dev, false);
 	}
 
 	dev_dbg(dev, "adding to PM domain %s\n", pd->name);
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index f04a6df65eb8..70f3946b088a 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -117,7 +117,7 @@ static int of_iommu_xlate(struct device *dev,
 	 * a proper probe-ordering dependency mechanism in future.
 	 */
 	if (!ops)
-		return driver_deferred_probe_check_state(dev);
+		return driver_deferred_probe_check_state(dev, false);
 
 	return ops->of_xlate(dev, iommu_spec);
 }
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index f7e354f85518..c808bf567d24 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -111,13 +111,15 @@ static int dt_to_map_one_config(struct pinctrl *p,
 
 		np_pctldev = of_get_next_parent(np_pctldev);
 		if (!np_pctldev || of_node_is_root(np_pctldev)) {
+			bool persist = false;
+
 			of_node_put(np_pctldev);
-			ret = driver_deferred_probe_check_state(p->dev);
 			/* keep deferring if modules are enabled unless we've timed out */
-			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret == -ENODEV)
-				ret = -EPROBE_DEFER;
+			if (IS_ENABLED(CONFIG_MODULES) && !allow_default)
+				persist = true;
 
-			return ret;
+			return driver_deferred_probe_check_state(p->dev,
+								 persist);
 		}
 		/* If we're creating a hog we can use the passed pctldev */
 		if (hog_pctldev && (np_pctldev == p->dev->of_node)) {
diff --git a/include/linux/device.h b/include/linux/device.h
index e0649f6adf2e..ecf59dfcbfb7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -340,7 +340,7 @@ struct device *driver_find_device(struct device_driver *drv,
 				  int (*match)(struct device *dev, void *data));
 
 void driver_deferred_probe_add(struct device *dev);
-int driver_deferred_probe_check_state(struct device *dev);
+int driver_deferred_probe_check_state(struct device *dev, bool persist);
 
 /**
  * struct subsys_interface - interfaces to device functions
-- 
2.21.0
