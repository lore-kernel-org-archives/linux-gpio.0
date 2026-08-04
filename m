Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B63F54A7;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825293; cv=none; b=L0UwfmgS3wQrFSbhrUgl8KqlMnku45nMi3BMm/7lJPabXg91MYWc7utmSodFjJjlIVizOO7fbQe4SCaKv/URN13GLwbu51ad0AxtjkO7AhoTFw5VWg+4JbdaTr3aVxO8CASbLVV0JAQrtnw4lo6KIuXIu7tPEPW2JpaFGkp+qqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825293; c=relaxed/simple;
	bh=eK5KW5XaUhZgqtyPX8V2F4qYGjamjcNJA3BtmtkTQS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IouhdfY18Gg0fO0kOe5gmrEyoCOXi2kLU3kxounDYa8PeTeKAAT3eCRo3DfPt2gqrNFnMUatYkL5eligE/buJmFTFtT0oCj2VwBokVczvS7W0LS+iQ/Zo+g0Fr2TfjnCnD8ArGQ0Sc70PN1IJj+X6XJzyCUAdyRqeKhvmlRQ8UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrkftVbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrkftVbb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8210BC32782;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785825293;
	bh=eK5KW5XaUhZgqtyPX8V2F4qYGjamjcNJA3BtmtkTQS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hrkftVbbVpsjaBazvrW+5RpjwsfwAU44Zc1TMFeIJsHxrBDdyAuM9fw7EMiaSuUnz
	 e2EFjMZOvizPrxNMb8kIyV/J4CFNTh6uxu739yI9p+oU9NyX2VgFqy2yMnPFbe4rGb
	 pOO5kBSawYaA63Mx6hrXcqKOU3223R9z5xUxcc0c20b1ux91lHUxPA0jnkPRCg0k3x
	 lnic8ZJgSw6cPXVpu/S9JpiyOwIHSjvXXoKH3k3bojwA196UOqupO5zTx+8VciaN6g
	 OdoeeqtV3pGU+H4ZKEa33zkqZvN3MHjoQkosBlalhoX/xI3usSYXbJeW7MQi5AS7kU
	 LjAOgjpTSWMvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D07DC55822;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 04 Aug 2026 08:34:29 +0200
Subject: [PATCH v5 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785825291; l=4481;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=wPc9N22m75KCBH5Mx8x+Rn9GxrIKl+3I5FlNe49Dud8=;
 b=AgEhyT6BbJ0Sh/anXoARwsndzLeaIzEpcd3a20ANPGMxdaNJThJIwug5pgOAFMF+UnPlWTpET
 xx/jQ7vtL/UDAWTR5hz7TfZq5EITnS9kMnoMDpalgnHqeCehIPyAB7Z
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 reports the USB ID pin through interrupt 49 of its interrupt
controller. Unlike PM8941, this path has no separate addressable misc
block to represent as a devicetree child node.

Register a child platform device for the existing Qualcomm USB extcon
driver after creating the PMIC IRQ domain. Pass the USB ID interrupt as
a named resource and reuse the PM8921 firmware node, allowing consumers
to reference the PMIC node directly as their extcon provider.

Unregister the child device and dispose of the IRQ mapping when the
PMIC is removed or probing fails.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/mfd/qcom-pm8xxx.c | 78 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..884fc99a1488 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -7,6 +7,7 @@
 
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
+#include <linux/ioport.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -64,12 +65,15 @@
 
 struct pm_irq_data {
 	int num_irqs;
+	int usb_id_irq;
 	struct irq_chip *irq_chip;
 	irq_handler_t irq_handler;
 };
 
 struct pm_irq_chip {
 	struct regmap		*regmap;
+	struct platform_device	*usb_extcon;
+	unsigned int		usb_id_irq;
 	spinlock_t		pm_irq_lock;
 	struct irq_domain	*irqdomain;
 	unsigned int		num_blocks;
@@ -492,6 +496,13 @@ static const struct pm_irq_data pm8xxx_data = {
 	.irq_handler = pm8xxx_irq_handler,
 };
 
+static const struct pm_irq_data pm8921_data = {
+	.num_irqs = PM8XXX_NR_IRQS,
+	.usb_id_irq = 49,
+	.irq_chip = &pm8xxx_irq_chip,
+	.irq_handler = pm8xxx_irq_handler,
+};
+
 static const struct pm_irq_data pm8821_data = {
 	.num_irqs = PM8821_NR_IRQS,
 	.irq_chip = &pm8821_irq_chip,
@@ -501,11 +512,60 @@ static const struct pm_irq_data pm8821_data = {
 static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
-	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},
+	{ .compatible = "qcom,pm8921", .data = &pm8921_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
 
+static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
+				 struct pm_irq_chip *chip,
+				 unsigned int hwirq)
+{
+	struct irq_fwspec fwspec = {
+		.fwnode = dev_fwnode(&pdev->dev),
+		.param_count = 2,
+		.param = { hwirq, IRQ_TYPE_EDGE_BOTH },
+	};
+	struct platform_device_info pdevinfo = {
+		.parent = &pdev->dev,
+		.fwnode = dev_fwnode(&pdev->dev),
+		.of_node_reused = true,
+		.name = "qcom-pm8xxx-usb-id",
+		.id = PLATFORM_DEVID_NONE,
+	};
+	struct resource resource;
+
+	chip->usb_id_irq = irq_create_fwspec_mapping(&fwspec);
+	if (!chip->usb_id_irq)
+		return -ENXIO;
+
+	resource = DEFINE_RES_IRQ_NAMED(chip->usb_id_irq, "usb_id");
+	pdevinfo.res = &resource;
+	pdevinfo.num_res = 1;
+
+	chip->usb_extcon = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(chip->usb_extcon)) {
+		int ret = PTR_ERR(chip->usb_extcon);
+
+		chip->usb_extcon = NULL;
+		irq_dispose_mapping(chip->usb_id_irq);
+		chip->usb_id_irq = 0;
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static void pm8xxx_remove_usb_extcon(struct pm_irq_chip *chip)
+{
+	if (chip->usb_extcon)
+		platform_device_unregister(chip->usb_extcon);
+
+	if (chip->usb_id_irq)
+		irq_dispose_mapping(chip->usb_id_irq);
+}
+
 static int pm8xxx_probe(struct platform_device *pdev)
 {
 	const struct pm_irq_data *data;
@@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
 
 	irq_set_irq_wake(irq, 1);
 
+	if (data->usb_id_irq) {
+		rc = pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);
+		if (rc)
+			goto err_domain;
+	}
+
 	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (rc)
-		irq_domain_remove(chip->irqdomain);
+		goto err_extcon;
+
+	return 0;
+
+err_extcon:
+	pm8xxx_remove_usb_extcon(chip);
+err_domain:
+	irq_domain_remove(chip->irqdomain);
 
 	return rc;
 }
@@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pdev)
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(&pdev->dev);
+	pm8xxx_remove_usb_extcon(chip);
 	irq_domain_remove(chip->irqdomain);
 }
 

-- 
2.43.0


