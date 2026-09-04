Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A79511E7C
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542185; cv=none; b=LwRqMbAPy9ujYKob+5GWnGt8OshssZfK1ir+F0VYjDLFw7nFm3vW4OppqlHRYxNuihqhCLA3GfVhICM1Cqqb//56PsxfhxTNWuOz+6GVqbHzBPZ0EEHUsqyEt5ep1xOId2hkKoWiI+390wKSrtESqk865k9RvJnRMbCQk74swEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542185; c=relaxed/simple;
	bh=aGLPmu41Pw0BcItdaIQ/oejtoZmWVddlOgwbZWfcXyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mD9LDYKFKXJWMy/Oa1zVKO7YxVi1xSlrYehRk9uJViSkndrqX93EpPiMDoZfpCMZ8RpUb7L8GhjanqCWvHLbUoVQRUfjHSq2ZTqSOp5KRbCkGcocqGf7j4oKWoPb1x3kT8e4dI5XUSRlRkh1c47TYwpbUYGvWVHOcQyrC7PS5qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7o0qsyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb2UGfgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7o0qsyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb2UGfgD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiU7D3765790
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 17:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=; b=c7o0qsybM+Itqzp/
	YdI4hU1dLy9APJfr6D8K/YLigN5YAIyxq5g9zAjHiTVAx+GvjtQQlVMh0J5FhDcx
	910xRmub2zbRO7U5vN8OL21UL0qrmen98+t+hVt9kkibrnlJK71QMBQ/AW0XtQ2d
	wEDr88puUeDdMZ0Ft2nHYxkNZk8F0UGMt9FEruAbd148BxYMPIbI+1WqV4Vl/EEv
	KhIrUSbTVZUqyqa0CziwVQhOWPU4EuYDU5//DG1LJ01/IQhHT38ml7CQx5cBWI1Y
	Vqq27k5vUd4jzseeKbw4gXs0TKRgsH4rnxVWLKyVvtig6LtcZnC02MybdoLMPbwv
	vOj2Jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg012186h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:16:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so250134285a.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542179; x=1789146979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=;
        b=Lb2UGfgD463EwuZ+mBjw+eEk1uYgGE3LeKrhE6O5b03hghwioAjsCs+oFXa6iruj6T
         NBxgOx+GgiccISDgMryx0iHQYVtMXaOOOP8YSLmWsW/r7sua1ahfCp6quT5sDIz04NPO
         rczhv8lLYTfYy2vIpQ2sBWf7lDc9xBboLJql+zsFAOxXCrr0lbNDIAshJ0RlVLkEZ4h4
         gK9bMXilPIEoZm7K/HhHKvcWGF2DHGZgGOjnvSsDCblI1nvRICy0TYHSLth1PDwbER5k
         HetVagJZLvyDB8/fS7mil5p8vqTvw+KYAPy6FvcLEW9dnlLjG/s1TwIwBHtB+XJq9MBk
         EnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542179; x=1789146979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=;
        b=FVc8Z4fj8xjVo7Pqnp2866J2ShhWiSAue5dPPRioUmFLglR8epqSckppVvB3Zb2F1M
         k+p4a1tvzWtD1oVEFXjvywLpMpzw2UaxzgVQQRV8Nksv0ZkGByeprKfZ85oUT0Axvpe5
         oqMYoVCNtpsuY4odvINVozQ79UXbzriDgsSi+WCdULn7nBYkM50ZZj4wvMxxNFU1rhyc
         Ecm/4X453OSZqItAqqaZ1NYvTSWGHAFqFOVuVUJDrHtantcUAc5YRXw0Lzw/ZA/R6mqt
         w87OQbGTJU6p4+FHNwU7OTguaHe6vkPfdW5llOoBtPq3omHabhKWRix4qevyxQpiYV+a
         At7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxd+fsQvik41P+jGQlTYzsWc1rYYscR4dm+KFTu0eVj9oGWqyVNR6V9KafCU20N/mPePHaOx0LKdv7q@vger.kernel.org
X-Gm-Message-State: AFuF++lPA1cwI2otwueUN2ZHj8YYjQ9ErrS6HOTONCIjBNdti6fkUoic
	85Jw9PjE8YjlJcJJT/bhrKp+LpDlFFc4aEdcB+lRbga7epiTBThUCjI6eYZQM4xC55O2S5StWkf
	DmMWZwC3hfXt5HYSzd+2X189tPtBrKOutNX/op+880DlMNbWiIMBrItfncF2cMg1v
X-Gm-Gg: AYBFou1v5eCDOHSDPqWwAdx/vycQqvCYKT6I44pe/QWgWywsR2gVRAswgwgnDLLhq74
	N72g+/mD7fNcCfRdfgjuvBrvtHc84Ss+srP4PeR4WurElaxUbHDWra1Gh6r2CXXjXsRmbA0rutG
	wEKtcOoE03Z+4gzdhGvQ8uoI9pXxzIe86QEKJVKLkKRb0lryqozaqnQFYFH7FtX6hwmq/qXn8v5
	MaLiEQOm2qpoI311x971MHBw/wAGimWs8q3CcloX+2AjG8RHmoKn6/O4P24vX2wGaQldpTESHls
	jb8BZtM427gji29LwgdsVQpZHdZPeG0jj40XJ+HiccOPwaKz26zyKGceYSWSOK3zVcvfuuvQPGW
	Kb7yOkrP/FF8Arg==
X-Received: by 2002:a05:620a:4d89:b0:930:9091:f0ce with SMTP id af79cd13be357-9398037b9admr545438285a.22.1788542178943;
        Fri, 04 Sep 2026 10:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4d89:b0:930:9091:f0ce with SMTP id af79cd13be357-9398037b9admr545430185a.22.1788542178341;
        Fri, 04 Sep 2026 10:16:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm146631735e9.0.2026.09.04.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:16 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:21 +0200
Subject: [PATCH v3 4/5] PCI/pwrctrl: tc9563: Switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-4-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9afce3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=viGhCAv9QodxNsH3n2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX6w9QDwe6nWpG
 73bzNeJUUMEmldzmeJYnBQnzI58Ighhph4I+wCShSwCjtnI5jJ8Tgg1vQ6bgBWRX5AhlZR96FqU
 T+G7H8pJ6VxmkK+CpynLOJt7CNWbAWv7qhRBcZRyr2LkoXPMbwXrY2FTZ9MdgwFT68kkZWZ8ex+
 rcVdA8UNALQSQr4IOQ4l6tt+v1IuIpQBgoBc2K1ywj3xbuPhwvMyExnOnNMkbU4c1FqRXzLVSiW
 oXJfzu5LfzdJXMNle9bRfnmR+WovntoGXkVsPvEDsuofURvzbdwQPKDoGTzt8iI4BiORp5CbCmx
 qVxaM8fgPknTxkAoFAOiM+T5a8bIZuJ0ff29HeMFGTzwxGH53Stk4YG9hMhpZNhiO8nbf3Nqiib
 k0CoaiXNPj5DMpUrM9J9lagdW2AyYaDVEtw+5iP9EH9HI+7WJc9lUvE4g5v6MKFxrL+5qMsKQhN
 W4Jy8z8/NozM+fg5/gQ==
X-Proofpoint-GUID: iDc4baFJ8mjYdaMdmu0rr4-Da_nKB4cq
X-Proofpoint-ORIG-GUID: iDc4baFJ8mjYdaMdmu0rr4-Da_nKB4cq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX4EAakzEGv6nf
 eg64o0znGJhtyl5ELfEu2yqlKNGd8Frsj0G+12vdjUSLqcjeimUojrg8IsL4JRB8hgoAoBulbaA
 lX5PSIazDTmoz+doJ/NEOExACSeFaQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040156

Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
definitions, which are no longer used after switching to the GPIO
descriptor API. Move TC9563_GPIO_CONFIG and TC9563_RESET_GPIO
definitions in tc9563.h header file.

Replace the direct regmap-based per-port reset logic in
assert_deassert_reset() with gpiod_direction_output() calls, falling
back to the legacy regmap approach only when no reset-gpios DT
property is present for a given port.

Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
PCI downstream port child node. The lookup is done lazily at the
beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
is registered.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++++------
 include/linux/soc/qcom/tc9563.h          |  3 ++
 2 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 2230765950b8..d9b69c3aeb7e 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -25,9 +25,6 @@
 
 #include "../pci.h"
 
-#define TC9563_GPIO_CONFIG		0x801208
-#define TC9563_RESET_GPIO		0x801210
-
 #define TC9563_PORT_L0S_DELAY		0x82496c
 #define TC9563_PORT_L1_DELAY		0x824970
 
@@ -59,9 +56,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -87,6 +81,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -351,16 +346,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
 static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
 						bool deassert)
 {
-	int ret, val;
-
-	ret = regmap_write(tc9563->regmap, TC9563_GPIO_CONFIG,
-			   TC9563_GPIO_MASK);
-	if (ret)
-		return ret;
-
-	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc9563->cfg); i++) {
+		int err;
+
+		if (tc9563->cfg[i].reset) {
+			err = gpiod_direction_output(tc9563->cfg[i].reset,
+						     !deassert);
+			if (err)
+				return err;
+		} else {
+			/* Fallback: legacy DTS without reset-gpios */
+			switch (i) {
+			case TC9563_DSP1:
+			case TC9563_DSP2:
+				err = regmap_clear_bits(tc9563->regmap,
+							TC9563_GPIO_CONFIG,
+							BIT(i + 1));
+				if (err)
+					return err;
+
+				err = regmap_assign_bits(tc9563->regmap,
+							 TC9563_RESET_GPIO,
+							 BIT(i + 1), deassert);
+				if (err)
+					return err;
+				break;
+			default:
+				break;
+			}
+		}
+	}
 
-	return regmap_write(tc9563->regmap, TC9563_RESET_GPIO, val);
+	return 0;
 }
 
 static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
@@ -395,6 +414,38 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
 	return 0;
 }
 
+static int tc9563_pwrctrl_parse_reset_line(struct tc9563_pwrctrl *tc9563)
+{
+	enum tc9563_pwrctrl_ports port = TC9563_USP;
+	struct device *dev = tc9563->pwrctrl.dev;
+	struct device_node *node = dev->of_node;
+
+	for_each_child_of_node_scoped(node, child) {
+		struct tc9563_pwrctrl_cfg *cfg;
+
+		if (++port >= TC9563_MAX)
+			break;
+
+		cfg = &tc9563->cfg[port];
+		if (cfg->reset) /* Already discovered */
+			continue;
+
+		cfg->reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
+						   "reset", GPIOD_ASIS,
+						   NULL);
+		if (IS_ERR(cfg->reset)) {
+			int err = PTR_ERR(cfg->reset);
+
+			cfg->reset = NULL;
+			if (err != -ENOENT)
+				return dev_err_probe(dev, err,
+						     "failed to get reset\n");
+		}
+	}
+
+	return 0;
+}
+
 static void tc9563_pwrctrl_adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -478,6 +529,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct tc9563_pwrctrl_cfg *cfg;
 	int ret, i;
 
+	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
 				    tc9563->supplies);
 	if (ret < 0)
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
index 0dfd25747b9a..086f37a40d80 100644
--- a/include/linux/soc/qcom/tc9563.h
+++ b/include/linux/soc/qcom/tc9563.h
@@ -13,4 +13,7 @@
 #define TC9563_GPIO_EN0_OFFSET		0x801208
 #define TC9563_GPIO_OUT0_OFFSET		0x801210
 
+#define TC9563_GPIO_CONFIG		TC9563_GPIO_EN0_OFFSET
+#define TC9563_RESET_GPIO		TC9563_GPIO_OUT0_OFFSET
+
 #endif /* __QCOM_TC9563_H */

-- 
2.55.0

