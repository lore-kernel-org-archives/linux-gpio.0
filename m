Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815E47D930
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450457; cv=none; b=XnlTidoL6ldjm+RgDZrHpJxP/fscOgvxP60sh/+pEv543Gv4X0fMIY+Lfr7XIRGqaTJI6ocTQqsAhZb7sZxSAUB1yz3YG3lS839Pta03XS9tamcYCMZnrMJIoKwTiY4TVCgEqTRFQ+OtEMhqCExdoJqaFHMjt4M/fBLN1hziSww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450457; c=relaxed/simple;
	bh=eS9tx7B9389Jw+H7bYOrrb2gd0fjio6YDJLF25PI7/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQjDJv9FHsvfGoY9w3V6Orkv5U6M0hSTYQ/d4/2d5Maggq1XT2Gp1lOdIrzgrGGj7hoIpQ3Zy4EYDWHGeosBwpSawV+FC0AmhLzR7dq0I3wrFKxsFFSKW5U+4f6PA/src3fvntZUilgWxdBM/opFuCg+ROrtoDfpHFDTmSoSFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOHhD6xg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTrOz9zV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOHhD6xg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTrOz9zV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987Ka7k1170062
	for <linux-gpio@vger.kernel.org>; Thu, 8 Oct 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQKMGCTIIP0SOPrNW0TH65lQQERMYReGQFd
	R0qVI0AM=; b=EOHhD6xgtI3XaJoG0DUI8FsBJBqSh7oU44LhvvVLSu1ZjxZ47ye
	HjPpYLUo7i4dGpmHL7lcZElqYjOrSN9Z1g/LHhYP647Tpzu1qusAw1aiJLIIMp76
	6D0zeRkmCzUMvtxeGmW/85y4te9hVz/V8J4B9UqyPPgs8zecclv12+ncYFXRH/yJ
	TjROnbytYFYaqVy+aEcgDbleUkwS7ux3viyG6F440SX/m/71r98s6jzvGb63/8RC
	cwtnW7bapIF1SFD87Pv0sKh5j6csjFnd0ryqEmqBKB9E2cVtyDbzSV9z4Y20Btro
	1rOmUlld62K9UpvgBO09jlWUhu9DNPm1HIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a232-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so880850785a.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450453; x=1792055253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQKMGCTIIP0SOPrNW0TH65lQQERMYReGQFdR0qVI0AM=;
        b=NTrOz9zVOkftaE+fpGMha8ZZ6GpkoPXFYL50N2v4Vz7mKXlAVUSjIHh9b4Q3dK5KBF
         PYZf2Gtgu4Rd6GWXvvDbJ6zByTdYMfFmK5e1FamQKFuzl/URdyu0f90pEdI1Bb4h+pAN
         CvFwa9LUsWUVPBzYZLQD0q2ZYe60eFgR7TMTbgSbxF9+GHkykvMQ0FkeR65Q/N/n4q95
         wcdC06uMoXGJ45nuYggUPsi00M5QcsBu1du55RmFYM+PK5Wevo2qTtvLRavcpEpQjfF1
         QDfZVDJwv3bYbLf8rVk640XcEW+NW2gosqh1tnpIhZInoLi37GIWzXtKGYeaHKmaIp78
         DURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450453; x=1792055253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQKMGCTIIP0SOPrNW0TH65lQQERMYReGQFdR0qVI0AM=;
        b=kLq0I/toUrAavbBHNACW8azRLZVSsAttzYHcN18KCt9KN37wMkNiwZh8+fvYyDVyQX
         wkNz0L5WQx5WkhTtR0InMvct1ohbkWJk/xgmYyV/+salH3qY+20bNnqPOBgrDGSNkyO/
         ih1keMSPs5PQpmVy+l/o1iTDZZnErc+ktfmrXjNAo9IFGTFBAf1rOnWbigf3ina2mVIs
         pO1w30Z8sfelobDpi1v90JbMwahpW5yxWRrD2zwCglJktkY6KOrxzEDeb5uY5UDdDNZc
         Ghjwi2FmoklmYlMwbnJ4Bb9LPwauITfEq98arSv077O6LFMTZvrlZp53OXJjtXJcKVWu
         CcZA==
X-Forwarded-Encrypted: i=1; AKwUvBxzZjinLGP567TyS4KcL1e0F3OxdJyx6CZuSREMbT1CEwAZT9LEsQhgbPQsPJYanxgW29CIx6/5r6MD@vger.kernel.org
X-Gm-Message-State: AFuF++nH7AQf+xffwDSFV/VNyLLz61I36wrrBcVJYy1R6wcFtPKJRsiW
	4tASSYUbmwKGp8NN/Vt8Vko/gvoGwW/P62C73C/2oePquRx166bss0ZbfDXxALhPwAnFAMtU9VT
	68zQ2h6weCVjsjKUPgMW/qDz7HTfFgnj8RVNjg2Ek+ZwauiLdDHXHarFPqDhKrlbZLj4qdHUO
X-Gm-Gg: AYBFou3WO6Jkzsz00bmSi/y9JxjV5KaAIoboAQuSd32kId4K/gjsqTSG0dZn2ZMbQmr
	0CoQK9Q5NSKSLQM0bl1Jhv6u4PHeww13PW/cWk/7PDGd7MR1DgdZdX3eQ0Xv7hIH5H0CjcD6AV6
	LUKqjiTls8QSmr1VwPq4hpC3h+9c7uqMs35MtarCXgV0r1gHh1aLNIxbfRN5edy3ik0ajj4PJGv
	Q8hdoHZ1N7uW3tsISG3QxZoNZxV4DvWJ1+ZI5Uj4tT/ts0Bsq8TkpyY1Nld3Vc1xGOopgLQwzTG
	zmsRHcFNlQubsuvobz0TRkRtvmGxyuacdRSuR+EjzDm3qmAh32ihZXAqN2aGuzX6EOshVOBEJ2V
	ahCJ1O/A4FMR/ijsAR2cxinicheVhoGSuZaPVQIuktZVTgA==
X-Received: by 2002:a05:620a:4048:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93e9b8910dbmr958713585a.65.1791450452679;
        Thu, 08 Oct 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4048:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93e9b8910dbmr958707685a.65.1791450452125;
        Thu, 08 Oct 2026 02:07:32 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffbcsm9669440f8f.36.2026.10.08.02.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:07:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3-rc7
Date: Thu,  8 Oct 2026 11:07:24 +0200
Message-ID: <20261008090724.5423-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HD6juci3f8tn0LE1LSmAZKmNCeS2vhCK
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75d55 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=__NLv3j47UhbTv1Fh3MA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX1nGAKTTNu45r
 tVq2FNgk/l/HC6q8wxXckwf++/AeGXGqAlwfy7EZNLYGA3p8GJkQwikzMl4YWJIaVZPDaU1oOOg
 ehjyeRTxN6qfiFMhJKZsMvUWsClzd6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX+72hyQGKzu4o
 13YRLxSLUiZ89ufPJwAIiyKOXSo+53RkQEc8n5ZeZWMOi1N01YpcKmhhsTryGIw1UvZVNK6nYyN
 lVQ1i9RpsbSUE6lVBkivbkQuB3ttXruiN4P49o5qIO/qtpzaENEMKQT1XeC7FplqCBcs84mwd1d
 psUn6Bpr4xdkMOpduNkePnEHTBEO9pvSITwC83SdkJYTpamKnjk0EJ9HaGUPBB3DvS33O9xOx4L
 CvcEebox2Dd8isJq4dQpnRs54Lox3ni2s22VDES/73zqztvEV1nohJk51L9aqDO84fXH+hMdCKe
 B/nqjo76zYzyVzwc5V23ousvRGDB52sVRMZQQ+Dk5X1ZglVt8g71yUcXvAGiZI02DaW4yUjbByX
 ULyqJis56foo19M3xTBCNn4vCtMTxOxpOib+5Rd1Ta+nf1ZAvi8cizle8k1OrKiyBqocfBNg5qb
 qVn7tecNdI3JYW26xEQ==
X-Proofpoint-ORIG-GUID: HD6juci3f8tn0LE1LSmAZKmNCeS2vhCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Linus,

Please pull the following set of Qualcomm pin control driver fixes for the
next RC. This is based on v7.3-rc5 where the previous set of pinctrl fixes
landed.

Thanks,
Bartosz

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3-rc7

for you to fetch changes up to 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a:

  pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12 (2026-10-06 10:05:09 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.3-rc7

- fix intr_target_width in several qualcomm pinctrl drivers
- make direction changes exclusive in pinctrl-spmi-gpio
- fix function issues in pinctrl-ipq5018
- add missing OF module alias to pinctrl-ipq5210
- split QUP1 SE2/SE3 into lane-pair functions

----------------------------------------------------------------
Adriel Santos (1):
      pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12

Bartosz Golaszewski (1):
      Merge tag 'v7.3-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-current

George Moussalem (1):
      pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions

Gilberto Conde (1):
      pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13

Konrad Dybcio (3):
      pinctrl: qcom: hawi: Fix intr_target_width
      pinctrl: qcom: maili: Fix intr_target_width
      pinctrl: qcom: qcs8300: Fix intr_target_width

Shawn Guo (2):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
      pinctrl: qcom: spmi-gpio: make direction changes exclusive

Zhangfei Gao (1):
      pinctrl: qcom: nord: fix GPIO interrupt target width

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 drivers/pinctrl/qcom/pinctrl-hawi.c      |  1 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c   | 20 ++++++++---------
 drivers/pinctrl/qcom/pinctrl-maili.c     |  1 +
 drivers/pinctrl/qcom/pinctrl-nord.c      |  1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++++++++-------
 6 files changed, 43 insertions(+), 18 deletions(-)
