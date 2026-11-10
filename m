Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324548;
	b=lnUyeE6Nbk0mOo5AXq4hmTeiU+qzDRGZXm9g4xnOzrY6CUEjIPN98ZYg3MgTgqO9t1OW
	 3ikGyIMJUG4f8Oayfmz8OfY92YL7+nqD3RVENxIOXyJ0JMM2RgpMqWITSCiyUGXGO/ibs
	 EiSXbS4+FxRrYOTMmoo/sA4RWWtIdDr/cgC6myZxi/vLUqoj6HP5K10EQinuwAeer5Q0Y
	 L7WF5KyodyHc7c42XUZ3h5nuZJs2ae2ZQyhDvSTKnovtenFzNxzUo9qZ7+zwa5Jt225dE
	 nuJYt5eRt2kN3I5iYvlGPvS6axx01jF5WnS4oYyQy5h8J1IvoNGZ5vLVd1A6+WC9iew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=503OajthHw5X0dv+g5JN9rqx2DJ30OND9/TX/ljdkzo=;
	b=ueL6iFY+DGeUGXN7n3V/1ApgX/YtZenxl8dJ8PHgu3wP++MObah01qNrTfB0lJrgl1X3
	 BFKdJMHYzr243V0MCpXFsLNGYrHmqq6u2mLYe50ZkmxgShYu9HlA4NZYporM6oKzuoYWo
	 ld/H1G24MYcLHfLwEG3st0sm1R7ObA0lwYsswKpd97Q/Q8GepNMcZ1lq+KqyImBHJ93rl
	 cgZxiAXvxoMGTb+ECR/IVE8ibXRJkpTwKbjYVAMCzxjS3u+dmwtmbNvNMlzN5NWX+NXwZ
	 HtUEacgBJfHn+PlmY7m+G6U2ePDQOC1VC77rWYHov2VefNMYMFj14mvq8UWLx6feh7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=GZlaOLdK;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2860A2604;
	Tue, 10 Nov 2026 15:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD2860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=GZlaOLdK
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP9YD6lKGz7QqdV;
	Tue, 10 Nov 2026 23:29:04 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324544;
	bh=B2JtBmjLeVnDlmbkPthhG/+ppibEoUUudoRq4SpwIT0=;
	h=Date:From:To:Cc:Subject;
	b=GZlaOLdKhPNF+q8fpZSKZ51JqJ6AM3Gffssguc/a8Umnl4qQZeLMwuf9Vhwogb/3p
	 AadgpoKOMueBczMBJyy5EMDSnHU3cDorBM7wNHt+801Vg6ma3Gpl/kwvaa7CHXmABH
	 f8lyhOpCFi1JtVW7mVJDO1CT5VOs4aM3ZT2JS0ueENXi/4WSdTsvPTW1F2iAOyGAhv
	 D5p39VwlQuztrP3uPoqFvuPvyxUuA/nGaxda/RonBKzhDJ2bR7PZ8IsNu4n5jHoSX3
	 BGfAF8r8NUAugRx3Jc2hC1V6uzPjNjPSxRV6vSZ9wBIsBD0dk13pgH8LHprZjtcn4E
	 BNAWHCEsQ36GA==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6AAFStHT023812;
	Tue, 10 Nov 2026 23:28:55 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:28:58 +0800 (CST)
X-Zmail-TransId: 2afb6af3383a82a-21e4e
X-Mailer: Zmail v1.0
Message-ID: <20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn>
Date: Tue, 10 Nov 2026 23:28:58 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <andrew@codeconstruct.com.au>,
        <wbg@kernel.org>, <opendmb@gmail.com>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvNF0gZ3BpbzogZml4IElSUSBoYW5kbGluZyBhbmQgcHJvYmUgZXJyb3IgcGF0aHMgaW4gZm91ciBkcml2ZXJz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AAFStHT023812
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 23:29:05 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33840.000/4jP9YD6lKGz7QqdV

Four independent fixes in drivers/gpio/.  Two stop probe from swallowing
-EPROBE_DEFER so that the controller is retried once its parent interrupt
controller is ready, one makes the 104-IDI-48 IRQ status register
accessible again, and one keeps a missing device property from being
mistaken for a multi-gigabyte allocation.

The patches touch four separate drivers and have no shared dependency;
they are ordered by severity and can be reviewed, applied and taken
individually:

  1/4 gpio: aspeed-sgpio: propagate IRQ setup error in probe
  2/4 gpio: 104-idi-48: fix max_register blocking the IRQ register
  3/4 gpio: brcmstb: don't turn platform_get_irq errors into -ENOENT
  4/4 gpio: line-mux: fix unsigned truncation of property count error

Changes in v2:
- 4/4 (was 5/5): widen name[] to 11 bytes and print host_no with %u, so
  a ten-digit host number is not truncated to nine digits and cannot
  collide with an existing procfs entry (Jonas Jelonek).
- 1/4 (was 2/5), 2/4 (was 3/5), 3/4 (was 4/5): unchanged; pick up the
  Reviewed-by/Acked-by tags.
- The rcar patch (v1 1/5) was withdrawn after Geert Uytterhoeven's NAK
  on the v1 thread and is not reposted.
- This series replaces the standalone v2 of the line-mux patch posted on
  10 Nov; the other three patches are unchanged from v1 apart from the
  tags.
Link to v1: https://lore.kernel.org/all/202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn/

Shao Mingyin (4):
  gpio: aspeed-sgpio: propagate IRQ setup error in probe
  gpio: 104-idi-48: fix max_register blocking the IRQ register
  gpio: brcmstb: don't turn platform_get_irq errors into -ENOENT
  gpio: line-mux: fix unsigned truncation of property count error

 drivers/gpio/gpio-104-idi-48.c   | 2 +-
 drivers/gpio/gpio-aspeed-sgpio.c | 4 +++-
 drivers/gpio/gpio-brcmstb.c      | 4 ++--
 drivers/gpio/gpio-line-mux.c     | 5 +++--
 4 files changed, 9 insertions(+), 6 deletions(-)

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
