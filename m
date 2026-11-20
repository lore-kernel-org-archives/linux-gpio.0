Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180670;
	b=uWk+Bn85fMsAa+Yy9WXN9UdF8qqaWJGNGSGRquhgBihUkC4rxWu3fJsZPtQS92rOLgUf
	 bLTIDo+5/KG6I4MnZ7qaPRJAaP7J3GGHRdriytJBZHH4Rky0XaQfzuIOXRQVzujfKupsH
	 EbQve0vsTbTBCW0FJVUjNFfmzRkxZwa0w+SS/nYuz50Q3j7LCLGqAPRJUn1ahcdlHWV8P
	 6pXrImhUhxXWO/oyfk3Mgs8iGL5bq6bs4B88xzTMFMbREHpwRMhL9SngJQWKwNe/AoaZ5
	 xpipOYSKNUh9rt6OGPFk9XzxPUJt8EyCPf/Z+1weXZySOtuE8AuxA0xuNG9uPUShRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
	b=QGlevnJ63Vzu345qG4m+4fdzsW68MnYLpwPQYuhiDeXqd5JAP6fAk3G/ffioMyMylJct
	 vYfxqGz3AscecZ6T197hjyZHyXxx2RmlIgCa9gi7OULabvQuCIJndHrqHbxCUT7n1GBJ8
	 XuvjqNEe1j2O5bJjzoD1ikwS3oK1P6DxNatOfUnmIbGGEm3eZN5hKscbd6G8JB02IbwX3
	 Mm2DRt3dMNX6QqxzwVZGdYr0dxcScWGxGorIlQGz+/m4hGLXCLUF/yo3PcTuzR4EParmb
	 eGO303gxDDRS0pulA9YanbIq/nV/qK8H0FmgGxRKLpgERAcdB4ePp0PQJdX+HrZPjOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DD60A2602
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80DD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrBY3731042
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5
	VymI3MVE=; b=glPkfccAQkvM+KwsJiq8EGJow/vXlIrm8Y3+jclO016Qe6ONnae
	ZKZ9Tv4zv2t+LlcmC+3Q0Uk8O4QS5y2jiIZ5vr8S710K5N5q1hTVExRgO5ErbenO
	A/mZjx2yjTUwpXz0/7Hfig9g1UsfusNj64wwD+N2RaSU7LD4pSt/+gksPO5MQn5X
	6sUR7zFfDS4Ob+p53WaeZsWDk+TTuboT2hcv1Nmsjrpc828ktCVrwFMbaalQUAds
	qKRWBY1srGLtan60fJzFeQ96X6bHpCYrIO9K1DkMdDb47gdYLb/Rau8IxHpyX/G+
	qtKShJle/Ce7dYnInYxjamGJ2WQaYdES3DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gk1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:17:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso371828185a.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180668; x=1795785468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=EyP2CURkZsJg0CxkAXvJJnDEuWv8IfaL1K8doDGNHEINRVgLw9SAThGIoEuOaM1Oag
         7B5uRgjOq+bvRwvm2EYfdnhbjVSYFIVukoOYlwsPvEKEaznO9722uqTGOK29ZCz2lE00
         0UuPdhXrUqbaQf2cAcEwtUnwcMK6fGevx+91unJLbcL99mZU/x/++tmVsiePCaFsFwBr
         u0VPmf+4wfF9y1HkjR1347jmW5nX7MTbLyiv24D9+VR25TUVtFWVhhSQ+0rtXVoPlC/h
         qzTj0fmVVVK0zqjrt/4mFBILv/jNhbFTLDUokxsYk0vZHYlXSUBPy3PyuW9/zssZTyPY
         frGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180668; x=1795785468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=TmkWOBb5iHn6msEj9bsBCJl/rQfJYuQ0oAVEr5doPde/kJprrdh841tEcLtP7KHrVh
         MB66UFyO8G5YBhDops3gzy4XIa8bpQg/8wFa6d7xrK5gsRwOX4RqnKQsd9LU0ZBA00ZK
         UHneDz4FUIEB90pdy/ExiwaFcv+qqQc6U2hKOQ+ISzNvheRKdsNosvvSrbuemf7fy2oA
         FAGjeIAd/fmXBVDTZz6FwhL8EgwRVIH9P18Rlth3pVBdgtsk+fJNet81kKtc8YFfBX+5
         m6/Iwf/sEUsK1fACSL/m+yDIilu4iO+oaT/fxWwVItk0QtyhAd5v8CffRqbXr/aPFvV5
         C0mA==
X-Forwarded-Encrypted: i=1; AL+hErH8zh53TGYQpMH6TUBDQVoWhGY2jLYbBGAsZ0i7KtUkvY6l8+O9cqfvnIyw+ajFtJM/r/foz8uno9F3@vger.kernel.org
X-Gm-Message-State: APuU4Z8trSRyqVaWQbsyjSMELeONZml9+XOmoZzj3UtbhyflJ1sbQrhW
	o7l0q9olzrGN9aXHr3cloIGf8OOHj3lDkmkJW44xLHP29/MRQ6u9cDZ85CAAnYkM4gCxtbLg7Ii
	nt/2XIsJebLGqhoAzMJbpPoHw6toQd2X7u1oVyZvMIrQNqAAyZRtAQ68uQheiaZnq
X-Gm-Gg: AYBFou04vWZUNGFTdmME4qQrk8D3weD+M0XqjOdtl5x9Y18hTD0h6IcaX1ID+Huei5U
	ep7z/nb1QnOFX0+M8owqS3s8EtGBmRSPPPS6mhZAfEJO89D9RUz70HpY51sOYNjt/EtUl3PI1y8
	F9ODZn3GYYJ11lK2wI8gI3xWFWZAVffnMmGcugvUA/Dg8FmOnkduYNJsCtZ2ogJEnZOg8Iwg3Ar
	aFNYNxysTXtmsjR6OmVFmy57qD3x2xLZEriNlWhL25hpW1CZHvkQSSS5bYNP1n4/gJv1OwikfO0
	DI437n3ngTUc0xmXaotVFyrxMCKSSRHZK4IGecH0NYoQ4SSaJWMi+eoCwS7rI48yInQ1PeVkcD/
	WMKepLvjJNexHZCqUuci/vEw+Q82Gki6dtPX4crpez2HdwT6EeA5rORmp1QdV2uJk1qINzgiXoB
	Y=
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696169985a.33.1795180668251;
        Fri, 20 Nov 2026 05:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696165985a.33.1795180667760;
        Fri, 20 Nov 2026 05:17:47 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm5489060f8f.7.2026.11.20.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:17:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 14:17:43 +0100
Message-ID: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HMN3TCsmzvyYi64C5CmpFvUwfPWzjnqp
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00487c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=Cb2_Q8YfTQsDjjc_npEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX1gzXjsHYAvgd
 gdMzbb7XDT6ybNZ3Zp0yc97AJ44ohMAHlaogw8FqBkk+KP8cCbSZVF8oPIeVhf2mxp5e4tUhr4y
 qPlzZic1iKvdKOtPXirgVW3kUjGYxb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfXyoAQqcJHPIJ1
 m6nHxfjSSbnAOr+QXbdqGcSvpGf+vD7NdC32TVHlLT7MtJfFoUxdo5Qv06OBFIOrW44nQ6IjJYU
 MHxPk6YUyn1xf4s7JjTRvjSVMl6il/A7OapfxOl7nkXKvWMC3BcawmlA1eMZVXZWR1/Expc0nG6
 2pKBUlWmV9VMsTbl74TDl1Mt1CQoLZ8UWPkcpjXJS87FMwhwnRpQRG5gojmfoDT+TtrKV762dI/
 p0FPopCXOBTCL8ezrosIo9IH8I539EzAieElIpdJ57mDIyPyv2Z582gtFapfL2bHChbL5sYHmA0
 1xmQoVRhyZu8cGbQsYWJlkVvG3gNqM0gOgOGCg6lwAScbaAI9FbSRylk4fD+HusWsaxuY/r0MKY
 kV3GKqqxLJzBaG1QzlG5wgvUzoibbzo3yZYwC/KvRaSi+YIm8xOz7sbhgy4vtBocqfMBS/vUgjt
 tIVAgqM9myNJHyRoNrg==
X-Proofpoint-GUID: HMN3TCsmzvyYi64C5CmpFvUwfPWzjnqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200052

Linus,

Please pull the following set of fixes for Qualcomm pin control drivers for the next RC.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom-fixes-for-v7.4-rc4

for you to fetch changes up to 21d7ff7d6531b3420727539f04470ddae499592b:

  pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied (2026-11-20 13:40:36 +0100)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.4-rc4

- don't cache new config until it's been correctly written to hardware
  in pinctrl-spmi-gpio
- fix incorrect pull-up reporting for non-i2c pins in Qualcomm pin
  control drivers
- add missing dual edge GPIO IRQ errata flag in pinctrl-sc8280x
- fix a UAF bug in system shutdown path in Qualcomm pinctrl drivers
- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Bartosz Golaszewski (4):
      Merge tag 'v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-current
      pinctrl: qcom: fix a use-after-free bug in system shutdown path
      pinctrl: qcom: fix incorrect pull-up reporting
      pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied

Haipeng Lin (1):
      pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag

Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c       | 17 +++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-sc8180x.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++++---
 4 files changed, 25 insertions(+), 5 deletions(-)
