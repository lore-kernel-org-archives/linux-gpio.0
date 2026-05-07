Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B7838F630;
	Thu,  7 May 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141921; cv=none; b=RYbLr8UVjiOJLGihAiMdmgZMX0MT6sYfTHK5pYyL7SRaxpNfkZnlc6STTgpwx2kZcnspOT4LIMZYHiys1RGCSajuKh89aNkNrg7gSGx/x4iANX6dZsAZUPYvPgSDlWeX0e9qsz7Ts4mVcD/W/AUGICk3q1Xs7LByXCOvok89AvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141921; c=relaxed/simple;
	bh=BJsUWqhqKWTeRoj7f/uMA08P6L+O935weDINORxAej0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJN2cOCpOsg//JGLLcxVnoam4+ML09tIQE9MamyFyZ4cxu7F4SQ2KnO8PegTEH+PiLNqE/6EjZFORRD5+XMFRxT/S95Q91Co1ZJkQrDTWp4PhR/X48iItcxPzuPHDkZb3fo/vIjHTcvnjqrDhL8tgaovYVP+I9jBwkrSibyiojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S12;
	Thu, 07 May 2026 16:17:38 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 10/12] riscv: dts: thead: Add TH1520 I2C nodes
Date: Thu,  7 May 2026 16:17:08 +0800
Message-ID: <20260507081710.4090814-11-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S12
X-Coremail-Antispam: 1UD129KBjvJXoWxCry3ArWxJryrKw45WrWfKrg_yoW5CryDpa
	srArZ5Aws5XF1I93W3XFy2kFZxJan5uF92grnFkFWUCw1YgF4YvrW8tFyIvF1kXFWUXw1a
	qFn3Cr10yrn8tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Add nodes for the six I2C on the T-Head TH1520 RISCV SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
[Icenowy: rebase on top of v7.1-rc2]
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 60 +++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index a6a3e114d0d2f..df49f8f749ef7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -425,6 +425,36 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@ffe7f20000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f20000 0x0 0x4000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffe7f28000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f28000 0x0 0x4000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
@@ -523,6 +553,16 @@ padctrl0_apsys: pinctrl@ffec007000 {
 			thead,pad-group = <3>;
 		};
 
+		i2c2: i2c@ffec00c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec00c000 0x0 0x4000>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -534,6 +574,16 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@ffec014000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec014000 0x0 0x4000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pwm: pwm@ffec01c000 {
 			compatible = "thead,th1520-pwm";
 			reg = <0xff 0xec01c000 0x0 0x4000>;
@@ -759,6 +809,16 @@ uart5: serial@fff7f0c000 {
 			status = "disabled";
 		};
 
+		i2c5: i2c@fff7f2c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xf7f2c000 0x0 0x4000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-- 
2.52.0

