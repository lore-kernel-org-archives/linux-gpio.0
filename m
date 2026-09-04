Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0348AE39
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542174; cv=none; b=avtWM1J0oBijW+zuvJL1p/YUL6KY/s0X3/TiQJqCM7j4JpkCfDixY1N4hY9AYNC520FQGqUUYvl+hTDC1fIcwtD9LY5XDN9U9h3jBzGSM1qlATBin+DpDjb/Go6GWF7HYUOFcBDhr+9PxJOkZZz1wmwOdxVisyUUcHfTotPNudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542174; c=relaxed/simple;
	bh=x7dRHrj7nC8wmVCl2DWfpnKP2LS8cd5CJwncZtshTtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dlFFWGIsylM0OH9i2+3W2v6MGm3KuHqLdlkCGARE7ooY3/mnjzD5J7dxsIK+gh68GuP5Eg8wGakpNaKtDcfpkCBDACPznHWX/VuS4r0ymcpzpJqBGJhCzdO5606hR85zmydFzoMLd4gYRCWW+mYbkah17pG6lOKqTtkrUOS4UmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B83Y16dl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heTmTYQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B83Y16dl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heTmTYQr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiUTK3765811
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 17:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jfdac7YboZcbgYFhN1kGke
	x5CY/GjfxDt67MCRr45lY=; b=B83Y16dlkOZHoHbNni9+ZDbautUl/9OTJHeIGf
	o6caHsrw6pl7H1dv1MS+P9qfup1fpsCI/gfoKgtEeACrk2+7ZkrDf/6oJV8uizPV
	J9qiMguk8HGgheaV2kBPvqU4Hx9lfNWsGNDHx6CDyEqQwgObfPVcYfD7vsfr/bju
	Bpdwh/UF4iX/MJ0UyOJ+fuWwWoJtpzeYO2w0c2ZXn818hZCW6zz1fErEni9K2duT
	fP2PvL+DZCk0C01AsPIEBGeKzNl6aq1jdhQsYV5kMclUCxNS7usaz8uznn8QE/L4
	max/5KVuj56t/WD+ySnJUbR8TZ39RWU7ZqM1U7gQvgHuYcVw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg012185u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:16:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c405d3e18eso1328088e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542171; x=1789146971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jfdac7YboZcbgYFhN1kGkex5CY/GjfxDt67MCRr45lY=;
        b=heTmTYQrgwRljHCMp5T7txvDm+15/edlirk7mchTSG4NNyXg62ZrfYA3ttmMTY17tb
         3k+0/gTROzvQVzVT50aQnyNvYxWnvZAj2p1gIvNkTu+KXeHetr9/57wnisuMEGWD2asT
         G0PjJofqlH30DWzYdrmICIlOlWR5+1cV2lerNf5sGK/UQDf4NaLq1zfXFEfNeErpoHsi
         zRPL2FiiylIrG4VlTjoz5pXexRHOxh/5rApPgLkTkyrg4q2qts39LWjzCH0nURpSLSrL
         YOoCE9RwIDnELSAYty2B9cCzM4tsFb4mdMyvxyZvn72Yu0seJY5/IMwUVkVT32GB5XSO
         0B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542171; x=1789146971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jfdac7YboZcbgYFhN1kGkex5CY/GjfxDt67MCRr45lY=;
        b=B9cd9BTPDlaZdxGQyxvci4O4CDmX6lXyqt8SZUys6HbPdcy7jDT58f7wxcLR/0rS/u
         vOTnm6xo5I2PseG1mOKkFVbO/xp9DsQEjIck3lVsQTFQtMOR/KHmxAK/mYdJ9KpUn2hy
         RrkLUe5hU7qOtKmYHFysc17xfRTO2YgsRIrbxl+0zpmgMkVtSZmvpbAXixgzXMF2hGpQ
         QbqNahPC6rp/KkDQBVYRbybWk37/xl8B8pZsE5+aDQPY6wpQDM8a40C3nDOPBMPd5V7w
         5DgVeOzNAgO1Y5MK+n0leduC5oUnhAlKjBPFk2z/Fkqsf1V+hM2D6A/oW+HVT+vkhN2i
         bDvg==
X-Forwarded-Encrypted: i=1; AKwUvBzbKHMVP+Y65UZLFoeI6TjDXNoniJoPCQYNjqIupxJKYQQyD3H3KyMrDmBlSYPHD8uy0QelCkY6fV4j@vger.kernel.org
X-Gm-Message-State: AFuF++lF1kCvRuwr9SeZ8yVWuTLmrMBeUtCR/IO4C9BPF1RZWGQF0fVg
	L2KcSieHZZFUiaEKoMAyFsZAa0coA8BJEAT+ir5CqUmTXMfXPh9FThLmW1ImP83xNRi3Y5dPB3L
	Xdqy1tnvNLmbrDp89wdTahV3aWuEMScLC/cX/ODAwIQKbpAxyz9rCGsi+lbtErKJc
X-Gm-Gg: AYBFou0rjGzS7blVdJqIFhcu4YYEydmPwToyUKeccUeAE3ygWiP3Q5PxXmKEijtdSEU
	yIfEufpyjl+rBb/zB/IN6Jx3zkTd7DikKVtLSM25u9LZDbt3rKegsPxAy20WSbqFBmw49c4JRqM
	sYVKylKtgFcg2h3iaudowGJyRyoxf8ecNS2x81TCWN3+fnaXJV5uOSHKYdLvU1kd8j+qGWB0z09
	uDvC5e6YQdVO1k8vDLifZP8yroqrHDxGVMquSBv481SNt0mzyylccj3j3bMnTon0qctzZBYXpKu
	zTk0z2h+UP9C4N9pqU2Zy8oY4pdLqZCEcfqs6+pvNEZ4agOhtdPb9aW8w1MPqL91UpRHyh3u3Ad
	F9fOUSxg/7NNpVw==
X-Received: by 2002:a05:6102:1625:b0:77b:28c1:210e with SMTP id ada2fe7eead31-78a4a6e7016mr2730786137.1.1788542171459;
        Fri, 04 Sep 2026 10:16:11 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:77b:28c1:210e with SMTP id ada2fe7eead31-78a4a6e7016mr2730765137.1.1788542171014;
        Fri, 04 Sep 2026 10:16:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm35516655e9.4.2026.09.04.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:10 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v3 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Fri, 04 Sep 2026 19:15:17 +0200
Message-Id: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSw6CMBCA4auYri3pAwp15T2Mi9IWaSIUW2gwh
 Ls74MYEN5P8k8w3C4o2OBvR5bSgYJOLzvcQ/HxCulX9w2JnoBEjTJCSUzxoh0ctC8GxmmYshGL
 S5LxqBEFwNATbuHkHb3fo1sXRh/fuJ7ptv5QkBypRTLAxsq7gUWVLcvUxZq9JPbXvugwG2sTEf
 hV+UBgoPNeCFXWRM03/KOu6fgBEX/oI+QAAAA==
X-Change-ID: 20260731-pci-tc9563-aux-66a29d438f60
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9afcdc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S8ISWd2nbyi9d01ScZoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX6HYh7glmZm4I
 tyBzqJsQOOVxKFXpmbMF9mH3o94dLjbu1zDocsq8M+ipIWnEATvHOxnkE/9vl4VkMK2kmNTXvmV
 sM88eFsw/+xVPP2k4xw2uYuDnBGEqAZqJBKkFEd1QxARNRdcUFssLk4MhYcGodpd635/PEp8V5y
 0thkxFFwxLVMPRaDVB7ntANn+JugbQyZ6J4VZWod2ig1L8WHFd9F4UAYOx+++7uGCbexgS1EmYV
 cX+Yj2fajmbttF1ZsbRv8SgZK+Q6+7++5obOrTOZPyW4hqLqTV+knPR4GeZ064WrK1oJtNZSLcn
 f+5FbMbRfyUOHUDtBdoVkoCFY04DUtEt3cqhhdWH0Ez00K1PbTFUbCeBH8WGYcwhxQzYhc6F28Q
 P4hSxMvcj42F4ickekjmOuK6VNlD5YdhpVH9OLQ3z7/YsK1Ipoq0i3voz3TT9P+H1X5QlV8mpEE
 VSMlIccxmdZLwOrvt+Q==
X-Proofpoint-GUID: F_YNbTHgh7qfN5yu2SbSziWr4OHuz6zH
X-Proofpoint-ORIG-GUID: F_YNbTHgh7qfN5yu2SbSziWr4OHuz6zH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXx6tRTycW6TnP
 XWsjo6ZOFdTS0bpBUsQZKWYxOfw41QaOFuQMmaR0g4c1GDDOhvx+sfqK1T+o2NS3nypWH45ER/M
 3lSeL/YVeS9XwwH0ElT976Js263eTqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040156

This series is based on pwrctrl upstream branch.

---
Changes in v3:
- Describe gpio-controller support in TC9563 binding instead of defining
  a gpio child node.
- Link to v2: https://lore.kernel.org/r/20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com

Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: Add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
      PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: Switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  19 ++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 154 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 294 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

