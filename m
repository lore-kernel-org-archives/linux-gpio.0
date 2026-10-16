Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171815038EB;
	Fri, 16 Oct 2026 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169207; cv=none; b=AW+K04kMKXT+b5LBeUmr/2gjzi8+b2cB/L97t8UbFJLmYAv8FCk67ceQSZ6jzYEXv41MmnAYrSwvPKCjT3AErNJD11uYnh51L2MwrJQyGsBNsbDs9tXj1IL3635GJyxRG/i+RWWX0zjH2cq/ExusuhRsFbtJSB2G/0l6MARNh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169207; c=relaxed/simple;
	bh=KQXnZDYy1EZu9/raKtcS01XMzLW6VKbdjuwPdWeuXgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p+Oqi5/Q3IkQGBzmJPak+IYKXUEo3nhbk4VtE4r9KjBVD3kzxZtaYtEF4UQI0RTboHIRH4nIOGl37lBMzlmvw4MRDgRW2hPzpcgz4hI7hJxnfat1omwEluRi6rZpjDIxv2Ix4kD7JWdpqw63ARrH2xBahb5GRfLbfzcXbe13Lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C4341A0225;
	Fri, 16 Oct 2026 18:46:43 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02CFA1A006F;
	Fri, 16 Oct 2026 18:46:43 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 021FF1800068;
	Sat, 17 Oct 2026 00:46:38 +0800 (+08)
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
Subject: [RFC PATCH 2/7] i3c: hub: add i2c-tools support for SMBus-configured target ports
Date: Fri, 16 Oct 2026 22:16:20 +0530
Message-Id: <20261016164625.3166779-3-lakshay.piplani@nxp.com>
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

Add support for standard i2c-tools on hub target ports configured
to operate in SMBus mode.

This change implements the .smbus_xfer callback in the i2c_algorithm
structure of the I2C adapters created by the hub driver for each
SMBus-enabled port.

With this support in place, user-space utilities such as i2cdetect,
i2cget, and i2cset can access and operate on I2C/SMBus devices
connected behind the hub target ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
 drivers/i3c/hub/p3h2840_i3c_hub.h       |   3 +
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 211 +++++++++++++++++++++++-
 2 files changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 5b3fb1752c7b..38f02500b6a9 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -188,6 +188,9 @@
 
 #define ONE_BYTE_SIZE						0x01
 
+/* Payload size of an SMBus word transaction. */
+#define P3H2X4X_SMBUS_WORD_SIZE					0x02
+
 /* holding SDA low when both SMBus Target Agent received data buffers are full.
  * This feature can be used as a flow-control mechanism for MCTP applications to
  * avoid MCTP transmitters on Target Ports time out when the SMBus agent buffers
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 7fdfa79dfeb6..2f301134b978 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -7,6 +7,7 @@
 #include <linux/i3c/device.h>
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 #include "p3h2840_i3c_hub.h"
 
@@ -387,9 +388,216 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
 	return ret_sum;
 }
 
+/*
+ * p3h2x4x_tp_smbus_xfer_msg() - Run a single SMBus transaction through the
+ * SMBus Controller Agent of @target_port. The descriptor and the payload are
+ * written into the port's controller buffer page, which is located by
+ * multiplying the target port index by the number of pages per port and adding
+ * the base page number.
+ *
+ * @read is true for an SMBus read transaction. Note that for I2C_SMBUS_QUICK
+ * the I2C core passes @data as NULL and the transfer direction itself is the
+ * information sent to the device, so @data must not be dereferenced for it.
+ */
+static int p3h2x4x_tp_smbus_xfer_msg(struct p3h2x4x_i3c_hub_dev *hub,
+				     u8 target_port,
+				     u16 addr,
+				     bool read,
+				     u8 cmd,
+				     int sz,
+				     union i2c_smbus_data *data)
+{
+	u8 controller_buffer_page = P3H2X4X_CONTROLLER_BUFFER_PAGE +
+				    P3H2X4X_NO_PAGE_PER_TP * target_port;
+	u8 target_port_status = P3H2X4X_TP0_SMBUS_AGNT_STS + target_port;
+	u8 transaction_type = P3H2X4X_SMBUS_400kHz;
+	u8 desc[P3H2X4X_SMBUS_DESCRIPTOR_SIZE] = { 0 };
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	u8 read_length = 0, write_length = 0;
+	u8 rw_address = addr << 1;
+	int ret, ret2;
+
+	switch (sz) {
+	case I2C_SMBUS_QUICK:
+		/*
+		 * A QUICK transaction carries no data at all: only the address
+		 * byte including the R/W bit is sent.
+		 */
+		if (read)
+			rw_address |= P3H2X4X_SET_BIT(0);
+		break;
+	case I2C_SMBUS_BYTE:
+		if (read) {
+			rw_address |= P3H2X4X_SET_BIT(0);
+			read_length = ONE_BYTE_SIZE;
+		} else {
+			buf[0] = cmd;
+			write_length = ONE_BYTE_SIZE;
+		}
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = ONE_BYTE_SIZE;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			buf[1] = data->byte;
+			write_length += ONE_BYTE_SIZE;
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = P3H2X4X_SMBUS_WORD_SIZE;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			put_unaligned_le16(data->word, &buf[1]);
+			write_length += P3H2X4X_SMBUS_WORD_SIZE;
+		}
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			/*
+			 * The agent returns the length byte followed by the
+			 * payload, so reserve room for the maximum block size.
+			 */
+			read_length = I2C_SMBUS_BLOCK_MAX + 1;
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+
+			memcpy(&buf[1], data->block, data->block[0] + 1);
+			write_length += data->block[0] + 1;
+		}
+		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
+
+		buf[0] = cmd;
+		write_length = ONE_BYTE_SIZE;
+		if (read) {
+			read_length = data->block[0];
+			transaction_type |= P3H2X4X_SET_BIT(0);
+		} else {
+			memcpy(&buf[1], &data->block[1], data->block[0]);
+			write_length += data->block[0];
+		}
+		break;
+	default:
+		dev_dbg(hub->dev, "Unsupported SMBus transaction %d\n", sz);
+		return -EOPNOTSUPP;
+	}
+
+	if (write_length + read_length > P3H2X4X_SMBUS_PAYLOAD_SIZE)
+		return -EINVAL;
+
+	desc[P3H2X4X_DESC_ADDR] = rw_address;
+	desc[P3H2X4X_DESC_TYPE] = transaction_type;
+	desc[P3H2X4X_DESC_WRITE_LEN] = write_length;
+	desc[P3H2X4X_DESC_READ_LEN] = read_length;
+
+	ret = regmap_write(hub->regmap, target_port_status, P3H2X4X_TP_BUFFER_STATUS_MASK);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(hub->regmap, P3H2X4X_PAGE_PTR, controller_buffer_page);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(hub->regmap, P3H2X4X_CONTROLLER_AGENT_BUFF,
+				desc, P3H2X4X_SMBUS_DESCRIPTOR_SIZE);
+	if (ret)
+		goto out_page;
+
+	if (write_length) {
+		ret = regmap_bulk_write(hub->regmap, P3H2X4X_CONTROLLER_AGENT_BUFF_DATA,
+					buf, write_length);
+		if (ret)
+			goto out_page;
+	}
+
+	ret = regmap_write(hub->regmap, P3H2X4X_TP_SMBUS_AGNT_TRANS_START,
+			   hub->tp_bus[target_port].tp_mask);
+	if (ret)
+		goto out_page;
+
+	ret = p3h2x4x_read_smbus_transaction_status(hub, target_port_status,
+						    write_length + read_length);
+	if (ret)
+		goto out_page;
+
+	if (read && read_length) {
+		ret = regmap_bulk_read(hub->regmap,
+				       P3H2X4X_CONTROLLER_AGENT_BUFF_DATA + write_length,
+				       buf, read_length);
+		if (ret)
+			goto out_page;
+
+		switch (sz) {
+		case I2C_SMBUS_BYTE:
+		case I2C_SMBUS_BYTE_DATA:
+			data->byte = buf[0];
+			break;
+		case I2C_SMBUS_WORD_DATA:
+			data->word = get_unaligned_le16(buf);
+			break;
+		case I2C_SMBUS_BLOCK_DATA:
+			/*
+			 * The device reports the payload length in the first
+			 * byte. Clamp it so a misbehaving device cannot make
+			 * the I2C core copy out more than the block buffer.
+			 */
+			data->block[0] = min_t(u8, buf[0], I2C_SMBUS_BLOCK_MAX);
+			memcpy(&data->block[1], &buf[1], data->block[0]);
+			break;
+		case I2C_SMBUS_I2C_BLOCK_DATA:
+			memcpy(&data->block[1], buf, read_length);
+			break;
+		}
+	}
+
+out_page:
+	ret2 = regmap_write(hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+	if (!ret && ret2)
+		ret = ret2;
+
+	return ret;
+}
+
+static s32 p3h2x4x_tp_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				 unsigned short flags,
+				 char read_write, u8 command,
+				 int size, union i2c_smbus_data *data)
+{
+	struct tp_bus *bus = i2c_get_adapdata(adap);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+
+	if (flags & I2C_CLIENT_PEC)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&hub->etx_mutex);
+	guard(mutex)(&bus->port_mutex);
+
+	return p3h2x4x_tp_smbus_xfer_msg(hub, bus->tp_port, addr,
+					 read_write == I2C_SMBUS_READ,
+					 command, size, data);
+}
+
 static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 {
-	u32 funcs = I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+	u32 funcs = I2C_FUNC_SMBUS_QUICK |
+		    I2C_FUNC_SMBUS_BYTE |
+		    I2C_FUNC_SMBUS_BYTE_DATA |
+		    I2C_FUNC_SMBUS_WORD_DATA |
+		    I2C_FUNC_SMBUS_BLOCK_DATA |
+		    I2C_FUNC_SMBUS_I2C_BLOCK |
+		    I2C_FUNC_I2C;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct tp_bus *bus = i2c_get_adapdata(adapter);
@@ -528,6 +736,7 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
  */
 static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
 	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+	.smbus_xfer     = p3h2x4x_tp_smbus_xfer,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
 	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
-- 
2.25.1

