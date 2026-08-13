Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73332D0F5
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610811; cv=none; b=imgl6YISHbMwgotpyg8Njt1whdJrqLmYjSb4XEUbNd91aVFJ5UF2uW+9wlGpAHrLb4tZrEDgzietwW7zzehcCAI7lCEu53xD7myGb72PVRoNuT4Jywi26HbGPcHemnOvVqev+0y5WGx8sU7U10iU6utKNw5mA5l4no6+acT9xaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610811; c=relaxed/simple;
	bh=efHjxVvbfrVhNaRgShi6fYbSF63CpaLDwINSCF59gfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+6Anq3eHcGxgwKj/r5KOejrMgXtfmjV5nFis9c7t8a9sS01SOy7sP162cBITwUwD5i3jYWEow6ayAa9og0wrzJKOh5QdDGao0MbXYtO6UaqNXRhqzbDxScMzaPUBkoOwTy+eiZD+eJ3GkchVXjTN4WlBdZVQUaw+uxdzeE/uPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlG7sCSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKQPX0zC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlG7sCSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKQPX0zC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g7YV1072457
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVs
	q13ulycA=; b=TlG7sCSHh0/ZDOnnn+lHo+GySav+Taf6TaG26zULmHK2ZkcLb6x
	eO+3M3b5CH0cwUPwekQqO01BZzr3gfs4f0ApHij5+i81ku9sLYOTuMNiW77Mo6Ip
	wifv+Fjcw3UyWMu6WJgbEYVJNqIcXuRPNEVuKvFmJLsNK1FSDqnGu6RCXSJsWhlE
	x3wfroq3gVFj38nFXN4XbbFjm0Th3pIHdRQgC6VSIHTA2JjYBHq7kFS2UrSFOeBY
	GPf5jfmAuNwwEC9tmrBkNUYGoqLYYbIdvKwxr03T4FdkH4PH+vTCrqb+YBvPwiIb
	Jm33bI0HuojYfgcm88yaCIyl9/K/AS6I8/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syhedy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:46:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so32885561cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786610807; x=1787215607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVsq13ulycA=;
        b=TKQPX0zCWXDWl+vugC7hEjC4NG6Ce/swxf3F5B1Y8vACAu638jshaP9b17+wAR/0yY
         8aUNuYwbDpucDB8+rVhkSFIPjzeNkfa6WLyFajDuFrMF/z4QLPxV4bMXDSyLRRpLhnRK
         rSKE+7uc9GE1quAgt93e047a35qZYDd2yF0ickUkTak57La5raahqEVS7BAQxlID30jM
         6QBnwrmYeeQQtRKHcWoO3UbCAE80WNBirPT0wgovE9on0MAmsL156wgyLRvpAlYE0s3N
         xKNw8qV2CnAjQS46joTi17AwCayZjsY/B1iEvUgfE5m8kPlo3oxyhHZkJfIQRZW2bQj4
         Jekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610807; x=1787215607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVsq13ulycA=;
        b=BilOu5jAvYHlrrzJoTZVvVnATkgSDghz8XWyYq5ypUedd3OVGpyBAHpnVMhptmQq6X
         ddWT0mdQ5jlzCInhyxAd9ikHggpA17YQH/p+zXq3QTLSi9gvDj60QJNz3/7cmZLClzB2
         PgYP5y3auJhaqBc2OJ4hmEVvauPI0HrQc76hAOZlL2DRr42pqY8zJrmq1ke/w1oTOY0N
         KUKv3N6WoDO45satGbWl3PsKtPljtt5AZFIcSQvrunuc/sCMHaSgz3HbyjoqpRTtd+k9
         cQ2GNB0GzknLL+lm82q2+DtJjpwxSgrLjWhM9udxC9Zeyt42mpe+6qrk/D21SoWh/C9n
         Njww==
X-Forwarded-Encrypted: i=1; AHgh+RrmE0KC/T/bgYXjsTXV71qkbXGzCCck9TyBV2rRkaLfJaY1+SpTOjX/tsYQAvkNofGaiDbMeoP+ws0x@vger.kernel.org
X-Gm-Message-State: AOJu0YxZf9Qj34dlzO76QNfFFJBlngAvOIABVkKV5l1Gd2hJAaCrbtOC
	YMhmleL+/t7WF27C2FrC133KLqnaWJ4w7qw9rU6nhfgTtL3y+jTBhJJDsp42CIixDA/RizvMJ2g
	skB/IMTzPQYglsWEzKHQnifmHuSabdPd4ymI/r+EPE3pTAIUZ5WDus8AOJxj2Yxrh
X-Gm-Gg: AR+sD13GlR9SKKvD73TMWONeLzWTEF81zYw4yCpgHI4iTcuyIgVZU4fEbfxqO48dtco
	PcH+QbqEeRqJudC2Gx2Va2+GPxN4dpZY+/LJvT9VeyyzJsdy2d2TVUHb6PbcJo4AdKh195Db7n4
	ZZFQx+PesrONP0cGT5N1b0UkuGeOvJtWeqIj2eu0rYcC8IW8992Em8QgJJBB6gXY+FFCZ5EPsym
	khd2pjzgNao+3wJkaXz6mb7myUDKAjOijwynkBpX4O2L9nffzwoAgvNTiBHmCxQmM/E6VM1PukM
	Niyys/oxZhtpO61iswvCMUXUsvxKHrRUrkL20q8a84jD+hiwzE/a2OCd2Ul1UDPmY3g8P5P6bmj
	YGKqOTUD2x3XH9Pb/Ryi6gbKGjr/7PkFVwQGMKg==
X-Received: by 2002:ac8:7f47:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52d73d2aa74mr40942911cf.27.1786610806970;
        Thu, 13 Aug 2026 01:46:46 -0700 (PDT)
X-Received: by 2002:ac8:7f47:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52d73d2aa74mr40942641cf.27.1786610806545;
        Thu, 13 Aug 2026 01:46:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2837sm4400146f8f.37.2026.08.13.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:46:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl updates for v7.3-rc1
Date: Thu, 13 Aug 2026 10:46:42 +0200
Message-ID: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7d8477 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=67OyyYhSLkYN1d6ZTO0A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfXxRi2tpPDuVbW
 OfITHZe80Bcqy2tXEKLPJANCUEgfwckTqxps61gRU/O5hxrQ2zXInEyfyHMdf0XSdkDvyKAk5Zi
 hJK/CdQHcOqud4FjgW/bbs8GmO5UfxRDsMygea97bgISwGGadHY7LkHzUyPnksGiNpb9occDQcc
 BcifrHGw7Xm4hMHnW86A4DYrqLuEN9fjYriIUKlr1f6bPi8I9cbS2bBgT+yi/baHHUoVpTebFTh
 GrMIweoILJnBFmNWCqNbWzUenrnkShBT+gvWwv5bABqdY7Pu3S7zIVxmzHhLbEvnjryhQSltsdV
 yDPMUN8ObedAWVcMojA4yGOGSevPzXLR2ggi1ASwMejbkXDmlglgsVMvVM9eTT/NCrzX3CmBg7J
 OpYb65igosH0LMtE4H9VslOskrC0FUqoW3xNi85pBkBdOuiCJ/NxSFs5o3DBKQrydZKiI19SmCJ
 dpifBJQXk8/8j1Sbcug==
X-Proofpoint-ORIG-GUID: i4wG-c0gmPREACGN5CBUH6A1fyKSSICK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfX7Vgxa6U84Ale
 lHmx2/D5SqXyMxAmqfWJ3ahAgvv65n8j21ugBZ3DDwY1boF/rtiFIiYAV07qC6hp9QwUbJjsGIo
 n7bwcDSysReGtIbvaVPb/CysduTbExc=
X-Proofpoint-GUID: i4wG-c0gmPREACGN5CBUH6A1fyKSSICK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130060

Linus,

Here are the Qualcomm pinctrl driver updates for the upcoming merge window.
There are two new drivers, interrupt handling improvements for pinctrl-msm
and some minor driver updates and refactoring.

The merge from the irqchip tree pulls in dependencies for the PDC interrupt
handling changes.

All of this has been in next for quite some time. Please consider pulling.

Thanks,
Bartosz

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-updates-for-v7.3-rc1

for you to fetch changes up to 1860fb0be224dec0e4d170f46d1cbbc77e25e09e:

  pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip (2026-07-27 16:24:23 +0200)

----------------------------------------------------------------
Qualcomm pinctrl updates for v7.3-rc1

New drivers:
- add pinctrl drivers for Maili TLMM and Elize LPASS LPI TLMM controllers

Driver updates:
- acknowledge interrupts for the PDC interrupt controller in pinctrl-msm
- implement irq_get/set_irqchip_state() for pinctrl-msm
- add support for a new model to Qualcomm pinctrl-spmi-gpio
- drop some dead code from qcom pinctrl modules

Devicetree bindings:
- document new TLMM controllers and the new model for the SPMI GPIO

----------------------------------------------------------------
Bartosz Golaszewski (2):
      Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-next
      Merge tag 'irq-chip-qcom-pdc-for-gpio-07-07-26' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into HEAD

Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

Hans de Goede (2):
      pinctrl: qcom: Drop unnecessary bitmap_fill() call
      pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()

Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

Maulik Shah (6):
      irqchip/qcom-pdc: Restructure version support
      irqchip/qcom-pdc: Move all static variables to struct pdc_desc
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip

Ravi Hothi (2):
      dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
      pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

Sneh Mankad (1):
      pinctrl: qcom: Avoid assigning unused private context in test cases

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      |   18 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 drivers/irqchip/qcom-pdc.c                         |  540 +++++--
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     |   40 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   63 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    4 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |    3 -
 12 files changed, 2300 insertions(+), 128 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-maili.c
