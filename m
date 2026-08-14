Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D583D6CB0;
	Fri, 14 Aug 2026 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676233; cv=none; b=A1EffA8il+xCWddAxGbJKJ0/741liUNfzrn5RnRK/XHH0sZkWn/IpRYWjWNw/B8mFOBv8LjNtknBYVNO8dpemwbN+EZbh388Na6V4btxMJsk4MhcGZZJTLYB6mXg/cJZxyv4DsefB55w28JNMO/ynq1MnJrNUelBHDpSn0QPLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676233; c=relaxed/simple;
	bh=ZzgGQLMsxAT3lOMlbomO9DnvKGEhASufQ7r8xrQ2eKo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mezqHTjwqe0ORDW+bTBTtkmnXduJPBQNQ7bRlT3la8BB4RRABRHklNHQM7XlKg23mVacNXs8Ita1l/mQ7O13tNUHp9csRpdmlPcP3D8+Z1w5eah8chVcan4CPmEMlDH1lF4UrPqu+Y6Ka0uAnrIy8FfIFRDEPTmG57096TGc79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=sV9zdd7u; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="sV9zdd7u"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2v2v45893808, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676222; bh=MuGrmN+5YqL+gchtRZmPupGIbAtwJMnrjOTEXP/C9as=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=sV9zdd7uvG/gIM7XgN+VOeH7fP6k92kZI6Eb7A3xPkVRaLJA4dmZCVtc9Fm0G9ual
	 +FaTlF4wo0K+iAfaEU9f5lp017Ps2UeJa0JujSJjK3VPw+uMVE0CKeq3PEC2ZxAO48
	 WcSZd2kB+etbSpQHgZFbDK7qK5/5+KvC3s5ZbrYf91Ymej1SvWLme6eOaNdHy4XQdz
	 uwaAEcoVvYnYJs4y8f8lRRQ6x6oPYKQ23vaMTNlk+pdLATXPcOBGGM/ZV9QFQGLeyc
	 Qf2PhpbP/wrK87DPTkhiJryKDYQgxeXRyS027i8r4/Dx5/PCmp2oM5YO9dSZwp5cfJ
	 SQ0gf7fw8CMTg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2v2v45893808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:02 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:56:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:56:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 0/5] gpio: rtd1625: minor cleanups and log improvements
Date: Fri, 14 Aug 2026 10:56:52 +0800
Message-ID: <20260814025657.1400452-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series splits the previous cleanup patch into smaller, logical 
pieces and addresses the review comments from Andy Shevchenko.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
---
Changes in v2:
General:
- Split the v1 patch into a 5-patch series.

Patch 3:
- Add a blank line after the 'irq_hw_number_t hwirq' assignment.

Patch 4:
- Use regmap_get_device(), instead of adding 'struct device' pointer
into 'struct rtd1625_gpio'.

Link to v1: https://lore.kernel.org/lkml/20260812031929.3598364-1-eleanor.lin@realtek.com/

Yu-Chun Lin (5):
  gpio: rtd1625: Minor coding style cleanups
  gpio: rtd1625: Fix variable type for regmap_read()
  gpio: rtd1625: Narrow variable scope in loops
  gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
  gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro

 drivers/gpio/gpio-rtd1625.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.43.0

