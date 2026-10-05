Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9B427F91;
	Mon,  5 Oct 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191217; cv=none; b=S7RkBvVlnAG3u+ccAUx7bXbB2QVxI25tPGOoUSZo9MB2xVIWZ2U4uYn+oVKCT2b+/zF5RwHy2R0dBPFvAkN/VYw27PYIjfOgjlThjFEOwdlosSKeMONPOhadw+n2LkVpnR/4Y/sTsFOnspw3ZaJWrbFBagC2nPQIqllnCGWm/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191217; c=relaxed/simple;
	bh=inJt3EGfGVQJHz1e0ZblfPPrcPmGqgU+SdI8/LHJocE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oyq1wIQAubyJdt5uuFLnW9AIEOz27P/0JlRTgOjgkxTn6tqwBG9CCXamfvTkM+Eiz69rqgWqfnO1O/afuo7n02r518VzyZDJwcF8JUMzCiux5rZzCnnvYkbH62KYnPP83avYIKIwO+65v0JFoXT97ZZ9qsmiKIKkc9PMy77WdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjJoWloR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjJoWloR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1420F1F0089C;
	Mon,  5 Oct 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191216;
	bh=gxbS28SntsMUQyXM5E13ugMcWQINhgsovIcMpFDcwJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DjJoWloRFZNFBdWo3TyOVpX8PmVPTpKiT4yzrRJ5apizSOE41FzvGpytITen5Tn12
	 wLpb8UGqtY8sjDFl9A7e/4tOG8eCNvI7rV9AEzpW9ZtHvaSFbAHkb8WKy7hlI4olFu
	 oJjH3/PsPE8DwKg9hTYpGJZVHGHkHK/hC1lw0KbaM9wzl4kGf+gRf3cldzNuAMrhR+
	 tCuHvZhUZuLoIXOvyAg7cHCiRv/Oy2G+fmQLgA/1w5cY4DDBW3o5mC19lwvJ3FS6BP
	 OYujNII2UpyflFLbtpXG1nMuIgsMSVtH9waetva2nBHgfDvz4esDiKG3v8oEfz1qGR
	 oWrh2uYpOfIhQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:33 +0100
Subject: [PATCH v2 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-2-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

The SCMI core creates devices for the standard protocol IDs during
protocol enumeration, without waiting for an SCMI driver request.
Recording a request for one of these devices also rejects a second
driver registering the same protocol/name pair.

When the first driver unregisters, unrequesting that pair destroys the
core-created device. No other driver can be bound to it at that point,
but removing it also removes the device that a later driver could bind
to or use for module autoloading.

Skip request tracking for standard devices. Keep request tracking and
rollback for nonstandard devices unchanged.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index f2e2ed56bc32..230ee9f6f1aa 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	}
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 	int ret;
 
 	for (entry = id_table; entry->name[0]; entry++) {
+		/* Skip standard devices as they are created unconditionally */
+		if (scmi_device_id_in_std_id_table(entry))
+			continue;
+
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
 			goto err_unrequest;
@@ -200,8 +232,11 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	return 0;
 
 err_unrequest:
-	while (entry != id_table)
-		scmi_protocol_device_unrequest(--entry);
+	while (entry != id_table) {
+		--entry;
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 
 	return ret;
 }
@@ -211,8 +246,10 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name[0]; entry++)
-		scmi_protocol_device_unrequest(entry);
+	for (entry = id_table; entry->name[0]; entry++) {
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 }
 
 static bool scmi_device_name_is_transport(const char *name)
@@ -542,34 +579,6 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 	return sdev;
 }
 
-/* Standard protocols table */
-static const struct scmi_device_id scmi_std_id_table[] = {
-	{ SCMI_PROTOCOL_POWER, "genpd" },
-	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
-	{ SCMI_PROTOCOL_PERF, "perf" },
-	{ SCMI_PROTOCOL_PERF, "cpufreq" },
-	{ SCMI_PROTOCOL_CLOCK, "clocks" },
-	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
-	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
-	{ SCMI_PROTOCOL_RESET, "reset" },
-	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
-	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
-	{ },
-};
-
-static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
-{
-	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
-		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
-		    !strcmp(scmi_std_id_table[i].name, id->name))
-			return true;
-	}
-
-	return false;
-}
-
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *

-- 
2.43.0

