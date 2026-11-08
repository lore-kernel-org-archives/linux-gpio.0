Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162506;
	b=KeYdzdw5IG5ZShnmHqF0A2Z56owNK4l/Ob37FXx5mRae66VlkB3JhMnF6xSQZ+tLbw5e
	 nd9xgKbaBlYa1aFvCmj9wK5EmsgZyRddAQxazvAKbdZwsUXGsOP/k8YU5MDzq/X+zpBoT
	 eF2q7AUM27h4msGZ/tKAFSfhbj+yql0RzwP8NWLnP+sd5o6TS3nEgfVv5iUSqDoVO0JY+
	 n87OEpseLwDywx4AcUhHjvo4O/5mfGOewgiIysqVa0PhBp/ZA/ke2didaiRDohEvyvBSd
	 O9/FIQLyCU9Pk8jr299VwkI1Ky4YG6di9ipImJveGHK9D8frrgxEDGSZM4If8teI2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=M37KI/J2zQxwAs9N2LBNc7O8gL1xYb58utgqWjO3z40=;
	b=DQaSY8XT3e91lFPd0vjJEhna+9/jcA8dUZ5Wbu97yG8VxX1dhMv3yeeOAx+alVNltQWy
	 N9bXCrNi+erPX4n5JUaufpA5p1rPQ4ud0wsup8zFe2XmzE3vclZ0y5pvVnV8eulITMkV/
	 GA9lZtXeyJNTZ2WWSsxtgg+DHYGEni3nRIhwlvAIi7UXfn5yAV78yqopy2tmIuWjLfJu3
	 yA/iu1sCGkkVZWtC4YyM/We53P/dgIjliNgoVapp+6RcgeDVX/KeXJ+Pw4p1lJBS4Pisy
	 1tBjUrXbkvqyTxFVxuAwkRb/BZ2McJ44vSfP51JCVlOXZjV7N6CoqA4bzqOT63Rs2Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWpSDhRq;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8AA606A330
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 18:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8AA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWpSDhRq
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so27044866b.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162502; x=1794767302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M37KI/J2zQxwAs9N2LBNc7O8gL1xYb58utgqWjO3z40=;
        b=KWpSDhRqAEMbTBn45UGoRmrRcJWjiAcPGtsUq0b/UnGoKSpHqmk+pl46p7ax8pQxIC
         /MPUycqV2cclX4P9nf237t8G0ErKAvSnmfGNz1QwJO7wcOu5ezkXYe9UI97CeyvS5jGj
         rM1g00HwggzJuEwgBjWgEIEjtVb3iHzM4cjmKPbi5Rxt17aKdRC0Uqw4AaXbIPIC/Hum
         CVyaVAEudn0CVc7aQm0kO425nMckTY3+EudUc/uedjNZj1zheG4soCAQjIvzYgWrOhYx
         050wqgafNH/Oklx9xprlIlirjGj3W5OFJT9Zf2CoXNB7mp82BZfsBgpvg1ebOlhkiMYP
         si7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162502; x=1794767302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M37KI/J2zQxwAs9N2LBNc7O8gL1xYb58utgqWjO3z40=;
        b=nhD13inP4PLR4X2aolceL6ZUWTQLMmjDVQGbxPKf3lOUpxGiT2eyJ6wSrlBLOOSUjf
         1VBRkAOBAacFQdYHn8cUGCedHd/lNwgYkpJGuqAcPRHfpVmbbX9KIOWYbhfJtnFI3zrm
         V6J9Vx+YMF8iDwLrl+4ZpjNwFU8/kpFZRbv9q1otKwS1g8RAzBF5eOBSi+bIm5sK25/w
         5VRt63MYSGCEdTilD7wpT7sdJZQP8wqOcMPFyROzGkOc4HqNOlVbfP2ZzeyP+m9+spsT
         MdOF7bgIrtsuEYo2cPOsoLskP9JZmFn8FlKtkZ+0Gahg4d8WB73WyymLGdPbvWEGAcof
         g9gQ==
X-Gm-Message-State: APuU4Z/wX94THoK1wDM5FQFiYwPrhsItaT+SZMHNwBFsWYpzR6pXqsqm
	Q/nQ22vgJUQN/+3wViC9kkjY7cwbMNgccQpy7+uYWF7W7acBrXjiW7EeqeOyJE/5vdPl9Q==
X-Gm-Gg: AYBFou2+gTRINWVCALw7qT3BZbLAoNSOaQf2hlY977+gRj+hW2LGFPsfSuY+L2j9xP6
	3QwtEVYoE7l8uS8e0/ZenNpSbd1liz12mxTb7Ku7Kjd+wVnIxq4RUOYRVWh2kWM0mTO9z+pptaC
	FV+1AsYehATpYcczSmKPSpeZLihYMGEXdSuA+pY8sBJDt6yNGjn3ABMGuZP0zICyIukuduK5+WY
	eCvtPMzqdLhQ/NLZ3nA6n5FdPNzYgtftTzkuqyUNvw+MaSPfg1z+jqaldK5IC11yWRZ9nGf+VHb
	2bjNP6kb0oVnzUfp0ooImBHVXp7MFwwTOceJjjTobM9liePp5OiGip2fffZIatFHjP6juCxwlcI
	va+bccCgiarw8+545EhtjqjKJc8szbcVP8QAUgTS7rEvWLeT66dL+AEltTNBkax7jgL49/8o2vm
	nXRsNKbRXpY+nSneSAgU3TGtsm53M/5IHszBv0eETMMG8OaHO1S052JyIL3LYdbTm9EjXutdEt3
	7XbMJPqmLl5Wr91LZosIzFukRVGOpAEzdTRraUSdO0XzN4JY9TQEwxEIS91M0Ad9WyvJlV8R8lj
	Pqw8DxmOoTlLhspdl6xOkqsZr95ZFYtSK/aBhODJ93auu5m6olEcNDpWLljNqZVN
X-Received: by 2002:a17:907:a88f:b0:c40:b59:1b with SMTP id a640c23a62f3a-c4d6d891f1amr126675866b.44.1794162501504;
        Sun, 08 Nov 2026 10:28:21 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:19 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Sun, 08 Nov 2026 21:27:11 +0300
Subject: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
In-Reply-To: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2

Add driver support for the pin controller found in the MediaTek
Dimensity 8000/8100 (MT6895) SoC. It has 227 GPIOs and 20 virtual
EINT lines (227-246), and uses the common Paris pinctrl and EINT code.

The register tables and pin functions are based on the MediaTek driver
in the Xiaomi kernel source release for this SoC.

Pins 69, 70, 73, 74, 80-87, 186, 187 and 221-224 (RF front end, MIPI
RFFE and SPMI) have a 5-bit DRV_ADV field with an undocumented layout.
Paris handles only the 3-bit EN/E0/E1 layout and would clear these
fields, so they are left out of the DRV_ADV table and keep the value
set by the bootloader.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig              |   10 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c     | 1617 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h | 2717 +++++++++++++++++++++++++
 4 files changed, 4345 insertions(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 912d782fb6a5..8fa02204875d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -203,6 +203,16 @@ config PINCTRL_MT6893
 	  Say yes here to support pin controller and gpio driver
 	  on the MediaTek Dimensity 1200 MT6893 Smartphone SoC.
 
+config PINCTRL_MT6895
+	tristate "MediaTek Dimensity MT6895 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on the MediaTek Dimensity 8000/8100 MT6895 Smartphone SoC.
+
 config PINCTRL_MT7622
 	tristate "MediaTek MT7622 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 9982866359af..7e73309c63fe 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PINCTRL_MT6797)		+= pinctrl-mt6797.o
 obj-$(CONFIG_PINCTRL_MT6858)		+= pinctrl-mt6858.o
 obj-$(CONFIG_PINCTRL_MT6878)		+= pinctrl-mt6878.o
 obj-$(CONFIG_PINCTRL_MT6893)		+= pinctrl-mt6893.o
+obj-$(CONFIG_PINCTRL_MT6895)		+= pinctrl-mt6895.o
 obj-$(CONFIG_PINCTRL_MT7622)		+= pinctrl-mt7622.o
 obj-$(CONFIG_PINCTRL_MT7623)		+= pinctrl-mt7623.o
 obj-$(CONFIG_PINCTRL_MT7629)		+= pinctrl-mt7629.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6895.c b/drivers/pinctrl/mediatek/pinctrl-mt6895.c
new file mode 100644
index 000000000000..1eb879291230
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6895.c
@@ -0,0 +1,1617 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ *
+ * Author: Light Hsieh <light.hsieh@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include "pinctrl-mtk-mt6895.h"
+#include "pinctrl-paris.h"
+
+/* MT6895 has multiple bases to program pin configuration listed as the below:
+ * GPIO_BASE: 0x10005000
+ * IOCFG_RM_BASE: 0x11C20000
+ * IOCFG_RT_BASE: 0x11C30000
+ * IOCFG_RMM_BASE: 0x11C40000
+ * IOCFG_BL_BASE: 0x11D10000
+ * IOCFG_BM_BASE: 0x11D30000
+ * IOCFG_BR_BASE: 0x11D40000
+ * IOCFG_BRR_BASE: 0x11D50000
+ * IOCFG_LB_BASE: 0x11D60000
+ * IOCFG_LM_BASE: 0x11E10000
+ * IOCFG_RTT_BASE: 0x11EA0000
+ * IOCFG_TR_BASE: 0x11EB0000
+ * IOCFG_TL_BASE: 0x11F20000
+ * IOCFG_LT_BASE: 0x11F30000
+ * _i_based could be used to indicate what base the pin should be mapped into.
+ */
+
+#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
+		       32, 0)
+
+static const struct mtk_pin_field_calc mt6895_pin_mode_range[] = {
+	PIN_FIELD(0, 226, 0x0300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_dir_range[] = {
+	PIN_FIELD(0, 226, 0x0000, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_di_range[] = {
+	PIN_FIELD(0, 226, 0x0200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_do_range[] = {
+	PIN_FIELD(0, 226, 0x0100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 0, 12, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(1, 1, 12, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 12, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 7, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(4, 4, 2, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 2, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 13, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(7, 7, 13, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(8, 8, 6, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(9, 9, 6, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(12, 12, 6, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(13, 13, 5, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(14, 14, 5, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(16, 16, 13, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(17, 17, 13, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(18, 18, 13, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(20, 20, 6, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(21, 21, 6, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(22, 22, 6, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(23, 23, 13, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 6, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(25, 25, 13, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(26, 26, 13, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(27, 27, 13, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(28, 28, 13, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 13, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 13, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x0030, 0x10, 19, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(35, 35, 13, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(36, 36, 13, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(37, 37, 7, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(38, 38, 7, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(39, 39, 13, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(40, 40, 13, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(41, 41, 13, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 6, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(44, 44, 9, 0x0020, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 9, 0x0020, 0x10, 11, 1),
+	PIN_FIELD_BASE(46, 46, 9, 0x0020, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 9, 0x0020, 0x10, 7, 1),
+	PIN_FIELD_BASE(48, 48, 9, 0x0020, 0x10, 8, 1),
+	PIN_FIELD_BASE(49, 49, 9, 0x0020, 0x10, 6, 1),
+	PIN_FIELD_BASE(50, 50, 9, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 51, 9, 0x0020, 0x10, 1, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0020, 0x10, 5, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0020, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0020, 0x10, 4, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0020, 0x10, 3, 1),
+	PIN_FIELD_BASE(56, 56, 8, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(57, 57, 8, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(58, 58, 8, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(59, 59, 8, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(60, 60, 8, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(61, 61, 8, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(62, 62, 8, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(63, 63, 8, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(64, 64, 8, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(65, 65, 8, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 8, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 8, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(68, 68, 4, 0x0010, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 8, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(70, 70, 8, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(71, 71, 4, 0x0010, 0x10, 1, 1),
+	PIN_FIELD_BASE(72, 72, 4, 0x0010, 0x10, 2, 1),
+	PIN_FIELD_BASE(73, 73, 8, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 8, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 4, 0x0010, 0x10, 3, 1),
+	PIN_FIELD_BASE(76, 76, 4, 0x0010, 0x10, 4, 1),
+	PIN_FIELD_BASE(77, 77, 4, 0x0010, 0x10, 5, 1),
+	PIN_FIELD_BASE(78, 78, 4, 0x0010, 0x10, 6, 1),
+	PIN_FIELD_BASE(79, 79, 4, 0x0010, 0x10, 7, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(81, 81, 8, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(82, 82, 8, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(83, 83, 8, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(84, 84, 8, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(85, 85, 8, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(86, 86, 8, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(87, 87, 8, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(88, 88, 6, 0x0070, 0x10, 26, 1),
+	PIN_FIELD_BASE(89, 89, 6, 0x0070, 0x10, 27, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0030, 0x10, 9, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0030, 0x10, 10, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0030, 0x10, 7, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0030, 0x10, 8, 1),
+	PIN_FIELD_BASE(99, 99, 6, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(100, 100, 6, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(101, 101, 6, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(102, 102, 6, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 5, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 5, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0030, 0x10, 13, 1),
+	PIN_FIELD_BASE(106, 106, 3, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(107, 107, 3, 0x0030, 0x10, 10, 1),
+	PIN_FIELD_BASE(108, 108, 3, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(109, 109, 1, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(110, 110, 1, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 1, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 1, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(113, 113, 11, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0060, 0x10, 27, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(119, 119, 10, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x0060, 0x10, 28, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x0060, 0x10, 29, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x0060, 0x10, 30, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x0060, 0x10, 31, 1),
+	PIN_FIELD_BASE(126, 126, 2, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(127, 127, 2, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(128, 128, 2, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(129, 129, 6, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(130, 130, 6, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(131, 131, 6, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(132, 132, 6, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(133, 133, 6, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(134, 134, 6, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(137, 137, 6, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(138, 138, 6, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(139, 139, 6, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(140, 140, 6, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 1, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(152, 152, 1, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 1, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(154, 154, 1, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(155, 155, 1, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(156, 156, 2, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(162, 162, 1, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(165, 165, 10, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(166, 166, 10, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 10, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 11, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(169, 169, 2, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(170, 170, 2, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(171, 171, 11, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(172, 172, 11, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(173, 173, 11, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(174, 174, 11, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(175, 175, 11, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(176, 176, 2, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(177, 177, 2, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(178, 178, 2, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(179, 179, 2, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(180, 180, 2, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(181, 181, 2, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(182, 182, 2, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(185, 185, 2, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(186, 186, 11, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(187, 187, 11, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(188, 188, 11, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(189, 189, 11, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(190, 190, 11, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(191, 191, 11, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(192, 192, 11, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(193, 193, 11, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(195, 195, 12, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(197, 197, 12, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(198, 198, 12, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(199, 199, 12, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(200, 200, 12, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(201, 201, 12, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(202, 202, 3, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(203, 203, 3, 0x0030, 0x10, 9, 1),
+	PIN_FIELD_BASE(204, 204, 3, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(205, 205, 3, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(206, 206, 3, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(207, 207, 3, 0x0030, 0x10, 8, 1),
+	PIN_FIELD_BASE(208, 208, 3, 0x0030, 0x10, 7, 1),
+	PIN_FIELD_BASE(209, 209, 3, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(210, 210, 3, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(211, 211, 3, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(212, 212, 3, 0x0030, 0x10, 14, 1),
+	PIN_FIELD_BASE(213, 213, 3, 0x0030, 0x10, 15, 1),
+	PIN_FIELD_BASE(214, 214, 3, 0x0030, 0x10, 16, 1),
+	PIN_FIELD_BASE(215, 215, 3, 0x0030, 0x10, 17, 1),
+	PIN_FIELD_BASE(216, 216, 3, 0x0030, 0x10, 18, 1),
+	PIN_FIELD_BASE(217, 217, 12, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(218, 218, 12, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(219, 219, 12, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(220, 220, 12, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(221, 221, 13, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(222, 222, 13, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(223, 223, 13, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(224, 224, 13, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(225, 225, 7, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(226, 226, 7, 0x0030, 0x10, 7, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_smt_range[] = {
+	PIN_FIELD_BASE(0, 0, 12, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(1, 1, 12, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(2, 2, 12, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(3, 3, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 2, 0x0100, 0x10, 17, 1),
+	PIN_FIELD_BASE(5, 5, 2, 0x0100, 0x10, 18, 1),
+	PIN_FIELD_BASE(6, 6, 13, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(7, 7, 13, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(8, 8, 6, 0x00d0, 0x10, 17, 1),
+	PIN_FIELD_BASE(9, 9, 6, 0x00d0, 0x10, 19, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x0100, 0x10, 15, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x0100, 0x10, 16, 1),
+	PIN_FIELD_BASE(12, 12, 6, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(13, 13, 5, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(14, 14, 5, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 13, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(17, 17, 13, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(18, 18, 13, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 6, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(21, 21, 6, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(22, 22, 6, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(23, 23, 13, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 6, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(25, 25, 13, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(26, 26, 13, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(27, 27, 13, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(28, 28, 13, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 13, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 13, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0110, 0x10, 0, 1),
+	PIN_FIELD_BASE(35, 35, 13, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(36, 36, 13, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(37, 37, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(38, 38, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(39, 39, 13, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(40, 40, 13, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(41, 41, 13, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 6, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(44, 44, 9, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 9, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(46, 46, 9, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 9, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(48, 48, 9, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(49, 49, 9, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(50, 50, 9, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 51, 9, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(56, 56, 8, 0x00b0, 0x10, 16, 1),
+	PIN_FIELD_BASE(57, 57, 8, 0x00b0, 0x10, 16, 1),
+	PIN_FIELD_BASE(58, 58, 8, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(59, 59, 8, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(60, 60, 8, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(61, 61, 8, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(62, 62, 8, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(63, 63, 8, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(64, 64, 8, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(65, 65, 8, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 8, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 8, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(68, 68, 4, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 8, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(70, 70, 8, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(71, 71, 4, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(72, 72, 4, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(73, 73, 8, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 8, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 4, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(76, 76, 4, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(77, 77, 4, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(78, 78, 4, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(79, 79, 4, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x00b0, 0x10, 18, 1),
+	PIN_FIELD_BASE(81, 81, 8, 0x00b0, 0x10, 18, 1),
+	PIN_FIELD_BASE(82, 82, 8, 0x00b0, 0x10, 19, 1),
+	PIN_FIELD_BASE(83, 83, 8, 0x00b0, 0x10, 19, 1),
+	PIN_FIELD_BASE(84, 84, 8, 0x00b0, 0x10, 17, 1),
+	PIN_FIELD_BASE(85, 85, 8, 0x00b0, 0x10, 17, 1),
+	PIN_FIELD_BASE(86, 86, 8, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 87, 8, 0x00b0, 0x10, 15, 1),
+	PIN_FIELD_BASE(88, 88, 6, 0x00d0, 0x10, 21, 1),
+	PIN_FIELD_BASE(89, 89, 6, 0x00d0, 0x10, 14, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 6, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(100, 100, 6, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(101, 101, 6, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(102, 102, 6, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(103, 103, 5, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 5, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(106, 106, 3, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(107, 107, 3, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(108, 108, 3, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(109, 109, 1, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(110, 110, 1, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(111, 111, 1, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 1, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(113, 113, 11, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x0100, 0x10, 24, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0100, 0x10, 21, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0100, 0x10, 23, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0100, 0x10, 25, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0100, 0x10, 22, 1),
+	PIN_FIELD_BASE(119, 119, 10, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x0100, 0x10, 26, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x0100, 0x10, 28, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x0100, 0x10, 29, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x0100, 0x10, 30, 1),
+	PIN_FIELD_BASE(126, 126, 2, 0x0100, 0x10, 31, 1),
+	PIN_FIELD_BASE(127, 127, 2, 0x0100, 0x10, 19, 1),
+	PIN_FIELD_BASE(128, 128, 2, 0x0100, 0x10, 20, 1),
+	PIN_FIELD_BASE(129, 129, 6, 0x00d0, 0x10, 18, 1),
+	PIN_FIELD_BASE(130, 130, 6, 0x00d0, 0x10, 20, 1),
+	PIN_FIELD_BASE(131, 131, 6, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(132, 132, 6, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(133, 133, 6, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(134, 134, 6, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(137, 137, 6, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(138, 138, 6, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(139, 139, 6, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(140, 140, 6, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(150, 150, 1, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(152, 152, 1, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(153, 153, 1, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(154, 154, 1, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(155, 155, 1, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(156, 156, 2, 0x0100, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0100, 0x10, 13, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0100, 0x10, 14, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0100, 0x10, 9, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0100, 0x10, 10, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0100, 0x10, 11, 1),
+	PIN_FIELD_BASE(162, 162, 1, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(165, 165, 10, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(166, 166, 10, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(167, 167, 10, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(168, 168, 11, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(169, 169, 2, 0x0100, 0x10, 27, 1),
+	PIN_FIELD_BASE(170, 170, 2, 0x0100, 0x10, 27, 1),
+	PIN_FIELD_BASE(171, 171, 11, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(172, 172, 11, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(173, 173, 11, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(174, 174, 11, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(175, 175, 11, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(176, 176, 2, 0x0100, 0x10, 0, 1),
+	PIN_FIELD_BASE(177, 177, 2, 0x0100, 0x10, 1, 1),
+	PIN_FIELD_BASE(178, 178, 2, 0x0100, 0x10, 2, 1),
+	PIN_FIELD_BASE(179, 179, 2, 0x0100, 0x10, 3, 1),
+	PIN_FIELD_BASE(180, 180, 2, 0x0100, 0x10, 4, 1),
+	PIN_FIELD_BASE(181, 181, 2, 0x0100, 0x10, 5, 1),
+	PIN_FIELD_BASE(182, 182, 2, 0x0100, 0x10, 6, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0100, 0x10, 7, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(185, 185, 2, 0x0100, 0x10, 8, 1),
+	PIN_FIELD_BASE(186, 186, 11, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(187, 187, 11, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(188, 188, 11, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(189, 189, 11, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(190, 190, 11, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(191, 191, 11, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(192, 192, 11, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(193, 193, 11, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(195, 195, 12, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(197, 197, 12, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(198, 198, 12, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(199, 199, 12, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(200, 200, 12, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(201, 201, 12, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(202, 202, 3, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(203, 203, 3, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(204, 204, 3, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(205, 205, 3, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(206, 206, 3, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(207, 207, 3, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(208, 208, 3, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(209, 209, 3, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(210, 210, 3, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(211, 211, 3, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(212, 212, 3, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(213, 213, 3, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(214, 214, 3, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(215, 215, 3, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(216, 216, 3, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(217, 217, 12, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(218, 218, 12, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(219, 219, 12, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(220, 220, 12, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(221, 221, 13, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(222, 222, 13, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(223, 223, 13, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(224, 224, 13, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(225, 225, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(226, 226, 7, 0x0080, 0x10, 4, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_pu_range[] = {
+	PIN_FIELD_BASE(0, 0, 12, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(1, 1, 12, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 12, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 7, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(4, 4, 2, 0x00a0, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 2, 0x00a0, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 13, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(7, 7, 13, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(8, 8, 6, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(9, 9, 6, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(12, 12, 6, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(13, 13, 5, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(14, 14, 5, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(20, 20, 6, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(21, 21, 6, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(22, 22, 6, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(23, 23, 13, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(24, 24, 6, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(25, 25, 13, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(26, 26, 13, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(27, 27, 13, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(28, 28, 13, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 13, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(32, 32, 13, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(35, 35, 13, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(36, 36, 13, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(37, 37, 7, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(38, 38, 7, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(39, 39, 13, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(40, 40, 13, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(41, 41, 13, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 6, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(56, 56, 8, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(57, 57, 8, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(58, 58, 8, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(59, 59, 8, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(60, 60, 8, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(61, 61, 8, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(62, 62, 8, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(63, 63, 8, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(64, 64, 8, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(65, 65, 8, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 8, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 8, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(68, 68, 4, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 8, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(70, 70, 8, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(71, 71, 4, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(72, 72, 4, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(73, 73, 8, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 8, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 4, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(76, 76, 4, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(77, 77, 4, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(78, 78, 4, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(79, 79, 4, 0x0030, 0x10, 7, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(81, 81, 8, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(82, 82, 8, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(83, 83, 8, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(84, 84, 8, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(85, 85, 8, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(86, 86, 8, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(87, 87, 8, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(88, 88, 6, 0x0090, 0x10, 27, 1),
+	PIN_FIELD_BASE(89, 89, 6, 0x0090, 0x10, 28, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(99, 99, 6, 0x0090, 0x10, 24, 1),
+	PIN_FIELD_BASE(100, 100, 6, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(101, 101, 6, 0x0090, 0x10, 25, 1),
+	PIN_FIELD_BASE(102, 102, 6, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 5, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 5, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(109, 109, 1, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(110, 110, 1, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 1, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 1, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x00a0, 0x10, 26, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x00a0, 0x10, 23, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x00a0, 0x10, 25, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00a0, 0x10, 27, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00a0, 0x10, 24, 1),
+	PIN_FIELD_BASE(119, 119, 10, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x00a0, 0x10, 28, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x00a0, 0x10, 29, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x00a0, 0x10, 30, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x00a0, 0x10, 31, 1),
+	PIN_FIELD_BASE(126, 126, 2, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(127, 127, 2, 0x00a0, 0x10, 21, 1),
+	PIN_FIELD_BASE(128, 128, 2, 0x00a0, 0x10, 22, 1),
+	PIN_FIELD_BASE(129, 129, 6, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(130, 130, 6, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(131, 131, 6, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(132, 132, 6, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(133, 133, 6, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(134, 134, 6, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(137, 137, 6, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(138, 138, 6, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(139, 139, 6, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(140, 140, 6, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 1, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(152, 152, 1, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 1, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(154, 154, 1, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(155, 155, 1, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(156, 156, 2, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(162, 162, 1, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(165, 165, 10, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(166, 166, 10, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 10, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(169, 169, 2, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(170, 170, 2, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(176, 176, 2, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(177, 177, 2, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(178, 178, 2, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(179, 179, 2, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(180, 180, 2, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(181, 181, 2, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(182, 182, 2, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(185, 185, 2, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(186, 186, 11, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(187, 187, 11, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(195, 195, 12, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(197, 197, 12, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(198, 198, 12, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(199, 199, 12, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(200, 200, 12, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(201, 201, 12, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(202, 202, 3, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(203, 203, 3, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(204, 204, 3, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(205, 205, 3, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(206, 206, 3, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(207, 207, 3, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(208, 208, 3, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(209, 209, 3, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(210, 210, 3, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(211, 211, 3, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(212, 212, 3, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(213, 213, 3, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(214, 214, 3, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(215, 215, 3, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(216, 216, 3, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(217, 217, 12, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(218, 218, 12, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(219, 219, 12, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(220, 220, 12, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(221, 221, 13, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(222, 222, 13, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(223, 223, 13, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(224, 224, 13, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(225, 225, 7, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(226, 226, 7, 0x0050, 0x10, 7, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_pd_range[] = {
+	PIN_FIELD_BASE(0, 0, 12, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(1, 1, 12, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 12, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 7, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(4, 4, 2, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 2, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 13, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(7, 7, 13, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(8, 8, 6, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(9, 9, 6, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(12, 12, 6, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(13, 13, 5, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(14, 14, 5, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(20, 20, 6, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(21, 21, 6, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(22, 22, 6, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(23, 23, 13, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(24, 24, 6, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(25, 25, 13, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(26, 26, 13, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(27, 27, 13, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(28, 28, 13, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 13, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(32, 32, 13, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(35, 35, 13, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(36, 36, 13, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(37, 37, 7, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(38, 38, 7, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(39, 39, 13, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(40, 40, 13, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(41, 41, 13, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 6, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(56, 56, 8, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(57, 57, 8, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(58, 58, 8, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(59, 59, 8, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(60, 60, 8, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(61, 61, 8, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(62, 62, 8, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(63, 63, 8, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(64, 64, 8, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(65, 65, 8, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 8, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 8, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(68, 68, 4, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 8, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(70, 70, 8, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(71, 71, 4, 0x0020, 0x10, 1, 1),
+	PIN_FIELD_BASE(72, 72, 4, 0x0020, 0x10, 2, 1),
+	PIN_FIELD_BASE(73, 73, 8, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 8, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 4, 0x0020, 0x10, 3, 1),
+	PIN_FIELD_BASE(76, 76, 4, 0x0020, 0x10, 4, 1),
+	PIN_FIELD_BASE(77, 77, 4, 0x0020, 0x10, 5, 1),
+	PIN_FIELD_BASE(78, 78, 4, 0x0020, 0x10, 6, 1),
+	PIN_FIELD_BASE(79, 79, 4, 0x0020, 0x10, 7, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(81, 81, 8, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(82, 82, 8, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(83, 83, 8, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(84, 84, 8, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(85, 85, 8, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(86, 86, 8, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(87, 87, 8, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(88, 88, 6, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(89, 89, 6, 0x0080, 0x10, 28, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(99, 99, 6, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(100, 100, 6, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(101, 101, 6, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(102, 102, 6, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 5, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 5, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(109, 109, 1, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(110, 110, 1, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 1, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 1, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(119, 119, 10, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x0080, 0x10, 28, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x0080, 0x10, 29, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x0080, 0x10, 30, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x0080, 0x10, 31, 1),
+	PIN_FIELD_BASE(126, 126, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(127, 127, 2, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(128, 128, 2, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(129, 129, 6, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(130, 130, 6, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(131, 131, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(132, 132, 6, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(133, 133, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(134, 134, 6, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(137, 137, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(138, 138, 6, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(139, 139, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(140, 140, 6, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 1, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(152, 152, 1, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 1, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(154, 154, 1, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(155, 155, 1, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(156, 156, 2, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(162, 162, 1, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(165, 165, 10, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(166, 166, 10, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 10, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(169, 169, 2, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(170, 170, 2, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(176, 176, 2, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(177, 177, 2, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(178, 178, 2, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(179, 179, 2, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(180, 180, 2, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(181, 181, 2, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(182, 182, 2, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(185, 185, 2, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(186, 186, 11, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(187, 187, 11, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(195, 195, 12, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(197, 197, 12, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(198, 198, 12, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(199, 199, 12, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(200, 200, 12, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(201, 201, 12, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(202, 202, 3, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(203, 203, 3, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(204, 204, 3, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(205, 205, 3, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(206, 206, 3, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(207, 207, 3, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(208, 208, 3, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(209, 209, 3, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(210, 210, 3, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(211, 211, 3, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(212, 212, 3, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(213, 213, 3, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(214, 214, 3, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(215, 215, 3, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(216, 216, 3, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(217, 217, 12, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(218, 218, 12, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(219, 219, 12, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(220, 220, 12, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(221, 221, 13, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(222, 222, 13, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(223, 223, 13, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(224, 224, 13, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(225, 225, 7, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(226, 226, 7, 0x0040, 0x10, 7, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_pupd_range[] = {
+	PIN_FIELD_BASE(16, 16, 13, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(17, 17, 13, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(18, 18, 13, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(44, 44, 9, 0x0030, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 9, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(46, 46, 9, 0x0030, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 9, 0x0030, 0x10, 7, 1),
+	PIN_FIELD_BASE(48, 48, 9, 0x0030, 0x10, 8, 1),
+	PIN_FIELD_BASE(49, 49, 9, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(50, 50, 9, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 51, 9, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(106, 106, 3, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(107, 107, 3, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(108, 108, 3, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(113, 113, 11, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 11, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 11, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(172, 172, 11, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(173, 173, 11, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(174, 174, 11, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(175, 175, 11, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(188, 188, 11, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(189, 189, 11, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(190, 190, 11, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(191, 191, 11, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(192, 192, 11, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(193, 193, 11, 0x0060, 0x10, 12, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_r0_range[] = {
+	PIN_FIELD_BASE(16, 16, 13, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(17, 17, 13, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(18, 18, 13, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(44, 44, 9, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 9, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(46, 46, 9, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 9, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(48, 48, 9, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(49, 49, 9, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(50, 50, 9, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 51, 9, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(106, 106, 3, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(107, 107, 3, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(108, 108, 3, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(113, 113, 11, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 11, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 11, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(172, 172, 11, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(173, 173, 11, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(174, 174, 11, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(175, 175, 11, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(188, 188, 11, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(189, 189, 11, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(190, 190, 11, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(191, 191, 11, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(192, 192, 11, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(193, 193, 11, 0x0080, 0x10, 12, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_r1_range[] = {
+	PIN_FIELD_BASE(16, 16, 13, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(17, 17, 13, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(18, 18, 13, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(44, 44, 9, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 9, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(46, 46, 9, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 9, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(48, 48, 9, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(49, 49, 9, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(50, 50, 9, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 51, 9, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(106, 106, 3, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(107, 107, 3, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(108, 108, 3, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(113, 113, 11, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 11, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 11, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(172, 172, 11, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(173, 173, 11, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(174, 174, 11, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(175, 175, 11, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(188, 188, 11, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(189, 189, 11, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(190, 190, 11, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(191, 191, 11, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(192, 192, 11, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(193, 193, 11, 0x0090, 0x10, 12, 1),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_drv_range[] = {
+	PIN_FIELD_BASE(0, 0, 12, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(1, 1, 12, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(2, 2, 12, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(3, 3, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(4, 4, 2, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(5, 5, 2, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(6, 6, 13, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(7, 7, 13, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(8, 8, 6, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(9, 9, 6, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(10, 10, 2, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(11, 11, 2, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(12, 12, 6, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(13, 13, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(15, 15, 6, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(16, 16, 13, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(17, 17, 13, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(18, 18, 13, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(19, 19, 7, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(20, 20, 6, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(21, 21, 6, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(22, 22, 6, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(23, 23, 13, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(24, 24, 6, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(25, 25, 13, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(26, 26, 13, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(27, 27, 13, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(28, 28, 13, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(29, 29, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(30, 30, 6, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(31, 31, 13, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(32, 32, 13, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(33, 33, 3, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(34, 34, 2, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(35, 35, 13, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(36, 36, 13, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(37, 37, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(38, 38, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(39, 39, 13, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(40, 40, 13, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(41, 41, 13, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(42, 42, 6, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(43, 43, 6, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(44, 44, 9, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(45, 45, 9, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(46, 46, 9, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(47, 47, 9, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(48, 48, 9, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(49, 49, 9, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(50, 50, 9, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(51, 51, 9, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(52, 52, 9, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(53, 53, 9, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(54, 54, 9, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(55, 55, 9, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(56, 56, 8, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(57, 57, 8, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(58, 58, 8, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(59, 59, 8, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(60, 60, 8, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(61, 61, 8, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(62, 62, 8, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(63, 63, 8, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(64, 64, 8, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(65, 65, 8, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(66, 66, 8, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(67, 67, 8, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(68, 68, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(69, 69, 8, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(70, 70, 8, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(71, 71, 4, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(72, 72, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(73, 73, 8, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(74, 74, 8, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(75, 75, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(76, 76, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(77, 77, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(78, 78, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(79, 79, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(80, 80, 8, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(81, 81, 8, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(82, 82, 8, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(83, 83, 8, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(84, 84, 8, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(85, 85, 8, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(86, 86, 8, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(87, 87, 8, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(88, 88, 6, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(89, 89, 6, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(90, 90, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(91, 91, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(92, 92, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(93, 93, 5, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(94, 94, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(95, 95, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(96, 96, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(97, 97, 5, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(98, 98, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(99, 99, 6, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(100, 100, 6, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(101, 101, 6, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(102, 102, 6, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(103, 103, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(104, 104, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(105, 105, 3, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(106, 106, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(107, 107, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(108, 108, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(109, 109, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(110, 110, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(111, 111, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(112, 112, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(113, 113, 11, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(114, 114, 2, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(115, 115, 2, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(116, 116, 2, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(117, 117, 2, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(118, 118, 2, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(119, 119, 10, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(120, 120, 2, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(121, 121, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(122, 122, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 2, 0x0020, 0x10, 24, 3),
+	PIN_FIELD_BASE(124, 124, 2, 0x0020, 0x10, 27, 3),
+	PIN_FIELD_BASE(125, 125, 2, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(126, 126, 2, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(127, 127, 2, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(128, 128, 2, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(129, 129, 6, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(130, 130, 6, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(131, 131, 6, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(132, 132, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(133, 133, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(134, 134, 6, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(135, 135, 7, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(136, 136, 7, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(137, 137, 6, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(138, 138, 6, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(139, 139, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(140, 140, 6, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(141, 141, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(142, 142, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(143, 143, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(144, 144, 1, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(145, 145, 1, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(146, 146, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(147, 147, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(148, 148, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(149, 149, 1, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(150, 150, 1, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(151, 151, 1, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(152, 152, 1, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(153, 153, 1, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(154, 154, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(155, 155, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(156, 156, 2, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(157, 157, 2, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(158, 158, 2, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(159, 159, 2, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(160, 160, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(161, 161, 2, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(162, 162, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(163, 163, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(164, 164, 1, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(165, 165, 10, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(166, 166, 10, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(167, 167, 10, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(168, 168, 11, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(169, 169, 2, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(170, 170, 2, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(171, 171, 11, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(172, 172, 11, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(173, 173, 11, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(174, 174, 11, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(175, 175, 11, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(176, 176, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(177, 177, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(178, 178, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(179, 179, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(180, 180, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(181, 181, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(182, 182, 2, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(183, 183, 2, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(184, 184, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(185, 185, 2, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(186, 186, 11, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(187, 187, 11, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(188, 188, 11, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(189, 189, 11, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(190, 190, 11, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(191, 191, 11, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(192, 192, 11, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(193, 193, 11, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(194, 194, 13, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(195, 195, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(196, 196, 13, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(197, 197, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(198, 198, 12, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(199, 199, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(200, 200, 12, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 12, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(202, 202, 3, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(203, 203, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(204, 204, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(205, 205, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(206, 206, 3, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(207, 207, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(208, 208, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(209, 209, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(210, 210, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(211, 211, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(212, 212, 3, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(213, 213, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(214, 214, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(215, 215, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(216, 216, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(217, 217, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(218, 218, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(219, 219, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(220, 220, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(221, 221, 13, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(222, 222, 13, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(223, 223, 13, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(224, 224, 13, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(225, 225, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(226, 226, 7, 0x0000, 0x10, 12, 3),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_adv_range[] = {
+	PIN_FIELD_BASE(6, 6, 13, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(7, 7, 13, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(8, 8, 6, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(9, 9, 6, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(29, 29, 6, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(30, 30, 6, 0x0030, 0x10, 21, 3),
+	PIN_FIELD_BASE(31, 31, 13, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(32, 32, 13, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(33, 33, 3, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(34, 34, 2, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 13, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(36, 36, 13, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(37, 37, 7, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(38, 38, 7, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(111, 111, 1, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(112, 112, 1, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(129, 129, 6, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(130, 130, 6, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(131, 131, 6, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(132, 132, 6, 0x0030, 0x10, 27, 3),
+	PIN_FIELD_BASE(133, 133, 6, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(134, 134, 6, 0x0030, 0x10, 24, 3),
+	PIN_FIELD_BASE(137, 137, 6, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(138, 138, 6, 0x0030, 0x10, 18, 3),
+	PIN_FIELD_BASE(139, 139, 6, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(140, 140, 6, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(145, 145, 1, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(150, 150, 1, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(152, 152, 1, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(200, 200, 12, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 12, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(225, 225, 7, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(226, 226, 7, 0x0010, 0x10, 9, 3),
+};
+
+static const struct mtk_pin_field_calc mt6895_pin_rsel_range[] = {
+	PIN_FIELD_BASE(6, 6, 13, 0x00d0, 0x10, 0, 3),
+	PIN_FIELD_BASE(7, 7, 13, 0x00d0, 0x10, 12, 3),
+	PIN_FIELD_BASE(8, 8, 6, 0x00c0, 0x10, 0, 3),
+	PIN_FIELD_BASE(9, 9, 6, 0x00c0, 0x10, 6, 3),
+	PIN_FIELD_BASE(29, 29, 6, 0x00b0, 0x10, 6, 3),
+	PIN_FIELD_BASE(30, 30, 6, 0x00b0, 0x10, 21, 3),
+	PIN_FIELD_BASE(31, 31, 13, 0x00d0, 0x10, 3, 3),
+	PIN_FIELD_BASE(32, 32, 13, 0x00d0, 0x10, 15, 3),
+	PIN_FIELD_BASE(33, 33, 3, 0x00a0, 0x10, 0, 3),
+	PIN_FIELD_BASE(34, 34, 2, 0x00f0, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 13, 0x00d0, 0x10, 6, 3),
+	PIN_FIELD_BASE(36, 36, 13, 0x00d0, 0x10, 9, 3),
+	PIN_FIELD_BASE(37, 37, 7, 0x0070, 0x10, 0, 3),
+	PIN_FIELD_BASE(38, 38, 7, 0x0070, 0x10, 6, 3),
+	PIN_FIELD_BASE(111, 111, 1, 0x0090, 0x10, 12, 3),
+	PIN_FIELD_BASE(112, 112, 1, 0x0090, 0x10, 9, 3),
+	PIN_FIELD_BASE(129, 129, 6, 0x00c0, 0x10, 3, 3),
+	PIN_FIELD_BASE(130, 130, 6, 0x00c0, 0x10, 9, 3),
+	PIN_FIELD_BASE(131, 131, 6, 0x00b0, 0x10, 12, 3),
+	PIN_FIELD_BASE(132, 132, 6, 0x00b0, 0x10, 27, 3),
+	PIN_FIELD_BASE(133, 133, 6, 0x00b0, 0x10, 9, 3),
+	PIN_FIELD_BASE(134, 134, 6, 0x00b0, 0x10, 24, 3),
+	PIN_FIELD_BASE(137, 137, 6, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(138, 138, 6, 0x00b0, 0x10, 18, 3),
+	PIN_FIELD_BASE(139, 139, 6, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(140, 140, 6, 0x00b0, 0x10, 15, 3),
+	PIN_FIELD_BASE(145, 145, 1, 0x0090, 0x10, 6, 3),
+	PIN_FIELD_BASE(150, 150, 1, 0x0090, 0x10, 0, 3),
+	PIN_FIELD_BASE(152, 152, 1, 0x0090, 0x10, 3, 3),
+	PIN_FIELD_BASE(200, 200, 12, 0x0090, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 12, 0x0090, 0x10, 3, 3),
+	PIN_FIELD_BASE(225, 225, 7, 0x0070, 0x10, 3, 3),
+	PIN_FIELD_BASE(226, 226, 7, 0x0070, 0x10, 9, 3),
+};
+
+static const unsigned int mt6895_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE, /* 0 */
+	MTK_PULL_PU_PD_TYPE, /* 1 */
+	MTK_PULL_PU_PD_TYPE, /* 2 */
+	MTK_PULL_PU_PD_TYPE, /* 3 */
+	MTK_PULL_PU_PD_TYPE, /* 4 */
+	MTK_PULL_PU_PD_TYPE, /* 5 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 6 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 7 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 8 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 9 */
+	MTK_PULL_PU_PD_TYPE, /* 10 */
+	MTK_PULL_PU_PD_TYPE, /* 11 */
+	MTK_PULL_PU_PD_TYPE, /* 12 */
+	MTK_PULL_PU_PD_TYPE, /* 13 */
+	MTK_PULL_PU_PD_TYPE, /* 14 */
+	MTK_PULL_PU_PD_TYPE, /* 15 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 16 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 17 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 18 */
+	MTK_PULL_PU_PD_TYPE, /* 19 */
+	MTK_PULL_PU_PD_TYPE, /* 20 */
+	MTK_PULL_PU_PD_TYPE, /* 21 */
+	MTK_PULL_PU_PD_TYPE, /* 22 */
+	MTK_PULL_PU_PD_TYPE, /* 23 */
+	MTK_PULL_PU_PD_TYPE, /* 24 */
+	MTK_PULL_PU_PD_TYPE, /* 25 */
+	MTK_PULL_PU_PD_TYPE, /* 26 */
+	MTK_PULL_PU_PD_TYPE, /* 27 */
+	MTK_PULL_PU_PD_TYPE, /* 28 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 29 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 30 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 31 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 32 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 33 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 34 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 35 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 36 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 37 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 38 */
+	MTK_PULL_PU_PD_TYPE, /* 39 */
+	MTK_PULL_PU_PD_TYPE, /* 40 */
+	MTK_PULL_PU_PD_TYPE, /* 41 */
+	MTK_PULL_PU_PD_TYPE, /* 42 */
+	MTK_PULL_PU_PD_TYPE, /* 43 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 44 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 45 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 46 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 47 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 48 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 49 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 50 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 51 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 52 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 53 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 54 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 55 */
+	MTK_PULL_PU_PD_TYPE, /* 56 */
+	MTK_PULL_PU_PD_TYPE, /* 57 */
+	MTK_PULL_PU_PD_TYPE, /* 58 */
+	MTK_PULL_PU_PD_TYPE, /* 59 */
+	MTK_PULL_PU_PD_TYPE, /* 60 */
+	MTK_PULL_PU_PD_TYPE, /* 61 */
+	MTK_PULL_PU_PD_TYPE, /* 62 */
+	MTK_PULL_PU_PD_TYPE, /* 63 */
+	MTK_PULL_PU_PD_TYPE, /* 64 */
+	MTK_PULL_PU_PD_TYPE, /* 65 */
+	MTK_PULL_PU_PD_TYPE, /* 66 */
+	MTK_PULL_PU_PD_TYPE, /* 67 */
+	MTK_PULL_PU_PD_TYPE, /* 68 */
+	MTK_PULL_PU_PD_TYPE, /* 69 */
+	MTK_PULL_PU_PD_TYPE, /* 70 */
+	MTK_PULL_PU_PD_TYPE, /* 71 */
+	MTK_PULL_PU_PD_TYPE, /* 72 */
+	MTK_PULL_PU_PD_TYPE, /* 73 */
+	MTK_PULL_PU_PD_TYPE, /* 74 */
+	MTK_PULL_PU_PD_TYPE, /* 75 */
+	MTK_PULL_PU_PD_TYPE, /* 76 */
+	MTK_PULL_PU_PD_TYPE, /* 77 */
+	MTK_PULL_PU_PD_TYPE, /* 78 */
+	MTK_PULL_PU_PD_TYPE, /* 79 */
+	MTK_PULL_PU_PD_TYPE, /* 80 */
+	MTK_PULL_PU_PD_TYPE, /* 81 */
+	MTK_PULL_PU_PD_TYPE, /* 82 */
+	MTK_PULL_PU_PD_TYPE, /* 83 */
+	MTK_PULL_PU_PD_TYPE, /* 84 */
+	MTK_PULL_PU_PD_TYPE, /* 85 */
+	MTK_PULL_PU_PD_TYPE, /* 86 */
+	MTK_PULL_PU_PD_TYPE, /* 87 */
+	MTK_PULL_PU_PD_TYPE, /* 88 */
+	MTK_PULL_PU_PD_TYPE, /* 89 */
+	MTK_PULL_PU_PD_TYPE, /* 90 */
+	MTK_PULL_PU_PD_TYPE, /* 91 */
+	MTK_PULL_PU_PD_TYPE, /* 92 */
+	MTK_PULL_PU_PD_TYPE, /* 93 */
+	MTK_PULL_PU_PD_TYPE, /* 94 */
+	MTK_PULL_PU_PD_TYPE, /* 95 */
+	MTK_PULL_PU_PD_TYPE, /* 96 */
+	MTK_PULL_PU_PD_TYPE, /* 97 */
+	MTK_PULL_PU_PD_TYPE, /* 98 */
+	MTK_PULL_PU_PD_TYPE, /* 99 */
+	MTK_PULL_PU_PD_TYPE, /* 100 */
+	MTK_PULL_PU_PD_TYPE, /* 101 */
+	MTK_PULL_PU_PD_TYPE, /* 102 */
+	MTK_PULL_PU_PD_TYPE, /* 103 */
+	MTK_PULL_PU_PD_TYPE, /* 104 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 105 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 106 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 107 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 108 */
+	MTK_PULL_PU_PD_TYPE, /* 109 */
+	MTK_PULL_PU_PD_TYPE, /* 110 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 111 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 112 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 113 */
+	MTK_PULL_PU_PD_TYPE, /* 114 */
+	MTK_PULL_PU_PD_TYPE, /* 115 */
+	MTK_PULL_PU_PD_TYPE, /* 116 */
+	MTK_PULL_PU_PD_TYPE, /* 117 */
+	MTK_PULL_PU_PD_TYPE, /* 118 */
+	MTK_PULL_PU_PD_TYPE, /* 119 */
+	MTK_PULL_PU_PD_TYPE, /* 120 */
+	MTK_PULL_PU_PD_TYPE, /* 121 */
+	MTK_PULL_PU_PD_TYPE, /* 122 */
+	MTK_PULL_PU_PD_TYPE, /* 123 */
+	MTK_PULL_PU_PD_TYPE, /* 124 */
+	MTK_PULL_PU_PD_TYPE, /* 125 */
+	MTK_PULL_PU_PD_TYPE, /* 126 */
+	MTK_PULL_PU_PD_TYPE, /* 127 */
+	MTK_PULL_PU_PD_TYPE, /* 128 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 129 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 130 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 131 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 132 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 133 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 134 */
+	MTK_PULL_PU_PD_TYPE, /* 135 */
+	MTK_PULL_PU_PD_TYPE, /* 136 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 137 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 138 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 139 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 140 */
+	MTK_PULL_PU_PD_TYPE, /* 141 */
+	MTK_PULL_PU_PD_TYPE, /* 142 */
+	MTK_PULL_PU_PD_TYPE, /* 143 */
+	MTK_PULL_PU_PD_TYPE, /* 144 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 145 */
+	MTK_PULL_PU_PD_TYPE, /* 146 */
+	MTK_PULL_PU_PD_TYPE, /* 147 */
+	MTK_PULL_PU_PD_TYPE, /* 148 */
+	MTK_PULL_PU_PD_TYPE, /* 149 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 150 */
+	MTK_PULL_PU_PD_TYPE, /* 151 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 152 */
+	MTK_PULL_PU_PD_TYPE, /* 153 */
+	MTK_PULL_PU_PD_TYPE, /* 154 */
+	MTK_PULL_PU_PD_TYPE, /* 155 */
+	MTK_PULL_PU_PD_TYPE, /* 156 */
+	MTK_PULL_PU_PD_TYPE, /* 157 */
+	MTK_PULL_PU_PD_TYPE, /* 158 */
+	MTK_PULL_PU_PD_TYPE, /* 159 */
+	MTK_PULL_PU_PD_TYPE, /* 160 */
+	MTK_PULL_PU_PD_TYPE, /* 161 */
+	MTK_PULL_PU_PD_TYPE, /* 162 */
+	MTK_PULL_PU_PD_TYPE, /* 163 */
+	MTK_PULL_PU_PD_TYPE, /* 164 */
+	MTK_PULL_PU_PD_TYPE, /* 165 */
+	MTK_PULL_PU_PD_TYPE, /* 166 */
+	MTK_PULL_PU_PD_TYPE, /* 167 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 168 */
+	MTK_PULL_PU_PD_TYPE, /* 169 */
+	MTK_PULL_PU_PD_TYPE, /* 170 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 171 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 172 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 173 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 174 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 175 */
+	MTK_PULL_PU_PD_TYPE, /* 176 */
+	MTK_PULL_PU_PD_TYPE, /* 177 */
+	MTK_PULL_PU_PD_TYPE, /* 178 */
+	MTK_PULL_PU_PD_TYPE, /* 179 */
+	MTK_PULL_PU_PD_TYPE, /* 180 */
+	MTK_PULL_PU_PD_TYPE, /* 181 */
+	MTK_PULL_PU_PD_TYPE, /* 182 */
+	MTK_PULL_PU_PD_TYPE, /* 183 */
+	MTK_PULL_PU_PD_TYPE, /* 184 */
+	MTK_PULL_PU_PD_TYPE, /* 185 */
+	MTK_PULL_PU_PD_TYPE, /* 186 */
+	MTK_PULL_PU_PD_TYPE, /* 187 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 188 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 189 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 190 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 191 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 192 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 193 */
+	MTK_PULL_PU_PD_TYPE, /* 194 */
+	MTK_PULL_PU_PD_TYPE, /* 195 */
+	MTK_PULL_PU_PD_TYPE, /* 196 */
+	MTK_PULL_PU_PD_TYPE, /* 197 */
+	MTK_PULL_PU_PD_TYPE, /* 198 */
+	MTK_PULL_PU_PD_TYPE, /* 199 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 200 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 201 */
+	MTK_PULL_PU_PD_TYPE, /* 202 */
+	MTK_PULL_PU_PD_TYPE, /* 203 */
+	MTK_PULL_PU_PD_TYPE, /* 204 */
+	MTK_PULL_PU_PD_TYPE, /* 205 */
+	MTK_PULL_PU_PD_TYPE, /* 206 */
+	MTK_PULL_PU_PD_TYPE, /* 207 */
+	MTK_PULL_PU_PD_TYPE, /* 208 */
+	MTK_PULL_PU_PD_TYPE, /* 209 */
+	MTK_PULL_PU_PD_TYPE, /* 210 */
+	MTK_PULL_PU_PD_TYPE, /* 211 */
+	MTK_PULL_PU_PD_TYPE, /* 212 */
+	MTK_PULL_PU_PD_TYPE, /* 213 */
+	MTK_PULL_PU_PD_TYPE, /* 214 */
+	MTK_PULL_PU_PD_TYPE, /* 215 */
+	MTK_PULL_PU_PD_TYPE, /* 216 */
+	MTK_PULL_PU_PD_TYPE, /* 217 */
+	MTK_PULL_PU_PD_TYPE, /* 218 */
+	MTK_PULL_PU_PD_TYPE, /* 219 */
+	MTK_PULL_PU_PD_TYPE, /* 220 */
+	MTK_PULL_PU_PD_TYPE, /* 221 */
+	MTK_PULL_PU_PD_TYPE, /* 222 */
+	MTK_PULL_PU_PD_TYPE, /* 223 */
+	MTK_PULL_PU_PD_TYPE, /* 224 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 225 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 226 */
+};
+
+static const char *const mt6895_pinctrl_register_base_names[] = {
+	"base", "rm", "rt", "rmm", "bl", "bm", "br",
+	"brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+};
+
+static const struct mtk_eint_hw mt6895_eint_hw = {
+	.port_mask = 0xf,
+	.ports     = 3,
+	.ap_num    = 247,
+	.db_cnt    = 32,
+	.db_time   = debounce_time_mt6878,
+};
+
+static const struct mtk_pin_reg_calc mt6895_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6895_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6895_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6895_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6895_pin_do_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6895_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6895_pin_ies_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6895_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6895_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6895_pin_drv_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6895_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6895_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6895_pin_r1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6895_pin_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6895_pin_rsel_range),
+};
+
+static const struct mtk_pin_soc mt6895_data = {
+	.reg_cal = mt6895_reg_cals,
+	.pins = mtk_pins_mt6895,
+	.npins = ARRAY_SIZE(mtk_pins_mt6895),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt6895),
+	.eint_hw = &mt6895_eint_hw,
+	.eint_pin = eint_pins_mt6895,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt6895_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt6895_pinctrl_register_base_names),
+	.pull_type = mt6895_pull_type,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+};
+
+static const struct of_device_id mt6895_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt6895-pinctrl", .data = &mt6895_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt6895_pinctrl_of_match);
+
+static struct platform_driver mt6895_pinctrl_driver = {
+	.driver = {
+		.name = "mt6895-pinctrl",
+		.of_match_table = mt6895_pinctrl_of_match,
+		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
+	},
+	.probe = mtk_paris_pinctrl_probe,
+};
+
+static int __init mt6895_pinctrl_init(void)
+{
+	return platform_driver_register(&mt6895_pinctrl_driver);
+}
+
+arch_initcall(mt6895_pinctrl_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek MT6895 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h
new file mode 100644
index 000000000000..efaf5f801f58
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h
@@ -0,0 +1,2717 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ *
+ * Author: Light Hsieh <light.hsieh@mediatek.com>
+ */
+
+#ifndef __PINCTRL_MTK_MT6895_H
+#define __PINCTRL_MTK_MT6895_H
+
+#include "pinctrl-paris.h"
+
+#define EINT_INVALID_BASE 0xff
+
+#define MTK_PIN_VEINT(_number)			\
+	MTK_PIN(				\
+		_number, "veint" #_number,	\
+		MTK_EINT_FUNCTION(0, _number),	\
+		DRV_GRP4,			\
+		MTK_FUNCTION(0, NULL)		\
+	)
+
+static const struct mtk_pin_desc mtk_pins_mt6895[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(3, "VOW_CLK_MISO"),
+		MTK_FUNCTION(5, "SRCLKENAI1"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO"),
+		MTK_FUNCTION(7, "MD_INT1_C2K_UIM0_HOT_PLUG")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(3, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(5, "SRCLKENAI0"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO"),
+		MTK_FUNCTION(7, "MD_INT2_C2K_UIM1_HOT_PLUG")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "PWM_VLP"),
+		MTK_FUNCTION(3, "AGPS_SYNC"),
+		MTK_FUNCTION(4, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "I2S1_MCK"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO"),
+		MTK_FUNCTION(7, "DVFSRC_EXT_REQ")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "PWM_VLP"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_CS"),
+		MTK_FUNCTION(4, "TP_GPIO3_AO"),
+		MTK_FUNCTION(5, "KPCOL2"),
+		MTK_FUNCTION(6, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(7, "TP_UCTS2_VLP")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI7_A_MI"),
+		MTK_FUNCTION(2, "ANT_SEL16"),
+		MTK_FUNCTION(3, "PTA_EXT_FREQ"),
+		MTK_FUNCTION(4, "UTXD2"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI7_A_CSB"),
+		MTK_FUNCTION(2, "ANT_SEL17"),
+		MTK_FUNCTION(3, "PTA_EXT_ACT"),
+		MTK_FUNCTION(4, "URXD2"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SCL0"),
+		MTK_FUNCTION(2, "IDDIG_1P"),
+		MTK_FUNCTION(3, "SPI4_B_CLK")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "SDA0"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "SPI4_B_CSB")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "SCL1"),
+		MTK_FUNCTION(3, "SCP_SCL5"),
+		MTK_FUNCTION(4, "CONN_BGF_UART0_RXD")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "SDA1"),
+		MTK_FUNCTION(3, "SCP_SDA5"),
+		MTK_FUNCTION(4, "CONN_BGF_UART0_TXD")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "DMIC1_CLK"),
+		MTK_FUNCTION(2, "AGPS_SYNC"),
+		MTK_FUNCTION(3, "ANT_SEL3"),
+		MTK_FUNCTION(4, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(5, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(6, "IDDIG"),
+		MTK_FUNCTION(7, "GPS_L1_ELNA_EN")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "DMIC1_DAT"),
+		MTK_FUNCTION(3, "ANT_SEL4"),
+		MTK_FUNCTION(4, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(5, "AGPS_SYNC"),
+		MTK_FUNCTION(6, "USB_DRVVBUS"),
+		MTK_FUNCTION(7, "GPS_L5_ELNA_EN")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "KPROW2"),
+		MTK_FUNCTION(3, "TP_GPIO4_AO"),
+		MTK_FUNCTION(4, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(5, "SCP_SCL5"),
+		MTK_FUNCTION(6, "DP_TX_HPD")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "MD_INT4"),
+		MTK_FUNCTION(3, "TP_GPIO5_AO"),
+		MTK_FUNCTION(4, "TP_URXD1_VLP"),
+		MTK_FUNCTION(5, "SCP_SDA5"),
+		MTK_FUNCTION(6, "DP_OC_EN")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "MD_INT3"),
+		MTK_FUNCTION(3, "TP_GPIO6_AO"),
+		MTK_FUNCTION(4, "TP_URTS1_VLP"),
+		MTK_FUNCTION(5, "SCP_SCL6"),
+		MTK_FUNCTION(6, "DP_RAUX_SBU1")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "MD_INT0"),
+		MTK_FUNCTION(3, "TP_GPIO7_AO"),
+		MTK_FUNCTION(4, "TP_UCTS1_VLP"),
+		MTK_FUNCTION(5, "SCP_SDA6"),
+		MTK_FUNCTION(6, "DP_RAUX_SBU2")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(3, "TP_GPIO8_AO"),
+		MTK_FUNCTION(4, "TP_UTXD2_VLP"),
+		MTK_FUNCTION(6, "GPS_L1_ELNA_EN")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(3, "TP_GPIO9_AO"),
+		MTK_FUNCTION(4, "TP_URXD2_VLP"),
+		MTK_FUNCTION(6, "GPS_L5_ELNA_EN")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "KPCOL2"),
+		MTK_FUNCTION(2, "SRCLKENAI0"),
+		MTK_FUNCTION(3, "TP_GPIO10_AO"),
+		MTK_FUNCTION(4, "TP_URTS2_VLP"),
+		MTK_FUNCTION(5, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(6, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "MBISTREADEN_TRIGGER")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_CK"),
+		MTK_FUNCTION(4, "ANT_SEL15"),
+		MTK_FUNCTION(6, "GPS_L1_ELNA_EN")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "I2S3_MCK"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "SPI5_B_MO"),
+		MTK_FUNCTION(4, "GPS_PPS"),
+		MTK_FUNCTION(5, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(6, "I2S0_MCK"),
+		MTK_FUNCTION(7, "IDDIG_1P")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "I2S3_BCK"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "SPI5_B_MI"),
+		MTK_FUNCTION(4, "PCM0_CLK"),
+		MTK_FUNCTION(5, "PCM1_CLK"),
+		MTK_FUNCTION(6, "I2S0_BCK"),
+		MTK_FUNCTION(7, "IDDIG")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "I2S3_LRCK"),
+		MTK_FUNCTION(3, "SPI5_B_CSB"),
+		MTK_FUNCTION(4, "PCM0_SYNC"),
+		MTK_FUNCTION(5, "PCM1_SYNC"),
+		MTK_FUNCTION(6, "I2S0_LRCK")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "ANT_SEL14"),
+		MTK_FUNCTION(4, "PCM0_DI"),
+		MTK_FUNCTION(5, "PCM1_DI"),
+		MTK_FUNCTION(6, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(7, "UDI_TDO_0")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "I2S3_DO"),
+		MTK_FUNCTION(3, "SPI5_B_CLK"),
+		MTK_FUNCTION(4, "PCM0_DO"),
+		MTK_FUNCTION(5, "PCM1_DO0"),
+		MTK_FUNCTION(6, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(7, "UDI_TDI_0")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "SPI1_A_CLK"),
+		MTK_FUNCTION(3, "IDDIG_1P"),
+		MTK_FUNCTION(4, "DP_TX_HPD"),
+		MTK_FUNCTION(7, "DMIC1_CLK")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "SPI1_A_CSB"),
+		MTK_FUNCTION(3, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(4, "DP_OC_EN"),
+		MTK_FUNCTION(7, "DMIC1_DAT")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "SPI1_A_MI"),
+		MTK_FUNCTION(3, "VBUSVALID_1P"),
+		MTK_FUNCTION(4, "DP_RAUX_SBU1")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "SPI1_A_MO"),
+		MTK_FUNCTION(2, "VBUSVALID"),
+		MTK_FUNCTION(3, "PWM_0"),
+		MTK_FUNCTION(4, "DP_RAUX_SBU2")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "SCL7"),
+		MTK_FUNCTION(2, "SCP_SCL4")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "SDA7"),
+		MTK_FUNCTION(2, "SCP_SDA4"),
+		MTK_FUNCTION(3, "ANT_SEL19")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "SCL6"),
+		MTK_FUNCTION(3, "SPI4_B_MI")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "SDA6"),
+		MTK_FUNCTION(3, "SPI4_B_MO")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "SCL5"),
+		MTK_FUNCTION(2, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(3, "GPS_L1_ELNA_EN")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "SDA5"),
+		MTK_FUNCTION(2, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(3, "GPS_L5_ELNA_EN")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "SCP_SCL0")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "SCP_SDA0")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "SCP_SCL2"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_MI")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "SCP_SDA2"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_MO")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(4, "ANT_SEL16"),
+		MTK_FUNCTION(5, "GPS_PPS"),
+		MTK_FUNCTION(7, "UDI_NTRST")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(7, "UDI_TMS")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "LCM_RST"),
+		MTK_FUNCTION(7, "UDI_TCK")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(2, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(3, "TP_GPIO0_AO"),
+		MTK_FUNCTION(4, "PTA_RXD"),
+		MTK_FUNCTION(6, "SRCLKENAI0")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(2, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(3, "TP_GPIO1_AO"),
+		MTK_FUNCTION(4, "PTA_TXD"),
+		MTK_FUNCTION(5, "CLKM2"),
+		MTK_FUNCTION(6, "SRCLKENAI1")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDI"),
+		MTK_FUNCTION(5, "CCU0_JTAG_TDI"),
+		MTK_FUNCTION(6, "LVTS_SCK"),
+		MTK_FUNCTION(7, "CONN_BGF_DSP_L5_JDI")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TMS"),
+		MTK_FUNCTION(5, "CCU0_JTAG_TMS"),
+		MTK_FUNCTION(6, "LVTS_SDI"),
+		MTK_FUNCTION(7, "CONN_BGF_DSP_L5_JMS")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDO"),
+		MTK_FUNCTION(5, "CCU0_JTAG_TDO"),
+		MTK_FUNCTION(6, "LVTS_SCF"),
+		MTK_FUNCTION(7, "CONN_BGF_DSP_L5_JDO")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "CCU0_JTAG_TRST"),
+		MTK_FUNCTION(6, "LVTS_FOUT"),
+		MTK_FUNCTION(7, "CONN_BGF_DSP_L5_JINTP")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TCK"),
+		MTK_FUNCTION(5, "CCU0_JTAG_TCK"),
+		MTK_FUNCTION(6, "LVTS_SDO"),
+		MTK_FUNCTION(7, "CONN_BGF_DSP_L5_JCK")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(6, "LVTS_26M")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(4, "UDI_TCK"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JCK"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "JTCK_SEL3")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(4, "UDI_TMS"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JMS"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "JTMS_SEL3")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(3, "TP_GPIO2_AO"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JINTP")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(4, "UDI_TDI_0"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JDI"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "JTDI_SEL3")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(4, "UDI_NTRST"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "JTRSTN_SEL3")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(4, "UDI_TDO_0"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JDO"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "JTDO_SEL3")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "MD_UCNT_A_TGL")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "DIGRF_IRQ")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "BPI_BUS0"),
+		MTK_FUNCTION(4, "ANT_SEL0"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "BPI_BUS1"),
+		MTK_FUNCTION(4, "ANT_SEL1"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "BPI_BUS2"),
+		MTK_FUNCTION(4, "ANT_SEL2"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "BPI_BUS3"),
+		MTK_FUNCTION(4, "ANT_SEL3"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "BPI_BUS4"),
+		MTK_FUNCTION(4, "ANT_SEL4"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "BPI_BUS5"),
+		MTK_FUNCTION(4, "ANT_SEL5"),
+		MTK_FUNCTION(6, "SSPM_URXD_AO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "BPI_BUS6"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS6"),
+		MTK_FUNCTION(4, "ANT_SEL6"),
+		MTK_FUNCTION(6, "SSPM_UTXD_AO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "BPI_BUS7"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS7"),
+		MTK_FUNCTION(4, "ANT_SEL7"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "BPI_BUS8"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS8"),
+		MTK_FUNCTION(4, "ANT_SEL8"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "BPI_BUS9"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS9"),
+		MTK_FUNCTION(4, "ANT_SEL9"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "BPI_BUS10"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS10"),
+		MTK_FUNCTION(4, "ANT_SEL10"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "BPI_BUS11_OLAT0"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS11_OLAT0"),
+		MTK_FUNCTION(4, "ANT_SEL11"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "BPI_BUS12_OLAT1"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS12_OLAT1"),
+		MTK_FUNCTION(4, "ANT_SEL12"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TMS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "BPI_BUS13_OLAT2"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS13_OLAT2"),
+		MTK_FUNCTION(4, "ANT_SEL13"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TCK_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "BPI_BUS14_OLAT3"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS14_OLAT3"),
+		MTK_FUNCTION(4, "ANT_SEL14"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "BPI_BUS15_OLAT4"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS15_OLAT4"),
+		MTK_FUNCTION(3, "MIPI4_D_SCLK"),
+		MTK_FUNCTION(4, "ANT_SEL15"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "BPI_BUS16_OLAT5"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS16_OLAT5"),
+		MTK_FUNCTION(3, "MIPI4_D_SDATA"),
+		MTK_FUNCTION(4, "ANT_SEL16"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "BPI_BUS17_ANT0"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS17_ANT0"),
+		MTK_FUNCTION(4, "ANT_SEL17"),
+		MTK_FUNCTION(6, "TP_UTXD1_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "BPI_BUS18_ANT1"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS20_ANT3"),
+		MTK_FUNCTION(3, "BPI_BUS20_ANT3"),
+		MTK_FUNCTION(4, "ANT_SEL20"),
+		MTK_FUNCTION(5, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(6, "TP_URXD1_VCORE")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "BPI_BUS19_ANT2"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS21_ANT4"),
+		MTK_FUNCTION(3, "BPI_BUS21_ANT4"),
+		MTK_FUNCTION(4, "ANT_SEL21"),
+		MTK_FUNCTION(5, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(6, "TP_URTS1_VCORE")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "MIPI3_D_SCLK"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS18_ANT1"),
+		MTK_FUNCTION(3, "BPI_BUS20_ANT3"),
+		MTK_FUNCTION(4, "ANT_SEL18"),
+		MTK_FUNCTION(6, "TP_UCTS1_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "MIPI3_D_SDATA"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS19_ANT2"),
+		MTK_FUNCTION(3, "BPI_BUS21_ANT4"),
+		MTK_FUNCTION(4, "ANT_SEL19"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "MIPI2_D_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "MIPI2_D_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "MIPI_M_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "MIPI_M_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "MIPI1_D_SCLK"),
+		MTK_FUNCTION(2, "CONN_MIPI1_SCLK"),
+		MTK_FUNCTION(7, "TP_UTXD2_VCORE")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "MIPI1_D_SDATA"),
+		MTK_FUNCTION(2, "CONN_MIPI1_SDATA"),
+		MTK_FUNCTION(7, "TP_URXD2_VCORE")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "MIPI0_D_SCLK"),
+		MTK_FUNCTION(2, "CONN_MIPI0_SCLK"),
+		MTK_FUNCTION(3, "BPI_BUS20_ANT3"),
+		MTK_FUNCTION(7, "TP_URTS2_VCORE")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "MIPI0_D_SDATA"),
+		MTK_FUNCTION(2, "CONN_MIPI0_SDATA"),
+		MTK_FUNCTION(3, "BPI_BUS21_ANT4"),
+		MTK_FUNCTION(7, "TP_UCTS2_VCORE")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "MD_URXD0"),
+		MTK_FUNCTION(3, "MD_URXD1"),
+		MTK_FUNCTION(4, "SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_RXD"),
+		MTK_FUNCTION(6, "ANT_SEL19")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "MD_UTXD0"),
+		MTK_FUNCTION(3, "MD_UTXD1"),
+		MTK_FUNCTION(4, "SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_TXD"),
+		MTK_FUNCTION(6, "WIFI_TXD"),
+		MTK_FUNCTION(7, "CONN_BT_TXD")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "ADSP_URXD0"),
+		MTK_FUNCTION(3, "MD32_0_RXD"),
+		MTK_FUNCTION(4, "MD_URXD0"),
+		MTK_FUNCTION(5, "TP_URXD1_VLP"),
+		MTK_FUNCTION(6, "MD32_2_RXD"),
+		MTK_FUNCTION(7, "MBISTREADEN_TRIGGER")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "ADSP_UTXD0"),
+		MTK_FUNCTION(3, "MD32_0_TXD"),
+		MTK_FUNCTION(4, "MD_UTXD0"),
+		MTK_FUNCTION(5, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(6, "MD32_2_TXD"),
+		MTK_FUNCTION(7, "MBISTWRITEEN_TRIGGER")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "TDMOUT1_LRCK"),
+		MTK_FUNCTION(2, "DP_TX_HPD"),
+		MTK_FUNCTION(4, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TDI_VLP"),
+		MTK_FUNCTION(7, "IO_JTAG_TDI")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "TDMOUT1_BCK"),
+		MTK_FUNCTION(2, "DP_OC_EN"),
+		MTK_FUNCTION(4, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TRSTN_VLP"),
+		MTK_FUNCTION(7, "IO_JTAG_TRSTN")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "TDMOUT1_MCK"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU1"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TCK_VLP"),
+		MTK_FUNCTION(7, "IO_JTAG_TCK")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "TDMOUT1_DATA0"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU2"),
+		MTK_FUNCTION(3, "SCP_SPI1_A_CK"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TDO_VLP"),
+		MTK_FUNCTION(7, "IO_JTAG_TDO")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "TDMOUT1_DATA1"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(3, "SCP_SPI1_A_CS"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "SCP_JTAG0_TMS_VLP"),
+		MTK_FUNCTION(7, "IO_JTAG_TMS")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "TDMOUT1_DATA2"),
+		MTK_FUNCTION(2, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(3, "SCP_SPI1_A_MI"),
+		MTK_FUNCTION(4, "TDMIN1_DATA0"),
+		MTK_FUNCTION(5, "TP_URTS1_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO15_AO"),
+		MTK_FUNCTION(7, "DAP_MD32_SWD")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "TDMOUT1_DATA3"),
+		MTK_FUNCTION(2, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(3, "SCP_SPI1_A_MO"),
+		MTK_FUNCTION(4, "TDMIN1_DATA1"),
+		MTK_FUNCTION(5, "TP_UCTS1_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO14_AO"),
+		MTK_FUNCTION(7, "DAP_MD32_SWCK")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "SPI0_A_MI"),
+		MTK_FUNCTION(2, "KPROW1"),
+		MTK_FUNCTION(3, "TDMIN1_BCK"),
+		MTK_FUNCTION(4, "TP_GPIO10_AO"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "JTDO_SEL1")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "SPI0_A_CSB"),
+		MTK_FUNCTION(2, "KPROW2"),
+		MTK_FUNCTION(3, "TDMIN1_LRCK"),
+		MTK_FUNCTION(4, "TP_GPIO11_AO"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "JTMS_SEL1")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "SPI0_A_MO"),
+		MTK_FUNCTION(2, "KPCOL1"),
+		MTK_FUNCTION(3, "TDMIN1_DATA0"),
+		MTK_FUNCTION(4, "TP_GPIO12_AO"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "JTDI_SEL1")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "SPI0_A_CLK"),
+		MTK_FUNCTION(2, "KPCOL2"),
+		MTK_FUNCTION(3, "TDMIN1_DATA1"),
+		MTK_FUNCTION(4, "TP_GPIO13_AO"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "JTCK_SEL1")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "DMIC_CLK"),
+		MTK_FUNCTION(2, "SPI0_A_WP"),
+		MTK_FUNCTION(3, "TDMIN1_DATA2"),
+		MTK_FUNCTION(4, "TP_GPIO10_AO"),
+		MTK_FUNCTION(5, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "JTRSTN_SEL1")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "DMIC_DAT"),
+		MTK_FUNCTION(2, "SPI0_A_HOLD"),
+		MTK_FUNCTION(3, "TDMIN1_DATA3"),
+		MTK_FUNCTION(4, "TP_GPIO9_AO"),
+		MTK_FUNCTION(5, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(6, "ANT_SEL20"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWD")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "TP_GPIO11_AO"),
+		MTK_FUNCTION(3, "TDMIN1_MCK"),
+		MTK_FUNCTION(4, "TP_GPIO8_AO"),
+		MTK_FUNCTION(5, "SRCLKENAI1"),
+		MTK_FUNCTION(6, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWCK")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "KPROW0")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "KPCOL0")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "TP_GPIO10_AO"),
+		MTK_FUNCTION(3, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(4, "TP_GPIO7_AO"),
+		MTK_FUNCTION(5, "SRCLKENAI0"),
+		MTK_FUNCTION(6, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(7, "MBISTWRITEEN_TRIGGER")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "SPI2_A_MI"),
+		MTK_FUNCTION(2, "SCP_SPI2_A_MI"),
+		MTK_FUNCTION(4, "TP_GPIO6_AO"),
+		MTK_FUNCTION(5, "SCP_SDA6"),
+		MTK_FUNCTION(6, "MD_URXD0")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "SPI2_A_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI2_A_CS"),
+		MTK_FUNCTION(4, "TP_GPIO5_AO"),
+		MTK_FUNCTION(5, "SCP_SCL6"),
+		MTK_FUNCTION(6, "MD_UTXD0")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "SPI2_A_MO"),
+		MTK_FUNCTION(2, "SCP_SPI2_A_MO"),
+		MTK_FUNCTION(3, "PWM_VLP"),
+		MTK_FUNCTION(4, "TP_GPIO4_AO"),
+		MTK_FUNCTION(5, "SCP_SDA5")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "SPI2_A_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI2_A_CK"),
+		MTK_FUNCTION(4, "TP_GPIO3_AO"),
+		MTK_FUNCTION(5, "SCP_SCL5")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "AP_GOOD"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "ANT_SEL19"),
+		MTK_FUNCTION(4, "AGPS_SYNC"),
+		MTK_FUNCTION(5, "GPS_PPS"),
+		MTK_FUNCTION(6, "IDDIG"),
+		MTK_FUNCTION(7, "ANT_SEL4")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "I2S1_MCK"),
+		MTK_FUNCTION(2, "I2S3_MCK"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TRSTN"),
+		MTK_FUNCTION(4, "MFG_UDI_NTRST"),
+		MTK_FUNCTION(5, "HFRP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TRST_B")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "I2S1_BCK"),
+		MTK_FUNCTION(2, "I2S3_BCK"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TMS"),
+		MTK_FUNCTION(4, "MFG_UDI_TMS"),
+		MTK_FUNCTION(5, "HFRP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TMS"),
+		MTK_FUNCTION(7, "PCM1_CLK")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "I2S1_LRCK"),
+		MTK_FUNCTION(2, "I2S3_LRCK"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TCK"),
+		MTK_FUNCTION(4, "MFG_UDI_TCK"),
+		MTK_FUNCTION(5, "HFRP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TCK"),
+		MTK_FUNCTION(7, "PCM1_SYNC")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "I2S2_DI"),
+		MTK_FUNCTION(2, "I2S0_DI"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TDI"),
+		MTK_FUNCTION(4, "MFG_UDI_TDI"),
+		MTK_FUNCTION(5, "HFRP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TDI"),
+		MTK_FUNCTION(7, "PCM1_DI")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "I2S1_DO"),
+		MTK_FUNCTION(2, "I2S3_DO"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TDO"),
+		MTK_FUNCTION(4, "MFG_UDI_TDO"),
+		MTK_FUNCTION(5, "HFRP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TDO"),
+		MTK_FUNCTION(7, "PCM1_DO0")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(5, "ANT_SEL2"),
+		MTK_FUNCTION(6, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(7, "PCM1_DO1")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(4, "PWM_1"),
+		MTK_FUNCTION(5, "ANT_SEL1"),
+		MTK_FUNCTION(6, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(7, "PCM1_DO2")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "UCTS1"),
+		MTK_FUNCTION(3, "HFRP_URTS1"),
+		MTK_FUNCTION(4, "PWM_2"),
+		MTK_FUNCTION(5, "ANT_SEL0"),
+		MTK_FUNCTION(6, "ANT_SEL5")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "URTS1"),
+		MTK_FUNCTION(3, "HFRP_UCTS1"),
+		MTK_FUNCTION(4, "PWM_3"),
+		MTK_FUNCTION(5, "ANT_SEL21"),
+		MTK_FUNCTION(6, "ANT_SEL6")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "SCP_SPI0_A_CK"),
+		MTK_FUNCTION(2, "SPI6_A_CLK"),
+		MTK_FUNCTION(3, "MRG_CLK"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "PWM_0")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "SCP_SPI0_A_CS"),
+		MTK_FUNCTION(2, "SPI6_A_CSB"),
+		MTK_FUNCTION(3, "MRG_SYNC"),
+		MTK_FUNCTION(6, "PWM_1")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "SCP_SPI0_A_MI"),
+		MTK_FUNCTION(2, "SPI6_A_MI"),
+		MTK_FUNCTION(3, "MRG_DI"),
+		MTK_FUNCTION(6, "PWM_2")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "SCP_SPI0_A_MO"),
+		MTK_FUNCTION(2, "SPI6_A_MO"),
+		MTK_FUNCTION(3, "MRG_DO"),
+		MTK_FUNCTION(6, "PWM_3")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "SPI7_A_MO"),
+		MTK_FUNCTION(2, "ANT_SEL18"),
+		MTK_FUNCTION(3, "PTA_EXT_PRI"),
+		MTK_FUNCTION(4, "SDA1"),
+		MTK_FUNCTION(5, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "SPI7_A_CLK"),
+		MTK_FUNCTION(2, "ANT_SEL19"),
+		MTK_FUNCTION(3, "PTA_EXT_WLAN_ACT"),
+		MTK_FUNCTION(4, "SCL1"),
+		MTK_FUNCTION(5, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(2, "ANT_SEL9"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(2, "ANT_SEL10"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "SCL9"),
+		MTK_FUNCTION(2, "UDI_TDO_6"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "SDA9"),
+		MTK_FUNCTION(2, "UDI_TDO_7"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "SCL8"),
+		MTK_FUNCTION(2, "UDI_TDO_4"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "SDA8"),
+		MTK_FUNCTION(2, "UDI_TDO_5")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "SCL0"),
+		MTK_FUNCTION(2, "ANT_SEL20"),
+		MTK_FUNCTION(3, "AGPS_SYNC"),
+		MTK_FUNCTION(4, "SCL7"),
+		MTK_FUNCTION(5, "I2S2_DI2"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "SDA0"),
+		MTK_FUNCTION(2, "ANT_SEL21"),
+		MTK_FUNCTION(4, "SDA7"),
+		MTK_FUNCTION(5, "I2S5_DO"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "SCL4"),
+		MTK_FUNCTION(2, "UDI_TDO_2"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "SDA4"),
+		MTK_FUNCTION(2, "UDI_TDO_3"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "SCL2"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "SDA2"),
+		MTK_FUNCTION(2, "UDI_TDO_1"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "CMVREF6"),
+		MTK_FUNCTION(2, "SPI3_B_CLK"),
+		MTK_FUNCTION(3, "DMIC1_CLK"),
+		MTK_FUNCTION(4, "ANT_SEL16"),
+		MTK_FUNCTION(5, "APU_JTAG_TDI"),
+		MTK_FUNCTION(6, "IDDIG"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "CMVREF5"),
+		MTK_FUNCTION(2, "SPI3_B_CSB"),
+		MTK_FUNCTION(3, "DMIC1_DAT"),
+		MTK_FUNCTION(4, "ANT_SEL17"),
+		MTK_FUNCTION(5, "APU_JTAG_TMS"),
+		MTK_FUNCTION(6, "USB_DRVVBUS"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "CMVREF6"),
+		MTK_FUNCTION(2, "SPI3_B_MI"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "ANT_SEL18"),
+		MTK_FUNCTION(5, "APU_JTAG_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "CMVREF4"),
+		MTK_FUNCTION(2, "SPI3_B_MO"),
+		MTK_FUNCTION(3, "PMSR_SMAP"),
+		MTK_FUNCTION(4, "ANT_SEL19"),
+		MTK_FUNCTION(5, "APU_JTAG_TRST"),
+		MTK_FUNCTION(6, "AGPS_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "CMMCLK6"),
+		MTK_FUNCTION(2, "CMVREF6"),
+		MTK_FUNCTION(3, "CMVREF3"),
+		MTK_FUNCTION(4, "ANT_SEL20"),
+		MTK_FUNCTION(5, "APU_JTAG_TCK"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "CMMCLK5"),
+		MTK_FUNCTION(3, "CMVREF4"),
+		MTK_FUNCTION(4, "ANT_SEL21"),
+		MTK_FUNCTION(5, "CONN_BT_TXD"),
+		MTK_FUNCTION(6, "AGPS_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "CMVREF0"),
+		MTK_FUNCTION(2, "ANT_SEL16"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(4, "MD32_3_JTAG_TCK"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TCK"),
+		MTK_FUNCTION(6, "IPU_JTAG_TCK"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "CMVREF1"),
+		MTK_FUNCTION(2, "ANT_SEL15"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(4, "MD32_3_JTAG_TMS"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TMS"),
+		MTK_FUNCTION(6, "IPU_JTAG_TMS"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "CMVREF2"),
+		MTK_FUNCTION(2, "ANT_SEL14"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(4, "MD32_3_JTAG_TRST"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TRST"),
+		MTK_FUNCTION(6, "IPU_JTAG_TRST"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "UDI_TDI_4"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(4, "MD32_3_JTAG_TDO"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TDO"),
+		MTK_FUNCTION(6, "IPU_JTAG_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "UDI_TDI_5"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(4, "MD32_3_JTAG_TDI"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TDI"),
+		MTK_FUNCTION(6, "IPU_JTAG_TDI"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "CMMCLK2"),
+		MTK_FUNCTION(2, "UDI_TDI_6"),
+		MTK_FUNCTION(3, "SPI5_A_CLK"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_AICE_TMSC"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "CMVREF0"),
+		MTK_FUNCTION(2, "ANT_SEL13"),
+		MTK_FUNCTION(3, "SPI5_A_CSB"),
+		MTK_FUNCTION(4, "MD32_0_GPIO0"),
+		MTK_FUNCTION(5, "MD32_2_GPIO0"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "CMVREF1"),
+		MTK_FUNCTION(2, "UDI_TDI_1"),
+		MTK_FUNCTION(3, "SPI5_A_MI"),
+		MTK_FUNCTION(4, "MD32_0_GPIO1"),
+		MTK_FUNCTION(5, "MD32_2_GPIO1"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "CMVREF2"),
+		MTK_FUNCTION(2, "UDI_TDI_2"),
+		MTK_FUNCTION(3, "SPI5_A_MO"),
+		MTK_FUNCTION(4, "MD32_0_GPIO2"),
+		MTK_FUNCTION(5, "MD32_2_GPIO2"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "CMVREF3"),
+		MTK_FUNCTION(2, "UDI_TDI_3"),
+		MTK_FUNCTION(3, "SPI7_B_CLK"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TDO"),
+		MTK_FUNCTION(5, "MD32_2_JTAG_TDO"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TDO"),
+		MTK_FUNCTION(7, "MSDC1_CLK_A")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "CMVREF4"),
+		MTK_FUNCTION(2, "ANT_SEL12"),
+		MTK_FUNCTION(3, "SPI7_B_CSB"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TDI"),
+		MTK_FUNCTION(5, "MD32_2_JTAG_TDI"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TDI"),
+		MTK_FUNCTION(7, "MSDC1_CMD_A")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "CMVREF5"),
+		MTK_FUNCTION(2, "ANT_SEL11"),
+		MTK_FUNCTION(3, "SPI7_B_MI"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TMS"),
+		MTK_FUNCTION(5, "MD32_2_JTAG_TMS"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TMS"),
+		MTK_FUNCTION(7, "MSDC1_DAT3_A")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "CMVREF3"),
+		MTK_FUNCTION(2, "ANT_SEL11"),
+		MTK_FUNCTION(3, "SPI7_B_MO"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TCK"),
+		MTK_FUNCTION(5, "MD32_2_JTAG_TCK"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TCK"),
+		MTK_FUNCTION(7, "MSDC1_DAT0_A")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "CMVREF4"),
+		MTK_FUNCTION(2, "ANT_SEL12"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TRST"),
+		MTK_FUNCTION(5, "MD32_2_JTAG_TRST"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TRST_B"),
+		MTK_FUNCTION(7, "MSDC1_DAT2_A")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "CMVREF5"),
+		MTK_FUNCTION(2, "ANT_SEL13"),
+		MTK_FUNCTION(7, "MSDC1_DAT1_A")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "CMMCLK3"),
+		MTK_FUNCTION(2, "UDI_TDI_7"),
+		MTK_FUNCTION(4, "MD32_1_GPIO0"),
+		MTK_FUNCTION(5, "MD32_3_GPIO0"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "CMMCLK4"),
+		MTK_FUNCTION(2, "ANT_SEL7"),
+		MTK_FUNCTION(4, "MD32_1_GPIO1"),
+		MTK_FUNCTION(5, "MD32_3_GPIO1"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "CMMCLK5"),
+		MTK_FUNCTION(2, "ANT_SEL6"),
+		MTK_FUNCTION(4, "MD32_1_GPIO2"),
+		MTK_FUNCTION(5, "MD32_3_GPIO2")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK"),
+		MTK_FUNCTION(4, "MD_URXD1"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA"),
+		MTK_FUNCTION(4, "MD_UTXD1"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "CONN_HRST_B"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "CONN_WB_PTA"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "CONN_BT_CLK"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "CONN_BT_DATA"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL0"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL1"),
+		MTK_FUNCTION(3, "PCM1_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL2"),
+		MTK_FUNCTION(3, "PCM1_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL3"),
+		MTK_FUNCTION(3, "PCM1_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL4"),
+		MTK_FUNCTION(3, "PCM1_DO0"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "ANT_SEL0"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(4, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(5, "I2S0_MCK"),
+		MTK_FUNCTION(6, "PTA_EXT_FREQ"),
+		MTK_FUNCTION(7, "PMSR_SMAP")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "ANT_SEL1"),
+		MTK_FUNCTION(2, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(4, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(5, "I2S0_BCK"),
+		MTK_FUNCTION(6, "PTA_EXT_ACT"),
+		MTK_FUNCTION(7, "USB_DRVVBUS_1P")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "ANT_SEL2"),
+		MTK_FUNCTION(2, "AGPS_SYNC"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(4, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(5, "I2S0_LRCK"),
+		MTK_FUNCTION(6, "PTA_EXT_PRI"),
+		MTK_FUNCTION(7, "DP_TX_HPD")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "ANT_SEL3"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "USB_DRVVBUS"),
+		MTK_FUNCTION(4, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(5, "I2S0_DI"),
+		MTK_FUNCTION(6, "PTA_EXT_WLAN_ACT"),
+		MTK_FUNCTION(7, "DP_OC_EN")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "ANT_SEL4"),
+		MTK_FUNCTION(2, "GPS_PPS"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(4, "DMIC1_CLK"),
+		MTK_FUNCTION(5, "I2S5_DO"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU1")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "ANT_SEL5"),
+		MTK_FUNCTION(2, "GPS_PPS"),
+		MTK_FUNCTION(3, "AGPS_SYNC"),
+		MTK_FUNCTION(4, "DMIC1_DAT"),
+		MTK_FUNCTION(5, "I2S5_MCK"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU2")
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "ANT_SEL6"),
+		MTK_FUNCTION(3, "SPI4_A_MI"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "I2S5_BCK"),
+		MTK_FUNCTION(7, "DP_TX_HPD")
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "ANT_SEL7"),
+		MTK_FUNCTION(3, "SPI4_A_MO"),
+		MTK_FUNCTION(4, "PWM_1"),
+		MTK_FUNCTION(5, "I2S5_LRCK"),
+		MTK_FUNCTION(7, "DP_OC_EN")
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "ANT_SEL8"),
+		MTK_FUNCTION(3, "SPI4_A_CLK"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU1")
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO185"),
+		MTK_FUNCTION(1, "ANT_SEL9"),
+		MTK_FUNCTION(3, "SPI4_A_CSB"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(5, "I2S5_DO"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU2")
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO186"),
+		MTK_FUNCTION(1, "CONN_MIPI_ANT_SCLK"),
+		MTK_FUNCTION(2, "MIPI4_D_SCLK"),
+		MTK_FUNCTION(4, "MD_URXD1"),
+		MTK_FUNCTION(5, "ANT_SEL14"),
+		MTK_FUNCTION(6, "DMIC_CLK"),
+		MTK_FUNCTION(7, "DMIC1_CLK")
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO187"),
+		MTK_FUNCTION(1, "CONN_MIPI_ANT_SDATA"),
+		MTK_FUNCTION(2, "MIPI4_D_SDATA"),
+		MTK_FUNCTION(4, "MD_UTXD1"),
+		MTK_FUNCTION(5, "ANT_SEL15"),
+		MTK_FUNCTION(6, "DMIC_DAT"),
+		MTK_FUNCTION(7, "DMIC1_DAT")
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO188"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "ANT_SEL10"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "PTA_RXD"),
+		MTK_FUNCTION(5, "VPU_UDI_TCK"),
+		MTK_FUNCTION(7, "GPS_L1_ELNA_EN")
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO189"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "ANT_SEL11"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(4, "PTA_TXD"),
+		MTK_FUNCTION(5, "VPU_UDI_TMS"),
+		MTK_FUNCTION(7, "GPS_L5_ELNA_EN")
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO190"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "ANT_SEL12"),
+		MTK_FUNCTION(3, "PTA_EXT_FREQ"),
+		MTK_FUNCTION(4, "SPI6_B_MI"),
+		MTK_FUNCTION(5, "VPU_UDI_TDI"),
+		MTK_FUNCTION(7, "EXT_FRAME_SYNC")
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO191"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "ANT_SEL13"),
+		MTK_FUNCTION(3, "PTA_EXT_ACT"),
+		MTK_FUNCTION(4, "SPI6_B_CSB"),
+		MTK_FUNCTION(5, "VPU_UDI_NTRST"),
+		MTK_FUNCTION(6, "PMSR_SMAP")
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO192"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(2, "ANT_SEL14"),
+		MTK_FUNCTION(3, "PTA_EXT_PRI"),
+		MTK_FUNCTION(4, "SPI6_B_MO"),
+		MTK_FUNCTION(5, "VPU_UDI_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO193"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(2, "ANT_SEL15"),
+		MTK_FUNCTION(3, "PTA_EXT_WLAN_ACT"),
+		MTK_FUNCTION(4, "SPI6_B_CLK"),
+		MTK_FUNCTION(5, "AGPS_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO194"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "SRCLKENAI1")
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO195"),
+		MTK_FUNCTION(1, "SRCLKENA0"),
+		MTK_FUNCTION(2, "SRCLKENA1")
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO196"),
+		MTK_FUNCTION(1, "SRCLKENA1"),
+		MTK_FUNCTION(2, "SRCLKENA0")
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO197"),
+		MTK_FUNCTION(1, "SCP_VREQ_VAO"),
+		MTK_FUNCTION(2, "DVFSRC_EXT_REQ")
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO198"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO199"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO200"),
+		MTK_FUNCTION(1, "SCP_SCL1"),
+		MTK_FUNCTION(2, "SCL1")
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO201"),
+		MTK_FUNCTION(1, "SCP_SDA1"),
+		MTK_FUNCTION(2, "SDA1")
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO202"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(3, "AUD_CLK_MOSI_A"),
+		MTK_FUNCTION(4, "TDMIN_BCK")
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO203"),
+		MTK_FUNCTION(1, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(3, "AUD_SYNC_MISO")
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO204"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(3, "AUD_DAT_MOSI0_A"),
+		MTK_FUNCTION(4, "TDMOUT_DATA0")
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO205"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(3, "AUD_DAT_MOSI1_A"),
+		MTK_FUNCTION(4, "TDMOUT_DATA1")
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO206"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI2"),
+		MTK_FUNCTION(4, "TDMOUT_LRCK")
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO207"),
+		MTK_FUNCTION(1, "AUD_NLE_MOSI1"),
+		MTK_FUNCTION(2, "AUD_CLK_MISO")
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO208"),
+		MTK_FUNCTION(1, "AUD_NLE_MOSI0"),
+		MTK_FUNCTION(2, "AUD_SYNC_MISO")
+	),
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO209"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(2, "VOW_DAT_MISO"),
+		MTK_FUNCTION(3, "AUD_DAT_MISO0_A"),
+		MTK_FUNCTION(4, "TDMIN_DATA0")
+	),
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO210"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(2, "VOW_CLK_MISO"),
+		MTK_FUNCTION(3, "AUD_CLK_MISO"),
+		MTK_FUNCTION(4, "TDMIN_LRCK")
+	),
+	MTK_PIN(
+		211, "GPIO211",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO211"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO2"),
+		MTK_FUNCTION(3, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(4, "TDMOUT_BCK")
+	),
+	MTK_PIN(
+		212, "GPIO212",
+		MTK_EINT_FUNCTION(0, 212),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO212"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "MD_UCTS0"),
+		MTK_FUNCTION(3, "TP_GPIO15_AO"),
+		MTK_FUNCTION(5, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(6, "I2S3_MCK"),
+		MTK_FUNCTION(7, "DMIC_DAT")
+	),
+	MTK_PIN(
+		213, "GPIO213",
+		MTK_EINT_FUNCTION(0, 213),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO213"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "MD_URTS0"),
+		MTK_FUNCTION(3, "TP_GPIO14_AO"),
+		MTK_FUNCTION(4, "KPCOL1"),
+		MTK_FUNCTION(5, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(6, "I2S3_BCK"),
+		MTK_FUNCTION(7, "DP_TX_HPD")
+	),
+	MTK_PIN(
+		214, "GPIO214",
+		MTK_EINT_FUNCTION(0, 214),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO214"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "MD_UCTS1"),
+		MTK_FUNCTION(3, "TP_GPIO13_AO"),
+		MTK_FUNCTION(4, "KPCOL2"),
+		MTK_FUNCTION(5, "MD_INT3"),
+		MTK_FUNCTION(6, "I2S3_LRCK"),
+		MTK_FUNCTION(7, "DP_OC_EN")
+	),
+	MTK_PIN(
+		215, "GPIO215",
+		MTK_EINT_FUNCTION(0, 215),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO215"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "MD_URTS1"),
+		MTK_FUNCTION(3, "TP_GPIO12_AO"),
+		MTK_FUNCTION(4, "KPROW1"),
+		MTK_FUNCTION(5, "MD_INT4"),
+		MTK_FUNCTION(6, "I2S0_DI"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU1")
+	),
+	MTK_PIN(
+		216, "GPIO216",
+		MTK_EINT_FUNCTION(0, 216),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO216"),
+		MTK_FUNCTION(1, "PWM_VLP"),
+		MTK_FUNCTION(2, "MD_INT0"),
+		MTK_FUNCTION(3, "TP_GPIO11_AO"),
+		MTK_FUNCTION(4, "KPROW2"),
+		MTK_FUNCTION(5, "DMIC_CLK"),
+		MTK_FUNCTION(6, "I2S3_DO"),
+		MTK_FUNCTION(7, "DP_RAUX_SBU2")
+	),
+	MTK_PIN(
+		217, "GPIO217",
+		MTK_EINT_FUNCTION(0, 217),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO217"),
+		MTK_FUNCTION(1, "SPI3_A_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI3_A_CK"),
+		MTK_FUNCTION(3, "SCP_SCL4"),
+		MTK_FUNCTION(4, "MD_URXD0"),
+		MTK_FUNCTION(5, "TP_URXD2_VLP"),
+		MTK_FUNCTION(6, "MD32_3_RXD"),
+		MTK_FUNCTION(7, "MD32_1_RXD")
+	),
+	MTK_PIN(
+		218, "GPIO218",
+		MTK_EINT_FUNCTION(0, 218),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO218"),
+		MTK_FUNCTION(1, "SPI3_A_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI3_A_CS"),
+		MTK_FUNCTION(3, "SCP_SDA4"),
+		MTK_FUNCTION(4, "MD_UTXD0"),
+		MTK_FUNCTION(5, "TP_UTXD2_VLP"),
+		MTK_FUNCTION(6, "MD32_3_TXD"),
+		MTK_FUNCTION(7, "MD32_1_TXD")
+	),
+	MTK_PIN(
+		219, "GPIO219",
+		MTK_EINT_FUNCTION(0, 219),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO219"),
+		MTK_FUNCTION(1, "SPI3_A_MI"),
+		MTK_FUNCTION(2, "SCP_SPI3_A_MI"),
+		MTK_FUNCTION(3, "TP_URTS2_VLP"),
+		MTK_FUNCTION(4, "MD_URXD1"),
+		MTK_FUNCTION(5, "SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(6, "URXD1"),
+		MTK_FUNCTION(7, "HFRP_URXD1")
+	),
+	MTK_PIN(
+		220, "GPIO220",
+		MTK_EINT_FUNCTION(0, 220),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO220"),
+		MTK_FUNCTION(1, "SPI3_A_MO"),
+		MTK_FUNCTION(2, "SCP_SPI3_A_MO"),
+		MTK_FUNCTION(3, "TP_UCTS2_VLP"),
+		MTK_FUNCTION(4, "MD_UTXD1"),
+		MTK_FUNCTION(5, "SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(6, "UTXD1"),
+		MTK_FUNCTION(7, "HFRP_UTXD1")
+	),
+	MTK_PIN(
+		221, "GPIO221",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO221"),
+		MTK_FUNCTION(1, "SPMI_M_SCL"),
+		MTK_FUNCTION(2, "SPMI_P_SCL")
+	),
+	MTK_PIN(
+		222, "GPIO222",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO222"),
+		MTK_FUNCTION(1, "SPMI_M_SDA"),
+		MTK_FUNCTION(2, "SPMI_P_SDA")
+	),
+	MTK_PIN(
+		223, "GPIO223",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO223"),
+		MTK_FUNCTION(1, "SPMI_P_SCL"),
+		MTK_FUNCTION(2, "SPMI_M_SCL")
+	),
+	MTK_PIN(
+		224, "GPIO224",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO224"),
+		MTK_FUNCTION(1, "SPMI_P_SDA"),
+		MTK_FUNCTION(2, "SPMI_M_SDA")
+	),
+	MTK_PIN(
+		225, "GPIO225",
+		MTK_EINT_FUNCTION(0, 225),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO225"),
+		MTK_FUNCTION(1, "SCP_SCL3")
+	),
+	MTK_PIN(
+		226, "GPIO226",
+		MTK_EINT_FUNCTION(0, 226),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO226"),
+		MTK_FUNCTION(1, "SCP_SDA3")
+	),
+	MTK_PIN_VEINT(227),
+	MTK_PIN_VEINT(228),
+	MTK_PIN_VEINT(229),
+	MTK_PIN_VEINT(230),
+	MTK_PIN_VEINT(231),
+	MTK_PIN_VEINT(232),
+	MTK_PIN_VEINT(233),
+	MTK_PIN_VEINT(234),
+	MTK_PIN_VEINT(235),
+	MTK_PIN_VEINT(236),
+	MTK_PIN_VEINT(237),
+	MTK_PIN_VEINT(238),
+	MTK_PIN_VEINT(239),
+	MTK_PIN_VEINT(240),
+	MTK_PIN_VEINT(241),
+	MTK_PIN_VEINT(242),
+	MTK_PIN_VEINT(243),
+	MTK_PIN_VEINT(244),
+	MTK_PIN_VEINT(245),
+	MTK_PIN_VEINT(246),
+};
+
+static struct mtk_eint_pin eint_pins_mt6895[] = {
+	MTK_EINT_PIN(0, 3, 0, 1),
+	MTK_EINT_PIN(1, 3, 1, 1),
+	MTK_EINT_PIN(2, 3, 2, 1),
+	MTK_EINT_PIN(3, 1, 0, 1),
+	MTK_EINT_PIN(4, 1, 1, 1),
+	MTK_EINT_PIN(5, 1, 2, 1),
+	MTK_EINT_PIN(6, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(7, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(8, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(9, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(10, 1, 3, 1),
+	MTK_EINT_PIN(11, 1, 4, 1),
+	MTK_EINT_PIN(12, 2, 0, 1),
+	MTK_EINT_PIN(13, 2, 1, 1),
+	MTK_EINT_PIN(14, 2, 2, 1),
+	MTK_EINT_PIN(15, 2, 3, 1),
+	MTK_EINT_PIN(16, 0, 0, 1),
+	MTK_EINT_PIN(17, 0, 1, 1),
+	MTK_EINT_PIN(18, 0, 2, 1),
+	MTK_EINT_PIN(19, 1, 5, 1),
+	MTK_EINT_PIN(20, 2, 4, 0),
+	MTK_EINT_PIN(21, 2, 5, 0),
+	MTK_EINT_PIN(22, 2, 6, 0),
+	MTK_EINT_PIN(23, 0, 3, 0),
+	MTK_EINT_PIN(24, 2, 7, 0),
+	MTK_EINT_PIN(25, 0, 4, 0),
+	MTK_EINT_PIN(26, 0, 5, 0),
+	MTK_EINT_PIN(27, 0, 6, 0),
+	MTK_EINT_PIN(28, 0, 7, 0),
+	MTK_EINT_PIN(29, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(30, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(31, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(32, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(33, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(34, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(35, 0, 8, 0),
+	MTK_EINT_PIN(36, 0, 9, 0),
+	MTK_EINT_PIN(37, 1, 6, 0),
+	MTK_EINT_PIN(38, 1, 7, 0),
+	MTK_EINT_PIN(39, 0, 10, 0),
+	MTK_EINT_PIN(40, 0, 11, 0),
+	MTK_EINT_PIN(41, 0, 12, 0),
+	MTK_EINT_PIN(42, 2, 8, 0),
+	MTK_EINT_PIN(43, 2, 9, 0),
+	MTK_EINT_PIN(44, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(45, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(46, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(47, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(48, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(49, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(50, 0, 13, 0),
+	MTK_EINT_PIN(51, 0, 14, 0),
+	MTK_EINT_PIN(52, 0, 15, 0),
+	MTK_EINT_PIN(53, 0, 16, 0),
+	MTK_EINT_PIN(54, 0, 17, 0),
+	MTK_EINT_PIN(55, 0, 18, 0),
+	MTK_EINT_PIN(56, 0, 19, 0),
+	MTK_EINT_PIN(57, 0, 20, 0),
+	MTK_EINT_PIN(58, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(59, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(60, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(61, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(62, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(63, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(64, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(65, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(66, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(67, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(68, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(69, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(70, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(71, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(72, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(73, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(74, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(75, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(76, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(77, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(78, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(79, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(80, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(81, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(82, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(83, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(84, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(85, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(86, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(87, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(88, 2, 10, 0),
+	MTK_EINT_PIN(89, 2, 11, 0),
+	MTK_EINT_PIN(90, 2, 12, 0),
+	MTK_EINT_PIN(91, 2, 13, 0),
+	MTK_EINT_PIN(92, 2, 14, 0),
+	MTK_EINT_PIN(93, 2, 15, 0),
+	MTK_EINT_PIN(94, 2, 16, 0),
+	MTK_EINT_PIN(95, 2, 17, 0),
+	MTK_EINT_PIN(96, 2, 18, 0),
+	MTK_EINT_PIN(97, 2, 19, 0),
+	MTK_EINT_PIN(98, 2, 20, 0),
+	MTK_EINT_PIN(99, 2, 21, 0),
+	MTK_EINT_PIN(100, 2, 22, 0),
+	MTK_EINT_PIN(101, 2, 23, 0),
+	MTK_EINT_PIN(102, 2, 24, 0),
+	MTK_EINT_PIN(103, 2, 25, 0),
+	MTK_EINT_PIN(104, 2, 26, 0),
+	MTK_EINT_PIN(105, 1, 8, 0),
+	MTK_EINT_PIN(106, 1, 9, 0),
+	MTK_EINT_PIN(107, 1, 10, 0),
+	MTK_EINT_PIN(108, 1, 11, 0),
+	MTK_EINT_PIN(109, 1, 12, 0),
+	MTK_EINT_PIN(110, 1, 13, 0),
+	MTK_EINT_PIN(111, 1, 14, 0),
+	MTK_EINT_PIN(112, 1, 15, 0),
+	MTK_EINT_PIN(113, 3, 3, 0),
+	MTK_EINT_PIN(114, 1, 16, 1),
+	MTK_EINT_PIN(115, 1, 17, 1),
+	MTK_EINT_PIN(116, 1, 18, 1),
+	MTK_EINT_PIN(117, 1, 19, 1),
+	MTK_EINT_PIN(118, 1, 20, 1),
+	MTK_EINT_PIN(119, 1, 21, 0),
+	MTK_EINT_PIN(120, 1, 22, 0),
+	MTK_EINT_PIN(121, 1, 23, 0),
+	MTK_EINT_PIN(122, 1, 24, 0),
+	MTK_EINT_PIN(123, 1, 25, 0),
+	MTK_EINT_PIN(124, 1, 26, 0),
+	MTK_EINT_PIN(125, 1, 27, 0),
+	MTK_EINT_PIN(126, 1, 28, 0),
+	MTK_EINT_PIN(127, 1, 29, 1),
+	MTK_EINT_PIN(128, 1, 30, 1),
+	MTK_EINT_PIN(129, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(130, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(131, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(132, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(133, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(134, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(135, 1, 31, 1),
+	MTK_EINT_PIN(136, 1, 32, 1),
+	MTK_EINT_PIN(137, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(138, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(139, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(140, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(141, 1, 33, 1),
+	MTK_EINT_PIN(142, 1, 34, 1),
+	MTK_EINT_PIN(143, 1, 35, 1),
+	MTK_EINT_PIN(144, 1, 36, 1),
+	MTK_EINT_PIN(145, 1, 37, 1),
+	MTK_EINT_PIN(146, 1, 38, 1),
+	MTK_EINT_PIN(147, 1, 39, 0),
+	MTK_EINT_PIN(148, 1, 40, 0),
+	MTK_EINT_PIN(149, 1, 41, 0),
+	MTK_EINT_PIN(150, 1, 42, 0),
+	MTK_EINT_PIN(151, 1, 43, 0),
+	MTK_EINT_PIN(152, 1, 44, 0),
+	MTK_EINT_PIN(153, 1, 45, 0),
+	MTK_EINT_PIN(154, 1, 46, 0),
+	MTK_EINT_PIN(155, 1, 47, 0),
+	MTK_EINT_PIN(156, 1, 48, 0),
+	MTK_EINT_PIN(157, 1, 49, 0),
+	MTK_EINT_PIN(158, 1, 50, 0),
+	MTK_EINT_PIN(159, 1, 51, 0),
+	MTK_EINT_PIN(160, 1, 52, 0),
+	MTK_EINT_PIN(161, 1, 53, 1),
+	MTK_EINT_PIN(162, 1, 54, 0),
+	MTK_EINT_PIN(163, 1, 55, 0),
+	MTK_EINT_PIN(164, 1, 56, 0),
+	MTK_EINT_PIN(165, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(166, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(167, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(168, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(169, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(170, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(171, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(172, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(173, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(174, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(175, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(176, 1, 57, 0),
+	MTK_EINT_PIN(177, 1, 58, 0),
+	MTK_EINT_PIN(178, 1, 59, 0),
+	MTK_EINT_PIN(179, 1, 60, 0),
+	MTK_EINT_PIN(180, 1, 61, 0),
+	MTK_EINT_PIN(181, 1, 62, 0),
+	MTK_EINT_PIN(182, 1, 63, 0),
+	MTK_EINT_PIN(183, 1, 64, 0),
+	MTK_EINT_PIN(184, 1, 65, 0),
+	MTK_EINT_PIN(185, 1, 66, 0),
+	MTK_EINT_PIN(186, 3, 4, 0),
+	MTK_EINT_PIN(187, 3, 5, 0),
+	MTK_EINT_PIN(188, 3, 6, 0),
+	MTK_EINT_PIN(189, 3, 7, 0),
+	MTK_EINT_PIN(190, 3, 8, 0),
+	MTK_EINT_PIN(191, 3, 9, 0),
+	MTK_EINT_PIN(192, 3, 10, 0),
+	MTK_EINT_PIN(193, 3, 11, 0),
+	MTK_EINT_PIN(194, 0, 21, 0),
+	MTK_EINT_PIN(195, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(196, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(197, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(198, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(199, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(200, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(201, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(202, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(203, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(204, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(205, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(206, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(207, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(208, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(209, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(210, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(211, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(212, 1, 67, 0),
+	MTK_EINT_PIN(213, 3, 16, 0),
+	MTK_EINT_PIN(214, 3, 17, 0),
+	MTK_EINT_PIN(215, 3, 18, 0),
+	MTK_EINT_PIN(216, 3, 19, 0),
+	MTK_EINT_PIN(217, 3, 12, 0),
+	MTK_EINT_PIN(218, 3, 13, 0),
+	MTK_EINT_PIN(219, 3, 14, 0),
+	MTK_EINT_PIN(220, 3, 15, 0),
+	MTK_EINT_PIN(221, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(222, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(223, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(224, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(225, 3, 20, 0),
+	MTK_EINT_PIN(226, 3, 21, 0),
+	MTK_EINT_PIN(227, 4, 0, 0),
+	MTK_EINT_PIN(228, 4, 1, 0),
+	MTK_EINT_PIN(229, 4, 2, 0),
+	MTK_EINT_PIN(230, 4, 3, 0),
+	MTK_EINT_PIN(231, 4, 4, 0),
+	MTK_EINT_PIN(232, 4, 5, 0),
+	MTK_EINT_PIN(233, 4, 6, 0),
+	MTK_EINT_PIN(234, 4, 7, 0),
+	MTK_EINT_PIN(235, 4, 8, 0),
+	MTK_EINT_PIN(236, 4, 9, 0),
+	MTK_EINT_PIN(237, 4, 10, 0),
+	MTK_EINT_PIN(238, 4, 11, 0),
+	MTK_EINT_PIN(239, 4, 12, 0),
+	MTK_EINT_PIN(240, 4, 13, 0),
+	MTK_EINT_PIN(241, 4, 14, 0),
+	MTK_EINT_PIN(242, 4, 15, 0),
+	MTK_EINT_PIN(243, 4, 16, 0),
+	MTK_EINT_PIN(244, 4, 17, 0),
+	MTK_EINT_PIN(245, 4, 18, 0),
+	MTK_EINT_PIN(246, 4, 19, 0)
+};
+
+#endif /* __PINCTRL_MTK_MT6895_H */

-- 
2.56.0

