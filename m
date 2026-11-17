Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912090;
	b=sFvG1EziYNkwroU+E2cpHDJF+UJpTTpmw6MriF0E3LYN/AgpaEtUijzvQAqI+XBjRvUZ
	 /I5UjK7kvTloJrbN/7WC8xStyvkZZGenf+45CT8buwBQAauhE1263q+IDHoxhXA98dWj9
	 GT7Cg9Cy1Gb8vZKJpOGKpWdLdda8FEHyZGa0EQMOAlN012k29bn0NG1Di+7P4GOzGl34B
	 iQmvZe9rVAUqexYM2iDlnk7DeNrGx1Vj/19FO3BiC+h8yLqB5C08G0tVXDMrvFdxxR8pV
	 KZbE9if5ZCgvTChiwx9jrL0j1A0aDFU/IgOrD5LWOTK7ogJFLcfrYvKNXAmtOMMtMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
	b=OkY0nATpb0vd3F4DSz9OJxQBopbTfRYvs7DKxHamD7rLpmAbpz+f2CmcdLBLrTb0u5jz
	 tYETFXghUEfkem+wPrDl8s2p0fkmRRoR+eXHxZaLatIl3vkJD32A1+F6n+ty5E1zrsK92
	 7X3zwdePJXNMEFmewCGJYNXQfFAszNZAln8M7C1JfjNMOLTrWZA6PEteaU3eN9/b4Vqdi
	 MIVRw5ahY/4Mb2i5NW18MefeBpbk3Rl3+esr/ns7+1v7AztE6BLTtHuwsiZInuIHB+AmM
	 /0CKDqT2IaWjI4/ucwI/DESTgxmxqrEc4wy57nOSZCt1lOF/qCQ6GsPGTqzpvmmBimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzTKbVTa;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33A606A323
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A33A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzTKbVTa
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so4176810b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912089; x=1795516889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
        b=vzTKbVTaO0mnOjT0wrC9bJuj2U7c8JCBOJXeERXLXjO6BfmdRweqdJxvATO5aSRSHj
         SXb9XVeZEaBHEWOO2LUH8py3vAozCejmhPwtmDUBrZi4zh1Az2YxxawDJJz8Ml7lH5wd
         cnrD9bJqzzgyTEoscy4of5hkrgQDPSLHsjyaApIpOGz/V3CtmNtFnDppf79BVRrpsCzn
         nQUYFA3GFydj38LtNiRADuY95g6sUsnytyW70R+5lCmFfR3lWNafrMTBuzYZgT09nVi6
         vV8qmPYcO67Sg/XsSJIXbi9pwdzhbSr5k1Eq7p3ooNns1OQXih4gPtmlRxyRI3d3p11k
         rEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912089; x=1795516889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
        b=WplMUd3jphf3eNT5hLJ/HiE899bXEDwUQiMft/Zp/GRlPhHal52onC2OLUF/Q8wd+D
         gZ1vMlLhMgkJzw+UaK6XKAUSZ5dbAUeC3R/Hi4umd2NBo52e/bsTsAZNl6L416Glq8xu
         LSwprfY2HV1/sTUDyFIkycLT3BtCEryBYBFwKgg8R5veiRMp95YpBN5YakF2HMv7us9T
         w8kZkkVqVxLY4R6jaRlir9JkAV+tNMEmgIL4KWaBX1EswtkLhSJTWBP6dCGRqAfu5bqj
         TVe+PIsF+EZLSNgtiqFk8LhiDVyEz6Dg25fBvXuON25hFHmcYaXBVaTgY71l4/ReOPrE
         vlfQ==
X-Forwarded-Encrypted: i=1; AL+hErERPHXKlOGtc5gIVTIiDkGy97s5WUbJ1QdsZ91GFsm17/tzg5vhz3OSDaghLopIMcbQl+4jO2p56fOC@vger.kernel.org
X-Gm-Message-State: APuU4Z8gPz9rpW0ZveXRUqnbSVi5H/+gjgFSIPYXXSZ+GrVej7dT7Ekd
	Q0oCsfIoXa972+HvtJY5NDhQDGOyW+aIRO3Kt+omH7YNTNvk7GVIE/U0hFQvtaO/
X-Gm-Gg: AYBFou0D0CFOGITikt1EsU38+VFeTpS33qwroDrRmBYTu1dO2dPFKs+SiSIT8TuVGZ7
	/pja6qOx4RpSntVFmNITAJKruVk72OI2/tloZ5xWc+mFvl7u0A98S+t3GISdiYwaMqDBXVD+5DM
	OmGBN9Q7EDJg9LcxO7tf08b82+KX5pUal2/y0FHUpcbHXpHy1aDa617pBBhAG7/nkHK8pausSGX
	ePWBh1v9WADaZhaoxuyDMlTXaw5ty9TTymttEv5lNounXuhmmmjobVKPeaK8dBSCmTLMFul6bEB
	MIx3aFFCpR3nEaXmumLbQFi4pYuqXznEC/+iP0L5ELllMrx9+QvGRGRqBSoRdBmPaJX4ygOqQqq
	L+Rc5D6eg8Wofudb5qYHjDnacwEmu1MNAVQwN8E+6UNsGwbHcrEUu8kw+T/En4Yy7O5swYHRRb5
	7JF/DMEPp7jioyuTqhne/xCAxLGv3exDo7vkDJxA2foFzRSGBcHVwxG8QWOVZ2hIDVnC2YeuFtn
	k3jQ/BLFVlA8lpfTshpa2J+m3lFwkMAjY5Po3fWxeJLtYVeYYF1o0CVtq21yNDVln8o8j9pqeeB
	3RvzgNqqiey7UT99rxj3drvEQT+R1i1TIk8+BOkgodX6FQ66
X-Received: by 2002:a05:6a00:2350:b0:8b3:15b4:45f2 with SMTP id d2e1a72fcca58-8beb6b6baffmr12020475b3a.25.1794912089476;
        Tue, 17 Nov 2026 02:41:29 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm4900102b3a.48.2026.11.17.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:41:29 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
Date: Tue, 17 Nov 2026 19:41:10 +0900
Message-ID: <20261117104110.240112-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
len_actual - 2 bytes to the caller. A device that declares a bulk-in
endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
the copy length becomes -1 and memcpy() runs far past the one byte
buffer on the caller's stack and past bulk_in_buf:

  memcpy: detected buffer overflow: 18446744073709551615 byte write of buffer size 1
  WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
  Call Trace:
   __fortify_panic+0xd/0x10
   gpio_mpsse_get_multiple+0x767/0x780
   gpio_mpsse_gpio_get+0xa2/0xf0
   gpiod_get_raw_value_commit+0xf8/0x1f0
   gpiod_get_value_cansleep+0x1e/0xa0
   value_show+0x42/0x90

Reproduced with dummy_hcd and raw-gadget. A read needs room for the two
status bytes plus at least one data byte, so refuse to bind otherwise.

Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/gpio/gpio-mpsse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 61c5ca96314b..3ad7048f009f 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -676,6 +676,10 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	if (err)
 		return err;
 
+	/* Every read carries two status bytes ahead of the data */
+	if (usb_endpoint_maxp(priv->bulk_in) < 3)
+		return -EINVAL;
+
 	priv->bulk_in_buf = devm_kmalloc(dev, usb_endpoint_maxp(priv->bulk_in),
 					 GFP_KERNEL);
 	if (!priv->bulk_in_buf)
-- 
2.43.0

