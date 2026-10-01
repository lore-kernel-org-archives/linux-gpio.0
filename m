Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45E50B8C8
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858473; cv=none; b=q0Da8A83ygZelP085iePl6vUzTLY3WeL3564nnfilkNX/32sh5VbxvsDmf48C5eigOanRrCW3vxse5+Mqrxk9bqNur6RUMnDGYmXtAhDHuRXls/gVhvCxfxq0X+UNVrq7rxZler0g/jcuStfwGTLWPcL7tSOCf/C+5l9k4m2hzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858473; c=relaxed/simple;
	bh=i6CdXMNIsX9AsS85jR1xBRf2i9VEOJL+1YUH8Bqd8iI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uZYZUrAHu69Ml1T9QdEoJ5+i9kgcjypZu1ammLTUBaQWNZwNLBMtvGN28fWqaYi9eBsYItUjQWRPWX9it6SNhY1i3R4iNM9JBKYc6AmrA2rt7uGiBAhoAvIyLcXDi0MyHaOekN5MvtQhX6ODXMGA1qh4LVScIRTLCzGX4wvYV9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuDYYJFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJ/DKmih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuDYYJFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJ/DKmih"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xaLL962450
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 12:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pn9ZIrIwLLod9PpiKc2jm0
	af3QLi76hVkznb5/Ig6B4=; b=GuDYYJFMdI0+eAvuUOEvWRcpF4lhddJKuq5Vci
	/pppO86AX1NGtRsJPDq72nDZCMSkJnl8eZNcLIqCh9MX+hXbPvxsvX4m0ZTfOyRi
	Q2ESs/EEftjvcqTBaKwAYoeAEv2ihLxmE2fv2YrmMgZsREX3VjZmKo+zlusGRI9Q
	AaqGLsqomCOM5lMKiwV/HO3KcqKVNpcK/yA/ua1CljyxFLFj69haK5UFalK+9lB1
	VbVRW6pVWVUChNOG/YQhliHh65Q/3CubkX7Ku/Ifjp3tgVvrvTwjr5lLvT353mTt
	Kc0lAS8/f3KRJc2BangKXUJYKGtvCBi/LO+sVyrXay+6vDvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcv6xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:41:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso83634285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858469; x=1791463269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pn9ZIrIwLLod9PpiKc2jm0af3QLi76hVkznb5/Ig6B4=;
        b=HJ/DKmihU5t0kusfTC7Vc6IUF3mo4dIXdCm71bXMvkjNebbpcuPq9ViUSocTBi8K2R
         QMMSViQVGAHl0jxsMl/OSit9pqTOFcfj85Bf2UI/KCbuOngLNvAK1eCW4ocBUDatuH28
         q8XUHYJKllLHCWhly9buUAIRzwBRig2B2uZiBWH+b23rxgFhAEcKH/HzUnPG/EqoIp9q
         cS/t1YvLwTg7vnqAPv9dmN3I3teljQKPBRr02k9Kg2R/7DZK/IVm3u5QHEkDRFtZXMYp
         Rs0zvKyoTNnUbL6xJ+w2dxAV15rZyeaxoLhoHqBxdmTfC7znqs+iAekIUzXHeCYo5qob
         Om3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858469; x=1791463269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pn9ZIrIwLLod9PpiKc2jm0af3QLi76hVkznb5/Ig6B4=;
        b=rNDXw+9CWsWLRpfgKUXtau8e8VHZN7VnJfHQoI4xJnnCucvO04Gtz8+UNfol+GKf4l
         Ip6uhhrpNBPZN474DeL50kgQ6Y2t+Bui+n45tKuhQter03MsIDtPFYvEGqJV1aMUu4pb
         0K3V4Scc7kRS6bk0Ioze1wnGPOle2MXVK042nf9moLAyOD5oMEjJhd22bfCxu+FmUjwe
         nBLEsoRtQiNWZwKWSk4pI6FUNvU6enqRo/GilYOTqcLOCYEMq9aDhlx/dv5ks/6M+iwL
         l9cVQ0fCFwWObJ1333vn6v5oWuuLUSt55GC6uVtM/dBdpx0bllIwo2hT4wBT1fpN05k5
         6GdA==
X-Gm-Message-State: AFuF++neyMc0KTE5O1NPAz7bxHZY2BPsidhwGFudbVuk7R530Rdw2dhV
	s3e0qLSB9fTObAGwAD+mpHRswzPUHKLkyaEA0CCR1T+t7g/EZSqxGrS2NmQxbHcyivEtOdSk7Kt
	jx7lHlOQsUUoOoV8jz3aNH1uPj5y3kgG0J/0BQGTTt5yIhaGXAeansOesxcMR9Cjy
X-Gm-Gg: AYBFou3k8eH9m6Ys/M5k6mfGjzKSJq97YEgwXnBF16IGOpPsj5W4ciiCc2HVPxwz8Ae
	zwvHxfQptlfksMdhwRzbT1uGS8w5Unybs6aTGMdGeyFeGNjwcwIOkCbjZu1IEv0w+E6waGi75DV
	Hp6v39JghZs8vWmnBtB/IdCMBQ7OFGjqG8T+XraWqyLrhJMTFosMAvNxYjQZvLVnXuVEJvhv7Zo
	P6XEagQBWI4ZQX0YIjd/dJ95lnS15sbfAnn1r6JLU2tpSpNlniHqtz6K9Ib/LTocBrQ7KlT7EXy
	bzF1oCN5HBTQD/TRgNoG3s5xdBrLws6UUdv/PuU+0333HGZ1G8CWfuWjRZ3uo66VhWZ6obY0kyw
	lnlYo58r6RbehZgmZwdaH6668pazF
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr491931885a.17.1790858468960;
        Thu, 01 Oct 2026 05:41:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr491925585a.17.1790858468263;
        Thu, 01 Oct 2026 05:41:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] gpio: kunit: add test cases for platform lookup tables
Date: Thu, 01 Oct 2026 14:40:52 +0200
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVUvmoC/x3MTQqAIBBA4avErBvQMvu5SrSIGmsoVLQiiO6et
 PwW7z0QKTBF6LIHAl0c2dkEmWcwraNdCHlOhkIUWgohcfHscDstH+j38cDdue30qFWpqrYmrU0
 DKfaBDN//uB/e9wPG4qu8aAAAAA==
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=i6CdXMNIsX9AsS85jR1xBRf2i9VEOJL+1YUH8Bqd8iI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTXP7BA/vuHaXHw0Z2IT3wm8rABjCC+myTBH
 DAzh53u6/2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U1wAKCRAFnS7L/zaE
 w+ixD/9Ebp7qyHEQLv6oofC5tinCSJXDMUIrDr0BBKOenGLUHyn0eNl5Uny9sRjn7ZDdhC3Xnqs
 gC9JMOidDEdvTuvGjNjKP0Nvrr9l8gLXHeE/ko3WpYBmx1UhR2szFIRPzeqZEv9I7FXIM7u2Xqt
 ZmmzZl6iH261U3ajuVO4NLRbXyCrNAVXtIKm5M1Us2/wy8WNsKSkcJK8n5mmLc0xYkefdN92Qov
 O/uXv5uPeeYHOqZa/fA3pG+aT8PwpYCXuwWs2iePcitGdG/UgkTxTTcdYCkpY+bKpkoM0Tvs3XN
 xzKHBsAIWqUyVoxW9MWMMY0bt0QYTEwZkFv1U+9Ah1j5ZvH0/WT1fmubmsO6Fhsi/mUMCooJ0HI
 3m+Elc90zuj+peyCKQPL9oKEmfU8tZtDGl3JEJbGRVQsEO3cmYZXckLivbELD48SPWKc0lhC+I0
 Q8479W9Hyd3tL6Kz6MCQBw/oDOJWZl46BQAtx//++fX5VWPvX/zIX4Y/0V0BIzXAdElrSU6wrgS
 ujjgD7Rr6vpBxMvnlVp10w+qZOqmcdAhC21rHpGQceIH48ei/qPxIwrG2qndFtN0G/49+GlReCf
 9KGNtd8eDEBlrVh66gFel824lLgzEeZz5xj+d1BhYSVPVKDiBbpgcI8CsfImmHUrJkgf3fk3McD
 D3UOqtMrdJqyGDQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXzxbD3MuLcgSC
 Nqgn8QEUagHG+KtSiwPC87M6RXUPWPfnnwThI6vSZT+EeCGq5Rr4j+v+1qqNVtfrfj0C1pyCvTa
 4RuSGUVXrxxEtAP1V8A0f7hqvzBzI1NY8crTdF672CGnbaNZKLTyyu4eOpyxR6Nqn81GJpepj5F
 ZDsOcuqoBZUrt5Si6t8+Qp8b0vu4C8MrLyQmvGAm1hciZVtLOVdY/IqfOcbRAm74j7MIUAJI6pW
 dWl91zwFpiDH1iXJueWSq/fauDjWgOlVc09qlPlfVuap0kRSWiZLgMnw//pAmDfbdJa0Nt/e4dB
 ujgCVVfNu8K4oL4I1b8toAYYsd+mBriEECQckLpnQ0IcMjjMbpljnop/Iu5kqE5/1KIKfe+KHYG
 bCUnQz3IdYGKsGUx7aTphXvxWZq4RHVsTvUJNfwskRk92CJAba5ZfYHZKjyPd3843y1FIV5+bSO
 r5UTWjnh+zeq0BSYxeA==
X-Proofpoint-GUID: cpE1i5xJhXQ507Om3mCf4Zb8GlDgj5e1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX94v4Li/YFqXA
 rHJeLzZWDuL78BEMWaOIGtL9masER0wkwwKAQdSYyGBbT6hasSSE/j+5t2N3F0hoNgMd9Qv31P2
 5ZNVNSq3pzupHhFhHPt+aeEcEFR0fLg=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe54e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WHK2wXdqtRXZzuKitUcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cpE1i5xJhXQ507Om3mCf4Zb8GlDgj5e1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 221 ++++++++++++++++++++++++++++---------------
 1 file changed, 147 insertions(+), 74 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

