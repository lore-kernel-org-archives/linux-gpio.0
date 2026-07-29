Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1674F39C006;
	Wed, 29 Jul 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317269; cv=none; b=LSuBIEyk1aozCcIvYvCL2RJC8MC+pOKKhOqbQiMUXSUtCon2yJ36O4dVZ91wX3jUEkExUArl9fdGqWjgNS78Ygp0D+9yVhhCCkg98Z3jaG3M1i6K6qpEugNeOeJSlZC7GNQ+hD66HZ2tDhBhRuPfuaE0q72jrT1z0hUuTWG24ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317269; c=relaxed/simple;
	bh=a8vz2kdE1B+R7GzcFtSt/0b0yQsJVgqtNXxc2x0R2BA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fJRHql44+IjA0DYG39xicA11t0qVNpIzC8E/JAb5xVC/5EVPkBCNyVS4ExSPbecFq5mAmysQ7BNtOlKjFgeeSjjiBuvsR2zq4tN8+c67f71vSIM7VsueHPY1xe2YCaPr/01D3j93O9WLpR4/TXosaWEYQwtGBdEsBPtJ0gjVVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=b1+wJS4w; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="b1+wJS4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785317219;
	bh=0czDE2Baf5VXcACHNaYCOnmgs1DwgYJgguBQX3abr7U=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=b1+wJS4wBtcvD6CFXUk7zeIlIIYkcrFKZgTl+UA5BwsSP2i/O+IlAIumhqSAOS4V7
	 55zfJ8cP8WodPjOFyoNWB2xzPtbzy9cbvL4ZyuaoNAwW8oorZWvukpwpUg5MJAKe9d
	 557qtGItujdrTK73+qphSsOfUp6RJDlCQPSZyFxI=
X-QQ-mid: esmtpgz10t1785317213t4279bf81
X-QQ-Originating-IP: /FxxjMWtEwRgOyb56xO01hIfa0l/DYeEUl5M01s6frE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Jul 2026 17:26:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1701228897843642483
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Jul 2026 02:26:42 -0700
Subject: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAyF4VcZuTZQC5vTVxEvYppqRLvSdEMYe
 3erXv4czreCSVExOHUrFFnUdEot9rsO+E7pJqihNXjnB3fwR7RMLC+tmDXxlCIu9NRAtf0w6ls
 MI/XkhMexDwM0Jxf5DY05X/5t8/UhXL8wbNsHkATQi4UAAAA=
X-Change-ID: 20260729-spacemit-pinconf-validation-fixes-fa5a0ec885d6
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=a8vz2kdE1B+R7GzcFtSt/0b0yQsJVgqtNXxc2x0R2BA=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmZx6OmOR/X0Jk1WWPPJe2ZX3Y3TrjQcvm+X4X7bHc3b
 98dj2/1dpSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEwkeQLDfx+b+9OP2uw5btZd
 dmNFp/L5Zm+tWzxrBKMDr7YorFuU9pThr9ikqnO57oa1kx8pF855p7cn6dm9o+xxbxburbA4Zt0
 cwQsA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MFdGPHhuqhNoWo7ddIDzrYNsbIr6ITpMOzrVfwiwOPW2uZUHVeX9Zr5H
	tzk/4zkr0yNtpG5UKsxYRb242S1UABddrsg75QM7Z4voDC2KXAdOnz5NxH12LVj14C/1Dt8
	ue/DR/bvlwNjr4fofg+rifBLNA09omnm6b8hYZgtSB6mTd6XfLbuJ6qO7P0FOBXAW32q4AC
	0uecuHmBhQKaFiiwM5D8sEyyvQPnIwWmM4Fypbh76C2YLxBNrDX14jMV06YfL1/xBggZj9a
	SAg+C8PZuQXwfPFIKZLvWON5gTeSDeICuc2N2p9kHf0v1Xs0Am0TMu5+Oh9JpjDcghphTHj
	siqhs9cDYaKm5WEybc2OBOlqIaw6+c9c1xW4IEi+jYW/GDMKhv393FWf+SXw1iCDw937lDH
	pw+GmDl5N+l5WTfoGoePPRXYXai33DNwGtJxImY4zzqgiU4JbponcoxIVktY9lToCCBaWlX
	a54eQVCbb2Abh7f24n8UkamdEHXs4Njc7vTQ2RzlHnYJilVbotnlEJ+ISLR6d44AYmZErMo
	okDflt3LDUJkmsHzhaThN//3VM2wCRdfGqrM7AhKEQhmkCYuzzEaAZEBfDvWgarMWcqFQ+4
	kg4dtgz9rpbJ1w285JIBujyhTPBKVPEKpwU6MXpXe03rHaQiDjILDawY9oyRk13mD6Ll2kJ
	KXDqy403oeSYZy+uFD4VAm1WXzBCmlnzDXItbOuqlFoFP4Etlt6nzVu8e77UMSlEiNz1j3f
	8toSLl5wc+TGdSLm8cmD4v1t8F8Lv6W8k5MsOZ+kiK+DWvrtdP25B7o5t+hMgf2I+8BNdoi
	/dV7q9KqUc9WiMOR1ZQYJVudHSt1D8kTOLtXQs6TCEXCGfihIx/xV9ZjDtNacFLfJnBpZey
	mb6HwPMPfZTo16+eYIZMjE2XMIXvAhKEHFsp96AFFgJt3voeHpEVS8EQz3rd/wx9RkUlNIR
	cx8jAptUTDuOEhacmxOkJ2vjfEfABMJ/93wFipeoOnV2PC5XVCpMULWl7qApMqZJtdQyG0+
	lJdNQ5RgNgCZ4Jw4RT9uPzTtzkPODWiqjwozW0V/16OyAV/c+9RN5GDcrcyGs9bkABx1s4Q
	N5E6J/3XAGRyhQMJPufRes=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Pin 0 is a valid pin ID, but spacemit_pinconf_get() rejects it by
testing the numeric ID rather than the result of the descriptor lookup.
It also fails to reject nonzero IDs absent from the SoC pin table before
computing their register addresses. Check the descriptor and use its pin
ID for the register lookup.

spacemit_pinconf_group_set() validates only the first group member when
generating the configuration. If a later member is invalid,
spacemit_pin_set_config() returns -EINVAL, but the callback ignores it
and reports success after partially updating the group.

Validate every group member before writing any registers so malformed
groups fail without being partially applied.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index f0b5ebd9e223..c3a7538783b8 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -503,13 +503,14 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 				unsigned int pin, unsigned long *config)
 {
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	int param = pinconf_to_config_param(*config);
 	u32 value, arg = 0;
 
-	if (!pin)
+	if (!spin)
 		return -EINVAL;
 
-	value = readl(spacemit_pin_to_reg(pctrl, pin));
+	value = readl(spacemit_pin_to_reg(pctrl, spin->pin));
 
 	switch (param) {
 	case PIN_CONFIG_SLEW_RATE:
@@ -689,6 +690,11 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	for (i = 0; i < group->grp.npins; i++) {
+		if (!spacemit_get_pin(pctrl, group->grp.pins[i]))
+			return -EINVAL;
+	}
+
 	for (i = 0; i < group->grp.npins; i++)
 		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);
 

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260729-spacemit-pinconf-validation-fixes-fa5a0ec885d6

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

