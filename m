Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4E522695;
	Fri, 16 Oct 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169223; cv=none; b=i22MMKSsFAxhAeXrUJID9w6lRRo1qvHp2Uq5U576K/LJ68qUOn++ayRjJUfGyTb0tmXFPkEUoWh6vYo0wvOlcZirUPoQ/Lw6G4JIG+0UkzKFkgVH4FDzwv/r8cJRjCgfDzoaeD9y9fTkhkQj5Wz1QANd6Me0TrDVHQULIigqPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169223; c=relaxed/simple;
	bh=oNVyoKs/S09Dcj9GGaMHc6IQPS1w0Q4jGrDFBS52rEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XAAp5btoY/T82sHZfa4TbrrrFnAaXaEIrdydh4zWgSfM4a4mUKqcsszUbtxWWU/Jco7u9jDRghDFj4zk3sGOTpJNVDpCJeMC/i02q+JRcRTo0MbsGoukffpQh3B3xe5p/FE7yW/d/nlp7uleV/xERwRGdfxvNUYfyPVV59camjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E00620021B;
	Fri, 16 Oct 2026 18:46:51 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 07A7520000B;
	Fri, 16 Oct 2026 18:46:51 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3C9CB180006C;
	Sat, 17 Oct 2026 00:46:47 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [RFC PATCH 4/7] i3c: hub: p3h2x4x: add clock-frequency DTS support
Date: Fri, 16 Oct 2026 22:16:22 +0530
Message-Id: <20261016164625.3166779-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Read the standard 'clock-frequency' DT property for each SMBus target
port and store it in bus_clk_rate. Map it to one of four hardware speeds
using nearest-neighbour rounding (datasheet Table 20, descriptor byte 1
bits[2:1]):

  <= 150 kHz  -> 100 kHz (bits = 00)
  <= 300 kHz  -> 200 kHz (bits = 01)
  <= 700 kHz  -> 400 kHz (bits = 10, also the default when absent)
  > 700 kHz   -> 1 MHz   (bits = 11)

The port rate also scales the expected transaction time, which is used
to derive the status poll interval. Replace the fixed 400 kHz estimate
with one computed from the port rate, and keep flooring the overall poll
deadline at the SDA-stuck recovery window so a slow bus does not report
a spurious timeout. An out-of-range or missing rate falls back to
400 kHz, so the transaction time never divides by zero.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 drivers/i3c/hub/p3h2840_i3c_hub.h       | 30 +++++++++---
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 65 ++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 38f02500b6a9..ad2e7cb7f5ea 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -219,8 +219,20 @@
 #define P3H2X4X_TP_BUFFER_STATUS_MASK				0x0f
 #define P3H2X4X_TP_TRANSACTION_CODE_MASK			0xf0
 
-/* SMBus transaction types fields */
+/* SMBus transaction types fields - descriptor byte 1, bits [2:1] */
+#define P3H2X4X_SMBUS_100kHz					0
+#define P3H2X4X_SMBUS_200kHz					BIT(1)
 #define P3H2X4X_SMBUS_400kHz					BIT(2)
+#define P3H2X4X_SMBUS_1MHz					(BIT(2) | BIT(1))
+
+/* SMBus clock rates, in Hz, supported by the SMBus Controller Agent */
+#define P3H2X4X_SMBUS_CLK_RATE_100kHz				100000
+#define P3H2X4X_SMBUS_CLK_RATE_200kHz				200000
+#define P3H2X4X_SMBUS_CLK_RATE_400kHz				400000
+#define P3H2X4X_SMBUS_CLK_RATE_1MHz				1000000
+
+/* Target ports run at 400 kHz unless the DT requests another rate. */
+#define P3H2X4X_SMBUS_CLK_RATE_DFT				P3H2X4X_SMBUS_CLK_RATE_400kHz
 
 /* SMBus polling */
 #define P3H2X4X_SMBUS_POLL_COUNT			10
@@ -236,13 +248,16 @@
 #define P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE	(P3H2X4X_TARGET_BUFFER_SIZE - 2)
 
 /*
- * At 400 kHz, one 9-bit I2C byte takes 22.5 us. Round this
- * up to 23 us per payload byte and add 100 us for the address
- * byte, bus overhead and controller processing time. This models
- * the time a healthy transaction takes and is used to derive the
- * poll interval, not the overall give-up deadline.
+ * One I2C byte on the wire is 9 bits (8 data + ACK). Model a healthy
+ * transaction as the payload plus four bytes of address and descriptor
+ * overhead, and scale it by the port clock rate. The result is used to
+ * derive the status poll interval, not the overall give-up deadline.
  */
-#define P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(x)		((23 * (x)) + 100)
+#define P3H2X4X_SMBUS_BITS_PER_BYTE				9
+#define P3H2X4X_SMBUS_XFER_OVERHEAD_BYTES			4
+#define P3H2X4X_SMBUS_TRANSFER_US(rate, len)	\
+		(DIV_ROUND_UP(P3H2X4X_SMBUS_BITS_PER_BYTE * USEC_PER_SEC * \
+			      ((len) + P3H2X4X_SMBUS_XFER_OVERHEAD_BYTES), (rate)))
 
 /*
  * On an SDA-stuck condition the SMBus Controller Agent can legitimately
@@ -310,6 +325,7 @@ struct tp_bus {
 	bool is_registered;	    /* bus was registered in the framework. */
 	u8 tp_mask;
 	u8 tp_port;
+	u32 bus_clk_rate;	    /* SMBus clock rate for this port, in Hz. */
 	struct mutex port_mutex;      /* per port mutex */
 	struct device_node *of_node;
 	struct i2c_client *tp_smbus_client;
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 2f301134b978..406bf9f15446 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -18,6 +18,47 @@ enum p3h2x4x_smbus_desc_idx {
 	P3H2X4X_DESC_READ_LEN,
 };
 
+/*
+ * p3h2x4x_tp_speed_type() - Map a bus clock rate to the transaction descriptor
+ * speed field. The SMBus Controller Agent supports four discrete rates, so pick
+ * the nearest one for rates the device tree may have rounded.
+ */
+static u8 p3h2x4x_tp_speed_type(u32 clk_rate)
+{
+	if (clk_rate > 700000)
+		return P3H2X4X_SMBUS_1MHz;
+	if (clk_rate > 300000)
+		return P3H2X4X_SMBUS_400kHz;
+	if (clk_rate > 150000)
+		return P3H2X4X_SMBUS_200kHz;
+
+	return P3H2X4X_SMBUS_100kHz;
+}
+
+/*
+ * p3h2x4x_tp_get_clk_rate() - Read the requested SMBus clock rate of a target
+ * port from the device tree. The rate also scales the transaction time estimate,
+ * so reject a zero or out-of-range value rather than dividing by it later.
+ */
+static u32 p3h2x4x_tp_get_clk_rate(struct p3h2x4x_i3c_hub_dev *hub, u8 target_port)
+{
+	u32 clk_rate;
+
+	if (of_property_read_u32(hub->tp_bus[target_port].of_node, "clock-frequency",
+				 &clk_rate))
+		return P3H2X4X_SMBUS_CLK_RATE_DFT;
+
+	if (clk_rate < P3H2X4X_SMBUS_CLK_RATE_100kHz ||
+	    clk_rate > P3H2X4X_SMBUS_CLK_RATE_1MHz) {
+		dev_warn(hub->dev,
+			 "port %u: unsupported clock-frequency %u Hz, using %u Hz\n",
+			 target_port, clk_rate, P3H2X4X_SMBUS_CLK_RATE_DFT);
+		return P3H2X4X_SMBUS_CLK_RATE_DFT;
+	}
+
+	return clk_rate;
+}
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
 					    enum p3h2x4x_tp tp)
@@ -192,14 +233,15 @@ void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
 
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
-						 u8 data_length)
+						 u8 data_length,
+						 u32 clk_rate)
 {
 	unsigned int xfer_us, timeout_us, sleep_us;
 	u32 status_read;
 	u8 status;
 	int ret;
 
-	xfer_us = P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length);
+	xfer_us = P3H2X4X_SMBUS_TRANSFER_US(clk_rate, data_length);
 	sleep_us = clamp(xfer_us / P3H2X4X_SMBUS_POLL_COUNT,
 			 P3H2X4X_SMBUS_POLL_INTERVAL_MIN_US,
 			 P3H2X4X_SMBUS_POLL_INTERVAL_MAX_US);
@@ -252,8 +294,9 @@ static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub,
 {
 	u8 controller_buffer_page = P3H2X4X_CONTROLLER_BUFFER_PAGE + 4 * target_port;
 	u8 target_port_status = P3H2X4X_TP0_SMBUS_AGNT_STS + target_port;
+	u32 clk_rate = p3h2x4x_i3c_hub->tp_bus[target_port].bus_clk_rate;
+	u8 transaction_type = p3h2x4x_tp_speed_type(clk_rate);
 	u8 desc[P3H2X4X_SMBUS_DESCRIPTOR_SIZE] = { 0 };
-	u8 transaction_type = P3H2X4X_SMBUS_400kHz;
 	int write_length, read_length;
 	u8 addr = xfers[nxfers_i].addr;
 	u8 rw_address = 2 * addr;
@@ -308,7 +351,8 @@ static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub,
 
 	ret = p3h2x4x_read_smbus_transaction_status(p3h2x4x_i3c_hub,
 						    target_port_status,
-						    (write_length + read_length));
+						    (write_length + read_length),
+						    clk_rate);
 	if (ret)
 		goto out;
 
@@ -410,7 +454,8 @@ static int p3h2x4x_tp_smbus_xfer_msg(struct p3h2x4x_i3c_hub_dev *hub,
 	u8 controller_buffer_page = P3H2X4X_CONTROLLER_BUFFER_PAGE +
 				    P3H2X4X_NO_PAGE_PER_TP * target_port;
 	u8 target_port_status = P3H2X4X_TP0_SMBUS_AGNT_STS + target_port;
-	u8 transaction_type = P3H2X4X_SMBUS_400kHz;
+	u32 clk_rate = hub->tp_bus[target_port].bus_clk_rate;
+	u8 transaction_type = p3h2x4x_tp_speed_type(clk_rate);
 	u8 desc[P3H2X4X_SMBUS_DESCRIPTOR_SIZE] = { 0 };
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 	u8 read_length = 0, write_length = 0;
@@ -528,7 +573,8 @@ static int p3h2x4x_tp_smbus_xfer_msg(struct p3h2x4x_i3c_hub_dev *hub,
 		goto out_page;
 
 	ret = p3h2x4x_read_smbus_transaction_status(hub, target_port_status,
-						    write_length + read_length);
+						    write_length + read_length,
+						    clk_rate);
 	if (ret)
 		goto out_page;
 
@@ -814,6 +860,13 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
 
 		i2c_set_adapdata(smbus_adapter, &hub->tp_bus[tp]);
 
+		/*
+		 * Determine the port clock rate before the adapter goes live, so
+		 * a DT child probed from i2c_add_adapter() already transfers at
+		 * the requested speed.
+		 */
+		hub->tp_bus[tp].bus_clk_rate = p3h2x4x_tp_get_clk_rate(hub, tp);
+
 		/*
 		 * Publish the callback-visible state before i2c_add_adapter(),
 		 * which can synchronously probe a DT slave and invoke
-- 
2.25.1

