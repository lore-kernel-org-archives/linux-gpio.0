Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D2429814;
	Mon,  5 Oct 2026 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191221; cv=none; b=cYXe/M7lesgVO5JXvMdsN9XxW7aFqqh0maplApGR8qZ4i31jdb1/4cO1cmFTUHqt6emd9IoPgwG8ikoDHMIusAUEmtLYH997rRZFvFdzt/VVYCGJAVBbZ0C63q5jrFH8yHS4UR9gtP8Eyc8uCGuLuJMxxtL+1/NbzuRQ1WETHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191221; c=relaxed/simple;
	bh=N7ppUWYWwA2ciiAK9eJviw0l25lBvQ2ohR5ssiYrSpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQFY8EqqPXLQ+n/VKekPjwmWDe180tSuTuODlpS51LYcbZjsDCXfOJFj7EDf9lwfEyU3NZX18PB7pYYNmJ9HVj1ntvcMYBjNSavnWbRKsZVLXC8b58Nciw/KPiSQMLOSxoL5h60phmMZkLrNZ3wM4Ju6RRyHMGkDb6k2696OKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igPnMmAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igPnMmAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1C41F00893;
	Mon,  5 Oct 2026 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191220;
	bh=pQMvdvTBs6iJwXtYsvXOz+3I/5tVR71kCapN0bE7bQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=igPnMmADQExidCdXXF4Wq/8dGBbJ0wI+gdVJN4/wH8sdLmM2n3DtJ6kyrXfLTlsP2
	 sYkU7tnCxXat1UP+UwJ9dP11QqwRhyD1KZDm1s1wUpOY8wjEdr6wSsqY1FYQd9m+QY
	 MFyybganmv1DZttCNZi16Cknzv7vnUZHmQ1SCwdxXF9h5VoKkNWv+eMyUvaZ7dqYZ8
	 ewmxeTQhAA0kIPAt1DVDm3mPH4yVwcF1dlPVn/Flvod+Ayt9FBWa24ZqlYbNHQOVOb
	 jwuUFOivRn+ElTXeCzBXaoxxjTxD4mqDcc4ZMDs7LhEgx7FsJU7WL53d1hUVNnYi7k
	 onyP15+t5wbtA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:35 +0100
Subject: [PATCH v2 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-4-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
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
index 6be31b5121b3..b235d322330b 100644
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

