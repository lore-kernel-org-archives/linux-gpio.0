Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88CF3D6CD4;
	Thu, 17 Sep 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631798; cv=none; b=glcSusXhSXcTFcB7GcbV0pBIcRMu5ncZtEnLThUiDvf/hEIbg/gmCM7+WO9yJpp1u/msj2C1a1Mhco0pzWCy16+5z9WmR/vEa8Z7lkjUB9rR+FO8vcXMJ7+x0x3dzh6uA+Wq9Acgq3hk96Le31MYpKqB0p/I6vSdg3m9Z8OK8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631798; c=relaxed/simple;
	bh=RR2aHzLqgo4LX0nym8CkvNcAqiJip5DllFnOQJ0cHq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3GVU2MQz5Owo3mM+MB8UpKVHqM0D2xoSWhUq5N+ND+ONXmqVg+w1RL1wtETQfpAi+odQj5WmAGuiJg/O5V6GxOXmvsiZEAWjPDFxNQ3m7dBeUYncos7eVefc9jjvk2fEww3pu2utgo6Y0OgeFVo4HBAzr5UeOyc7Aqy9hdr74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=QjTzE/96; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="QjTzE/96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631791; x=1821167791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fm5FFfmTZuWJ7PoLJRZDVLb+zJTaooCYDjM1eXo4/KM=;
  b=QjTzE/96z18SJI9VEYtnLcE4ozhQ4mFFF7LU8O0FLyJ9NTWSmPPmrssz
   4XJ0SOVmYsdZzq5M8xLEbbLNkIRqAoiqJ2mDxwoWfVy1DBxrMbhTPspou
   6GNu6ZGJf29ujfRbpUjs/qFb6TouXp20SWWAHJklT/GEDh6+x4B3J0X0J
   BXKOVb7lRshqGpnUr+8ICUDdOtB8T7+5InoM4KuWnUz/8kA5jbLbw92/B
   h9ZqnnbaMMJAuLUwU4ZH5hwoNFbgeJWSEF17tIftPLzqnelUrhrVDcHYu
   JFBPd1m+UmMgLDghpsv8fzAZQQ/wDoaEc8AVgv4BRVNRCQh7k4ZZ+/+ti
   g==;
X-CSE-ConnectionGUID: fANv7i4TQVaIxJXMkLGArA==
X-CSE-MsgGUID: E2AFzm3uSIu/Sm09QyfD3Q==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28900766"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:56:28 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:11786]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.200:2525] with esmtp (Farcaster)
 id cd2a0efd-5e7b-441f-a7d7-867217ee62a2; Thu, 17 Sep 2026 07:56:28 +0000 (UTC)
X-Farcaster-Flow-ID: cd2a0efd-5e7b-441f-a7d7-867217ee62a2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:56:28 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Thu, 17 Sep 2026
 07:56:26 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] pps: clients: gpio: release pins to an inactive state on remove and shutdown
Date: Thu, 17 Sep 2026 07:56:11 +0000
Message-ID: <20260917075611.47881-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Some boards route the PPS input GPIO through a pin controller and need to
mux it to another function when pps-gpio is not driving PPS. The driver
core applies the "default" pinctrl state before probe, so the pins are
muxed for GPIO/PPS use while the driver is bound. Nothing, however, hands
the pins back when the driver is unbound or the system is shut down, so
they stay stuck in the GPIO function for whatever runs next, kexec
included.

Look up an optional "inactive" pinctrl state in probe via
devm_pinctrl_get() and pinctrl_lookup_state(), and select it with
pinctrl_select_state() in remove() and shutdown(). The state is looked up
and selected by the driver itself rather than reusing the runtime-PM
"idle"/"sleep" states, so its meaning is unambiguous and it does not
depend on CONFIG_PM. Boards that do not describe an "inactive" state are
unaffected.

Since "inactive" is only meaningful as the mux to restore after the
core-applied "default" state, reject an "inactive" state that is not
paired with a "default" one rather than releasing pins that were never
put into a defined PPS state.

The mux must not change while something can still drive the pins. On
shutdown() the requested IRQ and the echo timer would otherwise outlive
the mux change -- device_shutdown() is not the end of the road, the
kernel keeps running to load and start the kexec image -- so a timer
callback or the PPS handler could poke a line that by then belongs to
another function. Tear down in the same order as remove(): free_irq() and
timer_delete_sync() first, and the mux change last. shutdown() does not
unregister the PPS source, which is a remove-time concern.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v3:
- Treat -ENODEV from devm_pinctrl_get() (a DT device without a
  "pinctrl-0" property) as "no pinctrl", not a probe failure; keep
  propagating everything else, e.g. -EPROBE_DEFER
- Restore the "inactive" mux on probe failure too: route the error
  paths after pps_gpio_get_pins() through a new err_release_pins label
  so a failed probe does not leave the pins stuck in the "default" state
- Warn if pinctrl_select_state() fails to apply the "inactive" state
  rather than silently ignoring the error (pps_gpio_release_pins() now
  takes the struct device to log against)
- Trim and de-duplicate the added comments

Changes in v2:
- Rename the released state from "idle" to "inactive"
- Look the state up in the driver with devm_pinctrl_get() +
  pinctrl_lookup_state() + pinctrl_select_state() instead of
  pinctrl_pm_select_idle_state(), removing the CONFIG_PM dependency
- Fix shutdown() to free_irq() and timer_delete_sync() before the mux
  change, matching remove(), so no IRQ or timer callback can drive a pin
  after it has been handed back
- Require a "default" state whenever "inactive" is present and reject the
  mismatch

 drivers/pps/clients/pps-gpio.c | 100 ++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 038c55c5f7d4..2ee8fba8520c 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/pps_kernel.h>
 #include <linux/gpio/consumer.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/timer.h>
@@ -30,6 +31,8 @@ struct pps_gpio_device_data {
 	struct gpio_desc *gpio_pin;	/* GPIO port descriptors */
 	struct gpio_desc *echo_pin;
 	struct timer_list echo_timer;	/* timer to reset echo active state */
+	struct pinctrl *pinctrl;	/* pin control handle */
+	struct pinctrl_state *pins_inactive;	/* pins released when unbound */
 	bool assert_falling_edge;
 	unsigned int echo_active_ms;	/* PPS echo active duration */
 	unsigned long echo_timeout;	/* timer timeout value in jiffies */
@@ -96,6 +99,66 @@ static void pps_gpio_echo_timer_callback(struct timer_list *t)
 	gpiod_set_value(info->echo_pin, 0);
 }
 
+/*
+ * Look up the optional "inactive" pinctrl state. It requires a "default"
+ * state (applied by the driver core before probe) and is rejected without
+ * one. Absent pinctrl, or an absent "inactive" state, is not an error.
+ */
+static int pps_gpio_get_pins(struct device *dev)
+{
+	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
+	struct pinctrl_state *pins_default;
+
+	data->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(data->pinctrl)) {
+		/*
+		 * A DT device without "pinctrl-0" yields -ENODEV, which
+		 * is not an error here; propagate anything else.
+		 */
+		if (PTR_ERR(data->pinctrl) == -ENODEV) {
+			data->pinctrl = NULL;
+			return 0;
+		}
+		return dev_err_probe(dev, PTR_ERR(data->pinctrl),
+				     "failed to get pinctrl\n");
+	}
+
+	/* The "inactive" state is optional. */
+	data->pins_inactive = pinctrl_lookup_state(data->pinctrl, "inactive");
+	if (IS_ERR(data->pins_inactive)) {
+		data->pins_inactive = NULL;
+		return 0;
+	}
+
+	/* "inactive" requires a "default" state to return from. */
+	pins_default = pinctrl_lookup_state(data->pinctrl, "default");
+	if (IS_ERR(pins_default))
+		return dev_err_probe(dev, PTR_ERR(pins_default),
+				     "\"inactive\" pinctrl state requires a \"default\" state\n");
+
+	return 0;
+}
+
+/*
+ * Restore the "inactive" pinctrl state, handing the pins back to whatever
+ * function uses them while pps-gpio is not driving PPS. This undoes the
+ * "default" state the driver core applied before probe. A no-op for boards
+ * that describe no "inactive" state.
+ */
+static void pps_gpio_release_pins(struct device *dev)
+{
+	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	if (!data->pins_inactive)
+		return;
+
+	ret = pinctrl_select_state(data->pinctrl, data->pins_inactive);
+	if (ret)
+		dev_warn(dev, "failed to select inactive pinctrl state: %d\n",
+			 ret);
+}
+
 static int pps_gpio_setup(struct device *dev)
 {
 	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
@@ -161,11 +224,16 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* pinctrl setup (optional states) */
+	ret = pps_gpio_get_pins(dev);
+	if (ret)
+		return ret;
+
 	/* IRQ setup */
 	ret = gpiod_to_irq(data->gpio_pin);
 	if (ret < 0) {
 		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
-		return ret;
+		goto err_release_pins;
 	}
 	data->irq = ret;
 
@@ -187,7 +255,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(data->pps)) {
 		dev_err(dev, "failed to register IRQ %d as PPS source\n",
 			data->irq);
-		return PTR_ERR(data->pps);
+		ret = PTR_ERR(data->pps);
+		goto err_release_pins;
 	}
 
 	/* register IRQ interrupt handler */
@@ -198,13 +267,18 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	if (ret) {
 		pps_unregister_source(data->pps);
 		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
-		return ret;
+		goto err_release_pins;
 	}
 
 	dev_dbg(&data->pps->dev, "Registered IRQ %d as PPS source\n",
 		data->irq);
 
 	return 0;
+
+err_release_pins:
+	/* Restore the inactive mux on probe failure; safe to do last here. */
+	pps_gpio_release_pins(dev);
+	return ret;
 }
 
 static void pps_gpio_remove(struct platform_device *pdev)
@@ -216,9 +290,28 @@ static void pps_gpio_remove(struct platform_device *pdev)
 	timer_delete_sync(&data->echo_timer);
 	/* reset echo pin in any case */
 	gpiod_set_value(data->echo_pin, 0);
+	/* release the pins last, once nothing can drive them */
+	pps_gpio_release_pins(&pdev->dev);
 	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
 }
 
+static void pps_gpio_shutdown(struct platform_device *pdev)
+{
+	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
+
+	/*
+	 * The kernel keeps running after device_shutdown() (e.g. to load and
+	 * start a kexec image), so quiesce the hardware before touching the
+	 * mux: free the IRQ and stop the echo timer first, then release the
+	 * pins last, so no callback can drive a pin after it is handed back.
+	 * The PPS source is left registered; that is a remove-time concern.
+	 */
+	free_irq(data->irq, data);
+	timer_delete_sync(&data->echo_timer);
+	gpiod_set_value(data->echo_pin, 0);
+	pps_gpio_release_pins(&pdev->dev);
+}
+
 static const struct of_device_id pps_gpio_dt_ids[] = {
 	{ .compatible = "pps-gpio", },
 	{ /* sentinel */ }
@@ -228,6 +321,7 @@ MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
 static struct platform_driver pps_gpio_driver = {
 	.probe		= pps_gpio_probe,
 	.remove		= pps_gpio_remove,
+	.shutdown	= pps_gpio_shutdown,
 	.driver		= {
 		.name	= PPS_GPIO_NAME,
 		.of_match_table	= pps_gpio_dt_ids,
-- 
2.47.3

