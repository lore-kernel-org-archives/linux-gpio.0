Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795812641;
	b=ZKfFax9jvNrNCLPfBD7eQo3vQd87xaAg3v39Iu4DYLimmRJ7BHsPH0hX6O8VPQUzwk5R
	 nGBG9iuNPuFl1fweIjiNVQsEMhLl30AM58hqlBKRvqkpp2QrODmfahumtgh4EKs4RqriE
	 iIqwwHzW1j+YyJ87XSlMRRysmqoNr41bjDGMGwaKwGnDYxpqPZGzeillCfaEnpCVbvXtM
	 F+BA6qCurDoeBCtgNru49HQnoKCb3vNOYnKDBjyyrqDWI6D0IZ9gNfODuVAgTy5HcDyC8
	 tr/TV6gRVVZaup+wPJdCXtuaUvb+r6vnHTE85KgyIDeXqI+RBkmeY50aiQyMq1d2EAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812641;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q20QBOvn92S7mPY5twr+Vd8sz0GdMjQCLIH9xkAIz2A=;
	b=VCov2M4uLU7VZOcOB818RM3ZUwSAa4i9P67QGJrNvnUKDhIRvKd4Eym14mC18SU/SKWd
	 HYulvl7vfRZAZ1wrW3R4elIMmFkcVk4chm6WncaYG7Wlied/k7uba7934AEzP6Wg5pUmz
	 viv03pulpoDFd8rvuSN6Ig0y5YgcHyeCkjMpkMBej5UOr1KFLlsw2Xe69WmQWJk/ZZknD
	 fUuH2K5UXuMgXCwCb5eXzlDpbbbwBJyOZNRvIUD0aAIy9tLMPdBMgB7KKnRsH2WOtFFrw
	 G3oIt4Xn8z6SDX8m5SyvYmpZDfmeO/muPuckUX0VnZcUNteu27Gtdv9L057Yn0ciFsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lx25qOL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB8606A686;
	Fri, 27 Nov 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lx25qOL0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812640;
	b=SywiFxTGvUKQFRNXDHcliOVHswLcjVq0v7N4mcmWXSi2GOUjj5N/fNkOO0IOsdMXa9rT
	 hVaInYStZQD8g6gq9aNSony/K8mi1PaT8MFFXNPOv/abEqW2HgMibyEJcVCgIjO6KHBmd
	 wseT3njns1OD+5bP//1Jk6i8IUMzeEATKYbFnVxoXbMaggXF+cNu3pTiqUGIBe2KqhzYF
	 IJEP4huGW8P32aL7KBd1MEScCEaRKO/RFDkcCtFF3ZYg/ioTq8nrRxh8IkKtq52vxDwl9
	 ma88EzQXuNJFi7UCmHd23LpsJJ7okijE7JGOFWaDJcPbosoednG9t4v/Uu10SYNUnkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812640;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q20QBOvn92S7mPY5twr+Vd8sz0GdMjQCLIH9xkAIz2A=;
	b=tbsjOAPV83CBQYpIEq4GInzMrgecK6IxyA2rfIxbj3oGMVx5fenE8+4IvGlEeLLz02Wy
	 KxJoNEzrMb7lvWOQqWaNpBmAPKuJUBwszyKRLbKcdoqldPnQBz77cDpHcO9WijvaBnq2X
	 6WCbZ5xedDSYJQtZZxIhLyacgRzhTjcE43na9/a5gFCiWkDakzHJRNLfheeGQ0CijI3Qw
	 SFFi94+dYyOCU1g+ESeMOI0YaRwqwv0nB5H5itMAMzMbeZTh7GAghzeLsQ1mPOIvMJjY8
	 cx0/m5ldgm7+L6gULm7KRfeMdjSMQjneDBlxrhNQx86F7R/8zZO6Dlgxpc7HBDq044Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECD7A1F0089A;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812640;
	bh=q20QBOvn92S7mPY5twr+Vd8sz0GdMjQCLIH9xkAIz2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Lx25qOL0RrrbYlMohj63pyOqrf2MmxK5502qgHcLtc1d6PIJjFSIqR3LYuDfhWrXD
	 tQLa4I8oYMOq2ILoF1M0kYJIb1JDuGOIeGcIaiLPFBbRMHYSCcKXp40tGQ08NybMA3
	 n9RE2/0LPrcFpdqEp2loR+MRRCbvQNegLiG3YrYtTkJlAxgSFB3KSmUeyiHYaKm7qV
	 DEHUUAghgqZ0BoBMRvS+AmzC0Rus5SG+Tu/Dvuz/KwToLSxONBZgtzYRk943gy1QFt
	 IlRo16fwCcAvKvpt62AD++SFJ3Mz9vM/ti5nPJ6KN5HlT8QCchkSaz9KsSPb9zx3TN
	 pq/HrxfUBk7cA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 745A44DDE3;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:29 +0300
Subject: [PATCH v5 4/6] reset: Add Cortina Systems CS7542 global reset
 controller
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-cs7542-syscon-v5-4-d5a373c72b05@gmail.com>
References: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
In-Reply-To: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=6229;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=5K/vLm2oN+ZIV0+W8dyIY0j0kBlKvVn48Mt8RDzub30=;
 b=AI+Ckwyf3gSHB7rj+xju635VFx3u/GPNDNEwIsP30QRmRLCvcBo/26eXi+m9xaKwLixnmunW7
 ubhSK1027XLC1VrtsUU5Pu72JiZIAGB1Q+RSA1Qs8WfBSrlrkrf/H63
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Use the shared syscon regmap to control three PCIe and seven network
engine reset signals. PCIe consumers supply their own assert and
recovery timing. Verify level transitions of the network resets before
the consumer releases DMA buffers. Reject the unassigned group ID to
preserve exclusive ownership of the underlying lines.

The clock provider registers early for timers. Match the platform
device for the same syscon when reset consumers can probe.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/reset/Kconfig        |  10 ++++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-cs7542.c | 135 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a..544cb79fa 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_CS7542
+	tristate "Cortina Systems CS7542 reset controller"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  Control the individual PCIe and network engine reset signals in
+	  the CS7542 global register block.
+	  The PCIe controllers have independent level resets. The network
+	  engine uses seven reset lines, including the shared DMA block.
+
 config RESET_DR1V90
 	tristate "Anlogic DR1V90 reset controller"
 	depends on ARCH_ANLOGIC || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6b..df183fc0a 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_CS7542) += reset-cs7542.o
 obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
 obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
 obj-$(CONFIG_RESET_EIC7700_HSP) += reset-eic7700-hsp.o
diff --git a/drivers/reset/reset-cs7542.c b/drivers/reset/reset-cs7542.c
new file mode 100644
index 000000000..6b68a2109
--- /dev/null
+++ b/drivers/reset/reset-cs7542.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 global reset controller */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/reset/cortina,cs7542-reset.h>
+
+#define CS7542_GLOBAL_RESET	0x04
+
+static const u32 cs7542_reset_masks[] = {
+	[CS7542_RESET_PCIE0] = BIT(6),
+	[CS7542_RESET_PCIE1] = BIT(7),
+	[CS7542_RESET_PCIE2] = BIT(8),
+	[CS7542_RESET_NI] = BIT(0),
+	[CS7542_RESET_FE] = BIT(1),
+	[CS7542_RESET_TM] = BIT(2),
+	[CS7542_RESET_SCH] = BIT(3),
+	[CS7542_RESET_QM] = BIT(5),
+	[CS7542_RESET_DMA] = BIT(16),
+	[CS7542_RESET_NI_XRAM] = BIT(17),
+	[CS7542_RESET_FLASH] = BIT(14),
+};
+
+struct cs7542_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+};
+
+static int cs7542_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct cs7542_reset *rst = container_of(rcdev, struct cs7542_reset, rcdev);
+	u32 mask = cs7542_reset_masks[id];
+	u32 target = assert ? mask : 0;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_update_bits(rst->map, CS7542_GLOBAL_RESET, mask, target);
+	if (ret || id < CS7542_RESET_NI)
+		return ret;
+
+	return regmap_read_poll_timeout(rst->map, CS7542_GLOBAL_RESET, value,
+					(value & mask) == target, 1, 1000);
+}
+
+static int cs7542_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, true);
+}
+
+static int cs7542_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, false);
+}
+
+static int cs7542_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct cs7542_reset *rst = container_of(rcdev, struct cs7542_reset, rcdev);
+
+	return regmap_test_bits(rst->map, CS7542_GLOBAL_RESET, cs7542_reset_masks[id]);
+}
+
+static int cs7542_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *spec)
+{
+	unsigned int id = spec->args[0];
+
+	if (id >= rcdev->nr_resets || !cs7542_reset_masks[id])
+		return -EINVAL;
+
+	return id;
+}
+
+static const struct reset_control_ops cs7542_reset_ops = {
+	.assert = cs7542_reset_assert,
+	.deassert = cs7542_reset_deassert,
+	.status = cs7542_reset_status,
+};
+
+static int cs7542_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs7542_reset *rst;
+
+	/* Clock-only descriptions also use this syscon. */
+	if (!of_property_present(dev->of_node, "#reset-cells"))
+		return 0;
+
+	rst = devm_kzalloc_obj(dev, *rst);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->map = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "cannot get global regmap\n");
+
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.dev = dev;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.ops = &cs7542_reset_ops;
+	rst->rcdev.nr_resets = ARRAY_SIZE(cs7542_reset_masks);
+	rst->rcdev.of_reset_n_cells = 1;
+	rst->rcdev.of_xlate = cs7542_reset_xlate;
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct of_device_id cs7542_reset_of_match[] = {
+	{ .compatible = "cortina,cs7542-syscon" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs7542_reset_of_match);
+
+static struct platform_driver cs7542_reset_driver = {
+	.probe = cs7542_reset_probe,
+	.driver = {
+		.name = "cs7542-reset",
+		.of_match_table = cs7542_reset_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(cs7542_reset_driver);
+
+MODULE_DESCRIPTION("Cortina Systems CS7542 global reset controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0


