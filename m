Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CC32B130
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398110; cv=none; b=JxFhIRBTnlf01K0Otf7k86pJqE+SCCnVUhrrTtotwWHKR3RNTdjC5sgxwLrLG15TmhAC244I4SIDQeJx5hJ14oes0AjnZi8yJ58L6jBwv3iTBTxDEjmBTDn1U7RcnJ0mkKgUsI3hlTmQbOzBUNggsYqE7mbJxl0ibSZ9676/p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398110; c=relaxed/simple;
	bh=xpbeott/c0v2tNmBRy7ksMTZvOQ2zp1VkozVc/bGQNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYeEL0qAvVGkslKYMqFUZR0zMNXWw5I+BUcLrJ/tiSVUFi7olTTlTAAu5srUNkspNOJS6i8Ew9ry2cRCUI/KJ3vXQVN7+Yo0eTYrIeE+Kj953otrwnfIpWjdaume1ZkcQzNiQLDSG1zSRePmsSbfHVzZ4b7X7s+DjpTZ1j/6kmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbmkDDpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMWadtZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbmkDDpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMWadtZh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aiwu270666
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6
	yXy7s6bw=; b=XbmkDDpp51lrgyg7d1lLqnJdT1ChPMqC4t6YfSqf/avTJLRetl+
	Hl35q+cyEyUxX1RXiZd5sR/FYDcjhAJFVkA++F4Q2ii5ZRbpv2H5SADtzk1PejS5
	x1oMC3cGHO3Row/rX0xF+Oke9wWV3pR/Qphpj4b62wLhlxzsqcSzCI6UKmGLIoSK
	2UVq380Q6Ud5OF5PHNa1SFIMwaZWqdHK54RKrMy2ccBI95RgoTF1FMCMWqnr0wOS
	aBiiombHzDyAHdWl7db634Aqa5iZ0MryLPrGiWVAfoqjTwHH+sZStfPqGPUqDu4S
	5Y9DW8sV1OxaIpU3CNfntk2+SV7eH3+jJ4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr1c80c9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:55:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so18109391cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398107; x=1786002907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6yXy7s6bw=;
        b=FMWadtZhlRwc3RfGgW0PP3uZmKHf6TNymL6w/nHmtq6ISLNRVg0SyGNYd0SV0k614O
         GrCrjtVfp3vkxAayx08ftRb+Qg8PMUmn10ZOeJqyS0toELrV3Ppx1WREwjMlZYjsd0U7
         nnzcOgkThytFWjy5ns9XUV8W7zURG9uAwUkXg+ScuXxI6animQHzRAB/9Kq77Eg1J4fE
         cjwpFfWKW+hs6RW1Wh8Q5p9UUPgkZ32lDed6A53qi0+tqewMIfqCe8ocUyN329LZsEen
         QxPOtbliXDjQoLMvlMjZOATgG843dumkWnKyp3pnurWSTQuwmQ2+dmX7YyoKFi0HZCQ/
         o9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398107; x=1786002907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6yXy7s6bw=;
        b=AYu4pb+1iOz25SE7HQbS3F1vzSWklxHtQomEKIyTgewkZVvx98l3s+KhLGtzdt0gMK
         ucoeLJ6X+Ti5ZNYpBQjyJ823T2BxVKgMgyLWCm/oC9A3G3ymBoK9/uX3r47DAPfOj5Sv
         vH4J5vZ6R6ZMtYTqoj61CVXtIk9tkhCPV/qn01OkFlzBrCEybEcoFKCmqD2kIxmWmWB6
         PQTlJxw6fbo0loFvQToevwtX/aVPM3kAn8MO6frEhqk5bMyAa/BbYnL7bVtpi15aPdY7
         YuUsCrHYZ7d/RFQDJ3lJOF5dJ4S3nhj8hBw7GLiU5IiTfP5+nWQw3YFQnvcyD9DMt6si
         0P+g==
X-Forwarded-Encrypted: i=1; AHgh+RonwQ9Dfwqd3PQ8Ultlhni03upoe2ZcRi8aO/oV9+VtnWlDtZUScLMhovus2shDd7hHzpOAkKMvXpR1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1VVB9RkFm2LTb74oo6QpbI6F1hJ1M1QlTTGyJji4OrKSWkwJ
	qkH5Afm964L4fvjOEqib5Z9OMqZY+ojYMpc2G0UEQrne6ftRwWmmlnMw9IP+lWcs6+GP964nc5I
	NfsClJs/4xFeq8+aRKHWjN2hDKKjO4gF+qBJpaQeT16lIipuCm6rxXItCGHoX8a4b
X-Gm-Gg: AR+sD12gu1VDPJrj4e4zjEDEnRICHgAJaRK//mXVHcr8aOQEKuR5+1A6H250JvmlHu/
	2Yhn0/2nwIlR/f29ErPg3sd3z2kIAsKaTMeBG4TZgsi6FI7YnSosyl3AFQXc8JLpKKrnu2gIdcR
	HcwEIDysyKRyqEKt3Npdxe//+9IS3KMLBHQn6qNlGrFWMcGEMub3q0Hoxcd++haZauD0SyqfH2t
	yyupmSsjL1NheqLvtQ8IYIJxnEbJaAgE1tAUmFQNqCADxEQiDgkn7c1efhJKVEJeTpbGQuzIyxU
	4Q8rpyAPVWkPP1upvg9/Os/qNWN+AWTAkWYHMQ9pqaxQpdi++gza+kSWVJf69tvR5DXL6cvJ42y
	tgrPlcwM4g+a/s5Br4mrDIzAw+yku
X-Received: by 2002:ac8:5acd:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52b384f2e71mr17311271cf.32.1785398106871;
        Thu, 30 Jul 2026 00:55:06 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52b384f2e71mr17311051cf.32.1785398106383;
        Thu, 30 Jul 2026 00:55:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:529e:6fba:4bc2:e378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010bb0e7sm36959025e9.15.2026.07.30.00.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:55:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl fixes for v7.2-rc6
Date: Thu, 30 Jul 2026 09:55:01 +0200
Message-ID: <20260730075501.7653-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lv7m3b__Lgj7OviZanBeUsje1Bh1odnK
X-Proofpoint-ORIG-GUID: lv7m3b__Lgj7OviZanBeUsje1Bh1odnK
X-Authority-Analysis: v=2.4 cv=EJU2FVZC c=1 sm=1 tr=0 ts=6a6b035b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=s0bWprLixBiu8OTeGpoA:9
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfXyRzog6mrv/H5
 CsVLZjOc28F6oznVQOP4lfP4c83AHOQRkq6gM2bNDEMhsk81xub7Bah/y4tL47F/0sjlQYUVqBs
 7lQlKXvOjOCH/iYbiS3zGeLQ2v33l+EPCEwRdc5WpcECNhsUWPNwU6V2sLz8B1QpjeQZT52rTBV
 IEAOUxq5JW6NFpFut6vzWS599txbk02LBScXJRnJi6SiigN5ZNierHxIMeEPFMXpzwKHJohA66r
 p2weIpb0ALir5Kbf8JfjNyj7eE0fbukJajtbWvMINnrHV76PZcC+rAwJBA8FzL8hdEZ/4s6vUmY
 nbRVKxDq9xGsSO1vKXPTFohDXAewdobgqK4ZuOVxsf8aK0fiK3LSqkJGQh7tf9fveGhKtr4qjHO
 W1ACWRdpuYMxSJCui2Mox5tpvlN+aRlZkbYhMi5YuW4Y+QsjbUrpYun6JJu0x7mQfXV/y7DN8JD
 3QnScwAAaJmAG7JByGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfX+9sOayxLKK9q
 yNLjMR5lMlQ/VQ/szZi6wP2DNNxEaH2MtKOvIHEJyBtoG8Fp0wFWgbP16br8IFrvS8Z79f85W0e
 sqF+jMYSVza21RLgPMVJwlxTO7dufBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300055

Linus,

Please pull the following set of Qualcomm pin control fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794:

  pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151 (2026-07-01 09:22:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.2-rc6

for you to fetch changes up to fd46760956509f580f7d3d25db4de10e7c6f949b:

  pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function (2026-07-28 11:11:20 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.2-rc6

- mark gpio and pci reset as a GPIO pin functions in pinctrl-ipq8064
- fix audio_sec_mclk_in1/out1 pin numbers in pinctrl-ipq9650

----------------------------------------------------------------
Hans Ulli Kroll (2):
      pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function

Taceddin Sancak (1):
      pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins

 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 8 ++++----
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
 3 files changed, 11 insertions(+), 6 deletions(-)
