Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D632EF66E;
	Tue,  3 Feb 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162339; cv=none; b=HBFWrKAndaqv7mDgiSom4PnSOwvNP9A3atRk6e2IZioTLa5dSWn8dsPAnzk9+bNsRUGxNXkDfEKI4aDPTmkGqipA3D8EGqVGBhgfIDnWjITkkBd97rKDHtM/OZtjs3ajoy4rlq3da10DEsU48IjrTDOEWf9DzVlwX+XcENvR8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162339; c=relaxed/simple;
	bh=JppXUACS/8ytxWcZoC5tDRWNTGvKaGGNk6/gemc46sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dY6CS4EW6SZYTWCFbTHz4bX/ozBQ4fxv5LqQxv8IyZxj5pwaoC9gs640Cm+0/CKoHMcaP1Tu8AqJWgKXfrQFeramxZnILMLFtX9CSvXELKN2ReBQZEAwmR9CVoD49hl6Nug2d52WfX4bpAJEoGnGTveTPFNwbNdgnaBvtCyk7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GvL2dlvr; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GvL2dlvr"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CCE18C05219A;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CCE18C05219A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770162330;
	bh=JppXUACS/8ytxWcZoC5tDRWNTGvKaGGNk6/gemc46sI=;
	h=From:To:Cc:Subject:Date:From;
	b=GvL2dlvrwgC6SZOyc+4/txdIOPtJ99sj+z31FArIgoJd2YgyY0aib3FyRvmBJeaHI
	 oHVWMzsxnhbdx7J5m90UjJW/W7mk+qopvZwLso/ZEQiVQKrND4umTQWw6Wsz/kaR2q
	 6G0O6udkbfDvjBZzc48dOdz2mKqrkql1FyjBFGgA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id AC5F417DFE;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v4 0/3] gpio: brcmstb: wake-up interrupt improvements
Date: Tue,  3 Feb 2026 15:45:26 -0800
Message-ID: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:

- Provide a leading patch that utilizes irqd_to_hwirq(d) to fetch the HW
  IRQ number
- Utilise .irq_mask and .irq_mask_ack notation in the commit message

Changes in v3:

- added Linus' R-b tag
- removed useless comments

Changes in v2:

- corrected the patch implementing irq_mask_ack to write properly to the
  STAT register, this was not the case
- create a separate helper to write to the IMASK register to make the
  code more readable
- remove unnecessary cast of unsigned long to u32

Doug Berger (2):
  gpio: brcmstb: implement .irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

Florian Fainelli (1):
  gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq

 drivers/gpio/gpio-brcmstb.c | 125 +++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 38 deletions(-)

-- 
2.43.0

