Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825803;
	b=2oE6qVDAp+AWFAfllroAEGDBJEge95fW9AXlVbHkRuqNH/B1wcSXI4/MmFWFWOtCVV38
	 QPHdokKFIx1/H5qT27SCQa5dROr2R7fPp+Yy2987RpI+CoK0wF+7BHC7AGkCaHZBDOdOC
	 oLBBx8WvU9SbBOW05ryBStyvXDD7kibvrFRfasu8iYpoYIMVW5qduP4MQUeo6ueOl2ntj
	 41o5M+dAkRCGK1+CgSaJf3m3BYBAhjLUY5O6Azv18eLS/VF+azp5WfAx9BG/3DTx7TPbA
	 njEcL8rxqaWngbtXt86aWkcJ10sQEcTpAREPusSQIOxp+wCOMCQcz6oUxPDbDfBQvdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
	b=QX+eL8ldqvyxBXubt27gsJ9wIjmQ0z5Orn9m4Uq+yDhDv9ABMhaHjqoCTeg19CLdVQ4q
	 MhC6Z3H9NLDNmQNJnxLqw8wtr2yTBE254BYdhpAG6rr7YwM+z4Mx5JimumZVAMj1gvgDu
	 OQg2qx6CmFK669RcPZw0gOLmVkA8pOjUxqOfm4OL6QMu7JoIqobdQfZDoJfGPE7dri3KQ
	 ahWAhUeIQRL2oZOOfcFCujozLZt8L89T2x0ahoSZXWpuHuw2FeZioTf/xlMmk98RWKKN0
	 DLwAD4QrYvt26ZcHuelRrp3D9BJmWb/fsnmS/EaMzRBWeh6UPhid7dfNIWJn0GyIe6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhvSwFts;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA6F609C04F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 20:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA6F609C04F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhvSwFts
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso760952eaf.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793825802; x=1794430602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=FhvSwFts8ivHGnvGf5KrX49y3BsSXscdwKipMqHRoExN+dFXOpaaivXRMisb27O5eg
         T4Af4ToVLlRwa1asotxEAVg3pXW6P7RwbRZyql7ZlwN9CPi+6dVJUqZoJ1Dn3Q8wUtAq
         qlfgZtV6ZX6gZEszKdz4p72ulJxWpbg3moL2BcOk9iBGbzrv/D/Uy47XO5m3Z+YdWkBv
         xWo9nIbtIBJEHHmNVWoCQQOELU0bOqT1WXffFckYx9t9LEzGoxzs0HR6A3wsHW8LlBdx
         4DdR/W+cFrBTa0oRh1yKGb2FHZcyxA3/g3LhXaRlT/Ok5vDOB/yp2/MPIf/qgkXFF6W0
         HVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825802; x=1794430602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=hH6dT6kj9d7NNSJoOidi6nrU8oNHe7f+G4UMleDOCbUbECSfLvJPSRiI8jZavzfFPy
         /gdmpr/xdCuV4ixC3suOswOMm43jVAYWvFOnpMt/sQO5Vu7lQZ9S1wKQxbY113p50/md
         aCLQRXfOUpTn78nDjDyLORSm3AoQ5skKVXPnvceWUDB3WCL1qv8IhQQfeDHEjINz7Nkb
         YjX9JdTVN9X4lZEqzdLq6HuS2rGnKXuCEewOK0v2ncBYm8QDgD4utysejIIkQuxfTcJF
         MYv/Ey/OmctWLveGfOYDTIhgwNWItaghRInOtX5Alq/Q70+iWmqZbuVfCMAyC9st3jyO
         ovaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFKhS6OBsV1hnaXuJqzhiIoAq6dBZ+WjsDw5rsN2HhkxkodqAI/K+nEzIz5/oyqMZU8haKn1XCtxto@vger.kernel.org
X-Gm-Message-State: APuU4Z/DdcqwLRg2QXvy6oyjbVZ2p0gaSxQYJ1ifH+vETREKFZ2eFyZH
	r5SN5rjQKULptgDAHjBZ3VRuLChWqhK7PGPGvUcijoez/AW3AD2uIGEm
X-Gm-Gg: AYBFou2u0UtYZ/Pl1wAD0EF4ltrr4PQDlnQ02zoWOkmrAH3LhvhEW414K0OMTE+f1CB
	nuqjMgBxRY6w2VLNOLpVBuIa9nmt5575jQuzeMuqhfjE1AJ3LbPQfSfmUGWBgWoIz1lPkCN1Isd
	x0tjGlOgDkajl6KAF2U0Kn9XXvLvIQutnX0PpgWTkzg93d8DXDergkGeq5sVS6F/6pKkYL1Gnl5
	ommy3gePCCmB5Lph303ZrJaSj30twq16m6IFNKpz2/vJrv0x/qOq5QVBDhvDrHEcPGVRXd97WTu
	9CvrO92IP7NlRFm5MNRAgSffR7xprNZUJkJc6ulUi11nVTliuzrfTlZKc4twSqbjAwvWaSdEzPI
	MwAnpmWy6D7W6QvvlEAzSGE+5SZWeE0fzpNX2uhT1FEYnrhuZUaDZ67TTe9veF5kLmUvfjY02fV
	SAx80tgkTU2vh6EC0+3V7fDbIc+YaQgDSE6Cx4xfHPfaGNSpd3jqe52s3PCUTxpZmIia+mvTHI5
	CEJPxikJTHXnkbULDIY41cH3Cx7zUa813LP0ASy+ZdJyAYuzYYRZrZacX6DZ50nyjecXVEmzkMh
	2kC1BpJxKV0TmvCb2cWe0+mYAhU9fFYbitz6is+WGi73eM/nS0mtyC8GeEnkK7TbXo0GYq9e14y
	iesk=
X-Received: by 2002:a05:6820:4082:b0:70a:c89b:d12d with SMTP id 006d021491bc7-714f24f9d20mr8969903eaf.11.1793825801586;
        Wed, 04 Nov 2026 12:56:41 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12529a1sm2620150eaf.5.2026.11.04.12.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:56:40 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Wed,  4 Nov 2026 15:56:39 -0500
Message-ID: <20261104-a733-pinctrl-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The A733 GPIO_POW_MOD_SEL voltage-mode fields are two bits wide on
both controllers (A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20). On the main controller, the one-bit
BIAS_VOLTAGE_PIO_POW_MODE_SEL handler writes bit N for bank N, which
is reserved or half of another bank's field.

Starting from the vendor firmware value 0x01155550, a request for PF
with a 1.8 V supply sets bit 5, changing PC from auto (01) to 1.8 V
(11). A request for PK with a 3.3 V supply clears bit 10, changing PF
from auto to 3.3 V. PB is supplied from VCC-IO (A733 Datasheet v1.01,
table 4-5), whose field is at bits 25:24, but a PB request writes
reserved bit 1 instead.

A733 R-PIO has SEL at 0x340 and VAL at 0x348 and nothing at 0x344
(section 18.14.5.2), where the BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV
handler it shares with A523-R writes the A523 control register. That
handler also writes bit N of SEL inverted: for PL with a 3.3 V supply
it sets bit 0, changing PL from 3.3 V (10) to 1.8 V (11).

v7.4-rc1 added A733 support with these handlers, so the writes happen
on the first request of a pin in a bank with a vcc-pX-supply in the
devicetree.

Select BIAS_VOLTAGE_NONE for both A733 controllers and give A733-R its
own descriptor, keeping the A523-R descriptor and behaviour. This
leaves the firmware voltage modes in place, including any that do not
match their supplies. It does not implement voltage switching.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Rebased on v7.4-rc1, which added the A733 pinctrl driver. Only the
  context of the A733 hunk changed.
- Dropped the old base and its prerequisite-patch-id lines.
- Dropped the AI assistance and Assisted-by lines.
- Added Vinicius' Tested-by, from a Cubie A7Z on Linux 7.3-rc6 with his
  local A733 patches, applied with a context adjustment: warm boots
  only, no cold boot, 1.8 V switching or A523.
- Added Fixes tags, manual references and examples of the bits the old
  handlers write.

Andre's RFT [1] fixes the same bug with a two-bit handler and changes
the same A733 line, so only one of the two can be applied. This patch
uses BIAS_VOLTAGE_NONE, as Vinicius recommended in that thread, rather
than an AUTO variant: manual section 18.14.4.6 gives auto as 01, but
as 10 for PC/PE/PK, which the 18.14.6.1 table lists as 3.3 V, and
there is no evidence that 01 is right on every silicon revision. The
cost is that firmware modes that do not match a bank's supply stay as
they are. Andre, if you prefer the AUTO variant, I can rework it.

[1] https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tested on v7.4-rc1 on a Cubie A7S with vendor boot firmware (one RAM
boot from cold, then a warm reboot), with A733 CCU v6, AXP318W PMIC v8,
the sunxi IRQ-bank v3 series, the 8250_dw changes, my A733
firmware-clock patch and A7S DT v2 on top. The main and R-PIO
GPIO_POW_MOD_SEL registers (0x02000040, 0x07025340) read 0x01155550
and 0x000aaaaa in both U-Boot and Linux, and the PF selector
(0x02000070) read 1. The PMIC regulators registered over R-I2C0 and
MMC0 reads worked. The readback was taken before the unused-regulator
cleanup.

The main-controller value distinguishes the handlers: MMC0 requests
PF, and this DT gives PF a 1.8 V supply, so the old handler would have
set bit 5 (0x01155570). An unpatched kernel was not booted. The R-PIO
value does not: PL has no vcc-pl-supply in this DT, because PL carries
the PMIC bus, so the R-I2C0 request returns before writing, and the
old handler's write for PM (3.3 V) would set bit 1, which is already
set. Vinicius' test covers R-PIO: he added 3.3 V vcc-pl and vcc-pm
supplies, and also read the registers after the unused-regulator
cleanup.

Also built arm64 defconfig with W=1 (GCC) and the changed objects with
Clang. Not tested: 1.8 V switching, A523.

v1: https://lore.kernel.org/r/20261031020640-263f7b05-a7s-pinctrl@gmail.com

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1cfd81184350 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..d4b0a40525f9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,8 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

