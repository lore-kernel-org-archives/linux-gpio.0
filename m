Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D2456DED;
	Mon,  5 Oct 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194014; cv=none; b=R+He+yHtRUCfOY/RYqi21GhastGm/w7CtLomqCWj3XJapaB0QThZtmUmPk2E3ugWznbBoMfQHRAMFz8Va0PNL3OuT5RZ9gcinE5N7PpGkZo7KGftDcViR6Pixdp8IEKile7QfUkr4G4EqdotQ8oZk/K1QEvx8hhhGK2nb2Xqg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194014; c=relaxed/simple;
	bh=CpBEvdxAsLen9Cc1RKb4vCbCAT5DXFI3cp+fa+aMjIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDXkC4JAgJtqXRIqelytPcBeU7zvQJhl3J86ZXTPDujrdWZicXchM6nqlKIyrYPEJLkGOFz9D6lJNld7bhZEPd4OeIK7DSqJYTBAr4dWN8yl4kDpoWJbBsgRxntfzREeJri6GNNplhPDQ6DmbliSjQ6ThPQbMrHFq+VTCJKK49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdA5mMgc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdA5mMgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00421F0089A;
	Mon,  5 Oct 2026 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194013;
	bh=hd5AiV+Egj6KEvH01cjHFLoKM9QPjWxRSjuXESD6hwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bdA5mMgcRH13PP1HS2ubFLyAP4jljXIAybpm2euDVWXMhHhw08hNi711gWRT3mwWH
	 LbO11zv2RYxa0jLp2JQlEeB9cwZpYR8d2wyjB4KWT1qnexocEV9t/pugyDUhWzJ9kH
	 cqzoP8r9QbveJTBCS2tksiU4ZQZBsXen1tgahoNcefnU5qzlyEEnuXC59ejvG6jzDP
	 TVMiBH8SYUp2SpkS3D1Fr/UmszLthicsNHmHpuo6J53XSKnqNSfbRlAV9wrXErUb46
	 kJ+HCjajnXrGLqrkffmRsRslfoGCKSWu68754+Z7C+cpw2vq00YzCpWRUp/+Jjw8wR
	 k57g4lzgljtVg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:53:13 +0100
Subject: [PATCH v3 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v3-4-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

The SCMI performance-domain driver uses the named "perf" device only
when its firmware node declares #power-domain-cells. Otherwise its
probe returns without registering a provider, while the same SCMI
protocol may still be needed by the separate "cpufreq" device.

Do not create the "perf" device when the provider property is absent.
This avoids an unnecessary device claiming the protocol fwnode and
leaves cpufreq creation unchanged. Update the device-creation contract
to document that an intentionally omitted named device returns NULL.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index eef47d2054cd..7613ea2893ef 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -570,6 +570,11 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 {
 	struct scmi_device *sdev;
 
+	/* The perf device is only needed when it provides power domains. */
+	if (protocol == SCMI_PROTOCOL_PERF && !strcmp(name, "perf") &&
+	    !fwnode_property_present(fwnode, "#power-domain-cells"))
+		return NULL;
+
 	sdev = __scmi_device_create(fwnode, parent, protocol, name);
 	if (!sdev)
 		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
@@ -596,10 +601,8 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
  *
  * Return: The created device (or one of them if @name was NOT provided and
  *	   multiple devices were created) or NULL if no device was created;
- *	   note that NULL indicates an error ONLY in case a specific @name
- *	   was provided: when @name param was not provided, a number of devices
- *	   could have been potentially created for a whole protocol, unless no
- *	   device was found to have been requested for that specific protocol.
+ *	   note that NULL can also indicate that a named device is not needed
+ *	   for this fwnode, or that no device was requested when @name is NULL.
  */
 struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,

-- 
2.43.0

