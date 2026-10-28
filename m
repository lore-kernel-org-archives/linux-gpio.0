Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190919;
	b=YW3lHUe5/b7/mpa3sx5vWRmNADto1PzV8f8D2eeOO0RakEbxjR8jZToJwZWTjjymWgUd
	 3HeKlM6MqyAd3B6TzvTSZtkzsntm5OshYVwWSlr54RVbExdgYFDc377H+99bAUGWXWx+o
	 UOsr6ePdEPpT6ZGQfmP5Z0KsWkqflE+Mi8hw8saA/XdyC9rLLNZ73wfX3RFPuT9R+5kZT
	 CHweK1SUtAs8ufj66aOVEf8owgCpXZTz8iVlAnRCyg6bRQVbDJtjz5WhdoO/DTGX6b5E4
	 miQNXGx8HFlH5BFSYSAA+HrrD9khOg9TCl6DNor1/mn7jxrWW4B4U8lLICmoo2ZrK8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
	b=aafgfnOKuPBI0wo3W+km+x6tnEEeA1yUNGs1xiI/7XRXODCBiDoeG2Xh8SxZt2Bu1rrJ
	 ph3oMqOuF0ncqspSzEqeET31rNYr1CO+2lptGhZxtz9CtZ7HwR71Ko7bQIC3Zo7qGZmhD
	 n2Wjm2Bbu8VRwmURdcHzJN72GB3dB6OKsR81WN/fXK9QP3MmLYbDBhbqBl/8Ik/cUpf2y
	 z8qnYPfDIOCP7eFJ6dYl6u+lQ+a42iPosn0ziLdztSAg2yByDYYDVwP8uSvLOHZhgV64Z
	 FH2O2NKOOK0sRCER6MfsDQE+kJ0fHNL1lFnTGme+7WkN0Msq7Nz2L/ZaITheqIZ+hrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B157606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B157606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeFHn505538
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/
	1ufgNTKQ=; b=DifZ4nd7xLUYeDvzNICOmecl0hoCpcyKrkXvz81QYTBpJq+CoCX
	tad7BLQaFaRZoSuxiskGePCE3eUbHiYVZW0DuFSJxn24mekIbJVYkxT1lkflOh/x
	yVFKBpgwMERa1ygzX6TBNMMAEJ35E/46Q/Fcj5tpd54rVISmuw2MP3YAISVWelM4
	nSfr1ugJgmN8J4nIH3MFOjq/qFrmjLV/yXxcHb7RdL8KRkPkwMUpNkDY9nEqG/5z
	ELcJShxzF92aTRpfDwaZZPKRaLUnvwsUPuHQxMF6gzOQNAPS8VZICe8rNLVe5328
	dZjN5zAFVikO8sUBtgURmFfjlEmuHJcbX0Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g435c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3321293eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190918; x=1793795718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=EzdbG4Y6u1xgczrXnhSBRTByv1qz9DS/xbrl9kBLndFvD5ZcfBX/Bxz8xjggrn1fMn
         VqdyzYns32YXO2R3CcmQvlR8IRKNaCkbxYMnUaz6tjjudKlO801tGXmqm7Awy+taPk0h
         yUPSkAy8Jok4RvaSpo7cpwPcgGSU2KJb1vp8rTwdetPe0jy8fFXd7DemtmVXsHFFJ4Vv
         tmtmWEGn+wKekkDUhiPFVro0CfpfuH+HJSt4+7t3brlausoGGtYM5CAZATru4c3nkmHG
         CBQqtY0TxmGidtmgBq5aeyWHIm+BQj1CkcafN8MJ7qSdqjjIBLFodlgv/9tGsXzwkFqM
         Kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190918; x=1793795718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=zjVqe1NnHKZhqExWTmUmrrgJB+EfZaddv0A4WyTunbtwzqF4i/it53iUZbcU5mYDar
         KOFAgV78cQaKymFhbjN7GYwoNZ5u5YU2WGm3KYwyOlbpEAKoovR9TKHIciuU0EzFrx/L
         mMER4AQimq9DFXXyuMPZZG9cvsbnSE8+7d98lIuUypDJOm/4pA+25SZmb5iIfZB6pwWJ
         ePhMUuAZcgXTXR0zasGoHfTZaTPwJcAWfwmhE0oTFPLtoAR1bV7x5TBgaaJ961Le948e
         ZOdr2vBcOJzs8+riIKZzZClEFYB9IHNPGGoFbeIJbplCWsyHdFy3XAbzEEfgfyrWebD1
         n7Sg==
X-Gm-Message-State: AFq9FYIY8PYqJ9QGlae1GI/Jib9UTvftfofjA43NT03xA3yjqTpSitKq
	I9HvqQKaPufkdEXRB39P+OTyRHcWt8KJhdyWOaHpZIzwXwckzGxPZcVui8L4mfIHGlQRD+ozgnt
	hn0IlAmZiHXwn48Prbno2YsOxoQVfdRfc8SJT/Lv34QPcupXjKjST0SiX+xunKdGW
X-Gm-Gg: AYBFou13uqn1TNOkT0scoOcadFkd2r4bNaRF4vH6eQwP4sLD/OTWqT/Jr2WNL5M9Xn/
	CNbBS16a/Tze+eTJa3elKxew/0W4DF+tlPEHtLLUe8Yo5Ma9//BqCjkXg06tVbtbJ4GTEhrk3O8
	Ck4tcZ/0MoRsBC39uPtxq7GTA6d+/yEvN08BOvBR9e0fXyMp9BNx5mfxT16Pw2uxw0mnprrYSfv
	L6VzOsWpdQbCfsYtXqN5QXELLiO20bYK0NLq0pzFEl2Meb914/1c9K/hWbRM7FKCM8Xr9hzYOtR
	vJ+80fSaADou5K9RJY0NDhQ0DLc3hb4AIFAsFTAgQ44GZA7sHpbZaTzTWeNgXMYQrQpvsPzwdSL
	zlPmcrAtxdufMl52YQaBZ+ggHgyU2aWG+1Fw6Rf0aBfQsXInGlK+H3DFqUzAXNy9ZZlBP0Fz7hJ
	tZyA52/u7+sT4ptMwzd1fZMu7rOZm0AOfv
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825891eec.27.1793190917559;
        Wed, 28 Oct 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825853eec.27.1793190916977;
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Wed, 28 Oct 2026 20:34:44 +0800
Message-ID: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX67ZurXDBHV6A
 stApH41e6kNKYpVGu5asRZtC8wA4vLe6zxy4mg9Z4KYIl43/5OAhQQkvCceKWMOQgIZ88wkXWvk
 Bda45ku06UXIyFu7jsoUkceUxXAOqu4NWFcRN8qhBqz6JujMxSBLBAZbQnzEoyi5s26SRC7D+6H
 QGHmtDREXTRNscCG8SVEYKdE8YF6pLAnWFc6FNQ/tn0RCI6UtzWTXvsguJ85RKOVf6GZuYtGbiQ
 JtzzwT5//hedRKV+lxoydFIFvwQ8esBGkBq61MQJUOWoE/tOBZph8eXJftXbmKGXEHd/ezpbqP9
 kzY4qGDRER8dbZNdCp8vYLGuMCoqocTg9xXTtHRGxUQm8MzfC6fJ298QHXeZAPU3BKQqkjYuzr2
 wLP8pMhcb0EM+hkpXcKGhh0jOd04Ce+iNAupcxdGKwyS4FiBLSRwGXg22J5jSyxTsYKZ7pFtOg3
 P5Aiu/WsrpGTAPh8kmg==
X-Proofpoint-GUID: -u8T1pvoraniWaQFsOHMGhuXqh7F2ZGW
X-Proofpoint-ORIG-GUID: -u8T1pvoraniWaQFsOHMGhuXqh7F2ZGW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX+SrASK7LPrzT
 jUsdnKqUHsf8H4THim9au4QtJYg6wkjv9z6mK75G3lSuniuISsRho3d8iqxgWUUN5jgve6UuttF
 ST2hJR4GMMhx0mrisBdv1RLvPgW43qU=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1ec06 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m3B8FXdnuE4ZOOmS3hUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

Four fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Patch 4 drops a proxy's vote when it switches the line to input, so
releasing the line no longer fails trying to write the default value
to an input

Changes in v5:
- Drop Assisted-by: LLM trailer
- Patch 1: Add lockdep_assert_held() to gpio_shared_proxy_may_init() and
  gpio_shared_proxy_mark_configured()
- Patch 3: Explain in the commit message why the default value is
  written for all lines and not only GPIOD_ASIS ones
- Link to v4: https://lore.kernel.org/all/20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com/

Changes in v4:
- Patch 4: New. Clear the vote when reinitializing the line as input.
  It predates patch 1 (Sashiko)
- Link to v3: https://lore.kernel.org/all/20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast
  gpio: shared-proxy: Drop the vote when switching to input

 drivers/gpio/gpio-shared-proxy.c | 98 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 87 insertions(+), 12 deletions(-)

-- 
2.43.0

