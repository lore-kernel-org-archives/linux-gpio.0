Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697737;
	b=GWeZJdFKElb5Twv/UerfUeP+5mL9qj4VhM/h5oBPibdIaUTb524bkACALPCbC7fR4omX
	 DfPG+PRKpV9+rOkm+MKFdpmNmW4BowdEDkqk0aKfxUqWjZjVjzn3boxvfwfaL0JQtWGPy
	 gAK4MK2rZxwusUrX3y7wqjPB7EcgbXdkJWuUQ2+Kfth9q1Pg1aUQWyehubt48bb11jiCl
	 ix/0bQlMcLO2G0AyNAFb8EL9Em1z82SVXwdb3R472BiCW8MPueOyNkRHK2V5WJseIV0s7
	 dRYRkVdUQxzhEFeapaRxBiJYMa7CZbP+eXsq+XjmqESAYAM3dcklQa2R/HnV0aYXpKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
	b=DBifAF32ox7NghPVNO0N1UITzVWlBDeePdQBm3mdiyJRGN7VqnmxmzvmCFQBCqEyo6m8
	 yQ3xCWE1i/8WN3EZ0e8ia1vfJj2sLWkpNFbv8N8gi9Rumy5pY37M14SW1P157tmlLfWjC
	 1G5Rf6MAeYaJ2rV86tpuWUxpBrlOn/mkQ6Wah5xcvusHO1P/OVMYtyy839FZTek1/C/MS
	 xcLoCvJ/K4VWC1qYrHtIoGXoOhfaoOhgQyORVQYWHQjN894hDIwidRsz19/dVgFymnC3e
	 aKTUwZ3Z1Qc6eaGQP0S9Wfy3pODKusWoDsIPYqSI05ZjRGBc/WEMtdDwlYG5UNLyS8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxtJ4nYc;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD860A6F59
	for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FD860A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxtJ4nYc
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so1471945f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 15:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697735; x=1795302535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
        b=mxtJ4nYcD3JlhG7YDutpAQpj7FaeOIgaBQzUDovzeWv4MAbcvmdvn2lQ+aKk7Po3G5
         /BxoS2VZ5fgpggK0Y7jhBNdDAe7Mp3WIhZJBn3jEM7F0CF32A3TZECkAbaqkNN0YQxCa
         y7iEpKP8aZfa4yI6ARG2t+cxi9s1NH9exiq//CyjY7wOzyRf858LQ+O053LkjfNDTJUD
         MRPpI1t/ncVOfmBFHi9jrOnogVHDbEktNrmpigNSQ6vTxNdleitT73gxskCzjzPwcKe5
         8D4EpfcJhzlJ9HdtVyXqWq0cggrGPV+0bR2Vmz0SCDBQKYOJSNMufDQi+HE2JvrZbSK+
         AFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697735; x=1795302535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
        b=2K5LrJhoCK+MPcS4h6iQCz64HzIUDOyoZwLR2Qfc0nBO8DpWNl4SfGSKdOz9apZNfu
         jMuLIsN0JfDrg/8Fk3snuffMNFLDZJw7sRzQgVMK3JTNBwtawDe2GRNwrYUeIVjtt3Pg
         D0DKi+8pIgZrMsKEfHr4QASFJ9dIX5poPTnR5kzcJ+PGAk0UMHs43hj9Ye25Oe2kjaED
         ouAkJMjEDn1o4O7VxJ/0gnPXjdvvQJ6rVmMnxRKrSeULRRRgXu6WVKP20+LZ0/TYiyi+
         3ko9GZHyjxQR89CMLAdijySTJt1JzhwM9wWQICD3raroN0maLgdRXChPQU2KzTCZxvDg
         HcNg==
X-Forwarded-Encrypted: i=1; AL+hErGOW/kTp6hfVKy1BERoUECy3lT6TJR8Vl3PAFqjbFD806nOD1l0pmwP7AxRlDROfDGz2+jCg1TeR+k4@vger.kernel.org
X-Gm-Message-State: APuU4Z8niZJT+3I7g6sXVLkWxsAaEPeOUCS/JAARP9Xn5ZA88NuFo9jH
	ulQyds0IVQJGHfiPi9rWopCLtQ8em8M2/g44MgTxvTHkJ2RToFbQm++R
X-Gm-Gg: AYBFou1FikRbOH5FnzaeN4Tj4ZM4347FAwQL+iax7jAuPL3zQQVaulfROyMlh2vJG/y
	mQBUeioYfP25hHRPQo6tRx01ho/UvQNZ+Poe2OdtjZzvuRJglBownGd2Da1UvZ7X87zu9iBgObN
	8CRgqTm1ivbvKE1c9+2zLeG0eVS1WggHmlw4wkQHtAPbmhTS1Peni6E6TOY5ZZW8vrqs7R6VDGS
	/SH9Zh9j/ZMomDQzbz4UzFcqy4c7BZZjqhJf5GFx+hjtTJRd82VHQI7U7WY0OdYXWQ3XFe5hdvl
	TEL22RzvjX84nvaS3BlAschDeTToH8Kb8KkzIyJSRrvcQJbyf0FpDY2WQvxnLWUtrhjNcdncnPH
	s3peb3QAcp3ydAyuxZOmRpQtNORa7pg8gskCMmPebidIm4Lx45sjmDB5K9Qf9qYZmZ5zyoN/R8M
	L8j5F0i+sYNvtWW3Ui/ppvUOYlrNablgw5J+D0Iave+K3ntjQPCtN0HltWGFNDw08I0Yh5un+7Q
	PhHHjfwyi0jthCfIPHJWuYzvaI//2ybr5mAeIi4KDeKBqTYDn68WFNnTYV4zMbTnocKo6yMKTa2
	P+rHn4Q/okrbrBF4YCUvMJUeY8a7rfZl1Y0xYd9Vor6PYJJJpA==
X-Received: by 2002:a5d:6f0e:0:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-49b01734a32mr21424865f8f.6.1794697735316;
        Sat, 14 Nov 2026 15:08:55 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:54 -0800 (PST)
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
Subject: [PATCH v3 14/16] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Sun, 15 Nov 2026 01:07:58 +0200
Message-ID: <20261114230800.1344401-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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
index 391128e4bb35..80b300893658 100644
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

