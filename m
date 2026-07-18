Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABA383993
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362482; cv=none; b=Izzus1LQR43RHJTB7SAFRXDeJ++Rwze9mkMhxNXXGb3KACc84XZcyx7VewfUcUX/J+wBDqHxr18wpZU++S05uuhRZLoj9z+RYcSbE8UYto59v2OgRpF7zXZBkhs7TSOLUiv5t9MPJYjPbJhhFi7GCRIsarp9cG483DzQUkjR4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362482; c=relaxed/simple;
	bh=XL9SHzqUU4I9q1TOJJm0qrvHJGljsH5Wa/3R3Q++ISc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJ7ptTQBlCm4gyuJCFSnLUS34PHROr+/NFdqrpgq500HQud+fZqSb2llw810bGl0Uc7jdM0HaPBGFWEPUApXO7l/QjhEEAQmKefIqKaEq2LWRPSqc/feweMOT7mAGb406r1b+17qCwC5uvWede6hOK6PaumVJDGBuNKmdYamLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz4SFOtq; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz4SFOtq"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49543aa9bdfso801845e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784362479; x=1784967279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nElWDkdLXGPOvjS1cFwIf8i11/YAz84PJLo/bNncAwI=;
        b=Sz4SFOtqkHCTrDt2crKY+g/VSZvBZ2SFyc8kA1x4BwDfajTnMCIiUAAH7BKPVRUGs7
         JPybJoP2fd6yuY+OuiEFnf5H5o/++3CVpatsd87qyTv+ovohW03LFvCSZtyD7NcNPmiE
         vDW4Ti/BgwfCR8kSlq7nUQOZhU8RcOCaRrFGExyWcE0ylOnPWNgdlL/4OPKOsCH2Ofly
         VbxP/yWycBabZ5cgwaL+7rgn4s4rh399jIMatsSGq7Q6bbmCA+iEc2syt1Pi7l45u/GW
         2GbZoQ5T7WjS9OVb3QBM/A5ABb3wv2oRlKmvYJl+7nvBRtEZ9DyNc1CngX1bdWFGStDZ
         OPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784362479; x=1784967279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nElWDkdLXGPOvjS1cFwIf8i11/YAz84PJLo/bNncAwI=;
        b=dLwOVTmbtM/XvtUVoxjIS5KxqC17B0tBuskWJfb6QmIIAKVLkXm6Iq5JNtV563b4k6
         QIjUxfWaGp7IlMmeLz15v8VmgMelr8sAxdJJ5ROFOUdxDy3tC/e4zYgYWw+hsqVTy4E3
         IsNa52QXA6XooIHhVTCvNlbdXNuZ8mLOxuQfTK6mjYD+v9sohr2+J2hEiPHDzGerTbHL
         AH2bxyF3B1m3KTs+ra8+UXS3xPLNNbbxCj+qsafq3QA3P4BAXwxmYC3C77/0GZqAIlZ2
         gxvZz98dlHqsS1MhjZvAxSXM2AjuBduVAfAuQiCpjQbxgpMDnHcgpEYQOUhclo8Ma7q3
         djRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwEYRZYxk7arWC8HADS2G75VSXNdmRzvXt9PYQv1oomtjrcKXZHTeYKvKuuPEfW88fC4JuapDE+I+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6S4UXhLZPW0b8rdb/L+1JmHWIv3DmeQnLSfPwnIjfaTDLRXP4
	JO4PGDVZBWVsDWmMGueEGFIbuXC46EMd4rmsv3ZqTHKyfENkLpXft57q
X-Gm-Gg: AfdE7ckMpKYqDrxlMp8hnCjo5dyFQnU6wA5Z3fzbCu4O6Gkx2oiPmx7yaxhTuUGsdXU
	6zOOoW1XJlkv66Z2BF/ZtTrKY9i5d/iLjAtIkNV9Y1czjnyF+rShYl4kzLzz8mTiktELrJUYfMG
	9tZtu1tjIbtAiC5aScGBl0nlS7ZJxp/ZrpcQwg/Of6HGLEgnknqBoznJVFHR90qnCriVYqo5bTe
	uI5sHWF7tSgVSqPpVd7iXIVXWaWJeR+9LRIOOTDFJs+ja2gvTQaz7M2pPQxIz8Ik+X0VryniLtE
	VNPRwcZC87Ejrn8gqLUoHP0ZzqHh3s7EtLAyIVUq33zYHCL5MrbflKNc1gRQSI5RZzxEEzxROGO
	85ebU00tiK8SlglXW2quB0S2n3yXZfOmR/BhXVh7o9U7nDBt9br0M+Im4a9XQ4NbZWhLAfCntya
	5KXQ==
X-Received: by 2002:a05:600c:3b17:b0:495:4044:11fc with SMTP id 5b1f17b1804b1-4954a511a2fmr35340535e9.7.1784362478632;
        Sat, 18 Jul 2026 01:14:38 -0700 (PDT)
Received: from meto.local ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm73234285e9.0.2026.07.18.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:14:38 -0700 (PDT)
From: =?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
Subject: [PATCH 3/4] Documentation/misc-devices: add gxfp5130.rst
Date: Sat, 18 Jul 2026 11:14:30 +0300
Message-ID: <20260718081431.25456-4-metehangnen@gmail.com>
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

Document the Goodix GXFP5130 eSPI fingerprint sensor driver:
hardware interface (MMIO mailbox + 3 GPIOs), userspace ABI
(open/write/read/poll/ioctl), sysfs attribute, debugfs trace interface,
and the table of supported laptop models.

Signed-off-by: Metehan Günen <metehangnen@gmail.com>
---
 Documentation/misc-devices/gxfp5130.rst | 90 +++++++++++++++++++++++++
 Documentation/misc-devices/index.rst    |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/misc-devices/gxfp5130.rst

diff --git a/Documentation/misc-devices/gxfp5130.rst b/Documentation/misc-devices/gxfp5130.rst
new file mode 100644
index 000000000..73a468a8b
--- /dev/null
+++ b/Documentation/misc-devices/gxfp5130.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Goodix GXFP5130 Fingerprint Sensor
+=====================================
+
+Overview
+--------
+
+The GXFP5130 is a press-type fingerprint sensor by Goodix Technology used in
+several Huawei MateBook laptops. It connects to the host via an eSPI-based
+MMIO mailbox interface and is enumerated through ACPI (HID: ``GXFP5130``).
+
+This driver exposes a character device (``/dev/gxfp``) that userspace
+libraries such as libfprint use to perform fingerprint enrollment and
+verification through fprintd.
+
+Hardware interface
+------------------
+
+The sensor communicates through a memory-mapped mailbox window provided by
+the ACPI ``_CRS`` resource. Signalling uses three GPIOs:
+
+- **write-done**: host pulses high after writing a command frame
+- **read-done**: host pulses high after reading each chunk of a response
+- **irq**: sensor asserts to indicate a response is available
+
+All frames use a 4-byte eSPI wrapper header followed by a Goodix MP protocol
+frame, which in turn wraps a Goodix command/response body.
+
+UAPI
+----
+
+The character device supports the following operations:
+
+``open(2)``
+    Requires ``CAP_SYS_ADMIN``. Only one reader is allowed at a time.
+
+``write(2)``
+    Write a ``struct gxfp_tx_pkt_hdr`` followed by the payload bytes.
+    The driver wraps this in an eSPI frame and sends it to the sensor.
+
+``read(2)``
+    Returns one response record at a time. Each record begins with a
+    ``struct gxfp_tap_hdr`` header followed by the response payload.
+    Blocks until a response is available (unless ``O_NONBLOCK``).
+
+``poll(2)``
+    Returns ``EPOLLIN`` when a response record is available.
+
+``ioctl(2)``
+    ``GXFP_IOCTL_FLUSH_RXQ`` — discard all queued response records.
+
+Kernel parameters
+-----------------
+
+None. All configuration is automatic from ACPI.
+
+sysfs attributes
+----------------
+
+``/sys/class/misc/gxfp/acpi_id`` (read-only)
+    ACPI HID of the enumerated device (e.g. ``GXFP5130``).
+
+debugfs
+-------
+
+When ``CONFIG_DEBUG_FS`` is enabled, the driver creates
+``/sys/kernel/debug/gxfp/``:
+
+``trace_dump`` (read-only)
+    Ring buffer of recent driver trace events, one per line.
+    Format: ``<seq> <ts_ns> <message>``
+
+``trace_clear`` (write-only)
+    Writing anything clears the trace ring buffer.
+
+``trace_enable`` (read-write)
+    ``0`` to disable tracing (default), ``1`` to enable.
+
+Supported hardware
+------------------
+
+=============================== ======= ============================
+Device                          ACPI ID Firmware seen
+=============================== ======= ============================
+Huawei MateBook D16 2024        GXFP5130 GF_GCC_EC_20067
+Huawei MateBook X Pro 2024      GXFP5130 GF_GCC_EC_20068
+Huawei MateBook 14 2024         GXFP5130 (under investigation)
+=============================== ======= ============================
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f911edaec..17f78a355 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -10,6 +10,7 @@ fit into other categories.
 .. toctree::
    :caption: Table of contents
    :maxdepth: 2
+   gxfp5130
 
    ad525x_dpot
    amd-sbi
-- 
2.55.0

