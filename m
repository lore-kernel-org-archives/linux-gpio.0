Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF80477280
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258526; cv=none; b=MfZeW2fA9phEf/9fnvefTrzuAkCXGjLQ9NVmayhCm4JiKBRh6E9fJh5MufleBTCHRVpWXa2Ts1yNZLTsTkzgOnBQmhJaxAuuhuCnCYPllljAUCXkFXr2MMRt6mV1zK0ARdbYKa+F0TS/fH3PjeoA60VrorA7WbcwQ7kOlxqDLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258526; c=relaxed/simple;
	bh=dPSsgYpE44DjWYiRgf2uTKTF5w6V5cl0L3RhLkcTrio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTHPxR5yQRwYDPXAxZvY8fFDtunIdz2GL1uuH66/yEFb7xduTdNkCzZWlT/x+r8vsV+Y2CiOrj4VXiLc0HbA5ghR4/czld+JwH68uVTGuWKS/03x2l/A0NQiccu/uTxbiQVCT94rqdPiyd6E9EbssMybG2Edf1PX4+cepFvO6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/vYkALv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrMBiS+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/vYkALv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrMBiS+X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdhn1713054
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 10:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFwvOqZL4w8bxrrXh1tBzXKb5r9ExtSKU0KswpasHnA=; b=k/vYkALvD2lh/UfB
	d/3CApuBh9+Rj/4SMorv1GB/d8YS1Xn8vC/4EHKGOc6EIF85ZGOQk2ht9XXpnXFl
	kS1fsxk9q67oh9NFfLSb/ahOJcFQhp8xJd87pVLQN2MuxmoqyhDvin6vx2bLMyT0
	mcimXgADlX0Klb3aiBNoj7hQYTxpwNAH1LO5ig6lBpihGSDUp5pqQck8xkXWYgL/
	+YCA/8izz7jE/9aTLmqZav0+Mg5XVge8cTzw0D54s5CTWEQ/x6wDdrtfh6LgVdg4
	aX4zFXboF0TLS+lztrMKrAtdIL/mexTpeHe/pZqm7A7k2aGhCMVhEfmvz4eT3P28
	/BQL5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa14y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:28:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so668766585a.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258523; x=1788863323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFwvOqZL4w8bxrrXh1tBzXKb5r9ExtSKU0KswpasHnA=;
        b=hrMBiS+Xd72wf9VN9oLmL+lSrWde8yvMHKYSA2bkOFs+soao2FuicGkworwhUw9HZt
         kugaLA7t+dSoothqwVbiECfYrJ0C87/NHNwxIaoEKYEdM+j/yhwlZCQsYlqePnPhKx9x
         UY/Zi5JEbTkZ77li//o8UEuLlNIruqslLH1+ucbV6XFr9gBPWW506l0t8WcdLA6tCp31
         kkgiFPrK7f+WJoW6k+KijLIMauDSuX1/JxacDUPHj1ZWms/ukY/n3e2yAdRv2VRjQOMd
         eptlnvfT+ZcMNBli+bn3Qck1JKETfkLS1cCHlkukXOvz79UmsfI+ubvySMu5dM6ugLr2
         gcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258523; x=1788863323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFwvOqZL4w8bxrrXh1tBzXKb5r9ExtSKU0KswpasHnA=;
        b=fbnGrTdA1gRYh+lqudP8TrjbVDv7N9NtrrkrmFd5A9crgY19y6uhhiOpd2nhaYg2w5
         twiL9xJYoIOBLgWSlWjd8pNY75gS1AWMcLNI+/U1ekN7bmm+2lOPYUygYmDl8000zVTU
         TCzjYk2EwB0OR3OAIfKMOzmrwHbUL6z1XmqC2LKGuu9n3lW022vmBIinQoZ9rIo9WhN3
         /44vJ2OZpEGFakrkGyqTqLPUcjmQ1aPBZXcjCXCTNYRvnELEEa4pVfmphaJr2V6V4lPf
         8rJG2xbcilCKtllYe7JZrYm80mx7IxvOBhDAYLjvjTPS7RWQJhjPN4zo1mIOLgQjXiej
         A/0A==
X-Forwarded-Encrypted: i=1; AHgh+RqEOZ5HGjVisw8hip02q1yTlxTS/X99cvgHy44t4JFwXBubGIa9pKwCgu0pHrfGoVD4q0UnVzTJcA4o@vger.kernel.org
X-Gm-Message-State: AFuF++mx2uloBU7m1XT/QwAZlwIVyKfDMZV7NycvhEn9gndi1eQq32LI
	UE3/pjFjc4i0/rnHbkylaD+cMiA683Gelzhj8hUwTyb+lWqofniCQUc2WI66g7lgoogQhi3BAbW
	uswBVCpjtBDhNoiIf9PD7KaqmDLOhGtfn+F6IySV30HsjbcV2TTR2HChJ9fTzWt/o
X-Gm-Gg: AR+sD13SU5J9dd+NqxvdCzmNr253B01xw922P+VQea3O21K69aCnP7xmVB6XSrER3Da
	suA9dAypSdBSnwAXMPqazDTQRWcNjCz3jfPo0ILRqgXXMNNQW0pGHeKxK4OVtUESiPC8F9lsDh/
	NCd5Gb49QscjzW4v8Fl+wrlAr+IDqVVzkLINtvoHzY9T+7q4BuADebyyGUgqdJgYWjp4JCBI7G5
	vwRB813TnDnk/6pqMdT2ex0Wr792iZWUtW9bVPXzrlhJzjeYNZ3MtEhaP/Hm5r+u/3//UWBb+/T
	mOAvqHV8LFZu2oRAgQvoToeF2r2YBC2zX1wNMsIfxbtM1qZ7SzJofkf6zn+Ugi95/YiV0hUtWOp
	SVOlWC8NHq04e+Q==
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id af79cd13be357-93916f64e85mr3542935885a.21.1788258523038;
        Tue, 01 Sep 2026 03:28:43 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id af79cd13be357-93916f64e85mr3542922985a.21.1788258521727;
        Tue, 01 Sep 2026 03:28:41 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce11b00sm56362005e9.8.2026.09.01.03.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:40 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:55 +0200
Subject: [PATCH 3/5] PCI/pwrctrl: tc9563: add GPIO auxiliary device support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-pci-tc9563-aux-v1-3-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
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
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: f4ByHEKmII1XB33LQK7bqyPhHhOGZWLk
X-Proofpoint-ORIG-GUID: f4ByHEKmII1XB33LQK7bqyPhHhOGZWLk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX7LWAEbqmuzr6
 gxmjqAfxaYhWKsECvxvfAr4q5HIRLPeyg9IZjA+oXlXY8PwF9xKedeP8P23EiknE1gp5eDRLmzz
 Z8TZW6BBoiXbCcY32UE+59qwrLGuLdA=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96a8db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PJtxGifwbofezjXE9ZwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX7FR2ra3TRLiM
 lddLvngBQ6x80x0t+rGD8Ajdt2uo+yaRnShmRx3znW/1NBtlPYGFd9CTbm6uSw1zPB3mvN8Wj/z
 hmx+oC4SY/LpajaERmXvO6APa69RHOr/DOK26fABsN594qgqPc62w2GKv5RsVjtToM+n8MFBVzn
 gkwMIW0zFMaJJK9Mwwg3kQPNtoESLRsWrEdm/0ommdnjKmgv72q4hyPr1VAS6iJzKftvJqK1OVR
 cWKGR1xQbaMQFanDAE6j2MjqOs6yWBiSFh/XRyYQtYPluo9MQ4LttU+d32i6Kg1c55jYWDrW8wI
 TVcvyCa7GzkyCZgY/ag9aumTxN3bSxtRM49E2YX2q0w8CGe3mJoO2eGhumTpj9QekWGw8DWe6tI
 ImHYKdg4mqULQCELd638QGhXfZsEpAbYQ5JPi6v0QOgMZJ1CSEOhHEtCwtapOzW7AuAiHLrO7uK
 Pleq+1JTtu7oSHc+JlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

The TC9563 embeds a GPIO controller used for per-port reset signals.
Create an auxiliary device for it so the gpio-tc9563 driver can
register the GPIO chip and enable DT-based GPIO lookups. Pass the
tc9563 regmap to the auxiliary device as its platform data.

The downstream port DT parsing loop gains an of_node_is_type() filter
to skip non-PCI child nodes such as the GPIO controller node.

The pwrctrl driver does not wait for the GPIO chip to be probed. The
per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
registered, is added in the next patch.

Select AUXILIARY_BUS and GPIO_TC9563 in Kconfig.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/Kconfig              |  2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 78 ++++++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 1952ab4f29b6..a07694fae0c9 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -30,6 +30,8 @@ config PCI_PWRCTRL_TC9563
 	default m if ARCH_QCOM
 	depends on I2C
 	select REGMAP_I2C
+	select AUXILIARY_BUS
+	select GPIO_TC9563
 	help
 	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
 	  switch.
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index b0d8912690a2..ee9c26b8f5cb 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -20,12 +22,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/soc/qcom/tc9563.h>
 
 #include "../pci.h"
 
-#define TC9563_GPIO_CONFIG		0x801208
-#define TC9563_RESET_GPIO		0x801210
-
 #define TC9563_PORT_L0S_DELAY		0x82496c
 #define TC9563_PORT_L1_DELAY		0x824970
 
@@ -393,6 +393,71 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
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
+	if (!adev) {
+		of_node_put(of_node);
+		return -ENOMEM;
+	}
+
+	adev->id = id;
+	adev->name = name;
+	adev->dev.parent = dev;
+	adev->dev.platform_data = priv_data;
+	adev->dev.release = tc9563_pwrctrl_adev_release;
+	adev->dev.of_node = of_node;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		of_node_put(of_node);
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
+	struct device_node *node;
+
+	node = to_of_node(gpiochip_node_get_first(dev));
+	if (!node)
+		return 0;
+
+	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0, node,
+				       tc9563->regmap);
+}
+
 static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
 {
 	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
@@ -565,6 +630,9 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
 	 */
 	port = TC9563_USP;
 	for_each_child_of_node_scoped(node, child) {
+		if (!of_node_is_type(child, "pci"))
+			continue;
+
 		if (++port >= TC9563_MAX)
 			break;
 
@@ -596,6 +664,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
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

