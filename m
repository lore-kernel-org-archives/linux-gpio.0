Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7A56C62C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965817; cv=none; b=MWVa5h+mooaeHlpY+P/quLa6MhCfq5EblTzWswZXQtYd7HrAlEvG6HmYfi6L5i9jKvxyPMFYM66xiOS+U1fjA1RXvTXdqYAZRYzJJL7wqbTRd9sm/e0TeyekbQsB0LYmZTnxu5wqs0JzZSwQlA4+HZOq11KY3w/hUostnguYNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965817; c=relaxed/simple;
	bh=4OXN0Rl1IOzPKZW/swSOZm42BNSE5v5u4Sg55/zk5zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JxPAePTQ10I5vC4x4xMLhMpDwgA1Db3fPDxJq2LIU3xXb0gKay13CDtfvGSt21tWvKL6HdOEXuRa0/RrEVWMepurRqHV9kX/ku5Xsmz8kCvGUOVzpe+bwaM4N3LXvpeKKEABttlmPvWjEypHOvBkLR0foCdYEG1ERJOedOuP57s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0YpvMx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuevT/m4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0YpvMx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuevT/m4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoVTa2698515
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wp2blfNSiKAYO5zA3+biPV
	ntif31YKgd1gEoQ6yved4=; b=d0YpvMx6l0iCCXgDnDNtdbNlXIovDRKG02Cwjc
	AD/UMcp1AtS67+GbZ1/lBCsNMFrXTkcxfEDjPSP8Pc4HwcJnXy0zQ5eQSeEwrk//
	t1gUcPRU+Cn/wKQm+QdauHYiYGtVhiW6FGPPIxrf0hNpbIb2AXPhISMmvluJXHTb
	PZTpE5R6au9Fl4rBqzImf41rYBiu5ORPm0LONzrxIV4EpRd+8wG4+Q+N+SECOb0d
	q2lbH/38+XQSMgbiJ80XtcJRE/Wyj0NIBlSw4KS1HfScaKvE8MaUHLnp/09+/7Yg
	GV/AmrdehkqZecV2/ifE8gkwY4LQCMo1YEmR2GxWeS9GM6IA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0tmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 14:56:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78bb7517525so778684137.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965814; x=1789570614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=EuevT/m4NUX/OxgeT3HtvxMeglhbclGPlj5TufBdI7qV9RKoS/Oh7KKcbRnW/3om3D
         N6jRC4tw46J7y9ZM9hyvYgBX8uavs5rrh0pKQEds7q48MKLc7bHXn6nKobQtmMgwD7b7
         zFVsfU/J6EiAnHMV5/oQ3sRLhLy53H/05m/GT1eay/cIAtI7HegEZ6hnRaxfELDf3/0O
         POhktLOE1yq8zqq0OpSj+hNSNqlaeDIJuOr/SmFdHLJ/k8nwU4W8R13hwADHCZiws7s/
         +UYdzYn62gho1Bivgw60pqh5OnQ23cdGZIcyL6v7KbyEtAJ3motQL7qdnLCezjH92uQf
         tptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965814; x=1789570614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=Sio0bzjxaxFO2eqjrfX1sKlONtRmJBPjGeGAhL//UOpZRdHRqHO+KWwTw+bMDHFOL+
         bOsOP0rHCSi/upvopAmjpWbTalGu+BxyCY8ZzOm8JAm6JdEqBIN9KeiNfGAZfaSG1qwY
         AbUyVOi80NBWM0176eCbAPxscJeA8B6YQoKSDvLKVff6VkesvSpLsa6RdQp/dfJKhosp
         SZWVpxN3InUGNhwMwoDG7LPI09c9eWaCUm39dQG4z9+ITSFHHTFhX0hdl6n4tos+k09a
         noVIOYqL0BNre0Sa7IvnqTj6XLyVRDB8Rj07qrflMcoKQ6B8++2Qzhah2yb7t/D1lA32
         R4wA==
X-Forwarded-Encrypted: i=1; AKwUvBzKqfK72LTGnxvgTvC1MbXmTnSZf0DZQEFO2jRcCABuUP0I+6k9uDKZYw9JPSPGn71XCrMI6MU7tHUk@vger.kernel.org
X-Gm-Message-State: AFuF++l2rW25luxgCspWgeqAKdkwFWo4adHM3QLmw0RT19i2Kh/7FIpk
	ykg4VViT0MFUCyL/+QD7AEKdzLbiZU9FwTSjk+KwL+wtTdbY+wTRjlGtzODZwGjTjbOW3C7f5w/
	Gu/DezfaltRI6ls2XkJBZd4OBQpb0IdN/6SNi+t6/8AY3wudcCoYLSVvtgClaVPix
X-Gm-Gg: AYBFou29H+IHNslqWMZQ35hafEnIaQlrK95+j/fkMofvaKa4t5q1+wEp08p8rHGL89f
	EomXDiZMgXmp9/1JdWmVpZroE2FbamNsBkwTlwStWbkZo8RZXYDLU/dfGOQj9bChZxbbaegfegA
	HTeRQlOKh0oPDo92xa3euoIuYll7psFGHCDgOEmaCMxP78LB+m42ZVHa9E07StmYNpvCzzrj5YN
	IvpBhKVeZSd0kM4QTwqgZ0gH+y1xTlb9awlrKKLa8oZIquHSksmmnV0K7QBegYMmbvG00Q56Pha
	N+sfer6jwHJo4BqogX6mSuzjKbZBb0wRJsNeFOtMc1G5NKLdKo4pcUocRy8FGcr3502PPpqRcw4
	gd+Kj3SRMt4kLBA==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893460137.6.1788965814457;
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893440137.6.1788965813982;
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm47846131f8f.10.2026.09.09.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v5 0/5] PCI/pwrctrl: tc9563: Introduce support for embedded
 GPIO controller
Date: Wed, 09 Sep 2026 16:55:52 +0200
Message-Id: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSwrCMBCA4atI1kaSyduV9xAXeVUDamujRZHe3
 VE3hepm4B+Yb56k5r7kStaLJ+nzUGppzxhquSDx4M/7TEvCJsBAMyM47WKh1+iUFtTf7lRrDy5
 JYRvNCB51fW7K/QNud9iHUq9t//j4A39vv5RjM2rglNGUXLD4yGbDNm2tq8vNH2N7Oq1wkLc4w
 FQRMwVQETJqUEFJiPyPIqaKnCkCFRW4lC5pCB7+KHKq2JkiUYmmicYYCw7CD2Ucxxdvjf4shQE
 AAA==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXz0PMGRFJQJ7M
 Ev5wQ9bA+DQspSLYkoobTluyrnCwORmF21n0s6eXu/Eav+d/IM3a0CnX2ldx6isS51mqw44epI9
 JJZam4AUjN2gFtVeFhMttpaqttohiYdbTR6+j8C5FgoGMxpnAEL9qXGUaxCbmxPNoRCNu0SKQs1
 12kx0tUB6fL30O4Z1M1QFqsC4KxhEy5brbUYc2UKa2Aj3XZBDSGJDoCZZEgcSIgqbn7Ig1xgdp5
 fm9s9duyBmoAexmWtE4L17PbD49pMyZVFmlzSq0+1tT1l83pl6nf3KEDDSqv8ANg3xr3b97HwmO
 HifdnkajwujYbkiA9BeR+9iOC4/bu5X4JnkHACUsbWA3Ks9aWKuYHw+HcnZZLEjMAwrLtjU2dtl
 D/HHCkmXqNKA6kiAoKcYre3ZtJHYM1+pCvGsbpeI549W19E8rJRvXezFIhmvwNOAFhFctITv6iV
 vBQZ+CUSNDqfScL6zLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX3BWbW25L8KvK
 GEMKENOzkfM6l3Tfy+iN+zKdVXg4k0fhxiVyQ2rjSz/fNbIYVhoLc2qVReZoFJ5kAzK3jzfwrLD
 zy2j01WiI62FmpQp1zvwgmTtmKxlTJk=
X-Proofpoint-GUID: QPG_liem5Gv0uZ7NYNmSimgQCRDLojD4
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa173b7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0QktR8YAgtX1DuhF7UA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: QPG_liem5Gv0uZ7NYNmSimgQCRDLojD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The TC9563 embeds a GPIO controller currently used for per-port reset
signals.
Add a driver for the GPIO controller embedded in the Toshiba TC9563 PCIe
switch providing 37 GPIO lines. The controller is registered as an auxiliary
device by the TC9563 power controller driver and accessed through the same
i2c device.
Please note this series is based on pwrctrl upstream branch.

---
Changes in v5:
- Fix GPIO controller binding for Toshiba TC9563 PCIe switch.
- Link to v4: https://lore.kernel.org/r/20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com

Changes in v4:
- Do not always use 0 as aux device id.
- Link to v3: https://lore.kernel.org/r/20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com

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

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  14 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 300 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

