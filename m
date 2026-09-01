Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE739891E
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258521; cv=none; b=eQQjqMyF7G8c5NRagFRU9WTg4oU34MLethVD/+dfbYJMQWQS7Y0JJfygO9FhLIQvZYw4ZlDWtsD202RqHTUtjp1hgx3duHZdEkDK6VtBwPKLUAYjHn8k37tnpFXWPgoYasrZYGtlVNV5HVGBBbG2dhIZ5VY2YYQcsEs70kARfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258521; c=relaxed/simple;
	bh=WDv2cWqcgerf4rOLuZ3a1betGI8bkPDTNfMkI3Fnsfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=As5/E6udroHL+OQdG1QWxCWNjCwGj01JG2EDU6OossZ7u+rkuK4yxegFnmfL8K9ZxDRd5v4lazKbAYr3wMlWWWF0XRxeittrHE2SYXJVZ8TEW4YXN5JnUq1zjIAgi6BG2ssDDm0aMPuRMyGH6UrcmxD41EaTjaHUb6DKJ9GIXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0KBxcKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwRoxrZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0KBxcKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwRoxrZo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJprM2752324
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 10:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m8I06tVkhhPeVDAEZ23gzs
	kzzd1BaHp+2JxbIuHKZcA=; b=N0KBxcKnNAFWiyqhOxG5ZPRY4YkvBLccWROwan
	ylRMZxOqBObYvOidrLIeVbW715Mo+zznjWUi00M1DAiFoj8Vw5s+i0YLudlGNpOF
	/yMZNKyNRDj3IsPkkEoaj5QqxWnKhRfl58JqHrZmGklBYowAC0ZDLnnYdwYYhWkJ
	UtdgnZhdGiHZ+lYMVYU5vRyUX7wmRNUiadhgwtIluHFdk2KdaCZBBgBLbPx6HXQ6
	wnd3jnsB9/izICWtfO4evQW602XEXQaBjvVD22t74+HEunSbRkRSSEWM/IpwgntU
	1cD/W9HxCOZlJqIj+MO+8nRAaIZEEstsIOjgA7bJjERNP2ZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:28:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so734122685a.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258517; x=1788863317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m8I06tVkhhPeVDAEZ23gzskzzd1BaHp+2JxbIuHKZcA=;
        b=ZwRoxrZoTN/21fD1kI1eHlyGXx04vlOrSYeKiyYhToqW3u5M0tme9JquwrAOMlCptu
         hzdfKJF0J9P8J641DhIndyLpREWiBEGEZvwyer38iT33JykoMZvl1vsGdGfOCWiHRjKY
         3W3j+MwTzLIaQQfRP13YD2MXb/wbjO/vRbXcisg9VhL7w32ZHqvO3VxIRUeyiHhzE31X
         faJifxzJneRPrCmvVTYxKwF6pm0kR0ZHHhnJ3F3OrZBiavVGLsymUUkdSwrlJAf/RE0k
         jIbIt9MeZbuWu7okXX/hhq3rIcc9Hb6fzP/Q2yqbNkuQWBGo0AufnfkMgzWvPCzsqDmG
         sb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258517; x=1788863317;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m8I06tVkhhPeVDAEZ23gzskzzd1BaHp+2JxbIuHKZcA=;
        b=nZ2DbQu8CpFo7eAiN/0zWEGr29KgghVoyxLhckvaWd2wogMdklowx2cMAExFjUSKk+
         mnVy66U01tFT6+34Mkt//irgGrg3R1xW65hMAnQcgmIS3KkyQxHjCmGwJOHIodeeHdWx
         VYUfk5Z8PbJusr77z+rLeD2d+xUUmAfHTWGfN5AKdG+E9N0UeIoyaQB8S32fb8W09qI4
         pOTAIGPtQewisKqUb0FP7yofeBE/KH/m1FzCTC4x/rgP77C9pC8BAEVKjvkA3hylLtuM
         NINGU0WssPjbv7dFCC3GloXYOb5sMxc8PO4kbVXtf+HYG6a00K04JwlHDBbLUNEHjQoO
         4COg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7cKBFB8agOEwdSUvtEiZaremIOGd4lmHDH+GwyTGVsbU5BFZxYvpPhw7SdmFZ7ctiqk99fu7XSyRA@vger.kernel.org
X-Gm-Message-State: AFuF++m5wFeTxGfpXFGSwbPOWgVflheemmZR34GviGcDXZfkT9BqbzYs
	1ehpCzBWP9B+a7tNVyUssiJDdECRNJ1TGOSkl4R0heCqDPgfiF3sjqdwUwLFm0LMf5d3cRpPool
	lu+0ivf3xKwrXmg+Zfyrl4lgwixPcTAhiV7j2OjvX310SUJPC571xE+TypdHuvI3h
X-Gm-Gg: AR+sD12YbD3bqISTLWLGuFcyZOSr9n6YytgrssUCUgzYHU4hnkv4N9LfKr+jKDPAwDq
	JMMXJ3wLimCuMfmqpGoM1nx85gBO/jQT6Dryoedtc41eB/9r7MRoU5Z7SCEtCZ76XyGtIGekg6v
	Si7iif9WAwPVL6jY0k3Y0QJ8nZaqpkWLpj5I7neSvr9KXgn849ey/Iu/xoLLfHQHS5LGrm3xg2H
	vbFH/0mEHBgPd0qMWDXbCwNtteFGvlHUrkotYXPr4CaIw7TLMSeR72XmlC3fF0tH1Ul7EUdlK7L
	UWIcoyNaP7aA6acbg8x2OvkE5Oi8F6nDHTPxS4auIILCxZ3fNAwfKkQW4L+RSDzc4qiF163ztVW
	xvjE1wCiOT7WUTw==
X-Received: by 2002:a05:620a:4104:b0:938:fd23:1e29 with SMTP id af79cd13be357-93947f3f7d8mr920980885a.4.1788258517117;
        Tue, 01 Sep 2026 03:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4104:b0:938:fd23:1e29 with SMTP id af79cd13be357-93947f3f7d8mr920975185a.4.1788258516644;
        Tue, 01 Sep 2026 03:28:36 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm188966895e9.2.2026.09.01.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:35 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Tue, 01 Sep 2026 12:27:52 +0200
Message-Id: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc2ND3YLkTN2SZEtTM2PdxNIKXTOzRCPLFBNjizQzAyWgpoKi1LTMCrC
 B0bG1tQBIMXY1YAAAAA==
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
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Raakm-e6XsqsHjn135HHmpCrM46E2CcF
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96a8d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DaOxmBnbJEZ67lbDJzMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Raakm-e6XsqsHjn135HHmpCrM46E2CcF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXyqbE6Pm41iqW
 LIybnmUIwbxOFiQLksRHhZmOZhpgK4Qi1OTuTpKVlk3UtVYBRjKWHX9MNhap9IsvDlDkTjpBY9z
 vKNOL10NlCaRiyuk0EpcmLPFQga4NKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX498gFx2UZ1BW
 HbJGCU1xEA2ZV0OeOUvJ8duRGd0FrmJ368KcYFG8c9lb44W42uKDoj2sbtCZBuo3tfDVzJ6EhTN
 E3n1pug6AmcPZ/4iAIk2hPZDhSny32ongFCyB02F6BVvNBmFPypy3mHtOFFWojioksRY1vhuw//
 +ToyOPH59jeAQ4KwsPdkHmzQ+HQYoT3Edh4P/yQU5kOR+uouPKVjqUaZe5ckOURzESbIZC84AcZ
 XR6yo+0HzcFSkXkDLaP6nJNepAouNkKJXwivPu09cPshLh1Y29khJjgmhMssho9Gig2zAConevF
 D5wSpLWlkxvQ1q9slQ+ySKQ2V5n8yg5y64NRhsiPQDYq6z5Lr2TKnavwc0a68CH94u82kG5d9l9
 l4HOL121GRXtOnYgEXc35NuCLddtEM31nnmETeF2ktJuxpC2wEewL4/fjPr/Zl3ZQzYgBDthynU
 /zj6HZPOo34OXAN0dnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

This series is based on pwrctrl upstream branch.

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
 drivers/gpio/Kconfig                               |   9 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 163 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 316 insertions(+), 15 deletions(-)
---
base-commit: 550ecdbab0f51174202e7f9f6557673090bcd5eb
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

