Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAA3F54D2
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422029; cv=none; b=LzmMXpG5QAfzQtJbtTIHlP3M3hieqz7PwjvKI1Fkg7HSArT5UaBqCk079hn0Sr4fgRfH403ciPriGWItL8nHkonAd29Gguu5oTuFZ2GWXrSD4jnUeeELPwlFFgP7EIh7SmDCBK1yzpR4OmTWCfga6C4qGSuCgUU9ViAsYbInJSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422029; c=relaxed/simple;
	bh=AdPchfXsCQJMDBk4lR6KMgXheIpXggHP0WxqUt0lzGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KfJ/I6Y2A7HqKr+Pach3wvjNhLbMRnVnyKuBuahZNd3dDp9xLG0tFN8Fu1q60KxS8RqiS6paoppSIlINsI2m387K/o+zz2sapPAzqknDJklloujCjSZAKa6eYfupLIcyhKlpxFFpodkKMDELaY4ethgSk6hONhkhe6tF1Xxfqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRvkp291; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdR4ck15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRvkp291";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdR4ck15"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lZA23749594
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 07:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhA0v7+rttf/9iRNLvM4UJ
	HnE3oXqpEsh3RJGJCDhJk=; b=jRvkp291gXB0U8Z1GFg2yYuYYMkbo/dWuNrXBL
	g/zyp2XD2qrXxfX52hKYnMB56ZDO9Am1eHhi0/GKEnFFBVqg+Sh4NlrjVeFmKYpz
	dsOOzk3QpLlV0S0XY+ycDeRs7/dftfavJP/vSFoqfr8DayO7NeOQRc+BqCpSoEAh
	WGHX/jGru9/3kUrhShRxSsyeX5lRv3sizriG4RYCRw8n2+sR814KAMf9ZGUJ3A7N
	so33ZyHq5o9zLOrbQchbrMEpU1spTVBQ9qB+8UpiqT1M5GdBQZm/diSg8wWDh37g
	4OQgqOjDEqLvOzAhDhGAvnToM40Fb8w5dzvWW1VegsVhfVjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5uhjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 07:53:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so387149185a.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422027; x=1789026827; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=TdR4ck15AtOlZdJiBx9BtoHIc4Y68GIi1xro1sBZ4luBSgFtHyKoJhlUKV8cpA7h8n
         ei8VNBnppTsrSmWdXi0JXUB5JcTyt9tZrDkBpwQ3wQyD9i2SQVxvh9xHJSdBhj6nKjnC
         t7UwO28xJtqTEf/xYWQgyI89d0Dfr9n71dGCE8SBlRoDJX4kfu+yRoUPdIhawjqgwJpP
         zHggRzE589h3iGlKrJgTZ5k3ZFdqKAE7b9hKHxhegBI+H4qA9KbZephy4wkDeiqKfSdu
         5sLXxfDZ5U+gT2oaNu/frnmB0rAMDi8lqJQ84XVGRfpJDEZxPJrraV9tBWkYr+V9nzp2
         dHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422027; x=1789026827;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=l2PELZsp/gUXs3tS9wpqRTyPWg4enIoVTW/H8oqOovx3U7TNMJuVZioPj8hipjPzpj
         e7tGo81NF/2afoddEq2T1ywBqyYfLeep8U8ZHkwGLVZHCZMrZGAMg1KRs5BYWnV6Fjfu
         pr5liYc/5lMeIqNAOmD+DYitc/4CDfqOhNKwxslGTPqSHjEvnUeaMYw6aGVHuO3AWv2f
         4ciAT2YzgG/sduenDa9rbg1PdKCEczadcWUd8f7MVdcYv2fUIoVxsAoRK/gXpYud8+9B
         Pktwmu2D/U0k+O2WcgokOF1ApipfYDnZbv5bsW/Qxl91AXgQvYzzh2XGs2hhfLvw/miM
         DxMA==
X-Forwarded-Encrypted: i=1; AKwUvBxEh4+ueQ4x2eUNmLetujzoqZbfhM8Q50T/jCcFlUoSojx1kwg/jx4w5KPa6UzJrYAFaSCOtfAWFr7n@vger.kernel.org
X-Gm-Message-State: AFuF++mxkz/jVg5lEwA+YZFTrMYXVfC70he7d5VcLoRrB9TLi64aB4GU
	XlsaoeRxvtrmdAC4OGZcLtSP5IKGq6XaMJLZQkSgeCK4/sfq9CasKPiPI4oR38MKgg6uKIYEaGj
	vcuc7xyFcgd+rXlM0ZADBTIXw5NWfwf1lMwBjqnWTh0rjP/SSeVBnO5q+JCWu2+Og
X-Gm-Gg: AYBFou1zib8sp7sBp7+U9mmCbLaMm+HYNtuwahH4g6/kDU+g8/4LFY+TKKx3TEroRLg
	jDzGVWowGIKjCYWkDodk0HWEUPeDKkx16NUnRcShh+FUJXntXf1yBGSodP9srPTU6Kec2SXyKhq
	MwKeiehBAm0wKW7I4IAksNvnpapiEDxkGRReugDAo6ZalEYRRSjy1q9crvutxyqc7dHeFUfqZa9
	l5Pu6yWwuQEdaK3dthF4N4ro55dBC76zg0+8pJKv5N++Wi2FKJ4lVN8qjYtW8CnSV0spbmTYlfy
	Gyq6F2UPhSNSIoazTfAyyPo4hOppYLXNPLwZT1rqMmoWxQWoXYUZ7FYri3GWVJRbqFN5Jke0ITw
	IBjsPjltlWNoZgA==
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226694485a.13.1788422021561;
        Thu, 03 Sep 2026 00:53:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226672185a.13.1788422016377;
        Thu, 03 Sep 2026 00:53:36 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm57232225e9.3.2026.09.03.00.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:35 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Thu, 03 Sep 2026 09:52:56 +0200
Message-Id: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBREr0L+2k9Kq4Wy8h6GRW2L/EQotkAwh
 LtbcelmkjfJvNkgukAuQp1tENxCkfyQgJ8yMJ0eHg7JJgbOuGSlKHA0hJNRFylQzytKqbmyZ1G
 1kkEajcG1tB7CW5O4ozj58D78S/FtfyrF/lRLgQytVfcqHVWuZFcfY/6a9dP4vs9TQLPv+wdh/
 2PSswAAAA==
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a99278b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DaOxmBnbJEZ67lbDJzMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: j0S9LeyNXi74tQoz1drNKmbDShcaXzF_
X-Proofpoint-ORIG-GUID: j0S9LeyNXi74tQoz1drNKmbDShcaXzF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX7uF35u/V69/P
 30FxEwHqXqE/a+BzTekc8pxiT7x3vdqVIFX3NaSuvpQ2wOg4Ml6HoGIOL/4+ctLyPUTPdNCCRrQ
 fcQe3bpWUrtEMH9LuZ6s/JFwQDDRRd271639uM3cEsOO8E62T9mLxTgqXS2O9o8z6Pt/uekmi13
 tLCHo9V4UUtPhEW5agNVxWLy4xGb2LYbA6MbUKvLTBuQjrh5WStA0cOlivvTKzPAXLIe8Qby109
 J58rgK6pB4wjx8dN/Jex0M/IPwIWG3bGd+PUOBA6iAGiQiSDTxm3+ZB88MTdd3Mlal0SdiV1alR
 MV6xHfP3LUkwkWwX1Xhx3LysFCS/pOY/H9q711NGR4PK63pQbi8cGe/4PniyKoB8IGdNPkfiPcm
 rqPtGgVaV+o/3Jb2Qs5S69b4wplFAFBX1zdXxH5xdAsGELSfrDOZyKGSEo4NV3DRprlrUcyP2Z1
 9VJULw8CWbzSivRAzkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX/YfQ5VfQmqZY
 gMMfpyGwCphTrdMMOnd/hiSnY22ANHT2F9AKFtjqrQkeD0BkZE3GA+aJk+DowFf5Fs5071kbINj
 xZU7IfSrEe3+Xcog6ziIoucQ1durVJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

This series is based on pwrctrl upstream branch.

---
Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: document embedded GPIO controller
      PCI/pwrctrl: tc9563: add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  31 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 319 insertions(+), 15 deletions(-)
---
base-commit: 550ecdbab0f51174202e7f9f6557673090bcd5eb
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

