Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B7F471CE4;
	Wed, 23 Sep 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187785; cv=none; b=hJDDMbjO+s04OGisDKp1yC0om0ZgaM7YU0jR8NpNpMthGxocuxQLvDx2TbSCaRKnsTVIHwGiDi4qnMnNN2mmyvsV2gJFnSMpcfXpY4LR6H2kHPjWeJKIpmbMZkvcy7tlhFq4FAGPPU0TcE9xijRbpAEo2Lq0atp0MPTjgg5I7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187785; c=relaxed/simple;
	bh=mwMb65J27yexuTf7Xlp2+jX1iomL2YXwD0Q/Ln7R3CI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu1UzRjUaQFCKjRnUOh+F+2QhSVmb/FapsQiRZruRYCavyHyGh/s3DFgMxRuM+SR0Ypwd07cjyv6AYrTqD+VC/ghgeUSV23ngv8m1hjeoLpVzS5fkHD/Y8Z1eE2BHjgx2wbMeDLcgCtRzGrzyEZLiq5PrXBVHHzwZfGOVZDQJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qfJwG+vr; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qfJwG+vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790187783; x=1821723783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gZylmkN0FLVQrDyk8C5q+ntl1f8q57F7WItzjmlxp8o=;
  b=qfJwG+vrrIJZ9zSeovDQjtFXK2vELhg4tBMMdh5jDl366FnECG8NifbO
   74d+Fmoma1w1IdxK4VYbpoVgfBefibFYMm1i87jMkyJNnZLv5rBB8L8G3
   IdGpnrQsNsByV50kX5w0dbn5zgoUyzd4Bt4+1TBFxl802x4//g2UzhZy4
   BUK13gtWkUp0ONEef82u58heskHBqO4sjDnNnuTzaGYm6DJBc4kP/UfOM
   ctUXMqyO0o9BPSnKGh1FMlzZyJI8Jb2ZyWLE184izi5I5uJIpvxeW29Sz
   CF2CMrjUwdURnjUG4JFD3lUNTGBela1g4+AL0bcxBuf80F/Aq3IFVMVU6
   g==;
X-CSE-ConnectionGUID: /MnecoGYRIaiCwAdHzcuLQ==
X-CSE-MsgGUID: o0m2QqKYSrm47lbRXPy2cQ==
X-IronPort-AV: E=Sophos;i="6.27,119,1787011200"; 
   d="scan'208";a="29466299"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:23:00 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:28215]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.34:2525] with esmtp (Farcaster)
 id 693cbdea-4af6-4bcc-afa6-03bbd2fcd501; Wed, 23 Sep 2026 18:23:00 +0000 (UTC)
X-Farcaster-Flow-ID: 693cbdea-4af6-4bcc-afa6-03bbd2fcd501
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 18:22:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 18:22:57 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 4/4] pps: clients: gpio: release pins to an inactive state on remove and shutdown
Date: Wed, 23 Sep 2026 18:22:43 +0000
Message-ID: <20260923182243.41060-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923182243.41060-1-farbere@amazon.com>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
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

Look up the pinctrl states first in probe(), before pps_gpio_setup(), and
route every subsequent failure through a common err_release_pins label.
The driver core applies the "default" mux before probe(), so a probe that
fails after this point would otherwise leave the pins stuck in "default";
releasing them to "inactive" on the error path is the symmetrical
counterpart to what the core did on the driver's behalf. A failure in
pps_gpio_get_pins() itself returns directly, as no state was taken yet;
pps_gpio_release_pins() is a no-op when no "inactive" state was found.

Convert the pps_register_source() failure path to dev_err_probe() too,
so all three probe error paths that share err_release_pins log the same
way. This path already returned PTR_ERR(data->pps), so this is a logging
change, not a fix.

The mux must not change while something can still drive the pins. On
shutdown() the requested IRQ and the echo timer would otherwise outlive
the mux change -- device_shutdown() is not the end of the road, the
kernel keeps running to load and start the kexec image -- so a timer
callback or the PPS handler could poke a line that by then belongs to
another function. Tear down in the same order as remove(): free_irq()
first, then the echo timer (only when the board has an echo GPIO, as in
remove()), and the mux change last. shutdown() does not unregister the
PPS source, which is a remove-time concern.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- Convert the pps_register_source() failure path to dev_err_probe() +
  goto err_release_pins as well, so all three probe error paths sharing
  err_release_pins log the same way. It already returned PTR_ERR(data->pps),
  so this is a logging change, not a fix. Fold in here rather than a
  separate patch since this block is rewritten by this patch anyway, with
  a commit-message note (Rodolfo Giometti)

Changes in v5:
- Resolve the v4 probe-failure open question by taking option "A + keep
  the NULL guard": look the pinctrl states up first in probe(), before
  pps_gpio_setup(), and route the pps_gpio_setup() failure through
  err_release_pins too, so every path the driver can act on restores
  "inactive". pps_gpio_release_pins() keeps its NULL guard, so it is a
  no-op when no "inactive" state was found. Verified on the AL11 K2V6
  JRD10 with a forced-defer test: the pins are released to "inactive" on
  each failed attempt, the core re-applies "default" before the next, and
  the mux settles at "default" on the eventual success, with no spurious
  PPS event (Rodolfo Giometti)
- Clear data->pins_inactive when rejecting an "inactive" state that has no
  "default", so a board deliberately rejected here can never have its pins
  released to "inactive"
- Guard the echo-timer teardown in the new shutdown() with data->echo_pin,
  matching remove() after the preceding patch (Rodolfo Giometti)
- Convert the gpiod_to_irq()/request_threaded_irq() error paths to the
  log-only dev_err_probe() + goto err_release_pins form, following patch 1

Changes in v4:
- No functional change (probe-failure raised as an open question, now
  resolved in v5 above)

Changes in v3:
- Treat -ENODEV from devm_pinctrl_get() as "no pinctrl", not a probe
  failure; keep propagating everything else, e.g. -EPROBE_DEFER
- Restore the "inactive" mux on probe failure via a new err_release_pins
  label
- Warn if pinctrl_select_state() fails to apply the "inactive" state
  rather than silently ignoring the error
- Trim and de-duplicate the added comments

Changes in v2:
- Rename the released state from "idle" to "inactive"
- Look the state up in the driver with devm_pinctrl_get() +
  pinctrl_lookup_state() + pinctrl_select_state() instead of
  pinctrl_pm_select_idle_state(), removing the CONFIG_PM dependency
- Fix shutdown() to free_irq() and the echo teardown before the mux
  change, matching remove()
- Require a "default" state whenever "inactive" is present and reject the
  mismatch

 drivers/pps/clients/pps-gpio.c | 121 ++++++++++++++++++++++++++++++---
 1 file changed, 113 insertions(+), 8 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index aec534c246af..e6d39ca6777d 100644
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
@@ -96,6 +99,68 @@ static void pps_gpio_echo_timer_callback(struct timer_list *t)
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
+	if (IS_ERR(pins_default)) {
+		data->pins_inactive = NULL;
+		return dev_err_probe(dev, PTR_ERR(pins_default),
+				     "\"inactive\" pinctrl state requires a \"default\" state\n");
+	}
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
@@ -156,15 +221,25 @@ static int pps_gpio_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, data);
 
+	/*
+	 * pinctrl setup (optional states) first, so the "inactive" mux can be
+	 * restored on any later probe-failure path via err_release_pins.
+	 */
+	ret = pps_gpio_get_pins(dev);
+	if (ret)
+		return ret;
+
 	/* GPIO setup */
 	ret = pps_gpio_setup(dev);
 	if (ret)
-		return ret;
+		goto err_release_pins;
 
 	/* IRQ setup */
 	ret = gpiod_to_irq(data->gpio_pin);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to map GPIO to IRQ\n");
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to map GPIO to IRQ\n");
+		goto err_release_pins;
+	}
 	data->irq = ret;
 
 	/* initialize PPS specific parts of the bookkeeping data structure. */
@@ -183,9 +258,10 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	pps_default_params = PPS_CAPTUREASSERT | PPS_OFFSETASSERT;
 	data->pps = pps_register_source(&data->info, pps_default_params);
 	if (IS_ERR(data->pps)) {
-		dev_err(dev, "failed to register IRQ %d as PPS source\n",
-			data->irq);
-		return PTR_ERR(data->pps);
+		ret = PTR_ERR(data->pps);
+		dev_err_probe(dev, ret, "failed to register IRQ %d as PPS source\n",
+			      data->irq);
+		goto err_release_pins;
 	}
 
 	/* register IRQ interrupt handler */
@@ -195,14 +271,20 @@ static int pps_gpio_probe(struct platform_device *pdev)
 			  data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
-		return dev_err_probe(dev, ret, "failed to acquire IRQ %d\n",
-				     data->irq);
+		dev_err_probe(dev, ret, "failed to acquire IRQ %d\n",
+			      data->irq);
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
@@ -216,9 +298,31 @@ static void pps_gpio_remove(struct platform_device *pdev)
 		timer_delete_sync(&data->echo_timer);
 		gpiod_set_value(data->echo_pin, 0);
 	}
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
+	/* reset the echo state, if the board has an echo GPIO */
+	if (data->echo_pin) {
+		timer_delete_sync(&data->echo_timer);
+		gpiod_set_value(data->echo_pin, 0);
+	}
+	pps_gpio_release_pins(&pdev->dev);
+}
+
 static const struct of_device_id pps_gpio_dt_ids[] = {
 	{ .compatible = "pps-gpio", },
 	{ /* sentinel */ }
@@ -228,6 +332,7 @@ MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
 static struct platform_driver pps_gpio_driver = {
 	.probe		= pps_gpio_probe,
 	.remove		= pps_gpio_remove,
+	.shutdown	= pps_gpio_shutdown,
 	.driver		= {
 		.name	= PPS_GPIO_NAME,
 		.of_match_table	= pps_gpio_dt_ids,
-- 
2.47.3

