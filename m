Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CC381B05
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362478; cv=none; b=qpwro4s6Ax+LR2SAoZMAStwNyEGFo/8XHorIkXnOoAs1+ndzsuQR/CL6oY/8EdrAgDv7EH22iNaebnOnDHiaFx/678YdUZJFgKohzWnUOhW/pQSroypeQnCvwcLnQkMsIxFo8n87T2E7vOcAEB63pgoRvElO41N9SoACaruRXP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362478; c=relaxed/simple;
	bh=FPYs5SDj6qjqumMg2k6zXtsnAbrUK4LVvGwGcEzDtRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZ2lZqlGlgNxGmF0Iik5KzJ8IJUmZCbx4KBbFd42yyu2FwnJVOT1WuxcgFkDIbvVu9Zp5z9Zr//MUtE+7kVlgZPb1OQ5IvQ0dQQjXjTeqefuMzh34Q7e4kE4rSE4/+NVQ4YrgHeNCa7JTsJZuk599vu9K5TCEzpdKB2nVFOvza8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/2eUj2b; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/2eUj2b"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-49266a8770aso2702475e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 01:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784362475; x=1784967275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpwfRCa3QpVuvv1KidkUVHXcti0UD4UJnC6FARGoVcU=;
        b=K/2eUj2bXP4ZysoFqvFxXAPmr0NAr85xqQqqc2JculX5b5u3yfYxxprOX+cLOAYKMq
         j7KjMFf4kuESws7j/x6WuU3TXRnXFhO7fAPc1/v9Z+xxeuLrc8N1X/3ik/yuNR5/sSny
         c15ZZXbR/jmngmGT6bhvV2x6IcFYZNnX1Q6D4L1fbWEtN6fKmS07DOldwAXGlEaw0jnD
         nE3f/jwFGWJ8e0b8yVjPvJ6113m4U5JgysE27VdhQaYd6JRqxv0T7DldYcaD6vl2qO3H
         9NKnkTSBRHG3Dz2Imy/3/vJwb8MNBJGb1D3dCseRKVVaaWV6Qm4peAaVm0K+O2DwqqvS
         fX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784362475; x=1784967275;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpwfRCa3QpVuvv1KidkUVHXcti0UD4UJnC6FARGoVcU=;
        b=hz82CBPU+NVaVNR56rdq9rxeXE9ga3LWzRuhKz/oaVQX2Y4X2t/AOpO7PBSdmyKRoe
         ufLCBeYYVpR7XTMzA/giNqiQOvgDDtJcmGYyFQjYWSfN+tnW97IvedHkbdYRr1EueTT8
         W+6NsInHsB/aoLWhIxHmf6j2Pis1pxKCqXPfbZZ+uHEwIVBivJm49j5Ux8iKlMqSS/VO
         JR/TmyV7+sMZWPWv/mib5SU2bEfpXKMn/4rDXvp3ZLcfGtm1vOyGqBo3Zl7tsqqKeSdz
         1AD0iI6ufSruNtJlJMdx2iggDXVpa7Bn51nBXr4qNTu4oa0xCmcyYdumrA8RhPJB1KGg
         FjzA==
X-Forwarded-Encrypted: i=1; AHgh+RondVrS5XJvDhZBarGQN+EglOLWU78/61XrjOme4da9MN5uwdk7K4Uw2MKkGFjUDNZJj8M+KW1BTaO9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ1xVy9356gCxAq6c/Nde88BVtFCDFYMnhm9d21iRaiYn3ZUlj
	AcE74WnYg/U8BAVU8UHKOKYdQeIs3G0tlaNNbss9DQJh0RNJ9s88i3uC
X-Gm-Gg: AfdE7cmJrS57gPcDWjAW5T14XZsO62A9XtNEYo/GDCVFOfS1ZYICXQ/TyBP8zJZ4OW/
	mM3D1lqdRM8HYCMTY6ARA2FhJb8M3mTo+eHkvyKgdilcwF2oFK0oY0gH6h9LASGiq7MCXT5DDYx
	Gno+U8oK2VvrIq+rCacCDoQU/IVrIW8SV0yCV6kjBfQGTi5Ht6NoShwOE+KFu5PrOseTRMaWhc+
	9QxCCuMkp5EZtfV7DgcipcZbVMRgnX3WGKOxe/v/8THG7sLs2vWQXyLI88DS1gW3wTXYdibHVic
	ZzHVr58bi361wuKr2qYjeOTEqUbdWrPBYYyMeZ1vXVMa+yov73hKsJEmtnM7scwc+wjuQqGczUN
	OlTEiZ+jRwqlyKjcc7R2eXRYCsy9guq54iW8Euwqjy14fUp3K7z/ABDClHCH8G4GyECnqrSWND5
	edYhT1UaEvxB/b
X-Received: by 2002:a05:600c:3553:b0:495:4a33:2c34 with SMTP id 5b1f17b1804b1-4954a39955emr38675365e9.0.1784362474895;
        Sat, 18 Jul 2026 01:14:34 -0700 (PDT)
Received: from meto.local ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm73234285e9.0.2026.07.18.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:14:34 -0700 (PDT)
From: =?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
Subject: [PATCH 1/4] include/uapi/linux: add gxfp_ioctl.h for GXFP5130 fingerprint sensor
Date: Sat, 18 Jul 2026 11:14:28 +0300
Message-ID: <20260718081431.25456-2-metehangnen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718081431.25456-1-metehangnen@gmail.com>
References: <20260718081431.25456-1-metehangnen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define the userspace ABI for the Goodix GXFP5130 eSPI fingerprint sensor
driver:

 - struct gxfp_tap_hdr: header prepended to every read(2) record, carries
   payload length, MP protocol type and a ktime_get_ns() timestamp.
 - struct gxfp_tx_pkt_hdr: header that userspace prepends to write(2)
   payloads so the driver can wrap them in the eSPI frame format.
 - GXFP_IOCTL_FLUSH_RXQ: flush the kernel-side RX record queue.

Signed-off-by: Metehan Günen <metehangnen@gmail.com>
---
 include/uapi/linux/gxfp_ioctl.h | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 include/uapi/linux/gxfp_ioctl.h

diff --git a/include/uapi/linux/gxfp_ioctl.h b/include/uapi/linux/gxfp_ioctl.h
new file mode 100644
index 000000000..c9c6c2d48
--- /dev/null
+++ b/include/uapi/linux/gxfp_ioctl.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __UAPI_GXFP_IOCTL_H
+#define __UAPI_GXFP_IOCTL_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+#define GXFP_IOCTL_MAGIC 'G'
+
+/*
+ * 4-byte MP header + payload must fit GXFP_TX_BUFFER_SIZE(512).
+ */
+#define GXFP_IOCTL_TX_PAYLOAD_MAX 508u
+
+/* Maximum protocol payload bytes exported via read(2) records. */
+#define GXFP_IOCTL_TAP_PAYLOAD_MAX (128u * 1024u)
+
+/*
+ * Stream tap (read/poll) record header.
+ * Followed by `len` bytes of protocol payload.
+ */
+struct gxfp_tap_hdr {
+	__u32 len;       /* protocol payload bytes */
+	__u32 type;      /* MP type */
+	__u32 _rsvd0;
+	__u64 ts_ns;     /* ktime_get_ns() */
+	__u8 head16[16]; /* first 16 bytes of payload */
+};
+
+/*
+ * write(2) packet header.
+ * Userspace writes: [gxfp_tx_pkt_hdr][payload bytes]
+ */
+struct gxfp_tx_pkt_hdr {
+	__u8 mp_flags;
+	__u8 _pad0;
+	__u16 payload_len;
+	__u32 flags;
+};
+
+#define GXFP_IOCTL_FLUSH_RXQ _IO(GXFP_IOCTL_MAGIC, 0x11)
+
+#endif /* __UAPI_GXFP_IOCTL_H */
-- 
2.55.0

