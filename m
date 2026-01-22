Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A233F370;
	Thu, 22 Jan 2026 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044451; cv=none; b=BBIl7ze8CrtsLpihWIsX7qHileS85ZlPYckiRPX5JBycpmkd7+AfV77sAUAyAzhBnnczo23AWRHNm371Sm+6QKkQlSmv/O+0A+KUiASe5vngXvj8CxLxN7TQkqMFCW7HpXcoa2oImj9mPCoqWewlc7x7SwnWkXn3G0RuegYrP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044451; c=relaxed/simple;
	bh=huZ5GfwbtwyQkbiepHw4sBVF2iWyBdgFLgM3qEMW8jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUsFG0mwCHruMhGGjCe9hRzOyyEv2rlpk6Y7TfQzHc14pf/ovY7naClMFGO828PgHALVi6GeAx63lFTonpK1i8fF8XYeOxR/0Zl+Puy1/m/eGXM8w/1PC6ZZ3zvFCCOJlf7vdiujFo1JwCF6M356ocEovBPJqXKex/otPR4thrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OjhtGwE0; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OjhtGwE0"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C236EC034852;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C236EC034852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769043985;
	bh=huZ5GfwbtwyQkbiepHw4sBVF2iWyBdgFLgM3qEMW8jU=;
	h=From:To:Cc:Subject:Date:From;
	b=OjhtGwE0ivqN1AcyW8D4xnoe7PqMH2yEK2/EJ1cdLsi+gcOO9CBUghUeEtN3JoMpn
	 dtyJRYbJrNEmMbeHaOWj1sXlrI4am/uqGLFxh+hu7IkzdXCFAxhFmAGrJPbIrHw2VF
	 fdd6TzmpZbFJLnIUxJdMkoFxKTvCLuFiQmfjfiM4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5F89219CD7;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
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
Subject: [PATCH 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Wed, 21 Jan 2026 17:05:13 -0800
Message-ID: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series corrects the HW interrupt to the bank mapping logic to
be more robust and do not assume any particular order.

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Thank you!

Doug Berger (3):
  gpio: brcmstb: correct hwirq to bank map
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 121 ++++++++++++++++++++++++------------
 1 file changed, 82 insertions(+), 39 deletions(-)

-- 
2.43.0

