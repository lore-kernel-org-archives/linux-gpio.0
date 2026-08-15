Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933E03C109A;
	Sat, 15 Aug 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787120; cv=none; b=IkNO4kvB5Mz0uXY9MkcrxsACou61C8FGas73qye8CNqhNBnQo/9VTGM4JHljrzlH/LAKpoeyodADXtpIx/L8jKC10WSQngL/O4pNlipeAe0zPmwR6mqlv5OWpmaaCTGrj71Ntp+ZH794BSxGZdBouU4Ml2joT5mJdnbAv+U/JHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787120; c=relaxed/simple;
	bh=DacGmjAdns2QuCgCwMEkQTpPJHrXq2pZIpxvRWV6Eug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDdePoCkqejyA190soTUG9FKjj4KolywsbSuz7Y5hupAP9EC5MEGDhh1LmdkZ03Uy89JbZecZP78kgDjVPZwRrdM+TBkvjAR6sRRaMdrTi3J4lMEd0+VYtyvuVYFGDTZ9suGw9h6Kse+eA976iz3OkKpH8rzj7P3Wwyi2EKVpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RQ4TNihs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RQ4TNihs"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3B38588383;
	Sat, 15 Aug 2026 11:45:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFzHgobObLBH; Sat, 15 Aug 2026 11:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786787115; bh=DacGmjAdns2QuCgCwMEkQTpPJHrXq2pZIpxvRWV6Eug=;
	h=From:To:Cc:Subject:Date;
	b=RQ4TNihs6PyFKKneTJq8d7j5LPv2kF9QkblwnbbQmQgiW1FCQH0aCwXZBUj074QdF
	 TOvdCQEupQokQTRLzpwWZLbMZa1pFh4sXbBFGnXhlFEPaxOdqoKifop3GPcHYwqlmS
	 A3+U4mcszKRWGXUylsJSCJtC15oVaJ02PU8e8eQu41Eq3Q2hVmwU5qmd1aXp6un8Z4
	 /AllznlltUDF8mOhYkGRv3PUQb0Z2NHJiL0UbqjMvda1R6FTBszrphjOWWdFYE3UV7
	 +onY6B8bVDKl6cnPfFDVf5tUe6U29pF9IS6somUJH+6KU/vvdRbQrncEwxBD67VAyP
	 b8CoIBM1i9TMg==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
Date: Sat, 15 Aug 2026 14:44:49 +0500
Message-ID: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series changes gpio-realtek-otto to be functional around
SWAP_IO_SPACE config.

Firstly the ioread32 and iowrite32 in realtek_gpio_update_line_imr()
have to be changed to their __raw variants as it is the only point in
the driver where both devices with ports reversed and without meet.

Secondly, the bank_read/write and the flag for generic gpio config
have to be able to be changed to the opposite one when SWAP_IO_SPACE
is enabled. To avoid breaking any existing device tree out in the wild,
make them overridable by endian properties from the device tree node and
keep the current GPIO_PORTS_REVERSED quirk as it is.

I have tested it on my RTL9607C machine with SWAP_IO_SPACE enabled
and with big-endian property set under gpio controller node and it
was working fine.

---
Changes in v2:
 - added the review-by tag from Linus Walleij.
 - changed the patch 1 to instead use endian preprties as overrides on top of existing
   GPIO_PORTS_REVERSED quirk to not break any exsiting device trees as they don't use
   endian properties.
 - Link to v1: https://lore.kernel.org/all/20260511131520.98420-1-adilov@disroot.org/
 
Rustam Adilov (2):
  gpio: realtek-otto: use __raw_readl/writel in
    realtek_gpio_update_line_imr()
  gpio: realtek-otto: make bank_read/write overridable by endian
    property

 drivers/gpio/gpio-realtek-otto.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.55.0

