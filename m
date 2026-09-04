Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F25511E70
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542183; cv=none; b=AU/bSvVFhX+eRtLbzIVEfiazhC2Z5AJ6J/T3DkRraiPtl3HdL4VYG0wCjEb1XJXarbSMCdbn+RGv2AhIe0nHXhOtVCMIsY6u9nmn20tLQqGWZRAOTUR9Gu/WXOywiNYqx/jgUOBUfl6Q1jzzX44ClTVMQnoHg0yxnB0OZG7uG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542183; c=relaxed/simple;
	bh=1qkaC+SKi6ebjg8W4zfhbN82drHkn5e9XxLCfI2QoBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkmNukipvQ52c+Kv3V+ni34A5VejIILK2gd4jCMGCNvv9mUp2GmItuRLnBzJcFaYH5AdEEZuFkaaWrCm7kin1RkdLSpa0JKD5rfItRgJK8+NZDIttIh4k7X5Iug5rSqQ5IUYNDI4SKUKhuM4Oe5RDiTuLM3hP7bypDrvnJ1bIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbGDodbO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrD0LC+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbGDodbO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrD0LC+Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiSIp195844
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOYswW73NvNcE57fqtVbYPutsNDkW94DD5EExUv1nQ8=; b=BbGDodbOGNBy//pY
	bYrH20qVapt+trxUfJjXMiTp3q6XYXRUYY8ghGiAV7kyHGioBMhAnXf7p6gqI59T
	dfSlA9gVDP7znglkxZ27erp5Iw/M6biiY03C8VN8i098ZAYlfR4E+IzE5E0mO6Zf
	cuR4POH+Q/wch1SsIKqtI/R4F4NS6tqtdUX+GdcYjpeBoOKKHqM/DJGKa3c7EJUU
	QyR1TPapJBadAZntnSR9BSwHPTyH3r+ilVO+P9BMzJGREJky4mKMpirUaku094hf
	mogXExm5/bIShbE0vdcIuEu1zrCqVrKfAL6b0bMDjEL0g/SOc5tJnEK/avyXtjdH
	G4rNNg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01214vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:16:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f72so1038791137.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542176; x=1789146976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOYswW73NvNcE57fqtVbYPutsNDkW94DD5EExUv1nQ8=;
        b=RrD0LC+Y0h2D3mdC9JBYHVVd8lLfpZnHyC/c/zebD6L/hBfEU0TQ2wr9rih8fKY9ja
         fC69dTsoKeB7JWe07bMQPFpeSwzST7Ozc/Ix1d9o/rUBnVPV+wbAKRcQZ1oUgUAx8cc0
         1w1dkk/tFlobTllH3aV5KwwWupYH3f2a7CqanUWCctdBJ8gNZM9ah7T5UkESJQMLKeYs
         4/r2YhQ9JSnueqXc87Z+aeowZIVsAYRc7VnhBPWtWoFzPrEaFvXVR5G+Xu+uy31twz+l
         NJzJx+F+/83VsYPEcy21Pkft6ShD1FqpLBxVR1SvHuw/IxeJQUHCw+9IiRZPp0+Z7unj
         9P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542176; x=1789146976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOYswW73NvNcE57fqtVbYPutsNDkW94DD5EExUv1nQ8=;
        b=tA5LnnNCgMmDeucrYc/e7l/bwL+CP1L/4IHwtyKQx71l/ctgSHeHXqesNpDo7VvRIZ
         mOnUgghyH0FAoOjtWud4zr5YcY3i3j/vJ+mMBvq3/8mFpXwIb8GTT5yF1ItSb4hkBv+P
         E09hIlxDkoE95WT0j0eEZOe8abxuCftoOqLrUdWo4WjsSH0H4RdpPaeK3+QuF9ipTXRi
         lIJWUFtqtU6B50Az9cI6ytlGw/8NhKhwgKdA32nrq/mQ6thZ63JqY0WmdRs3KjO8AWhj
         6CVoNjcUZN8PpN7J/VJkcRMX2URoqRf6QC5cp08CRqD7T+XtVHPW/oWYpNHlA9ynA5ok
         WxMw==
X-Forwarded-Encrypted: i=1; AKwUvBwqQtHemBaU+Q9JFZHuXzAxA9yROhVA9neGyDp8FT2IDSNim80ZcLa6Tyw3wzLN6nrlNd3QP+zepH27@vger.kernel.org
X-Gm-Message-State: AFuF++k8Z8aArHTQ//JW0qx/jMPlgQJZKSJv2AqLNypWA7rNUhA0SJf6
	AZ66FpL/wHYUBUSRoBE2Q0Skdq4lDE2nwaNWtp3ye+o9doPOJ1U6rTrKI4FOK5R+SAQerGWQGJP
	vc83+tjOcxoTmREhqKDzf+GAFSX2f4YmlbLW7Ruyx7QhbcrIMAFlnFfnXAmEgdsq2
X-Gm-Gg: AYBFou3lbDjZKFMe5zKZGPBSdTWZpQQk3Q1C2v+rLseF2E07Gm8tz31ZlQmzTbPRdby
	fdJBNJt8u6UPCM/iy7I9DkdUDVU1xOXUCvxYWK1A0F6wOWSCTXmbd02tLFX5mnFQvXPOhosGXDW
	u13IDkPjCSlJimadtRHmguqn+jlqiazLPSCcqrt+YGgp+X6Vp/3RR20VXamGLRXC1j2nTbDhJUA
	s7dSp2/Zgd4G3ttfJx1cAUf5zNeCkXJgKd1YTu6oBkYnyuhF442vgTuv4oEqyTNeQ38GqJRFOmO
	4rr5XBnl5Bzna3zSdveC42O+GEdV0GdNujw6CkQ2P2/t65fD+xeAGmRhwqah1UcycYUu+7yjh0g
	Q30KRjWT5pzM/Eg==
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr3110640137.10.1788542176250;
        Fri, 04 Sep 2026 10:16:16 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr3110612137.10.1788542175806;
        Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm11230355e9.1.2026.09.04.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:20 +0200
Subject: [PATCH v3 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXws8sEOOTaUjX
 HZrwW+N2DdRw8ABfYS2wEJs749upAamMwYGWGayy1uJgYGtT/eNZhzF5qgwftn5pWcU7UWrLQga
 OFJBvKaEAmr3NHzd54d3v/fqGQoykkY=
X-Proofpoint-GUID: 6x9I9gupIQhMXqNJdlaRy-Bodtq1VVZM
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9afce1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=PJtxGifwbofezjXE9ZwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 6x9I9gupIQhMXqNJdlaRy-Bodtq1VVZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXyGB9nmKddj1K
 e2djGeO6ElGNkcetxvrKp2cttjIOncNjvCJFbpRi/fFZzmijtLqXhe7WT7O0bDO9cfFH8GFenGb
 MW+YIenZ69D/bmWMopCwrU6W9CQMSXyB0uwRqh9GCXve2W9rECATVYTsCQFYSrBm70OfDLmpgDi
 zVnD7QgOIJfM2mlchvgrVmVJ/Nm79/n/c5icq0/tQ0Q2vDo25NPn7RFWX9GMgE1FKQiUmvNigGj
 XEXURTT7TtaLtaR/TIgDuCGaxgtj6S63aId35d7SCc19MPgDwW5kPBKRVHItQpJeb89iYPuaofG
 0D1Rg68oQUgZO5IikvELpsp7/B72JuJSp9Njgy5zsNS5t+rk7NDwCqayj1/N17DU6a3oysejf96
 /3MdIKtyb3lPhg/JQkhfVrWztw1+ki2Sm6OiBTRsX0zJlhXBSM96DR9eidEk7VRhHX5Y7JwXBxU
 8aw58KlMlU7psqA1HCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040156

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
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/Kconfig              |  1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 69 ++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

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
index 59ad219c26c0..2230765950b8 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
@@ -18,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soc/qcom/tc9563.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -393,6 +395,69 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
 	return 0;
 }
 
+static void tc9563_pwrctrl_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
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
+				   u32 id, struct device_node *of_node,
+				   void *priv_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
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
+	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0,
+				       dev->of_node, tc9563->regmap);
+}
+
 static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
 {
 	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
@@ -596,6 +661,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
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

