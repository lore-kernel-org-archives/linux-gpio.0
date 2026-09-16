Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4424D0CD1;
	Wed, 16 Sep 2026 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583234; cv=none; b=DF2hPo2pR+Q0V2wYpya5EPyJto+v5nASYybHLQpZIaeuvA7Qj7yY1vfkAZU+QJ52sVKntpPBqh9oPeMfi5g/G8N9U0Ed2XENtzeccsBnBYKCo0WRtPc6fU1nvsd7bVN6oljs1QorerT+ApdDP+Er1cu99Jor3a5kUIkHvM0Pm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583234; c=relaxed/simple;
	bh=UAKlwj2jxI1NtJek0FDWVjgJ4VLzbJZoEzZboWVjFGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEFPKA0oHBwC4JkDWpat2piurlsVoEusuW+f4MGdd6F9BMkF4Q+P8o7Nva9wA4pbTyqCRiLkgNiENg4PbjG/HIIQwi+nyFB6jqTdqJ4X+j0z6edStqe/jbL648699erZhLnz+t9oQ2hMP07/Xpa18rxxs4ZjsGPyTFqE/i7bmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=A84fhMsM; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="A84fhMsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789583219; x=1821119219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AIFXyW5jjaywtRzzgHXph5jw0EtXmXYrxGqcayU4uJ4=;
  b=A84fhMsMMv6eoL8fuUycRoEcUelqmkM//DV5L84nQJ6aoChfon7zWQPK
   II6R6AuxaXiww59v4u+RZXbBUUkYQJQAxvg5qDL7noRqdd/wT/ECCHC/i
   KxcN+VC6pR4KKBvwQvwqd08YGcxDyVNUiprkbMY+D/6bu5tbqzSeZrgHO
   0p+XeT1Aao52EFWqy+5CkXyYyBev18GD4gEP22bAhdzWcKk3Ye+s+Yt9D
   fXH3pJNfsEBUsKYMJ+/5y/ps5NR9TX6+r1lEB+lvaFvQEdzxVFGaTKB3F
   9BcL0W5fDBEuqiaq23wFaQKYBqnB5AP3rAdDevqXFUnDJ2rGwh1FCZUqP
   Q==;
X-CSE-ConnectionGUID: p7Za2xryTeiUNCJIqXsbPA==
X-CSE-MsgGUID: HjbyDyBDSc6nWSbVrb8IZA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28857521"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 18:26:54 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:31039]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.10:2525] with esmtp (Farcaster)
 id 129101d9-6a51-4247-a797-8282c1c86fe2; Wed, 16 Sep 2026 18:26:54 +0000 (UTC)
X-Farcaster-Flow-ID: 129101d9-6a51-4247-a797-8282c1c86fe2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 18:26:54 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 18:26:51 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] pps: clients: gpio: release pins to an inactive state on remove and shutdown
Date: Wed, 16 Sep 2026 18:26:41 +0000
Message-ID: <20260916182641.9768-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916182641.9768-1-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
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

 drivers/pps/clients/pps-gpio.c | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 73ec2c7335e5..e619c7bb2f78 100644
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
@@ -96,6 +99,51 @@ static void pps_gpio_echo_timer_callback(struct timer_list *t)
 	gpiod_set_value(info->echo_pin, 0);
 }
 
+/*
+ * Look up the optional "inactive" pinctrl state: the mux to restore when
+ * pps-gpio is unbound or the system is shut down. It is only meaningful
+ * paired with a "default" state, which the driver core applies before probe
+ * to mux the pins for PPS use. A board that describes neither is unaffected;
+ * one that describes "inactive" without "default" is rejected, since
+ * releasing pins that were never put into a defined PPS state is incoherent.
+ */
+static int pps_gpio_get_pins(struct device *dev)
+{
+	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
+	struct pinctrl_state *pins_default;
+
+	data->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(data->pinctrl))
+		return dev_err_probe(dev, PTR_ERR(data->pinctrl),
+				     "failed to get pinctrl\n");
+
+	/* The "inactive" state is optional; without it there is nothing to do. */
+	data->pins_inactive = pinctrl_lookup_state(data->pinctrl, "inactive");
+	if (IS_ERR(data->pins_inactive)) {
+		data->pins_inactive = NULL;
+		return 0;
+	}
+
+	/* "inactive" requires a "default" state to release back from. */
+	pins_default = pinctrl_lookup_state(data->pinctrl, "default");
+	if (IS_ERR(pins_default))
+		return dev_err_probe(dev, PTR_ERR(pins_default),
+				     "\"inactive\" pinctrl state requires a \"default\" state\n");
+
+	return 0;
+}
+
+/*
+ * Release the pins to their "inactive" state, if the board describes one, so
+ * they are handed back to whatever function uses them while pps-gpio is not
+ * driving PPS. Boards without an "inactive" state are unaffected.
+ */
+static void pps_gpio_release_pins(struct pps_gpio_device_data *data)
+{
+	if (data->pins_inactive)
+		pinctrl_select_state(data->pinctrl, data->pins_inactive);
+}
+
 static int pps_gpio_setup(struct device *dev)
 {
 	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
@@ -161,6 +209,11 @@ static int pps_gpio_probe(struct platform_device *pdev)
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
@@ -216,9 +269,30 @@ static void pps_gpio_remove(struct platform_device *pdev)
 	timer_delete_sync(&data->echo_timer);
 	/* reset echo pin in any case */
 	gpiod_set_value(data->echo_pin, 0);
+	/* release the pins last, once nothing can drive them anymore */
+	pps_gpio_release_pins(data);
 	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
 }
 
+static void pps_gpio_shutdown(struct platform_device *pdev)
+{
+	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
+
+	/*
+	 * Quiesce the hardware before touching the mux: stop the IRQ and the
+	 * echo timer first so nothing can drive the pins, then hand them back
+	 * to their "inactive" function. The kernel keeps running after
+	 * device_shutdown() (for example to load and start a kexec image), so
+	 * the pins must not be released while an IRQ or timer callback can
+	 * still reach them. The PPS source is left registered; unregistering
+	 * it is a remove-time concern and is unnecessary on shutdown.
+	 */
+	free_irq(data->irq, data);
+	timer_delete_sync(&data->echo_timer);
+	gpiod_set_value(data->echo_pin, 0);
+	pps_gpio_release_pins(data);
+}
+
 static const struct of_device_id pps_gpio_dt_ids[] = {
 	{ .compatible = "pps-gpio", },
 	{ /* sentinel */ }
@@ -228,6 +302,7 @@ MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
 static struct platform_driver pps_gpio_driver = {
 	.probe		= pps_gpio_probe,
 	.remove		= pps_gpio_remove,
+	.shutdown	= pps_gpio_shutdown,
 	.driver		= {
 		.name	= PPS_GPIO_NAME,
 		.of_match_table	= pps_gpio_dt_ids,
-- 
2.47.3

