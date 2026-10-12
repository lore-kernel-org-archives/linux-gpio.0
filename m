Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B894D90B7
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830514; cv=none; b=qimNglI0kQtsgZrViactxtWmGS5XTA9ypQm72xrI4rIMQ5W5DVES2As5gzdG41f5Saf2q0A0ym3mXavyA+lLWZf7qA011TZklq6LieSdb7Y90bD1zmnGpg+0aaeW8L6exqgdd2AQ4wS5RLGAGEPbduRLSPxOajkEW4Efb3CCQbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830514; c=relaxed/simple;
	bh=1RrNnLhg06zNzdcDD9jk1F1qWL1NOpDhUSC0M07KyKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvAdFiqmSLCrdjCgK7aSPJNdNjstrZ7UTlHZInYF1/xoUbFf+FVapkhF5YUT8Nr+vd//raoxbdwiMCyKWybtYTCwyjS1exu/oUdx5SqQSME+6usWatZEmntq7FVbzDqQ6OFnA8yCigEx66/7jxQfvRHea7LR0p1vac+o8W5ijxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4LM+dsC; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4LM+dsC"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e931215e5fso1992563e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830511; x=1792435311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=S4LM+dsCvUCttFEcJLBXU49wZqAC1TKu8nvjL+IzogYD8r3d3tvCsSoEHVzPJSlpiK
         t0JKrddMoMPF043IG6jf8ghOlsRm3/X0gZimAXcfhbV567XmIAky+jh0/Fk+8kUetqC6
         Xpwk9LfPv2/EUMSVJxKSSfvzeCqryd/grdmViIp0vFxk0W2+aqhYrNWZpmt2ejrbdhiI
         c8tyEbkHQQBS0NybDNJ4SNFCl96YrPPASye1IzvqzC6S81Xx0pOsCJd5WCjEechWtwDv
         ToAH2nAi05KUUcsc/SBbuPnaT3Sre/Ch6Jx5f7txewbnBf/FcIcGAPx5pYiaSW+7iPct
         f44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830511; x=1792435311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=FBUqOwpfREwnFdbBf47QDIZMc7EVIKUn3kloYbEdUpTSxxbXHLDsgMC1pvhm+908ZR
         tvEe9aph7PbD0U9KzwlqkZJ4tI4jV9DTqnyFtGPrJ1C/Q4cF/BJQR6cbhvDiRJNpUQV7
         kBZsopsgHLsncntOb3sCOxiniy7NA7qfEkr2jZL4QgfrPouF+LThNqicjW/dYq+A06wQ
         0pKZWZbQuoTlKQ+UMbUjhU8/WUQr0imu8wMVf/dAV8/4VQo6gcLFniYFrlkadB1yofQH
         VE9kxWVLYhhHFBJBxaOBTa9y4jwrZT1v2Y3CriF/Gkrsssj0jjekRKGtn81CvjEmj6/3
         hPxw==
X-Forwarded-Encrypted: i=1; AKwUvBws5Qdrbe0fJiK1lLjPLATOiRiUi+AUCQ9r3BYCMsZhSJ2dpEVaXPL56CtoYWXJkMd7dfdI45Pc8dCb@vger.kernel.org
X-Gm-Message-State: AFq9FYIUh5UeiTwcsZo6NaLqvpAAXYC9hWIWLvhH71atw++s7f2GUzPT
	6lf5Y8WEM3lOOsZK4gwcj+C9KwVi/+1EaRYfr5X2c64kUd7wA7ECoI/d
X-Gm-Gg: AYBFou3hxCh7KZzrqTfu+H9XjDkPLVzNPyE9cGIjGDVoxiydzi27uG1yEursGtUcQMs
	30faUJBu+XVmJHAi0IMpbkgZP2SasZh3My2PL/NnaCjrwjYP+dPqM0UN3WhHL63KlGVVDYZfw/c
	JxhDsEK92Zv6yEUYxFEi3HU/pVYe6x22NFHnsQMBviNn+IdyciyJ7LjNA9yPes0XcmOvfPl1X5A
	TMt5Tc9x4vfMQ0knmPkNqDgPO3/TtvZcb187iojEoPlBVgcx9NcYaNg0ODEE2f6FD6EcRwrV6We
	2DyFRIOhSLwidnlfVVlCp/i+cAnkdeM0u3oLdX6q04EH3JXwUKwkYl/Sq6K5fggUS9CnNcSGTxA
	CI8Qs/7z/8GX8EfJqBEKmVpcCyqh4EomdukZQ+7iK+5kM1ZYstLLTp4RtrYrt1Hzqe8hhw3qAGO
	d54O7eXgurXj+MbBPG6On4JuCQqoTUomVcHZqE/WzXYgNWkxcrCmhE67gCBg/kqsuk0iysn6nlX
	LgM0FDxgQJ9F8qCD3Yq4SfOUwRSSW9WzCvfTIdgA9hJ/VhQcNdntt57U6CZ35IzQL+/dFK4pHbc
	7fxk4Y0=
X-Received: by 2002:a05:6102:5cc7:b0:7a7:198b:6748 with SMTP id ada2fe7eead31-7cb3735ff5cmr3147159137.29.1791830511319;
        Mon, 12 Oct 2026 11:41:51 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:50 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sunxi: a733: program the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:28 -0300
Message-ID: <20261012184130.548261-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 GPIO_POW_MOD_SEL register has a two-bit field per bank, but
the A733 uses the helper written for one bit per bank, so a request
for one bank can change the field of another one. With the register
as firmware leaves it on a Radxa Cubie A7Z (the fields of PB, PC, PD,
PE, PG, PH, PJ and PK in automatic mode, 0x01155550), a PJ request at
1.8 V turns the PE field into fixed 1.8 V (0x01155750).

Add a variant that takes the field of each bank from a mask table. It
keeps automatic mode and a fixed 3.3 V mode that already fits, and
writes only the field of the requested bank. PF is left out: its field
(11:10) is known, but it is tied to the MMC vqmmc voltage switching.
PI is left out as well, since its supply domain is not documented.
Only silicon revision B, as reported through SMCCC, is programmed,
since the encoding is documented for that revision only.

Computed with both helpers on that register value, the old one changes
it and the new one leaves it as it is.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 15 +++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 57 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  6 +++
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..6f5757b8adea 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,10 +21,23 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+/* PA is not implemented. PF and PI are left to the firmware, so are not listed. */
+static const u32 a733_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[1] = GENMASK(25, 24),	/* PB, VCC-IO */
+	[2] = GENMASK(5, 4),	/* PC */
+	[3] = GENMASK(7, 6),	/* PD */
+	[4] = GENMASK(9, 8),	/* PE */
+	[6] = GENMASK(13, 12),	/* PG */
+	[7] = GENMASK(15, 14),	/* PH */
+	[9] = GENMASK(19, 18),	/* PJ */
+	[10] = GENMASK(21, 20),	/* PK */
+};
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_io_bias_masks,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..8e62111d3409 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -10,6 +10,8 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
@@ -722,6 +724,58 @@ static const struct pinconf_ops sunxi_pconf_ops = {
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
 
+/*
+ * The two-bit encoding is documented for A733 silicon revision B, which
+ * firmware reports through the SMCCC SOC_ID call. Do not assume it for any
+ * other revision, or when the firmware does not tell.
+ */
+#define SUNXI_A733_SOC_ID		0x091e1903
+#define SUNXI_A733_REV_B		1
+
+static bool sunxi_pinctrl_a733_rev_b(void)
+{
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
+	s32 id = arm_smccc_get_soc_id_version();
+
+	/* Bit 23 is the JEP106 parity bit. */
+	return id >= 0 && (id & ~BIT(23)) == SUNXI_A733_SOC_ID &&
+	       arm_smccc_get_soc_id_revision() == SUNXI_A733_REV_B;
+#else
+	return false;
+#endif
+}
+
+/*
+ * Fields: 0 and 2 fixed 3.3V, 1 automatic, 3 fixed 1.8V. Leave automatic
+ * mode and any other supply voltage to the firmware, and touch only the
+ * field of this bank.
+ */
+static void sunxi_pinctrl_set_io_bias_2bit(struct sunxi_pinctrl *pctl,
+					   unsigned int bank, int uV)
+{
+	u32 mask = pctl->desc->io_bias_masks[bank];
+	unsigned long flags;
+	u32 val, cur, reg;
+
+	if (!mask || !sunxi_pinctrl_a733_rev_b())
+		return;
+
+	if (uV >= 1620000 && uV <= 1980000)
+		val = 3;
+	else if (uV >= 2970000 && uV <= 3630000)
+		val = 2;
+	else
+		return;
+
+	raw_spin_lock_irqsave(&pctl->lock, flags);
+	reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
+	cur = field_get(mask, reg);
+	if (cur != 1 && cur != val && !(val == 2 && cur == 0))
+		writel((reg & ~mask) | field_prep(mask, val),
+		       pctl->membase + pctl->pow_mod_sel_offset);
+	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+}
+
 static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 					 unsigned pin,
 					 struct regulator *supply)
@@ -795,6 +849,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		       pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
+		sunxi_pinctrl_set_io_bias_2bit(pctl, bank, uV);
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..c37170b2e4f4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,11 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/*
+	 * Bias voltage is set through two-bit fields in PIO_POW_MOD_SEL_REG,
+	 * whose positions are given by io_bias_masks[], as seen on A733.
+	 */
+	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 };
 
 struct sunxi_desc_function {
@@ -155,6 +160,7 @@ struct sunxi_pinctrl_desc {
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
 	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
+	const u32			*io_bias_masks;
 };
 
 struct sunxi_pinctrl_function {
-- 
2.43.0

