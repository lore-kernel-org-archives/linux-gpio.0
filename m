Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499570;
	b=SfFYYB7gUm6p/a5dsG1xeK3IfajsTEG2OyN6RFMBcI2X713APYWm3757lVGqbcd5l2HB
	 34itx5JkocA5vmP6iOx+FbeH2rx/sifOY8r7o0A4tFTypsMyGtIISEcjo2/jLGYuDxRCT
	 kh0q8VyOOmfhuntUAsK5UbI51HkAeZGLr84YZFqBkgUnqkhfiPzbQvqj0yheJrK++GcEi
	 kQblOXvn88KhDUSsL+UAJiADjc4FcJ60++ph3IabHyhxEI3OEGij6wL34CsxVTGbNtdAu
	 aip3OjyeRN1mLm/e9v4BFv+JqYySO+6nZ3MAE+y+2w2PD1CTD+WugceizdnkbWA7M0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
	b=zKX+JC4SJqgj647UsA4FPeAXQmNk6PRhE/2vd1G+w9P3pXp3khsGUB9JffiI2MAiXJsG
	 L9/KkhJde8mMhU4952Whv+XyBpQRx+GH+Zuz5YZECC9jpw9D5y/5esfTDTab4BSoINDgP
	 wsHo1Q9UEyLnoYGghNmFRXfE3Mb+1UNWcTiX8Phw1FkeXStR7NtHp1aZJ6nxIQk9wEb+s
	 wCgLa8Yom1J1J/f7ctdhFyQ/D0hwQ0OIU5vdWaK0xIdtVap7mL1Zp8+8EJx5VKf53bddU
	 9KQbw1cjysoOGAe9q1gNYQQQSGR9anWQ2sR13whQPKTQgM9FJ/YZdZDIaJJ5Du2jalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxXkJ245;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ob6ZogyF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC996606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC996606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxXkJ245;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ob6ZogyF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxKtR1145611
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=; b=MxXkJ245Fbhum7/Z
	7a70COi0qXtZslToWtGW2SIFV4hVPZx4qI+2rEiYtCBNvHTjUxCQC1Hh7fZNANGD
	qAj+cuoDcakC7aXX8GfnpHyLkUY0FTw39xvM/vVnECGggOdYNQ9VTtoPEgDOvLc3
	nltv09bE1W5HDnkmR94P3i/vKLZ1W117kVHaH95NAQHZ/5EzNgHDgg8pmQ3/Lo3X
	bS5fzQLIPJpvrjpzGH0lKyjcZ7FPRyba5/PXY3bwdHero8mN1xwZUcOd2eNVwmxG
	E3RF3YaHZ89r/9DGeN2hNXJ9V/s1nIbHWgk0SJHTiw3jYCZMH1EdXJrJFf15vIpJ
	kiP+9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qae8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91be1227fdeso63137386d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499568; x=1793104368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
        b=Ob6ZogyFJY7a2FON4vCx0g3C8cGkF0WIkkulygDQAuS755I7imEfSUE3R8Se5pIxzd
         hfhqeXwiiBM8KHpg+mHN/gIbH8I8L2ByFsCte7efF5VKd9aoS3Ks7sRNmDPFxIP8Agv6
         5XRprUr2vS+p65kpo0LTDw6vwSKu39SCb1+SpA+273VJduLNTvxWKF8gunF3ok7eqEPO
         JzMWCtQbpmb28LyOfl3ZNnTTCL4O0wAYuoVMHAPfrMGF07SzF1NE5W298PK6yod4WX5V
         z61aT5Ea2S5HyBLmAXTtQc1meKmQH4a0r9yvyOcuSEwEy2yRKEwbt6mGeyeL9AEC6Px5
         ksCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499568; x=1793104368;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
        b=UGrdmSbdyMXVyaBWUYl846mVjF9y0z9hgeeg3Y4smKM8x5rRkpzPIgE3Fc4DVf//kY
         BaiiCtYHooiTtGwDewfdo1fUbjr/xoHwtZMu/Z7H3rCorQIT4vOc9DPhVqvN8ED9K+Zp
         kriExIcXn2eByOZKyk0f75VPuo8LUb+q0S40A6r3PVMSsIHBRbeyTFFdjjeaaaKj0h6T
         2xS9icVmu9B4kRJIpqfADUDwdw76KlwFZt15I94R+dumJ7pT+ZvUN5mPxl8M3kWDNZcT
         3y4KfTlXH0/gePRvCptg7S5CePfzShoC7T1Ih0A6JBnM//QWLnlnS+YafeQ8LCnk0zUO
         20iw==
X-Gm-Message-State: AFq9FYKkgkIPjn7GlRlLo11Bo2dUl0tcli55K5UhA88FCrI9msuy/oUv
	XHOFGAq+GVrmsRnh6/ZEWPjX/E5Yf2AjuSz399pIfkaFi4s362KK9IxjAdBtr7Sizc48o2YonQF
	Nu95HfAbST44Xki/bGNQU8OkqjFzZY5aVIhIA+LFRIv9+Etw7+EfCgCS7r5mkpaS2JrZc7QHw
X-Gm-Gg: AYBFou07FL7eSWmMd2Ll7/pNYMUmWUgCL7fF7F8HnYqZge7p1JMluKQo8stA2Wh/AsT
	Jk7+LjQUO3ok91SG3tPjkm9elLApe6LF40xT6iydoolbn3OekbdIyEAWNRQzYNm2cAfEjHuNc2n
	3TLK/6QHIDVwJdva0KoZq8TTxxKm9hLHAnHiYX/T0GV8R8CSdgm29StC4rI1OpxeZ97jFcNTKP6
	UVLjOpj/DUN9zOEGVuNt3vtNyej42S2CEDDlc0UZmnink+dsppketvtk2N4LXTd4hG5giweoiJ+
	tVS7EGAAVXcH+QuykYJZh3HuaLlIBYzaupiZrmSGX4tysY5xqwrHUYDKeSS4ysnwo0O5+1hnA7A
	3ovfvYneDXTap3FmWpJdBHi5mk58=
X-Received: by 2002:a05:620a:a7d7:10b0:93f:3163:3e25 with SMTP id af79cd13be357-93f31634247mr931725685a.24.1792499568007;
        Tue, 20 Oct 2026 05:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:a7d7:10b0:93f:3163:3e25 with SMTP id af79cd13be357-93f31634247mr931722485a.24.1792499567536;
        Tue, 20 Oct 2026 05:32:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm5866725f8f.58.2026.10.20.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: kunit: add test cases for platform lookup tables
Date: Tue, 20 Oct 2026 14:32:42 +0200
Message-ID: <179249955803.22604.7440027670903099589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BathasIF10lvokVpsClaXkolInnu-aOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX8GTncW9B3WFd
 rncPDn56wln5CbGJCOB6eCwizwSpkokyZzdteOHxF1/Pl2FdChTnQCmZqf8OaptEvdmtfhTzPD8
 wurhBf1EhA6D+0CGEeffPAXL/4zxKzzgQpa0Jearq7SOMphcpCsmsBg1/paF2fGJ4R0k93ASsA0
 bhb8rxEm3RGOZ4tidXjJ41PJj734ihoD0OHddqsHWj+7GTtms6ILSpPM1puN2Q2f1VDE1yypiJG
 oQnPjW3KdhZRMBpV2AsdmyiyjYOj3rxLpZepXYJF+vmDhdSs9fAf+mSmhUDsuxahJE4YKnEplhK
 Pp0W9MqqWjSgm9rEaRQICuCWy9AJPv8ssC1LeEXAx4fxwlb2ChCzDUHBnIV0zXDGcnUWiHK9jfr
 65n03SCeCUoK38gEeggpiuEmePUAime9KQEgUlxLfIKQbJjDPKfai6NP3e7TNQkW9plu4rRFpFM
 F3nwqUtTVp9NX4ALU+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfXwjVMuNPnEoIj
 BMJ1A+vv9gWK94lSVFnRZz66tdMsO01zC+jJeESPdPTL3ULVeqn7RYRYTyDsk2tUTMws0hV6O3j
 UeVdWwgkZ6SOgPYIr/W8Tqcb+CGQ+Dw=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad75f70 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FdTQldbedhwpIuYvQycA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: BathasIF10lvokVpsClaXkolInnu-aOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200049


On Tue, 13 Oct 2026 15:02:59 +0200, Bartosz Golaszewski wrote:
> Add test cases for platform machine lookup for GPIOs along with some
> minor refactoring.
> 
> 

Applied, thanks!

[1/4] gpio: kunit: fix the label of the dummy GPIO chip
      https://git.kernel.org/brgl/c/26615aab18d5a2c71170cb217bd80ee2aaf937db
[2/4] gpio: kunit: factor out common code for waiting for device probe
      https://git.kernel.org/brgl/c/c3e8906112e0c2f139b6d2c3db25835e8ccf643d
[3/4] gpio: kunit: rename the swnode consumer to a more generic test consumer
      https://git.kernel.org/brgl/c/d4904cd39642e52291ec84dc9c1879cd811f4e09
[4/4] gpio: kunit: add a test case for platform lookup tables
      https://git.kernel.org/brgl/c/9b0183f6943516a071e74990646e95d046b082b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
