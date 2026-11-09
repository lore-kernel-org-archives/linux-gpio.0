Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253707;
	b=OZ9vvoBePxzPam9DL8vnKrdKOydxYdg7fhnPD3QeKxtn3fRmhglnqcJnON8dRYan8OGl
	 wIPs2nHsPZHID6PjuT/T0IzjhJNoZpzB2kdA4TK1KYgk6ciaUDssrAkYb2gmIr83ZK9Gd
	 pvWIraPic3CKSt/3VfUY5qAtxjjfWW77GkIkSsVWWS6GXaQjkyezSiXFhR8nWr2jSE3Up
	 OAtp87TnRKH0oK0hli5bGUnTz1KXaVXggS+VKyRJ7l6Phqz0j0sn8nfe+ppzJBOTXWem/
	 Km7DqG5kDvxVodVi6tQ5MUYo/xRDyA4VYY3XXWZtp6Mj4aKdnXeFhl1t3D5fJBQa2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
	b=1bj3urmKScumaG3FmBOVGLpAyRssV4yzK+bL6b0b8JY4nxLCkF3/zZv8WjX1S0BMVHey
	 YRAnFSKfsmxzlw6GfuM6q4LAolH7Q/a6/wFz0xBsjv9gH0VRzWncko/zeSOuM1+1Wk9r/
	 pDiCN0+NNepf+UewoNSxVP8XJdGQM0I/x5/TQW8PwTwKCwjdeqv1gaVwllwAydo20QTEb
	 rpQDDuouasrlwjjnza0jTAcNRMkBmfKUyyBtyXfThanzi8XyQVup/RoXDknzBc2qydyYT
	 2zcCct2Jf35w34QpyYTSGLVi5biOuV5wGvJnFO50hLKQnyG8RrIMA2kDyAb6aqUoA3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/Da1BX3";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C49606A31C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 19:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/Da1BX3
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1716039eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253706; x=1794858506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
        b=F/Da1BX3Z0rwbH9MUtbdPn7lpC9PbdpfMPFkuyApexhhk8QWdw974+ql+KeOlJZ3WJ
         A756Fh23CxaNDENfaqcfleQo92rz0Ja5bg3wBVp/lYyngVBHuPIO1vS/RJKQkVkQ1cWa
         bmgd+NIxs5xzoDR0Rpme9PVbYlvMw40s1xX+R7i+CY2G6zviG/JLRJvh1OTIHzsmWjbS
         MkSlRfNT7O0nVWhqMFC8/sSAGXN28AB6jIlXO1WGgBD2SpbjcELrd/WqBDiMRsBhQAe1
         5bQKG6/eQIDZyI3f1ny4FWl6UHckO+cSMv9DqEmtGK/EAjUzX0cI56NyCSnWWkcOoWz4
         hXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253706; x=1794858506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
        b=p2ijp2KYdZzwAQLQKlALTxu+c+qeIb8CJGlQmm1WgPO8v+RpQ2puSASaff6wwCQT+0
         QizG4iZwQ39PdPakzOFBA6uMwr5sPMXL4038PEHwR57Zg8X/tByR/xCtmFKaWEcPKpgS
         C+0X/zWEVN+QAi6ApS5zuh9gf9qy0YQvtGeQzXNhb2Gb89sPPsiSs9B9yNW+yqzfGsYo
         dMQ5hBB8uVIzCNtT01xopqUcRsfa1gp3KSEqe5y4MdXCcd+uWjeO+CPTVg/9Y0fOyrSo
         Xfb5TbV53bxrvelnIaYLw9A4wDZ+IlqqFlZRXKitazSXg7TRuxmPERdeLfaV+SpPpqMT
         zFzQ==
X-Forwarded-Encrypted: i=1; AL+hErEP0sxIsVS8v4iNLs2Sy//CkpGWTnUMXv/f5nI72OeC1ZSPPzkjhIqtQGntnPEOLftaYCoCUZMIF6qx@vger.kernel.org
X-Gm-Message-State: APuU4Z/2gGI5DgewAg27ICA0tyC7MQsC963x0MUPnFneSZEeBhvxhR7W
	CzxqNk6FkUN1Kkaij8N/I4zBQIYv+byIhBOdwboPikymCmka7Q/liZR0
X-Gm-Gg: AYBFou0wU3n99+7YU61EUhXaSBtrij+Cbf1O2SH7b9xxXWNWSsU1g0eJbOelk7iTdWI
	xIF2qsuYQK9fcrThRH7pXP+WLdSmg2bDNuv5dbk62Hy8FtUOQo0i45bDtsc7+d36kWJG59IcMtd
	UvzRAMvadkU97CSzcUV74zL8Gv4g/Enb6pVzAZSKBPRBrcwyRo5r2tluVa4pgG97XZ+csKkPXQk
	9YTM9saVN1yP0hDGn7+zPyK/4a1CaFoTjtSDDjfKV1L5snDrR/STMZSz99/oPCB3McxvSKnNNh1
	NT6ZpLA+gDpidXMFJ0z0O8ADbtHpm8ikVqf+6B50sY1VwUSj5DYdBLT/BhQasUG9zVNlY5m5+2V
	EzBgzeJAV97podiuxTU5rDXFWxBJl+MewwvlyPeIIjAheuD8F+heTqesWagqIeAH4+/m8dY4uYz
	Fx/IANrL8j3ybanMvvVz77Kw0ZSR2lW9/FBgxgsLGj8t0jVzHYryiLMPSA1G7OYyYBLJqo9W4oF
	EjYlytEK63u/x8qjlOyFtlR5QiCTl291tFJpCecOgMB6X1+bIZAY2r9zALh4LHk8x9+NreBnBpm
	ftA+kTw1iTrIP4VYU+5bmfYCaPT2UePsP7eqNcBek2/CBMylG2N2kSdhh3r0nMaY
X-Received: by 2002:a05:7301:d184:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3751c53689emr407134eec.5.1794253706090;
        Mon, 09 Nov 2026 11:48:26 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:25 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Tue, 10 Nov 2026 01:19:08 +0530
Message-ID: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

This series fixes two independent probe-time bugs in the DaVinci GPIO
driver:

1. A file-global MMIO base can be overwritten by overlapping controller
   probes, causing BINTEN setup to target the wrong controller.
2. Per-bank IRQ data is allocated as chained handlers are installed. A
   later allocation failure can leave handlers pointing to devm-managed
   data freed during probe unwind.

The first patch derives BINTEN from the current controller's mapped bank.
The second allocates all IRQ data before installing any handlers.

---
Testing:
- ARM64 W=1 Image builds passed for both patches.
- On AM642, a forced asynchronous-probe interleave made the baseline
  compute the wrong BINTEN target. The test redirected the unsafe baseline
  write before it reached hardware; the fixed path selected the expected
  target and verified readback 0x3f.
- With targeted probe allocation failure, the baseline left one chained
  handler installed; it was detached safely before devm cleanup. The fixed
  path left no handlers installed and reprobed normally.

The private baseline and fixed kernels showed unexplained
TAINT_MACHINE_CHECK bit 16. No BUG/Oops/WARNING/call trace/SError was
captured; the cause remains unknown, so this is not a clean hardware-health
claim.

GitHub Copilot CLI assisted with investigating the bugs and drafting the
fixes. The submitter reviewed the code and personally ran both board tests.

Sahaj Chaudhari (2):
  gpio: davinci: use controller-specific MMIO for BINTEN
  gpio: davinci: allocate bank IRQ data before installing handlers

 drivers/gpio/gpio-davinci.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

base-commit: 4fc2c9ab68f4324bea62cb5a43e93392225f1d11

-- 
2.43.0

