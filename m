Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663844CAC6;
	Thu,  6 Aug 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014418; cv=none; b=KtshybaWxX18mr7m0aWEhqVZ7UWEVqHEqGXJmUOI9ye/QbLTNKoL6iDpyM7aX8CTN2zm4YYzPVUztMiQlY/o2Glb387nGAV/I3/LosJnAMz+q8AWhHJ8kkhZAoIj4KSTrw60/7B2Nf7aDYAKaO+UYw4Nt5loAlCq9j3fZRqxgxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014418; c=relaxed/simple;
	bh=jzLyJT2SCc7a2xpXHUkQv4S7DyAIj6hI+U/vunrxlnI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eb9IFAShQbORnpDCjRrYAI747vUqLjOpq3IsBmj5P7sslrxRlOm2dN0/YW4Mjt1Rt/6Q8Vb80G8rZUcqiQrHC9VPGDVp7/kBh8LBmWCenxPSawhqf72JQ1VxZfO2v5qNQ+kY6MIcivia+Tay8wOMMTLw7FEBAUbyBbNKQhZQkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=no5AxS4l; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="no5AxS4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786014417; x=1817550417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jzLyJT2SCc7a2xpXHUkQv4S7DyAIj6hI+U/vunrxlnI=;
  b=no5AxS4l4noOxOPyeyWIcVuxK+r3xk4iFEjkWE9uOemMRWUUrC7/8bWR
   gsrJgS/QVkJ1HVba2ugiH45TGs42zWb4rPmq71tHEQ9DKSEdOTligHnBN
   2rYlpvijqgBj7ww5RH7MR29gK89q7ggmNfWeQZic3Wc5FREJBYlrNkNnu
   v+1UOAvg+0sZhl5EeysouZlPB0dcpTgZorhSfrpcSbtzgnONgngt5X2c1
   CUgNbEMgjHhEvpCHapfU1DE0m3WSc36DzzTxXC55dkUx1LpwEZg+82kaZ
   2ecUhOlHaKCcPOJ6QNy/s6Cc1RPlRtloRDL6a/he3Op2stPY8CpPsdCSV
   A==;
X-CSE-ConnectionGUID: kY/mlPnuQTG1D0D22e8lNA==
X-CSE-MsgGUID: q5aH9g4TRo+paWmgYCW6Uw==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="71347831"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:06:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 04:06:52 -0700
Received: from che-ld-ungapp03.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 04:06:48 -0700
From: Dhanushkalyan G <dhanushkalyan.g@microchip.com>
To: <linux-gpio@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, <vaibhaavram.tl@microchip.com>,
	<kumaravel.thiagarajan@microchip.com>,
	<tharunkumar.pasumarthi@microchip.com>, <Thangaraj.S@microchip.com>
Subject: [PATCH] misc: microchip: pci1xxxx: Acquire system lock per byte for OTP/EEPROM
Date: Thu, 6 Aug 2026 16:36:47 +0530
Message-ID: <20260806110647.9728-1-dhanushkalyan.g@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Access to the OTP and EEPROM is guarded by a hardware system lock
(CFG_SYS_LOCK register) that has a hardware timeout and is released once
the timeout elapses.

The read and write helpers acquire the lock once before the per-byte
loop and release it only after the whole buffer is transferred. As each
byte access polls the hardware for completion, a multi-byte transfer
takes longer than the lock timeout, so the lock is released mid-transfer
and the remaining bytes are not written.

Acquire and release the system lock around each byte access instead, so
every access stays within the lock timeout. Move set_sys_lock()/
release_sys_lock() inside the loop and release the lock on the error path
before bailing out, in all four helpers: OTP read/write and EEPROM
read/write.

After each access, confirm the lock is still owned before trusting the
result: under heavy load even a single byte access can exceed the lock
timeout, in which case the hardware releases the lock early. Return
-ETIMEDOUT in that case instead of silently reporting bad data.

Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Signed-off-by: Dhanushkalyan G <dhanushkalyan.g@microchip.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 83 +++++++++++++++----
 1 file changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index a2ed477e0370..1e99bf59fdd3 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -94,6 +94,23 @@ static void release_sys_lock(struct pci1xxxx_otp_eeprom_device *priv)
 	writel(0, sys_lock);
 }
 
+/*
+ * The system lock has a hardware timeout: if it is held for longer than the
+ * configured timeout, the hardware releases it automatically. Under heavy
+ * load this can happen in the middle of an OTP/EEPROM byte access, leaving
+ * the access only partially completed while the code still assumes the lock
+ * is held. Re-read the lock and confirm this function (PF3) still owns it; a
+ * cleared ownership bit means the access raced with a lock timeout and its
+ * result cannot be trusted.
+ */
+static bool is_sys_lock_owned(struct pci1xxxx_otp_eeprom_device *priv)
+{
+	void __iomem *sys_lock = priv->reg_base +
+				 MMAP_CFG_OFFSET(CFG_SYS_LOCK_OFFSET);
+
+	return readl(sys_lock) & CFG_SYS_LOCK_PF3;
+}
+
 static bool is_eeprom_responsive(struct pci1xxxx_otp_eeprom_device *priv)
 {
 	void __iomem *rb = priv->reg_base;
@@ -133,11 +150,11 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 	if ((off + count) > priv->nvmem_config_eeprom.size)
 		count = priv->nvmem_config_eeprom.size - off;
 
-	ret = set_sys_lock(priv);
-	if (ret)
-		return ret;
-
 	for (byte = 0; byte < count; byte++) {
+		ret = set_sys_lock(priv);
+		if (ret)
+			return ret;
+
 		writel(EEPROM_CMD_EPC_BUSY_BIT | (off + byte), rb +
 		       MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
 
@@ -148,13 +165,20 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 					rb + MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
 		if (ret < 0 || (!ret && (regval & EEPROM_CMD_EPC_TIMEOUT_BIT))) {
 			ret = -EIO;
+			release_sys_lock(priv);
 			goto error;
 		}
 
 		buf[byte] = readl(rb + MMAP_EEPROM_OFFSET(EEPROM_DATA_REG));
+
+		if (!is_sys_lock_owned(priv)) {
+			ret = -ETIMEDOUT;
+			goto error;
+		}
+
+		release_sys_lock(priv);
 	}
 error:
-	release_sys_lock(priv);
 	return ret;
 }
 
@@ -174,11 +198,12 @@ static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
 	if ((off + count) > priv->nvmem_config_eeprom.size)
 		count = priv->nvmem_config_eeprom.size - off;
 
-	ret = set_sys_lock(priv);
-	if (ret)
-		return ret;
 
 	for (byte = 0; byte < count; byte++) {
+		ret = set_sys_lock(priv);
+		if (ret)
+			return ret;
+
 		writel(*(value + byte), rb + MMAP_EEPROM_OFFSET(EEPROM_DATA_REG));
 		regval = EEPROM_CMD_EPC_TIMEOUT_BIT | EEPROM_CMD_EPC_WRITE |
 			 (off + byte);
@@ -193,11 +218,18 @@ static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
 					rb + MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
 		if (ret < 0 || (!ret && (regval & EEPROM_CMD_EPC_TIMEOUT_BIT))) {
 			ret = -EIO;
+			release_sys_lock(priv);
+			goto error;
+		}
+
+		if (!is_sys_lock_owned(priv)) {
+			ret = -ETIMEDOUT;
 			goto error;
 		}
+
+		release_sys_lock(priv);
 	}
 error:
-	release_sys_lock(priv);
 	return ret;
 }
 
@@ -229,11 +261,11 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 	if ((off + count) > priv->nvmem_config_otp.size)
 		count = priv->nvmem_config_otp.size - off;
 
-	ret = set_sys_lock(priv);
-	if (ret)
-		return ret;
-
 	for (byte = 0; byte < count; byte++) {
+		ret = set_sys_lock(priv);
+		if (ret)
+			return ret;
+
 		otp_device_set_address(priv, (u16)(off + byte));
 		data = readl(rb + MMAP_OTP_OFFSET(OTP_FUNC_CMD_OFFSET));
 		writel(data | OTP_FUNC_RD_BIT,
@@ -251,13 +283,20 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 		data = readl(rb + MMAP_OTP_OFFSET(OTP_PASS_FAIL_OFFSET));
 		if (ret < 0 || data & OTP_FAIL_BIT) {
 			ret = -EIO;
+			release_sys_lock(priv);
 			goto error;
 		}
 
 		buf[byte] = readl(rb + MMAP_OTP_OFFSET(OTP_RD_DATA_OFFSET));
+
+		if (!is_sys_lock_owned(priv)) {
+			ret = -ETIMEDOUT;
+			goto error;
+		}
+
+		release_sys_lock(priv);
 	}
 error:
-	release_sys_lock(priv);
 	return ret;
 }
 
@@ -278,11 +317,12 @@ static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
 	if ((off + count) > priv->nvmem_config_otp.size)
 		count = priv->nvmem_config_otp.size - off;
 
-	ret = set_sys_lock(priv);
-	if (ret)
-		return ret;
 
 	for (byte = 0; byte < count; byte++) {
+		ret = set_sys_lock(priv);
+		if (ret)
+			return ret;
+
 		otp_device_set_address(priv, (u16)(off + byte));
 
 		/*
@@ -309,11 +349,18 @@ static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
 		data = readl(rb + MMAP_OTP_OFFSET(OTP_PASS_FAIL_OFFSET));
 		if (ret < 0 || data & OTP_FAIL_BIT) {
 			ret = -EIO;
+			release_sys_lock(priv);
 			goto error;
 		}
+
+		if (!is_sys_lock_owned(priv)) {
+			ret = -ETIMEDOUT;
+			goto error;
+		}
+
+		release_sys_lock(priv);
 	}
 error:
-	release_sys_lock(priv);
 	return ret;
 }
 
-- 
2.34.1

