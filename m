Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593573B2FFD;
	Sun, 16 Aug 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893481; cv=none; b=mFSQrSryIzQ+d1K7IgoRgPoqjMHxGNt6Se9FHOsrY1iLe3mU+v9PzhEMJHsIZCpHnWDG1ejp4d+mu3tm/4YgWyRP7btoqKR2bf3WJFehUujC8kvcuYssljrNwvYj9YPhy1MAUmMWP5DN7A0DI2DxECmH4LxbpTq0+fUglmM2me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893481; c=relaxed/simple;
	bh=LQoUhAvQ+OCkXaJvqC/7/J59wOb0vxnCgTWDuXs9lDc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=RegiP10KHa3yxcQoNXB7H+PDG2bu8NLqTo+1SaJmKls6StT0A9dpEhAz/lLhFqmf9riGEwi12MkjY+gqnu4ozT523gaF4b7SWjHBf1j+zC3kVGyQdVhXlvZKq3hQ2NkGjpAREstWe2NmAxu6yIZsdPlJQhJCthnu3J7MJQYd7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MRc/J5nG; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MRc/J5nG"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHfuxE3038968, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893461; bh=KrmpgiPlFkxIok0LWEZBD8f1o2DJ3NWDzZ+nXWlxPGE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:CC;
	b=MRc/J5nGmaZpXaElI1HstfBqnZaMHqI4oWv0mjzWA4SyIu4Pnh77lQwKD/K+Jxyr2
	 hJ+C3HxqbQIy+8UJFDGpapTblmsEGr3WRfv1+1WGTWATCxAQCSS+FNRTEc9wn7HXlQ
	 GfJKmqrra1cq/Wz52N8MvkAlyHPYBDJqJY0APQurPKlmj0UTYvYI42PFHAjD6dpBRs
	 kFZpjMST8pWCdMIdgyQshQBy9AtPI3xuzLrL0OBvg5617H/2zX5tPKBPaR9WbwOrA+
	 lzq1wDEX0lyiIVZdmLdPLXMeshzrK3U5nc4/uTs8cOCXTg7PZ07ZvyYCtofeNCCJCC
	 8ALNTQIhISIaw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHfuxE3038968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:41 +0800
Received: from [127.0.1.1] (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Sun, 16 Aug 2026 23:17:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: [PATCH v3 0/7] gpio: rtd1625: minor cleanups and log improvements
Date: Sun, 16 Aug 2026 23:17:29 +0800
Message-ID: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInUgWoC/yXMTQqAIBBA4avErBPM6IeuEi1Mp5oIE80Iwrtnt
 fwW793g0RF66LIbHJ7kaTcJZZ6BWqSZkZFOBsFFzduiYrOlnakNpQmWKTlxLtqm1LKAlFiHE13
 frh9++zCuqI73ATE+zoXyR3AAAAA=
X-Change-ID: 20260815-gpio-cleanup-caf002873da1
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1312;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=LQoUhAvQ+OCkXaJvqC/7/J59wOb0vxnCgTWDuXs9lDc=;
 b=NzkAxJQmQh5jK00QD3tHPpa+xblrB1UkMStd/XA2IyhUrEVhxEaV3+3T0vmH0l6m5rh+l2T1R
 O4K5dTzB+EkCe5ep3kfiXbSHr1EAc4p5GXO3fyc26CVFT5rVAy0iQt2
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

This series splits the previous cleanup patch into smaller, logical 
pieces and addresses the review comments from Andy Shevchenko.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
Patch 1 & 2:
Split from patch 1 in v2.

Patch 3:
Add Reviewed-by tag from Andy.

Patch 4 & 5:
Split from patch 3 in v2.

Patch 6:
Add Reviewed-by tag from Andy.

Patch 7:
Add Reviewed-by tag from Andy.

Link to v2: https://lore.kernel.org/lkml/20260814025657.1400452-1-eleanor.lin@realtek.com/

---
Yu-Chun Lin (7):
      gpio: rtd1625: Remove unnecessary blank line
      gpio: rtd1625: Drop unneeded initializations
      gpio: rtd1625: Fix variable type for regmap_read()
      gpio: rtd1625: Narrow 'i' variable scope in loop
      gpio: rtd1625: Narrow 'hwirq' variable scope in loop
      gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
      gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro

 drivers/gpio/gpio-rtd1625.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 408866669ce01b8f2111afdea2c13d15a8960bff
change-id: 20260815-gpio-cleanup-caf002873da1

Best regards,
--  
Yu-Chun Lin <eleanor.lin@realtek.com>

