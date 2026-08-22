Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02893911AA
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787434849; cv=none; b=IHEdvXu+VPBXzQSnOGRxqDZEPGVekl+uR9CSPAoLyeXZbOkgHHUQkzsGPO9QHBkp4XhQP06Hwr1naEuLrugTBpRX3vH/dZaFhG4/hfsM0XmPYjvtaI1Kp3fekvfJWcBxBRW/0z/RUo3zNkuN97DvxPB+rnsRtPgbFEKzS61Juyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787434849; c=relaxed/simple;
	bh=O1b4qJuU5h0jkjtN1tmFHZg98/5Kor0pOfpmFSJmhKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0VmTIdnr+v7+dwYxkQ5iuRTNF9TZNPxXlXz/PMYepsVN32I+W/PXlwYuMzK7AROlyli5EHRs9giGi3FBM9BI/dK6B8e6TncMqK3JiXgYZ4u6h01pk27g7JZMmWkpf8ApB1+P6rVhKixkFI8eoyQDWeO+MPE88R8Johx4OnmF3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv/DmAO0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv/DmAO0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so3720651a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787434839; x=1788039639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d0fiyXH8Gw0QiNflyUYHvDRi8XIlp2AkUMiyQfpLiI=;
        b=Cv/DmAO0fbr4HMZI6EQTZ1jjqyYgFpkJODZ7fxs+QkhM/iphqwzhNkTIenH0HihBWb
         3AyRVV20O8AYDEsZ+SNdQ7tgUWJV/6g5z+o7+o2SpQdYrLIQMNwAsIns9oFyfMRb+SW/
         9pNZfSFNAPd5waFOWbY4wXqZJ++Cd/C/xMMXCdYOQSCl8U0MzlIzeWQS1M7EiYT1bRJD
         pGzw3Gc3a7y9qHEtk0/6gGTvY3W9jGTi1XmWX14ZFNHPCOm8ZXtQ+8EgmEHRroDVxPWT
         W06y0AkTSkxhS5I2dOhT1ypRjBkuPZPttybBv8WMzLBjo1Hk4OVyhOWsZ0QF2iEKidAe
         osZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787434839; x=1788039639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7d0fiyXH8Gw0QiNflyUYHvDRi8XIlp2AkUMiyQfpLiI=;
        b=DI6+NFFhn+abFUtVsLwb/2mJoR5AwRn229PNVPuRlG3k/ujXe/81kyJ1V++6jeDOcS
         sWbTZgpKe/DpLGogT9hCsVbWTfXBDaJqz+x7BMM5ueUD8oWvt9EJkncOS3QtwKEizyph
         xr8e9i648L1Qx3YFNAEUbxSyuHfHZB9eaqv0NRW1LGqAUr3pFYyUpWiSluD91AVSakS5
         zyi3NLH/eBd27fKrrgWCoO4YntQBhFsWoOcncrb1pu+nII/5he+BznLGQuQZ5H/w3m9g
         dnwt/0zpXMiyMSVz5FjQcjG9vm1lkaw5jztHFeGE3P7UAOxMmMqOEoT6TOe9Q1YkeYZB
         Kblw==
X-Forwarded-Encrypted: i=1; AHgh+RoMsvni7SFi3INL5SL4RZTPPJncPDC5as2TU1MohDYgL7z5GkNUGoYwyOjh5+vHnrSI1x4TcaUAbbGU@vger.kernel.org
X-Gm-Message-State: AFuF++khlYKp4qmQ7e8xUNJrD2Zx+DB3zxVjye80HgKlfIrzhjVhnDc7
	uq0uTjBdhvJ1GO42ttL00WrQqEoHEk7Pyl5m+edkhOXb0SG7LmnTe4zc
X-Gm-Gg: AR+sD135mcl4KGrFK8hB3bx1VrF1LaKQK0fZD6cdvzWRYOcWonSLqyFNJ2nQOciAvJD
	FUZ4H6eeENPlSd+X1CGRs2PEB2C0Y+BNua+TXCZSzmmReThHW3Cv6MySCXr1CUYG4crkpiw7uLT
	Na7POCOUQYjuB6amB6hOWZgeSR599VEja/0hajIQ2H6s+3LxdEfZiqZubDXoRrsxmCjuu79g0DY
	fm1lVwNtW3zxSEooynTOleq3XWIvhekBxxtj3foCZtjPNHZDi/MguL2zrOvVCKweFRHoyOTHWPb
	DEyywQYkcb3L3oI5KKUZkI2Pu+7ETGDc31V0TQZekpvpk04TpPTe7pK6KRV+wSOUCz0cDRiif5g
	ZzygtI5yVO4qsDRonuUwyVN11eURB8psPoP5sI+PsE2Di73AXkTb1T+sArbKqr/ab++R19UCpso
	phGqftyvesMViBT7hKYggfCQmuspcGrBI17JfQduteFrGHexS58fKZFziyU0L0I1boGdkl2Q==
X-Received: by 2002:a17:907:3e2a:b0:c21:7feb:4574 with SMTP id a640c23a62f3a-c246a2cece6mr1544595666b.1.1787434838519;
        Sat, 22 Aug 2026 14:40:38 -0700 (PDT)
Received: from m2.. ([37.142.151.124])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c24966f99basm466778466b.37.2026.08.22.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:40:38 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	Christina Quast <contact@christina-quast.de>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH 06/13] HID: ft260: i2c: reduce bus-error message severity
Date: Sun, 23 Aug 2026 00:39:34 +0300
Message-ID: <20260822213941.98882-7-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822213941.98882-1-michael.zaidman@gmail.com>
References: <20260822213941.98882-1-michael.zaidman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver logged errors when the FT260 reported an I2C bus error or when
ft260_i2c_write / ft260_smbus_write failed after such a status. That was
meant to flag unexpected failures, but bus scans (i2cdetect, HWMON
discovery, transceiver monitoring, and similar) hit missing devices
routinely and should not spam dmesg with either:

  i2c bus error: %#02x
  ft260_i2c_write: failed with -5

Keep returning -EIO, but print those via ft260_dbg. Still use hid_err in
ft260_hid_output_report_check_status for actual HID/USB transport
failures, which are genuine errors.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 8db896f164cd..1ed3701eaaf7 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -565,7 +565,7 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	 * to 1, bit 1 is also set to 1.
 	 */
 	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
-		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
+		ft260_dbg("i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
 	}
 
@@ -599,6 +599,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
+		hid_err(hdev, "%s: failed with %d\n", __func__, ret);
 		ft260_i2c_reset(hdev);
 		return ret;
 	}
@@ -638,7 +639,6 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
 	int ret, wr_len, idx = 0;
-	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
@@ -669,7 +669,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
 							   wr_len + 4);
 		if (ret < 0) {
-			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			ft260_dbg("%s: failed with %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -685,7 +685,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 			     u8 *data, u8 data_len, u8 flag)
 {
-	int ret = 0;
+	int ret;
 	int len = 4;
 
 	struct ft260_i2c_write_request_report *rep =
@@ -710,7 +710,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 
 	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
 	if (ret < 0)
-		hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
+		ft260_dbg("%s: failed with %d\n", __func__, ret);
 
 	return ret;
 }
-- 
2.43.0

