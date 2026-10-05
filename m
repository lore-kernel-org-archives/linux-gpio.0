Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8D429037;
	Mon,  5 Oct 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191216; cv=none; b=BFFCpWHpQfU1RnHcYV/DEwEMEPgZGEHXs/Cpo7QrIKAsCp7LSYiUHT90EIRwubsBUeajRGoTIxUY6mrHz2tZ3mdyfUK/uRQ9yodYtohYD7oFKbBbMjcxORl6aabg6VaYfmnTPGC3chPveSdTGtWjctZ4kBmAJqD5P9SyM4SCCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191216; c=relaxed/simple;
	bh=WRCAdGrlwZpRxS6P/rxVdY8CqltOT6G5hLnP5O3+36A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fN2j21/Sa1WwuQzFZKSHjrbVoxl8bnN+tbMRA4Bfq4NyCRfWf6z5OJNCFGljmT9mvMa8JU5BqgtELbg4hb155JjQqwf6hsy1Lf2MtJxm8yh8JCN+5cCdqjKTemw6KABLlH6pQd0TyR3FyPLUrh5te2WcLQ9LCnUb92k6QTtjDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnaA65Jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnaA65Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604EC1F000FF;
	Mon,  5 Oct 2026 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191214;
	bh=16n94nUYvcbZLV31vzIlAiIN4TxVfADG8ToDHtsscB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KnaA65Jhvg7gL4Wx4MErzEzjUOOxIccacYr2g1qgir0itF1CJO3MsISY4E/yYvg2w
	 hbhXsNLgiyX/57uXsPIynO2frc4KCnz58PmxFfZGRMv8J8DCtrPCmW3zP3aKatr0bL
	 ei3gsTjBCplbiTa0AsaH+WkgFSF4xwLFrHzUQpa+VlV9LgOHxi7f6U1LrRa++uZ9YB
	 e+E4M2Jz+UaCharqnM5basbvqKrkSjQIoy8Qb8M9s1uKc1IBfQBIx284x+URLwLupQ
	 8CLpEpT5HIam2XELNejuKHBsfflXUOTr0a9OpGG0KOFOkkJB8DqknOqSBpnryB5Lfa
	 RL9Gndb5vIMVA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:32 +0100
Subject: [PATCH v2 1/4] firmware: arm_scmi: Avoid protocol devices in
 exclusive raw mode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-1-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

Since standard protocol devices are created without a driver request,
rejecting SCMI driver registration is no longer enough to prevent them
from appearing when raw mode is enabled without coexistence.

When raw-mode debugfs setup succeeds, scmi_probe() returns success
before protocol enumeration, so it does not normally create those
devices. That early return is not sufficient: scmi_device_create() is
exported and can be called later.

Skip protocol-device creation in exclusive raw mode, including named
non-transport requests. Keep named transport devices so raw mode can
still set up its channels. Share the raw-mode condition and transport
name check with the existing bus paths.

Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..f2e2ed56bc32 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -36,6 +36,12 @@ struct scmi_requested_dev {
 /* Track globally the SCMI SystemPower protocol device. */
 static struct scmi_device *scmi_syspower_registered;
 
+static bool scmi_raw_mode_only(void)
+{
+	return IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
+	       !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
+}
+
 /**
  * scmi_protocol_device_request  - Helper to request a device
  *
@@ -60,8 +66,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
 		 id_table->name, id_table->protocol_id);
 
-	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
-	    !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX)) {
+	if (scmi_raw_mode_only()) {
 		pr_warn("SCMI Raw mode active. Rejecting '%s'/0x%02X\n",
 			id_table->name, id_table->protocol_id);
 		return -EINVAL;
@@ -210,12 +215,17 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+static bool scmi_device_name_is_transport(const char *name)
 {
-	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+	return !strncmp(name, SCMI_TRANSPORT_DEVNAME_PREFIX,
 			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
 }
 
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return scmi_device_name_is_transport(scmi_dev->name);
+}
+
 static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 					const struct scmi_device_id *id_table,
 					bool skip_transport)
@@ -591,6 +601,11 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 	struct scmi_requested_dev *rdev;
 	struct scmi_device *sdev, *scmi_dev = NULL;
 
+	/* Exclusive raw mode still needs transport devices for its channels. */
+	if (scmi_raw_mode_only() &&
+	    (!name || !scmi_device_name_is_transport(name)))
+		return NULL;
+
 	if (name)
 		return _scmi_device_create(fwnode, parent, protocol, name);
 

-- 
2.43.0

