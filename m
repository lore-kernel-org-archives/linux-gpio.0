Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399832;
	b=hxr1voB2x4HrKzo43GXOZDK9jbJKtB8cueuzn1aqfq0yTnt/gl+OGhZ0egPNnwHYoy1W
	 130zMp02n7HUeppH30udxa+WHI4lLS0QkV4jTZgdOHqtU981wnfu4wFdwgGIpr88KIKNT
	 lgEo18K5vFRGUca8SY9BrdOuEGk2BNcQVPG8T2T++eRwpOFu/HIkzgiyH8xtNpP4MkUFL
	 wxtdhJPGMhrUAcHROsdN8LKJsj2jFDmUBu40p8uD6jlKFnslcqvGX229A5AIZPw52my0M
	 dC9Y8oUUX2Rtu7ZoRnSFYJWE9WVXWtA9WKjt4bb+N8q5xklagP4HNq1gBbDTXiUv/rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ITruexzC3YrUxXEBUSI41RKRjFRMFCmpkb9IBOKFR5g=;
	b=XEwaqPW1Fa3+39pWiyxsv5GAA5PlgO387Ni+nxuiMg0PVVrP/L0dOF3mMzLcx3tT+0uK
	 z2wxPVX3/pVCW6gMcHddNzBXTJCEr29diP5oTtt96TN61mH2zgR9RqeWRrlIs+ReE6zqs
	 3/jiAcjWFSzEOTW5iBSikAN+9TZCCmn5wdOWZw5OROfkRaTENqe8ZTR8GNh5AHLCc5jre
	 l5GUVOhQoTylo8lUz8w6zbEJXXuWizXwxvN6Wkfn18vLvXCUG6qKm2EtgGEJYnNR8nsAH
	 Ehg8Ew+R5FA1ubqYZ2Sy/Zg2fL5O6JLMZGMFQ3/yhAoZOgfv4jOBXJxp8DxUjdFQIvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PBKZ/jnW";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9A60A2620
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C9A60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBKZ/jnW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c5358fc28so945657f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399831; x=1794004631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITruexzC3YrUxXEBUSI41RKRjFRMFCmpkb9IBOKFR5g=;
        b=PBKZ/jnWa7mmm0tS9g1kfixlHrM8IMYxEIHY2MEbheruyGor+NpYfhGtHuBAVe4OEn
         Rlhq1kUQhAokfvYgRY8u4jkmegL4T4AcB1oEplG9FIz61gKmJYcVUPIaCv8boO1zaYcA
         o6R46deS0v1dTBsiCHpNe5rB+V/TxVK1tP4uy53Vm69DxvvkRJR3YKaLfUQ/hnEgJaKM
         bJ1CdjOSK+dr+iKAbRthch670fYqnBO9M0VVg7NdGVHqQwregA6vSLYbIzjr52XRWQdS
         xOXa0TOG+UIeeRHYnCCzrhLpdp9aqxXWJFwjyvLXwsBdMksu3/zAm4Ziw7MctucOEoJo
         n1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399831; x=1794004631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITruexzC3YrUxXEBUSI41RKRjFRMFCmpkb9IBOKFR5g=;
        b=wYEfMU4pWg+oj2mClM9uA0hAjYj8bstuT4iCsnJ8RrdrdE2Um5rb/WyKoedxE0kaJx
         XDKvVs0aTzK51o5cDJxzbRnTX8tm2A81raD4ED6lY12WQLKaHdwCWy1gD1+QNUT6Zhqe
         3o+SpMCO9hhZfwK82vB6TcbJYHOmNVrM4FBV3K0uouwOe+B8nk3vbt6KqetDudNhNBEm
         XtCblP+f5xBOd2AreHmWp3d1BSr/ph8OZG2wjXxtdJ2DGRx7qTWYVdamUy6CBjnxSIgy
         2e9y+CXV+FSppnQuEXNgLfFHB3gNYADqCQkFCGkTi9b23k54XTjfze7lP/rCY1PtqHgU
         deKw==
X-Forwarded-Encrypted: i=1; AKwUvByl244uTqPn01cZE9wDfAjCeUjRBzY6YtQPcZinkbrMb4MzFlJaCkbiDQwoumlZIolNAczrZpQBB202@vger.kernel.org
X-Gm-Message-State: AFq9FYJIDM0kb3p0GcKHmUda8tlgLloewdjdfD5WT2zbq4rOeCizU0Fj
	Aog8j6eXm9sldSXBOY48iKbT+e7eEY/GHwIoCYAJ/HWmP5GZsgVA+SZr
X-Gm-Gg: AYBFou0u/euGyltZ9KwlONEjM4V3I5dOxLxfdgIbc5ZqpVewlDIhQyb8vGfi1M1ApQP
	YI8RO/D3w02tgnH+9Ljf3FZhTRlO6+api7/Qxc4jsdSt2hxOtNgPOO2Q+FiprRL4P6HhPQHjZ+K
	SuK5JTBB1JH3tycKuPyQJQ6Qzr6CsPOMKAcH4h6AO23WgDO/LZfuivSxuGFoOVDblZ82PdLSKdQ
	zF9HoBcBTM8CGSyyxz89TIKvW4DVk0yliktNY3zQqSLQ4HGH081MGAS3QksGMLfs4tUoUrhLkpT
	QpgHDtpy8N6QbLQNT3VjfIZOHSv2TPI1+YY0JDB6Ezu5Z8TQiiV4Fl6HZRx6FwzFmGZ/yT6J9zp
	DRUE/TMWm7930TRqhbL0MeL2CUVqApiJMjUh+6O9baNg6mRGL1SWr7NCR9Gk7f7ZLQJ/5FB+Ey7
	6e/pEQPQ20A9OYhwhAyiHG7h/zwdOhE9WObtLWd3xJq+lSTIhyx+OUot2e3I6+EDrjPWUM47QLL
	xvD95GSQXOGf8QWiVfL8AO1sJ8FvikUkbsYVBO1COaiBJufPsnuwZKZbH5JjfmtUEtlO2C7TgW0
	a6uwhfslYuykzTWmM02KcMckO3wP
X-Received: by 2002:a05:6000:310c:b0:48e:2a6c:153b with SMTP id ffacd0b85a97d-48e6e2fb0e6mr8615074f8f.35.1793399830633;
        Fri, 30 Oct 2026 15:37:10 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:10 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 06/15] HID: ft260: i2c: reduce bus-error message severity
Date: Sat, 31 Oct 2026 00:36:28 +0200
Message-ID: <20261030223637.86907-7-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
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

Drop the extra __func__ from the write-path ft260_dbg calls; the helper
already prints the function name (reported by Sashiko).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2: do not print __func__ twice through ft260_dbg (reported by Sashiko).
---
 drivers/hid/hid-ft260.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d2c5c9ed7927..6f8d72938702 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -575,7 +575,7 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	 * to 1, bit 1 is also set to 1.
 	 */
 	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
-		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
+		ft260_dbg("i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
 	}
 
@@ -609,6 +609,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
+		hid_err(hdev, "%s: failed with %d\n", __func__, ret);
 		ft260_i2c_reset(hdev);
 		return ret;
 	}
@@ -648,7 +649,6 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
 	int ret, wr_len, idx = 0;
-	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
@@ -679,7 +679,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
 							   wr_len + 4);
 		if (ret < 0) {
-			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			ft260_dbg("failed with %d\n", ret);
 			return ret;
 		}
 
@@ -695,7 +695,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 			     u8 *data, u8 data_len, u8 flag)
 {
-	int ret = 0;
+	int ret;
 	int len = 4;
 
 	struct ft260_i2c_write_request_report *rep =
@@ -720,7 +720,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 
 	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
 	if (ret < 0)
-		hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
+		ft260_dbg("failed with %d\n", ret);
 
 	return ret;
 }
-- 
2.43.0

