Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294BE3B14B8;
	Mon, 31 Aug 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173491; cv=none; b=MscIiJ0zrnPJ4qyDdY9km2nuReMkHe+w0dkCGKBuhkxzl00jtifbXPUoiVRzHLS//dve0DUYBsPnp50Y8pkKmaOQUaN7KVLOtyuGRFO4dfZww8uYwiU0r5JvxUb8z17LGxhggMbTXYH+H1uesdwEwuBOZR+R7w6evJBaBJyywJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173491; c=relaxed/simple;
	bh=DRGxPsf3QJ/4dYZ5B1KOYT5N54KAXh1btjSxdomv9XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2c7gmUQ2Z5ycv1V3tbX1ohrP1L8Bml88duID4P9NqdLw/NbN9ok42fyap6yroFq+adeVF6kvf1T9fZ0+VrSgzjoGosFgN31/6gTkjy/xsQOFtDMoUtXUYjvMnkddTpMVfj6Ex+ZSWl709Ara4nqunPnsUUBWqGrner0QI4brVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B13Jc/Hw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B13Jc/Hw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8611F00A3D;
	Mon, 31 Aug 2026 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173489;
	bh=7hL/ET5Qq3wr2P6zFL5txI55cnVWQQzZ2F/qHg0lYf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B13Jc/HwFvJynvpEddSdAjEGRTOiABRThBqmHHiE/4AiD0iQWYf3HCX//4rHRXK8I
	 gLVcoEf9n+ORgiBBpUVy2G0Zq8Wm4m0BykmnRfURD7sCFSidGdfPcF8IboCQB2JFAI
	 pJEqB1nMiACdRRQUBzV2PVPcFgm90SOE5Ho7YmlmaRbaRQtvOpvNjYol1CIc9hNaIV
	 rfC1wVbiQTl/bE5QGaLNmMcLxrRAtUnwzlX8bn8txjqLqOQI1+0/CEmJYJV2LpNy3D
	 AlS5BnRLIp5/un54LIxa5UGIhjYg2JPAwnxOwmzuYbSRTsXwPbzR5xY6AXfyDxBN5R
	 iDyF20bOAh7zA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v1 1/3] pinctrl: mpfs-mssio: fix whitespace in debugfs output
Date: Mon, 31 Aug 2026 11:50:57 +0100
Message-ID: <20260831105056.756259-6-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
References: <20260831105056.756259-5-conor@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=conor.dooley@microchip.com; h=from:subject; bh=uG6lbsSheysd9Z70Hex7XhWgc/RhjnhbE9NFxwPVduo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTY1b0z56vuP7oswNFk89+4Vs38Yro1riYH5NChI+bq 3oEfIma01HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJTE1hZFi8KcpY3XCdUUaX 68S3s2s4Wpdq7FX9rSHM5L/opN/DuYKMDHf3ffh9imuCb9Y+FpV9tv2BXTo9PIflX6ScYlqa2cZ 7gh8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The printout from mpfs_pinctrl_pinconf_dbg_show() is appended to
information from the core, so a leading space is required or the world
will end.

Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index ea1026a0d22c..502624221aca 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -612,7 +612,7 @@ static void mpfs_pinctrl_pinconf_dbg_show(struct pinctrl_dev *pctrl_dev, struct
 	reg = mpfs_pinctrl_pin_to_iocfg_reg(pin);
 	offset = mpfs_pinctrl_pin_to_iocfg_offset(pin);
 
-	seq_printf(seq, "pin: %u ", pin);
+	seq_printf(seq, " pin: %u ", pin);
 	seq_printf(seq, "reg: %x offset: %u ", reg, offset);
 
 	if (reg < 0 || offset < 0)
-- 
2.53.0

