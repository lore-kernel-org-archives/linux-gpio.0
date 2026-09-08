Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BE560AD7
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881364; cv=none; b=sxhdQPxIMmYPNLfK5iXkjtg53KPnLhrCAqR7rIO69aNOVHXNIbDu1gexiq4VCv8P9I2KClxKU2hFWE5o6YVZ/tu/ADHBGGMk/fzLYtKHPMHGrkm3hW5qsGOxp27oYgEu1HLVW481GhFFfqvWENEcfaHluAblqJptnCqbJEkREio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881364; c=relaxed/simple;
	bh=4+wWYRihNb+YzSTuxUwaI+YyiQAKimBV6A6X2ehKKqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cj/ruqEwUbjkLx57Ksjxqrg8wKyz4SrBnOayCfRiS7LrBA1cN+djLYReW9XWOMmEJnJl7kbIacPtFrlcHquksyvFxQSKdwuhaENf0mtjiIhGeDtMB/U/e6QCM/L9jL3TLvBffuUr/vP9IomI5RO6bbdG9sYsShAyhhM/K/KxxZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBw18gs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REUrkw+N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBw18gs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REUrkw+N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FOaV43579318
	for <linux-gpio@vger.kernel.org>; Tue, 8 Sep 2026 15:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KhxPlRqUMRagUmeRkRUzkyJQ3R0AyB2krXH1rMDJss=; b=SBw18gs6DS3uvswP
	ODAxWBMPflT86dX2Xl5i1SbdDtyIZL9e+M+c02Sr4buFJ7UAiMnF46gYXiCLLgIc
	bTMI9BDMI7E0Lm+STMQDQuyzzI3wgn4JU6f/hKK7BFPfG5ynb6LUdUI6xzKfGRLN
	Cpsg7GY/W3LhLS9WlEJUuVI7aOAOC+ljDD3IKel29slerASL551fcExWAC8WOJex
	Egcey6l9bgcc/r7sWqA0yKZOqenAGQVED00witEb4MAzEPDJ2sngd8ItJ9sXKu95
	ajIE1l3f2gCxavTuHLjPbOLAarHZwUPytOaNypGndm0suQjodP5YD5wPA7MgesDX
	I9jbCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujuug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 15:29:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so57607936d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881351; x=1789486151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KhxPlRqUMRagUmeRkRUzkyJQ3R0AyB2krXH1rMDJss=;
        b=REUrkw+NlGqwMyqD/JkwS7FGMgukQntqGnyqxFKRXYL5tqkTTEizEPJ+LolNcTN1rx
         cxNAu/4+oFVhEtsOj6kWueDnBZBKDRUHqWLfGgHyEdL09zK/AbiJNJnsFFnv3UWmkPTU
         33pcCy34lFSIiy1nnoisgWiSt0hoF64LCEdZBdQJw5wJ/EFguCpZ0muvh3ZAP/rtQhme
         32i4oHGpUjsVssRpovXAUFtgN8XVvExLnFa9mkVWGSkb6uuPUtkCeP1t3JFRyVeUyNzy
         gsADSloWLIQSPcR0o9ZVtFAPfygTQ3lgULC7p3wH0KW1D5K26i3t7bC88ADK4QJYAusO
         4V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881351; x=1789486151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KhxPlRqUMRagUmeRkRUzkyJQ3R0AyB2krXH1rMDJss=;
        b=lehj715S1uQqpG6m7x/8Oxd7VIlK5uO1pvGGN3nJVNPVmLZ9KFAEqz3B007692suL7
         nx30T/gv2Z7KyIV6ucHJ93BHKR6udgG0MXx6dBoEnk0BNWr7FLBlEu4s1yUNDm+yfesw
         h02jfqWK3hvI8L59EWQNDbABh0co49GFFBHvlsOL85JT5VraUcMMR4k01yX1ObCOuv6c
         JuRjvTb7lo4mYzvnSTMycGQC7y+LVDEQM0s9vCI4Xf9qA344Dtt3gnaS1985jsL1SaEb
         4qcPesHmFwFHMZfkOLYaLXoDdkg8aROh84wnbR+OobLcZShq3fQ/TvHGCISiRt8INWoV
         tkaA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Znu3E7RoZ/6COB3gwkE2Lu+EJW+thcD0AnNzHptmZL3gAwmkNKF4OfKbg634rAuMPhRwEEBNwKB8@vger.kernel.org
X-Gm-Message-State: AFuF++nlC79ba9c8QufQNXbbfEE+r5MJBkidjpq3OV+kOK2Fl3gbS6eF
	EuEzGlh6C/abznOtIcZ65Vo4wQf8y0uf8jPMQEpEmw4NZCZIefmqCayNYP5+FirKfThEbdY4hMc
	wuAGW6JIQZgEkjv0q5RJxflPxp2nC8zq/YFqJ/UbODqkWlkg0s5+HchMbNx7uJO5n
X-Gm-Gg: AYBFou0Zit4jcRKFQUm0zWPEnQv3/cJMIvjOVtXoYeF0fKHUZk5AsPxMnDb/hbqhRc9
	+KTc0X/roOwtW5jzIP9WJK3oJv6y/Osy3Y4KSlC0+EHWRv+IjOEXuBXnao1levQCpTw7qaqRVBE
	XgPRNnL+0NmWPiS/w33NY44bsivQ5l9YcJNgjmNyXrp2/OKkJgzsn5vGWz2rJZE56HJyX7nlqZL
	g2gPeSQCIMFpuTai9cCDsCkqxck41DNUqPXxnhamTB0YB3iwSGf8xh3kH1YhhqK741g9GCsqKZ0
	Oh8FOiUrkIqmXzFxXmmCky74tnom74RsuPQIEDjgOTepACf4owBwQOEztlnF+9Bfec+1JWpYLk6
	ceX1JuJgKqqW9Iw==
X-Received: by 2002:a05:620a:4807:b0:939:7162:911b with SMTP id af79cd13be357-93980400249mr3345338585a.32.1788881350738;
        Tue, 08 Sep 2026 08:29:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4807:b0:939:7162:911b with SMTP id af79cd13be357-93980400249mr3345328485a.32.1788881350121;
        Tue, 08 Sep 2026 08:29:10 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm31543528f8f.9.2026.09.08.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:29:09 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 17:28:36 +0200
Subject: [PATCH v4 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-pci-tc9563-aux-v4-3-c7fc7778292b@oss.qualcomm.com>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
In-Reply-To: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa029c7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=ee_2aqc6AAAA:8 a=E60cMIZf90sG3wRpYpsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: myNEcQSKeJGV6wiE00jXJ3wLGEiOUrs1
X-Proofpoint-ORIG-GUID: myNEcQSKeJGV6wiE00jXJ3wLGEiOUrs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX1kDuA6Qy4mYN
 UMwmgfPiGE881Y1AOfP0Qe94LMPF8b0W0r5QppWhZcAk6DGb0WhR/G5mZ4+vXT9BgCAfK6azuNo
 ta+beAYJDamqZSpLKZwaWQM+XDOJ5d4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX9ZPLCY5MPIYl
 4Bc9/FyO4kEpPlcpIwyhgk0GfQUXOGs5BDgQXkDM7gfql1uwt4CtLViJG8awnkn3SErarEuW3Kg
 uvdcbUDaEh035fu6ywBSsl95L1Qb4geDyOwb08b/eAHpLreTFea/Vf7RVRhP3XGWrudfdTN5Di3
 5uPE4A9C1gGO6arW1bO25ROWzkd1exmPtzj9X4stbsiwCzxd7Pd0UUuSk8jEwqjhxTWWKZaz8KB
 sRu7PisqZ0fQT3iseKCwWRprNyZfcLcLwBhgLR/7/jACul+J195QiB3zZZDBJ8yNK8IpldspoIC
 EpNknwap9DTXVajw0jPJ2IKNQsdtKgbc3GIFziomvZpjKxGs1NTgTdIQv+nWvBgV9crR6UB58KC
 OhoGgdo3JNaUyR7WbkCT0hwbpZMDFln/efKY3dvfRgGYscdOEhe5WjdXawmcWU2CAkgSRWGUO8I
 y+hxQHSfp34At6uMwpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

The TC9563 embeds a GPIO controller used for per-port reset signals.
Create an auxiliary device for it so the gpio-tc9563 driver can
register the GPIO chip and enable DT-based GPIO lookups. Pass the
tc9563 regmap to the auxiliary device as its platform data.

The pwrctrl driver does not wait for the GPIO chip to be probed. The
per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
registered, is added in the next patch.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/Kconfig              |  1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 80 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 1952ab4f29b6..38aab596aa04 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
 	select PCI_PWRCTRL
 	default m if ARCH_QCOM
 	depends on I2C
+	depends on GPIO_TC9563
 	select REGMAP_I2C
 	help
 	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 59ad219c26c0..3fb862105fa5 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -4,12 +4,14 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -18,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soc/qcom/tc9563.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -151,6 +154,8 @@ static const struct reg_sequence dsp2_pwroff_seq[] = {
 	{TC9563_PORT_ACCESS_ENABLE, 0x8},
 };
 
+static DEFINE_IDA(tc9563_pwrctrl_ida);
+
 static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl *tc9563,
 				       enum tc9563_pwrctrl_ports port)
 {
@@ -393,6 +398,77 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
 	return 0;
 }
 
+static void tc9563_pwrctrl_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&tc9563_pwrctrl_ida, adev->id);
+	of_node_put(adev->dev.of_node);
+	kfree(adev);
+}
+
+static void tc9563_pwrctrl_adev_remove(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int tc9563_pwrctrl_adev_add(struct device *dev, const char *name,
+				   struct device_node *of_node,
+				   void *priv_data)
+{
+	struct auxiliary_device *adev;
+	int id, ret;
+
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
+
+	id = ida_alloc(&tc9563_pwrctrl_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
+
+	adev->id = id;
+	adev->name = name;
+	adev->dev.parent = dev;
+	adev->dev.platform_data = priv_data;
+	adev->dev.release = tc9563_pwrctrl_adev_release;
+	adev->dev.of_node = of_node_get(of_node);
+	dev_set_of_node_reused(&adev->dev);
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		ida_free(&tc9563_pwrctrl_ida, id);
+		of_node_put(adev->dev.of_node);
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev);
+}
+
+static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
+{
+	struct device *dev = tc9563->pwrctrl.dev;
+
+	if (!of_property_read_bool(dev->of_node, "gpio-controller") ||
+	    !of_property_present(dev->of_node, "#gpio-cells"))
+		return 0;
+
+	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, dev->of_node,
+				       tc9563->regmap);
+}
+
 static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
 {
 	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
@@ -596,6 +672,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
 	tc9563->pwrctrl.power_on = tc9563_pwrctrl_power_on;
 	tc9563->pwrctrl.power_off = tc9563_pwrctrl_power_off;
 
+	ret = tc9563_pwrctrl_add_gpio_adev(tc9563);
+	if (ret)
+		goto remove_i2c;
+
 	ret = devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
 	if (ret)
 		goto power_off;

-- 
2.55.0

