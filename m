Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130895;
	b=mUpFDSkSWgdrWuu7xXgEXiJpSHoBAKJQsMqf4+Z+QU5a+xGcjoH+h/YeWDhXH5NUbcts
	 fVelcGVCYdvNKtBc0ddI/9RH3WEo7sfdv+rWpRK49Nf4JY6hyGyzn4lSBRK/Kdmd9Befj
	 +4vF2kUktwgJ4yMidhttIQ2Vv9vkLRK/QSvdLAmj9ZqvdthrB+6qUqLk2/VRSDHkFLiRo
	 Q0smZ4W0QpGmCK0OWf0Sjv58Nv4vLRP9VmFg9zxV60z5rBZEOcDhT4ASYI5m8cPp24T2c
	 rVxhaL2TizGyLnyvpTf9R8JJTa9IlSKYP6TUm0MP+kRKHBmRCvQl5OG4L3S0N1oAv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130895;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=9DMDsUj4wu9ouiC6uWgd/VZi3mi0jlavk3gy5YlGjHY=;
	b=qUsvR01YEL0Vgm4oDHwRy/sktPp6OwWRvDUjqWDIykGmCprm9bjSIBqHaa2XiZPorgba
	 p+pXqtUSAqdNsUJbaihnTl/mc/P9XyYTNWpOAHjIJvrsJfnX8wM+CO0b6ENAdoZiDSf0i
	 xDMSeizJ7D/NCs56e3PEhMpEBGO6iW6jxmHkrBxPpJoCBuU46l6sHzpdSbJT/UHgvSHrn
	 JVKE+xlQH2jC6noUbLrQM41jNLmu44EHrFnqTVzdxfvB6rhA8BdfzSr94YteWQsdg7J5p
	 Z13Rf2EYm0ECQs4Q6huHIRM1IpcuLZ176diW09wJPAhuvOrpCNjbpNXbhNCNVh4GRGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=r4vwh8ir;
	arc=none smtp.remote-ip=185.136.65.228
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84960A2606
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 23:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC84960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=r4vwh8ir
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261119232810602819f30500020771
        for <linux-gpio@vger.kernel.org>;
        Fri, 20 Nov 2026 00:28:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9DMDsUj4wu9ouiC6uWgd/VZi3mi0jlavk3gy5YlGjHY=;
 b=r4vwh8iravSFKDx0WkEJFOH/fKL+0dFSAO7bnXO1fR9kn1lcyFT6BdohDxXDBZLahOVh0R
 +o9r6y+3QdCT4yjp5IkcKeM3y99tLKVg4MtFxkENvIre9NYqhGTf7F1Nupm0gmuZJivizdaB
 Y7bShhhgEn86cw56MjzhOOufEzFibMu4Hsxvho2LPsaRuf7KscMqD3HFMTbrSQRm+aOykeTT
 ZqDbZl2cXiSx3lC7P3RVMtQCcQar/wmEt+pHOuN65PXFKODZiZ7VrIdomeB/HpWY+mc2KqsA
 qQHgpEZgi7u0MVjXGJ8M5/U0eF9rTYpM9mq5LQddiCIsrrisJfT6p45w==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 3/3] pinctrl: single: Reject bit-per-mux without a usable function mask
Date: Fri, 20 Nov 2026 00:28:05 +0100
Message-ID: <20261119232806.4093754-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

With "pinctrl-single,bit-per-mux", the number of bits per pin is derived
from "pinctrl-single,function-mask" as fls(fmask). Neither the binding nor
pcs_probe() requires the mask to be present with bit-per-mux, or to fit
the register width:

- If the mask is missing or zero, bits_per_pin stays 0. Probe succeeds,
  but parsing the first pin group divides by zero in
  pcs_parse_bits_in_pinctrl_entry() and pcs_get_pin_by_offset(), and so
  does reading the debugfs "pins" file via pcs_pin_shift_reg_get().

- If the mask is wider than the register, width / bits_per_pin is 0.
  pcs_parse_bits_in_pinctrl_entry() then allocates zero-sized vals and
  pins arrays and writes through the returned ZERO_SIZE_PTR, and
  pcs_pin_shift_reg_get() takes a remainder modulo zero.

Both configurations pass dt-validate against the current binding.
Reject them in pcs_probe().

The patch was inspired by a sibling fix
("pinctrl: single: Reject invalid register width in pcs_probe()").

Link: https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/
Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f5f0b95dc4282..ba5782b6b63d0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1860,6 +1860,14 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->bits_per_mux = of_property_read_bool(np,
 						  "pinctrl-single,bit-per-mux");
+	if (pcs->bits_per_mux &&
+	    (!pcs->fmask || fls(pcs->fmask) > pcs->width)) {
+		dev_err(pcs->dev, "invalid function mask 0x%x for bit-per-mux\n",
+			pcs->fmask);
+
+		return -EINVAL;
+	}
+
 	ret = pcs_quirk_missing_pinctrl_cells(pcs, np,
 					      pcs->bits_per_mux ? 2 : 1);
 	if (ret) {
-- 
2.56.1

