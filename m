Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E1327BEC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436700; cv=none; b=QzzMWwJ0iP3RGZMFHaI+zMLaMYYst98Gi1KYMllX+Lefr8PaD8zLhh7z7IHR7gO1+US2Kfg79Ove/nAyvuvtbZ7THvTRfWfI71XYd7OVVt1M4qL7RHPsbIsZ0di65fIj9tFUSw7Kza5oolGd46guz0pj/UBUfrYCqfvDw+Wjs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436700; c=relaxed/simple;
	bh=Fqu0oL7/K6k2KKq/OK5mLZUwutadk8Kcdniszb9Rh7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntD04o/XZ/1BdB/6XCXXsCXo5cih1rzudqQteidk3kU2VQPFJ3pDf1iqbUp8qn3dwUpLAPhk1XIRYzbXu88N1alVDyQ8ZznRFdYH6U1fCw+woVSWwwi56LWVrJa30H2SI/h+cRIGunN+mWVaFNLhyAMKVR6qf6tOKNuLokQYJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGFmr99Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3hXjJ0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGFmr99Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3hXjJ0P"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxjLr1439480
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbt
	zBim3oAA=; b=iGFmr99Y9qF0vJodR0WWwH/B7u6oWKphSluE/OBSPuijxRXbcOf
	2llVdMti1UzAZt0+2bFndpA84Tphb/UXs+sBImlHubaNL8JqXOJtbY6BRbPKaCrM
	cflawuM0yAbhaKn7+38gG3mmfbUANNu2MvaZmnChLryM6qmMJLqI5hhtoGyNGTL1
	kUls9NjwtjyQ9siNsnsZl+sSDEf2bhJxMim47hhWDTl1cWamIDd+p7kw/yWSptOl
	rt24wLQXOCMjYZl89Z69fOGUFVeyoeBS/D1C5x1/yUYuGtmUOmSqtyfo1VXR0bLt
	+mMpXxxsSfD+84UthLTtB9LYPq/IdilLJLA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbch8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:44:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso8602147a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 18:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436697; x=1790041497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbtzBim3oAA=;
        b=g3hXjJ0PoEq1H3hMXmeeJk3qRlXsBI6mwEFyM3Lofd2Qfl6KHg0JItHtAPjSk1/1U6
         6ERS4wLuZ+c9wN2Ve9kgc3YA0nRboGryMNEAN55Sr99xe21ohKcnpOerfms5yXRqhWsI
         Br9B0QWzTdatwzlBtXTT+AP35usGQF8M14hbbsPte6M3MWvIlAemrMED+e0UjpNQr3Us
         uUGwXE++FLwb1NXRZiCB/31O6NjMuvpMYzs8xmGGB/vsxK+b3Tanl3hqk8rqibBqoiGQ
         HFGtcpNZY7/cHo3GQWNwlr4FnHUTVhnTTWTPIV6q3i+6MjNrr8hjwQseTb+DqtBQaQ8/
         P6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436697; x=1790041497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbtzBim3oAA=;
        b=Eo7SiM7FNEj7sviRcleOT67tv+0gvA/H3m+UVVN7Qd+YOZEfJl/Vvl3c+jGNCyv0OQ
         c8W3MdqigQziNRt7ktpUk9G/QyTe1IDH7SBiHCYL13U/OXlMJVu9b7dlcXwlgLVFPy+B
         DZtb5PBJ3q7h4Ycgi2ibIvDMiZZXy9aiuBFGPzaSMznoyRbosjjKvpqo0NDJ7UKh13iC
         CS697RYr+8OUM4WHe0g8ubjkxziQxfRnBRs7smoAtb8yE/btzkfCJ5CMUayQ0wESjKN0
         AxVo8SlvmLVjSosZT+7ibJ3m+ebQQ58VEzB/Bn60Sn2QZZ7ejluwjfYYpPrPl7mKHBQ+
         xMUg==
X-Forwarded-Encrypted: i=1; AKwUvBzJnHploj3GJrwB6CifIDQKSy+7YV8hRqUL5hG7Wv2l5rTQ0v5YSS8d66G8RU71iyO8iisfmXCePtEc@vger.kernel.org
X-Gm-Message-State: AFuF++kJIiUl9fzB+F/2W6unQvXQdkpgjnZNxE36U/gKb4mQOAK/ehT/
	fjWZ3bbwp/tQaJJX6icUqUOi7KE9bO6IajEysHc7ge2D8+cig7ENPLsK1Dxpa9gGRfdWfii/NOp
	L47jlsWQOhBgsJlbytvyPSkX73lCfMBguPaJugogMzOBnlpnwY8rC0dT0CFDhEtht
X-Gm-Gg: AYBFou30L67yb92LyJroBVLdPufNB8/KrnbM6MXkJZoOAyrm+OXNE6h+OpoDpp+oVri
	W+T8SdoNiLRwc+3AzQiDw+RSXVeO0v/vVmRG5zyqCphh2jFbTbIUDmus/q84oF7BNkYUgVrCZGR
	hUNPlxBbCv4hMCjeyrf60V2sNuNUDkvZ7Vy2xXyGeo+R12s1UtUV1JfrqArgNBffaU1RS83U5xM
	qfjA0P4HVRjsLnIuqGQsnZ+Fhmrpj+4ms0UJB5MZcdkouvx9H68heD9SiUs9RRY6nC9xNclhSho
	kNtrmTPq1VVDd1XFnr0Eq5KCvKvXfd3SUCaliJJPsyehjRWsNKq5JhgH2QbEjLbjVmOGiN/71lb
	iG/7VcIlT50MWvbe1lpTdXsvsxHjCRqVMt/iXVisZFtVBKP32MjGLYeVN/iez
X-Received: by 2002:a05:6a20:2446:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3db404b5fffmr10475174637.4.1789436697462;
        Mon, 14 Sep 2026 18:44:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:2446:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3db404b5fffmr10475115637.4.1789436697052;
        Mon, 14 Sep 2026 18:44:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm33104723eec.28.2026.09.14.18.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:44:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix sharing a PMIC GPIO between multiple consumers
Date: Tue, 15 Sep 2026 09:44:45 +0800
Message-ID: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX6oC1DiLPpzwK
 gJL6iuMF3UF36M6oYUucnMp69XpznEOn5jlnA66IA9y4ydy0K0ToQi2mw/V6QhapgLOmXKmCxN2
 6wPDe6eLQrqJRV5PMvOfC1m4jW1JIii1hm6/XvIAE1xV3ocHDkXp9N8G+Ffb/NnlpKSaGdTFCcg
 0h56tNJOAS9xb/RaXDZEZUbZT5MccF/qBt4OepxqMvTdE+IeLhPX4CDR435nT9Wnkuqv3Klvz6u
 QH42IsauUQtpDjmx+BFGtt0ltoU8RdsahxLTHEZSzsWfxy7gUSyBZ4Hf8IHaClnTqYuOH4hpowI
 XCKJfpoZ2CWp0lviXy+Ifkyx4U09JIt9NbAiJDPRrxgyOvKKuCKFRFn3N8LsOYeyPW4Tczz7WNP
 3lEpTlqEkux2m92I/a2dH/b5q1koL1y9ea/ImsM/IKBQ//vPJezH14ICeSf11lLmGALphQVQkiR
 kRoN4r8ky8TWejdKy9g==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8a31a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=-rZZc-vT4HAifJYpZ8IA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: fRhKDHN8HWRxZAPskqWtOHE4VZmqJhGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfXxbwD1hDa4M58
 iMLDjLy5fOkVVxKOYbP12EtZl4QGFCL4ys12xloiGChl9xE4+KgEeYjaQyKHRsTjdq8T12PONLS
 VsaLy0+Zi8+2OnyvlH3v+tyMqKbaHM0=
X-Proofpoint-GUID: fRhKDHN8HWRxZAPskqWtOHE4VZmqJhGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150021

On the Qualcomm Nord boards, three discrete regulators feeding a WCN7850
module are gated by a single PMIC GPIO (pmau0102_e GPIO6), so the board DT
describes three regulator-fixed nodes pointing at the same GPIO.  Only the
first of them probes:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
  platform wcn7850-pmu: deferred probe pending: supplier regulator-wcn-core-vh-1p95 not ready

ARCH_QCOM selects HAVE_SHARED_GPIOS, so gpiolib creates shared GPIO proxies
for the line rather than taking the legacy nonexclusive path.  The failure
turns out to have two independent causes, one on each side of that
interface.

On the provider side, neither of spmi-gpio's direction callbacks clears the
opposite buffer: .direction_output() only sets output_enabled and
.direction_input() only sets input_enabled.  A pad left in DIGITAL_INPUT
mode by the bootloader therefore ends up in DIGITAL_INPUT_OUTPUT mode on
the first direction change, after which .get_direction() reports
GPIO_LINE_DIRECTION_IN even though the driver is driving the line.  The
same asymmetry means gpiod_direction_input() never stops driving a pad that
was previously an output, which is a bug in its own right.

On the consumer side, gpio_shared_proxy_direction_output() reads the
direction back for every requester after the first and refuses with -EPERM
if it sees an input.  The readback is not needed, since the proxy is the
only entity configuring the line and already knows which direction it
asked for.  It is also not robust: a provider without .get_direction() at
all makes gpiochip_get_direction() return -EOPNOTSUPP under a WARN_ON,
which the proxy propagates just the same.

Either patch on its own is enough to make the board work; both are sent
because both describe real bugs.  Patch 1 is what makes shared GPIOs work
irrespective of the provider, so I would consider it the more important of
the two.  There is no build or apply dependency between them and they
touch different subsystems, so they can go through separate trees.

Shawn Guo (2):
  gpio: shared-proxy: track direction instead of reading it back
  pinctrl: qcom: spmi-gpio: make direction changes exclusive

 drivers/gpio/gpio-shared-proxy.c         | 43 ++++++++++++++----------
 drivers/gpio/gpiolib-shared.c            |  1 +
 drivers/gpio/gpiolib-shared.h            |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 +++++----
 4 files changed, 37 insertions(+), 24 deletions(-)

-- 
2.43.0

