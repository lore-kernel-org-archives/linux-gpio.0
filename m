Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945936;
	b=irjCEJrB/xd6w9DlAnAhPgdGwb6dPK2PumgewdDjIjE2ha26n776pQdb3d2XvvZ/tySB
	 cixhWjNvyWVMZ93Fo14ff/jnG3Sbq8s2+e2ZsdGQAdvb4QPrtp9kH/WMq3hodIgxUT/sb
	 H9cin521BtbKNQtSuTsbfUqDwJudIxg6MJBdWfPomb6w6eYxJqX0hb4ljCryptQ5I0tUn
	 PwY8XA22JbcSJj9Goh4sjpd9q1HTy05sp6guYm9EEbPRyfgYT2TCzrIjr5X6q2OE3pP0P
	 lBGXptWFYdDV1izHuBb5CJnGjRJG8iCOeaBX+S2FBMDMmHjNRaqjJdAok3Nx2NPmU4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
	b=bWvKvXGBzJPECLHfjJdUmAhuNDjgAAnskz7zE8ZJWaKB/uSF7kDaBIq2Z7PZWgezp1Go
	 6HCbXmp3SBx6xgutUx8us2KT9o8Q8PqlzuJd2SShrbiz9EDoX45SQNzlFHEAEToi2erb3
	 n1a9ItKgNmv8EvZG9CbBJiIsDZrWAaLtSUtAV/YBLmj2TaBcBTYNBtHM5u7FXYK+EzXvO
	 Xr85CEU1AUo5m0itQX++hgtf6lvzOyyTFp2O1DBbjvAq8iWjKd3GttctIhToVEI8qr3MV
	 rGsLGS8njaRV/0QWUAlR28mjeENR+Z2RT0aehh4KZN4F6GzxrD5PICQg9Mgtw9SrZeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g82d6f8q;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E341606B475
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 20:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E341606B475
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g82d6f8q
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so92277f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945935; x=1795550735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
        b=g82d6f8qYdcw1P3PeliLS1T5H9U0IcgDSvbHbmDNXHG0YNHiKA0wzAaPTw9Yh9l0xf
         7Uxfu4V7F5KzrLi/15wIWpNl08nASI9JBMPfRbI6o0edRbvvmS8HvC5AZ/hd05NwBVXH
         oKzj7FSQcG4BTI8GcUvUiqBSRNipAC2I0536YmAMRfZn41nIb6zEP6IHABUl8GqAUma1
         Oo6RA2mFZ025y2RZdQnNSpK6v8ZZVlwGjLDHCFuvCRcRpDT2A8L/6gh+E0/PtHoSSHww
         ND/W24jbWzgH48f0xZsH0RZ2MuiAhjFykGzY0s328KEEiKbIf3AlRRU8vYLDvLGKIzLa
         ELDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945935; x=1795550735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
        b=wqrDkzwLgAq2TRqTrK8+991rYFhoo8T4FsOxGuDBWzwzu0B0G/lCiOCD+5w5vLTcpf
         04UpEyCzddpZSVqPI37w+AEhXGPs6ReqQJEOwdjRFLdGkMi+NJ2FOYRnD0XKIkVpLYtN
         N5FATFjQotaiKrkn1dVqktmjyWy6AXvD3dhQlD2flGNQ29Vo59tJ+1WG148u9mTcUW3c
         lNu+mZjoix9/0DP8/ST5LtUOxK2opIB4b33tZ6TM54CfG3q8XJ+VkNocfPQLFVuk4Jnt
         K8XP7t32dMxxDv4SIWoBk7JIKDk0yPTXloikz1AxqM777+TatQPwWvZqFj7H0T4w3lqt
         mx6Q==
X-Forwarded-Encrypted: i=1; AL+hErGK2bP3bmroWkZAhnTBnWFqJgTlNWj98SJJ6FuLFp2p/+UblZB2DrfnYdNylwM01rKhM10F0GtR9fS4@vger.kernel.org
X-Gm-Message-State: APuU4Z8GZOeFhIjIu4hG7vyAToOUWH0QDbCKxk66wh//F33NXz74tAtp
	LiExG2LEmc6oe4qmkw04EbKBrcG7CWfW3ki+v8Nw8misQ+GWf9zjdi3E
X-Gm-Gg: AZFdTZfdO84MQLU5VJqOdhsp/5k8fZyzRd3IKBTeL+uTiY+/Way72JUmQv5UFOW0Nrk
	72MX18nnMKw6Rhp+s1pqvluKRlJf3l/pDqjXm+8EUVUR4hsXQXv2/ohkgfXQfskzxtXQ0LKE+Dx
	HuDk8VFR/9bfGw3YT6xEIXFuYDFxgp9iDQt7FEjJgNAdnXTr8/zy43jNy+N2BvLCm9vIs9w9JYz
	vefnqFjtpbihwJAWg8k+UEijs87hqwN4FBZZ0h3L8ffHbC3OHITxJNwm7wSKYxTKg0SjUXe/J/P
	LdqA+waVNixdD0y5T87IRBZvmBiYV35ZDj9XTC0iDjQz5S5ccmZYwQmU9eiJmFi6l3P8yYTYDpG
	D3DNRqDXE6BZgGKPIfChKwc+8e7r7Hr7Hya8OxigL0RxzgxCq1iqlUxYZonMCinHtKsVi5RPoDB
	Gn2poB9EJP6V3I/OzC83IP171Wf7AA+wLdIi2j3RqUCT7U/ZW9Znx9ots8mzgYuMJUDhzCqeHBt
	MK4H6btJ7iaNTgLBQ/oNcAZ9ovAcF67c3SalEVvvx0lv5W7WVY7Ryb+YH+hNzX/g0mxHxVAFpfI
	oik1FYyCnb+7OCp+UFGUD9RfsSyF913VuVQ=
X-Received: by 2002:a05:6000:24c9:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-4a633a652e2mr1441900f8f.1.1794945934473;
        Tue, 17 Nov 2026 12:05:34 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:34 -0800 (PST)
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
Subject: [PATCH v4 14/16] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Tue, 17 Nov 2026 22:04:20 +0200
Message-ID: <20261117200423.19561-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
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

A sysfs store must return the number of bytes it consumed. kernfs
hands that value straight to write(2). i2c_reset_store() returns
whatever ft260_i2c_reset() returns, which is the length of the
feature report it sent, 2, not 0. The "return count" below it never
runs, so every write to i2c_reset returns 2 whatever its size.

A write of two bytes is right by coincidence, because the report is
two bytes long. A caller that leaves out the newline, as C and Python
code usually does, writes one byte and gets 2 back, which is more
than it asked for:

  echo -n 1 > i2c_reset   1 byte, write() returns 2, bash ignores it
  printf 1  > i2c_reset   1 byte, dash reports an I/O error
  echo 1    > i2c_reset   2 bytes, correct by coincidence

Return 0 from ft260_i2c_reset() on success. The value is discarded by
its other callers, ft260_hid_output_report_check_status(),
ft260_i2c_probe() and ft260_i2c_abort(), whose own four callers
discard it as well.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d5250bf5da61..e89f8a2fc06e 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -615,7 +615,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	}
 
 	ft260_dbg("done\n");
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
-- 
2.43.0

