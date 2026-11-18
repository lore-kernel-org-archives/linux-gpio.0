Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009078;
	b=TCeUdxVbrJ070a7Zv5XLA3e5wGT5RiHgA5CQA4UjWfNPzhqHldleb0MTn6JBWX8Me+2w
	 8ahWi/c6GcbipU/5MUhINNAeLIybWdYTpgkgN4zMysKxbGNCRlpnr6GiPe8jApHPSjtvL
	 DQmBrEgjm9O9Rcog3rUx3hK0YLQRz4Ks39Ae95cxGU+nsF8aVZflDr9Ch6TuWZCtgraYL
	 TxI7GbrdATncm20sc4ZCaGS2lRdnafIIEY9+fqFculKo/g5E/rslcGXt35H8foLBmmdEZ
	 jt+E6V28arVpzKrTzfYt43qp2doIag+iPQOR4QD6bXtK1FvpIo3eZP6ZCYErvb5kR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
	b=Sa1fO1hX2193LzCaDSeQUzlxxgMfYb9SdEutTI6/mkeR9HIK9VJF06q0FOi8wsAceJ0/
	 fOXFUkAzGnCAP69WDgzpgUTHcczQ/RxB0Az83gNv2fAwToJq/26oslHFon7TKj0oPdAXT
	 nqzc4NBdbP5GTQ0L8GW1ZGycDWKcG7/JE7djeBWKkpyezg6MgQXxGiDYPxa4kHyuaEuJB
	 yk0tk3LNtGesf6hJk6PEHN8Jv6sBW9YevKhO+6PMpGXAbViuzspC5/asT4ldRH700pNs7
	 rvS9kiL28ffnDeXkksdyH2ueSxeffJ9ZV1r6UhNjYVS+E3e8l9mcEHk1eJKmA+xlmaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgT1h26R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A471606A320
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A471606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgT1h26R
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQdti1928800
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fFhEs41KSZ4dfzyxb5QjYD
	d6/8oZJNiaCStnwzmcs3Y=; b=QK703xtBzVmLuyertRufPhXhiZHv3M+NOwMMnC
	H3F683rz9NoD+rlOxQ2G92Ld4lioiTHFXCkLH1RCYthLSL0spIjGM4tNC90rR7D/
	uycQNn0e8vN5C2mhOyN3DEXxkD3YeMR/2XZPfhv4NPJfDAjjzX5Miu7gCHKkZeDc
	BRQusAb/SGu0Zy6pLsctAdokr0eSRis4b8OOfm6HwzajYuB7Sy2v1RKP+NLCx+mW
	xjMX1frRUsEwhprXWirllqSsDMBhqZVJy8TcsKZctn5s3RJdUNO+NOnrcN8iTczQ
	z5qla7DIsKqniO/0EdnhycLibZMNEVM80YqE0DlAz81pFvNw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8b6sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:37:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e09f506e8so254002241.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 05:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009076; x=1795613876; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=GgT1h26Rag9nf4HspkUbEzKX5Y9ruG8brrtWPXH1sRcKg1iCwP7tb6POeAfwBaYjG6
         N4QPH4+cMQ7vXeP10qrWInHkDTWmj0e0QQyt1+X5UGpIZAv8I/tmuIcKX2puCwcKEDPv
         +G7cUbYTBM55lrE67pf+Px7FSY73O34Ccx28Ae6jHUK6VjXZwGSDXOZuGJge1dZxl0YG
         aPBQpfQEpsIZnX7XouMo46klpgXsS2F4Cl9IYak0OauaJ1k1I/maWwmtviP2kLY17l04
         WVcFs/BtxdzPpSb8ooUo2Xv9W/IXSijjiD5WODmsCsUEdsEsCbD5aUJnX8UJizoUZPVn
         8kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009076; x=1795613876;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=Iql0zCg44RXI1eLLhWcKp5wP+x7Fsnt+kv1kj8cJsJZmzSFblFe65G9SSazw4qZuB2
         VLhHCP4mUL6nJRSuX9ojyAc0EQ9BtHgSh3EpFpbW0dQsMEYbRSYUwlB58V8gondzdj49
         PL2LplDLJicioUXDmFzHckrpT/IbLurKaKonQg5z5TfyoA3PosvGC4v/JSrsGA67zLq+
         FmSWXxPo3oAT/OlYuOzmUu1jVzP5dqxXwMd58qhHU2TL3KMfRJ0/tvVFm8G+TP69igy2
         fv2sIYd7Rn8OwFBDpw37LE0McCracjC16G5IUaZ8b0vO/jdFMSQvL76WueKRumQ76WIO
         jzSw==
X-Forwarded-Encrypted: i=1; AL+hErHWACcsm+mNhweOdpEHpLcQRrsmMUduux2sXRhg3rS2/L0OghHwxhgbCf8vGawTCA59D1KEOZjjTzMg@vger.kernel.org
X-Gm-Message-State: APuU4Z91kwnDhTxHs9vPq/OZSVJxJhGs2vT60yWrXrUjwNeVd2xvIXZE
	nSEExZQO2Ns4CXmWF7KvE2SAWcSOUHKp4x46U6Iz4/zrjqUldE8d1oqMyeQNx3N8i9flwI31uSM
	MHgybUuQGn3jIN00C7ur+gLG4qRRv81qBm+EiBiVuHhZZrShqvqvHhlNRL7pYR1WF
X-Gm-Gg: AYBFou2eJYnFHd0C4RM/vgmyEyAPrDL5iFKProwVs+8gQ8qVFEfS/iGxRiu7rsOzBeJ
	8ib6Ie2P8xG0d0n3N996gYWAm/66PAtjC5EHKfSHbZ2ZnBNRnH5s0gqM1sDcGMWGnwSId8NWY6t
	Y51+ffm/Q0iWmZ7JDDLR/BjdrmEfULz/GIEjTDGrn3FvMBMQ9lf5VqYt0bQyXfOyT8NK9V3OaEs
	u7K7lVYnoOvZwxQSp41ePQ2aLwbZ18T1ZB5YO5bpltnEHbtp7TaXxkWUe+CZzc3jr4SJUTy+f2Q
	dZccVmMgf4b+AwYRBQ46Hms4q1WEENRFnSEZTEmmrBuIaaY6bt/cpaHk6gTHmTIsciyPi/hlbjp
	dty6CCQi/PPK4nO1x9xNWdIXv76i5nGcGHyYDBdH/95MN0wyCjJBDShYddTIh60ty6YiKRT5xIh
	frYP4=
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642696137.19.1795009075379;
        Wed, 18 Nov 2026 05:37:55 -0800 (PST)
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642676137.19.1795009074724;
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
Date: Wed, 18 Nov 2026 19:07:29 +0530
Message-Id: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmq/WoC/4WNQQ6CMBBFr0Jm7RBaiFhX3sOwKGWUSYBiB4mE9
 O5WLuDmJ+8n//0dhAKTwDXbIdDKwn5KoE8ZuN5OT0LuEoMu9FkppXGYrUhKRtlkoRFlIJqxLlz
 VaV0a2xKk8RzowZ9DfG8S9yyLD9vxs6pf+1e5KlRYlRfXGlNTQebmRfLX2w7Oj2OeApoY4xdmS
 8JgwwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=2451;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=2lmXizyvul/e/Sma3pDMRM3BD6BbkGljnmal79jyzLM=;
 b=sBUfTNcOB7p5tkML481ltXLjh2wlew0tpP0oosaXXdXBszz01eysgOcy5TrSvqhXUiiTDUlJN
 BI2eHfV5XssBr66/mQg+7GotzPIXDql6byfjaPI6RXTQffVzZ9XIAyH
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Proofpoint-ORIG-GUID: udi0-RgP0pCafwEIvlfkhkZ82I9BgMC2
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdaa34 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D0rfVSSvHAGRCStx8_UA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX+0Fgrl2CraW2
 GZ9B5XQbgHb6IC/LWplJdZykKeZTgZkIe9Y2R0j0ERwHWLDR6t03a5JoJ4wITXcchHqS/G0tg/q
 J0OLqwomZYK1MZLsaqtdGxz/hkiH9i+1mhWOCKkb0ckrNTc0No4rV2h15Gl9bd3IuINuq8FwoaY
 qdaDVrmG1HyWCUCsqZnHZlZnW1i4S3UchsrMbDL93+Je25RncCS73sI+nh7vOghyhIJH2WcYLiq
 Yp/PVr0dVUsZ4Njm8Y+B3h8ZQOLkooy7SEENjQrFjhEJiI/1pIWXbOiLyR+2iF/TWluTPAIm+sG
 7jVLc6X5INCoKwp+UaNPUV2TwJ4rCX1a+AGIoVuK16kSleIsbijKZ1j4yQ9LHk9HMBRfa7GrZZX
 Aiad/nSuL/uAeKi8MF1Vgy/+5a6aNHDd/C2PEMpiWAFzmUSYggAzhd3sLKlh6b4GgtTb59rEia+
 lqYkpDhqcgoPYUVXa4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX7lBTomNinXAb
 rUcxxAfjbKMS0jTC6FO4E/1Q6/s5dViBLh06S4oeXJP9AIQZS0l/+9eCrOlUmqk7kn5DDRF9q8m
 iq5LiGGhH76LP1ihWg8n7d+BCha6cuE=
X-Proofpoint-GUID: udi0-RgP0pCafwEIvlfkhkZ82I9BgMC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

The LPASS LPI pin controllers only have runtime PM callbacks, so their
clock votes stay held across system suspend when a consumer, such as a
SoundWire controller, is active when suspend starts. On Glymur CRD this
keeps CX and DDR from collapsing in s2idle.

Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
and pm_runtime_force_resume() as the system sleep callbacks there, so
the fix covers all the SoC-specific drivers.

Tested on Glymur CRD (pinctrl-sm8650-lpass-lpi) with next-20261113.
When s2idle is entered right after playback, the LPI clock votes are
now released during suspend and restored on resume. Playback works
after resume. The other SoC-specific drivers are compile-tested only.

---
Changes in v2:
- Move the dev_pm_ops into the common driver and apply the fix to all
  LPASS LPI drivers, not only sm8650 (Konrad, Bartosz)
- Link to v1: https://lore.kernel.org/r/20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com

---
Gopi Chandra Sekhar Reddy Kanala (2):
      pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep

 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c     | 6 ------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 5 +++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          | 3 +++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 6 ------
 15 files changed, 8 insertions(+), 78 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe

Best regards,
-- 
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

