Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1571B3AF646
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358845; cv=none; b=RZfk6yRa0rVRSqEkfJZBI6qdvsiEbeB6ezR5mismWzqEarFgxiBdOsVHOqDXbv6BUMC2jEgmdE0Yhb85X8p+Ea7mBW5UHcwasLBPhxZJTj5Lg6GpXVHZnxuXHnN4+htDA2zCDbSkDujW0rIw6geYsnAC6dSYb39vH06mp/8rFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358845; c=relaxed/simple;
	bh=eEK9HRzl7WgOH8cyISJGqOnaO1OvllbYNoM5BIwRvuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MaCUx5QinSe0shTO4sZ82uybG9MoZhKnjSXz0wFpXLeJqXkysVMb5VZCnXLf3KiC4XJF6p8ekYiFRfmIEATdkZE1tz2QDxHUbhSoKPw1zqHwQLF3lfGCek8MTTZuJOYpgCYMUUMiTiEjbUw1Nc0V2s4J9ft806YY0PDZFR29Nck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwJZwJhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asb+yO4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwJZwJhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asb+yO4w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SPNQ890721
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGegHwD5PJTSIBY4RpFA68a8MDgNYjLNJi+Oeutb1Gg=; b=XwJZwJhcNxdv0Q9/
	eVSFkcKrWp0nmf+CERoTAiOSH2gb/7LUdpln0P0yqL816Tfz/ONezFChT2XJ6yph
	EkaJVagTnmif+3uoNXzrbGJkNiQJ+tM8Jodp/CaucD5Ea5qx1npdzv7SwhBDaZ++
	5taubFhKEqYeM/uLrxA9T32Lkfs1KTI8dM/AwQs1HiZXJ8mRpvqUw0OelZ+hY4ID
	/+7MkyLOiwE+F6OY/JLghijJbv6CJim90Hjmb6gBynfZgSBhXuceESguX4MqJ4d8
	tjd55goIr/a1NJe9NEx9tYtoB1+RHo+HoLNIr2ekwv18Bw8Vfami+/1zW6rAnbCB
	mgjPaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v492yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:47:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so37303481cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786358842; x=1786963642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yGegHwD5PJTSIBY4RpFA68a8MDgNYjLNJi+Oeutb1Gg=;
        b=asb+yO4wWTapFRJv9LUzclWBCFuyqejykIKy2ORn1jhdi4HdAlhzBDorPXTLiGFqmE
         rc4dkczzYekzXBARk2qEjxW7to1x6L8x1AAvm6EvwQnkYifJLiRvAdfM1Ln6da/5bi5c
         jcYtTJkzovRlhycTBTsKKtIWBT5z8r//ii4M5EQFmxd3xj7IdExAsuFhyDIoS20O2DWB
         L0owL22h7900HQzMkhWE1/ue1BI2BXGM50wdsQ9K6kmiR6ekkPaL2DQzvuCjhKy5Kb6o
         jL1Bqhk2uVPx+VAC+j3MzJwtr/hX2jvvmnKc6iAKq5suu5kN6S7LdSP1F1LW12IBVH5r
         A0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358842; x=1786963642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGegHwD5PJTSIBY4RpFA68a8MDgNYjLNJi+Oeutb1Gg=;
        b=N/WOvv/HWrY/EKJdbEJNj2lEKpM2PhZcgIvXDqgVt2briBrZWeCmgL6YQN8Ut5ccEG
         R1LesIWerwOAs3VFhDVLuS2IfKAnrLPeDZTmaHaAcMRH3Ax1O+BbMuc+519Gqjh1qIit
         N7SKyeBfLJqHJ6iHiX3VuZQDSPyN1ApBo0kPIBH3TrSmxpDyZfdZBnCy2PLQ4eh4hgaL
         uVt5V82zjVk2I7V7xhj04dBDZIaxQDvtYDvIfBap5wZizUKFA36aJsnzWG46oDQHuT48
         JabXiCfTyyjNIhPqhF9OhyehRboBKUODajt8L4aKt1QLQpcr6yoLCcG8xhS1LWNc7u1J
         u02w==
X-Gm-Message-State: AOJu0Yxq01ZCCCzrUgtkrH7zNino2+kiANxP8g3IP5MU2BuskRtnDSJs
	xk8dhYCbaahvoCQBqy2JrCtkJoKQVX0a2EcyLzQhIWH3r2TTGJFdSIT8K/uyMs7E9hriN2TMyKv
	roLbpwCUt2LGjXO2C9p2LOVble/TmjEm6Ja4E5ibz8HJ6/MJ2Pre5s8UD7I1nPLPgKxvTf+uf
X-Gm-Gg: AR+sD11LFjjyVU96EZsQDEb5t2zCz3yBPLni2erfNF2StdsxeHe7iHZV0VfvzbkksqV
	HwYzAtMiT+z3163loDjmdI44fS8prHo+9mLraoP2+0R/01qDnTRb46G2vVD/j7JSEuGBic4k/Uw
	JIi57kPRPemxljwO20hJgSTvwCUq4NobybcEUzMhvCy4SmvEQlfJlTUr2PAW5sqt+QGWxrhrUE5
	Tab3fe2lpt7XRtWoFZ3kV+zVmXMRWN+Lo0p6+kKKnbDrASriECqHVWqNj6pf3VDQ50V68fNFGJm
	Y/eKRvEsGeI7vSGCwbGjhGfk4L3jCPJbE8dEPPDFUTxxzQwC92lUFbDginDochU5wyy2BxUCnoL
	90D/6x8pMKJuHXjLdAnddp+BX0b6e
X-Received: by 2002:a05:622a:1308:b0:51c:f8f:13e with SMTP id d75a77b69052e-52d4bdba3ecmr4925981cf.40.1786358842285;
        Mon, 10 Aug 2026 03:47:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:51c:f8f:13e with SMTP id d75a77b69052e-52d4bdba3ecmr4925771cf.40.1786358841901;
        Mon, 10 Aug 2026 03:47:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm417009715e9.3.2026.08.10.03.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:47:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: allow COMPILE_TEST for IOPORT drivers
Date: Mon, 10 Aug 2026 12:47:16 +0200
Message-ID: <178635883098.23843.13266453583376097694.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729211001.719606-1-rosenp@gmail.com>
References: <20260729211001.719606-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LYMHW5NB5XOBgSNla1LbjHhLm-bMg2qC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfX24UuNk/BdPNu
 +KxjzBRRJ+1nv8GX6YDwUVa+M9JwqDUfqdfaShrRxIv+63gE0ZNWignZbG3Jy3BiXVREe6YBWvB
 PRb5mbc2hLYSc1GPEWfvn6RVC0v3dcI=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79ac3a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ycdolSOfk6gr42JOQCwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfX97WHEFtnR0T0
 eu2oQXOKW6CPYE/FAOd4tfNUqWuBu1Z/xFThleKb+e+8Ex+z+O30DIAQPWnvUS2vkQLzgSJwuTF
 nr7VLgJMXygpFhkYCP60GnBnZ59x+HnlRSJbULHhFUgataPyUoSCwnHE5u0xhdyjiboQPWXMnRy
 FIk1IllZIk5BbnBez1cUkwBPo1k3sQAH90bz36XY8x0f+nOoiS8WxTjPWekV1a5Ux/q90pjh0c6
 beWNiDhW7RKAd8VTnbmSVQxpw/gVKlAP0RPrkATPrlyVIN4IlDMVHH3DK4J56NSG4xKmhL1i6av
 xufhGgMsXqtvaG53zzZuT/0BBrnqHKmFrRxt1H0KjSIxL9OM8wuy/QaO/jm9T4GPIEOfWwn/6jL
 OT5JtYjQZ0yqkcDmIjpk2QFMrJ+GRZGiVITzOIsMnAIVZn/QR9JQB0poFDhA54WuVN8WwuXzZBU
 5YXcBayP5I5+cfSgFKw==
X-Proofpoint-GUID: LYMHW5NB5XOBgSNla1LbjHhLm-bMg2qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100094


On Wed, 29 Jul 2026 14:10:01 -0700, Rosen Penev wrote:
> These drivers are gated by X86 but they compile on non-x86 just fine.
> Add COMPILE_TEST to the menu so that these drivers can use it if they
> want.
> 
> 

Applied, thanks!

[1/1] gpio: allow COMPILE_TEST for IOPORT drivers
      https://git.kernel.org/brgl/c/67c077553d338e1c79b8792d9e9e858df4bc3cef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
