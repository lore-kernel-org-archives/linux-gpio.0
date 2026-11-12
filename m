Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472387;
	b=AA9GNKspBFg7fl3+lDXpdV0zyIJ6dkglmDcA7W070T0KPK5i/Lhc/kM4Ze+LJOfepdn+
	 ERB1a2zCqwtxasTCJw6Ny2UQ36UAYCOZbxvQGy6f/UjbnK4zeoWoF9MNtWK/w3ZGw+gxj
	 HGZT6IRu5RcGatBdCfmLaSZCUUUeP/gKAVybo0vqSRxSWHv4mNYVBk3iZfrSjem4/TiA+
	 3sfgMUzlGcscNibbKDUrgyIpmf2PBdHACriyUiDIK6k9iaL2saaOoySdx0f0eA54HF+Wx
	 4ELzU2xIthn7wY5A0lR8kL6Kzbyhk0hiWOQzDf3XptmFSez6VG3EEqbqIxG5e1hmTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
	b=uYhtW6rK8sytaIhrrbkmt33tER4EE1jyycgvFh172KYtQiSfyHtYGlv5Z5HlW8DUCh6V
	 P/DKdC8XljacuaFEntJzqRCIV+p49iSlBfbAko3xwDSdKcEbFnA2yCTFhlWPFXwbIvWCn
	 8slgpIFS4SnSU7pmAFUDVeizqgmIWrnxauUbQkPl4raAqD6mZmNj44lALtLBsvAcIGGXP
	 CABjIqTsnnnW7ldjINdbmxAJDJMnT9fED+CaB5PZfnGGHFzlK9gLtzBnL0ghj7FdUSCTS
	 wEhwfHVV8QMxNv5HtRdznOCVR+dDSFSvsSplg5XpO5SF/yK0BYuEYW+tNGDM5e9YkqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDjGUTWu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwH4+mSz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F360A6F76
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801F360A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDjGUTWu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwH4+mSz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zfx04149469
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=; b=nDjGUTWuarL0gomG
	UiYUJvOfTJzCppFIuH04vgZteDGys4xua+WQ2rQvyrPYi3J74KvkjbBx+kVUOwds
	t5cZth1KVAxpmdBXvikHsloUpL5yKFQ5A8ZDzalpxse31oahRXVNA+yrbCm4y9Zp
	S+mkzi6A5iFR8RUAPAeQunWmS1H7/JtwDXq5/oB6HllnoevfRCeNWro6AxROawqV
	7QP8xdIXVRh4Te8Dqnl75vH3jn21d7OjC9cs8peg+RxsH3TMj612uLOuVy8vW0CN
	AVfCIKZzuAw+JUtf+Iquw+aZUJX0vuLZzXiWV+yWPJkov+ZtjhWq/u30KxDN8IVw
	OqBWJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62j2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:33:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so959521585a.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472385; x=1795077185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
        b=EwH4+mSzdFw0Fiz8KNZkU7w/+uDzB+PZ9h4gO3ou5mu53eqSGp51JEwVaXOa45P1yI
         3WLJTbyjmApHDs7xPUm6Hr7+kGA089n0Ixx5gDaXuoGsrYue9ZJXeJaj3NRdI9RReBcE
         4K2X0NrdEp2qPES7yQsdBfOmcIh6KJh7M/v67i+aU2hZOyXW8tXkGtZt3/7kAurx4lRD
         ZuYAavcRKqdpoCj4jSr+1LIllsUSsQ0ztoGQW/aEQ1gKW45SFXUZ0rt+3mPop6rSXbQs
         0jf0aXwVtjXsPTYKK3QAOy6mfZtd4Ak/P9mgsnBtHlNbn2OeopORKXGRBBJHzQMj9IQ+
         Eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472385; x=1795077185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
        b=aPUymUrFNhNhSthm7PT7VX8jfsr0lBI5BnAcQqYSc6p6pwNJjT4bGu6K4g/PtsdK7l
         N6YKA/Lyz3lN/IYwnC1fLfn8Q/h9HU9GP42Y6/18JLZszXoo7GAw5NjZn9GL98Gwd90u
         suQBMUQ4EFWeCwG8ztov3xm2QVjFyISM7/c199SOURJvrXHiVYjNKL5C/v+aPHhVrsd0
         iRKOGFlmcWgPSy87E03b7x/2f68LMOxw9wydp7GAHbmwopZubPkQetWybQsqAATDa5Rb
         dK0qtBFAxtST+Zd0EpurHugZjqYkxUxyf0ZZuPu0kfL7lgFntK+bf3GRqdx0R+WZq/DP
         AnoA==
X-Gm-Message-State: APuU4Z/hymFBGEjNaLqhA+mHJPSUjXCFTBs6LnS2NnQAiRRjOFcai5dw
	Gm+Af3mFncAzn2SjdG5qvdatWun7ZUyrAJMyiQzg+UBHzfzcg4uWFXcXUdpRGt5jfXWJoohwNPq
	E8TO8e1LdfETxYK5XlHmDpuHVUctTIgxqeQ6xoo/dmpLkvc3FAdyYte1tzhwEmJJb
X-Gm-Gg: AYBFou10Bpr7FpBFAzxiowHRsut9wZQlFGA6Q2Dm1bskHNjY2q2RigLVB2wBokeu8r8
	1NKtt8tOGNzjUNU7u7PAWRlljXe1/S+W2Ml8uWTkynktOMGT86C8jS49cu/MtzzKPyL1bVaeQCu
	a1Pqv6Sg4ZlSn2M7yKB/df4VTjsRxpy5FWknghUW4P/Fcpmy46ZhXbiln4NfaB9XqcDVhMsAn0V
	TMJy+jkhjtVstrDM6ivCERExB1hP51FW8bE6zsA0uABNTKBsoyKr1WsJuWp0aDDWNrhCNntPsM8
	o2oUNelfUtpSPphZSnXBTMMcp6J0cKrPLpAnoWpWkIOvXgWu7RfqPUpHzSXK4SUNBXFseCOoqj0
	IOeBZiZtNn62D+pczh+hVfKyH+2klZUjCGKXAMhjdCCRsmm8VFvyXhVNRkumN1p3cc/6nO5hES4
	J4
X-Received: by 2002:a05:620a:258b:b0:93f:2463:f784 with SMTP id af79cd13be357-947b00a70d8mr830039785a.66.1794472384907;
        Thu, 12 Nov 2026 00:33:04 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93f:2463:f784 with SMTP id af79cd13be357-947b00a70d8mr830036685a.66.1794472384376;
        Thu, 12 Nov 2026 00:33:04 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49bad3cd31dsm1070593f8f.56.2026.11.12.00.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
Date: Thu, 12 Nov 2026 09:33:01 +0100
Message-ID: <179447237994.4979.16703071994688693548.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
References: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: z7l0JkbR9jhCDBNDCXxX4i5JHfpCaHFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4gjIQeOmQWJ5
 PevoQMNOlcsn1PXwkIi+soKg69T1N8c6vOsQEac5tT7VTwiKHqDKgS0ckM7EwthL0zqzoMCIWEX
 TSnkhnZTpiEZ5l8MYYZvedFGxgoRq6nOZfPACfqWVvDY8bmczcFvEHqJ3vOL4ihP8M/AcC0a1/A
 RxfpJEq0nogBimunVpYCfomID6T3vSZ4iyfV6tlzfm21QmuPP20agAJQXt14mDE9Lwn0vzkyMZz
 wNcJPE4szd9d0aglQiBVZrNTZr9d0B9R7gw8zHyWlSbbBFKPX306DLhao9dT7sGEO5xmvGnie9j
 siYkGzuLONFja4SEhoPodHPaDGREE8CosU3ff+GEYG0/o+kJL5WUfhDbwoyPRW/IeOYM+OxBD7F
 0ADsud90W9Qj8kRTwuHZASxgVR+vB6FN9rCqFm682xYNmu9GuD/qsdumLcg+6WXnVnK2NUtgKE6
 d9a5y928bOcvYq4yHJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwiOb4uYAwtW8
 5bOy6yr3WA1jXXNjWMcpLf5CcH8Qz8a2HLe3op4Zde43E1AraCpXf8dPE9HO/0uP7DbWZmVGbHk
 JSrdW7nP4FwcJIAisNb3XYMVvjjt4sk=
X-Proofpoint-GUID: z7l0JkbR9jhCDBNDCXxX4i5JHfpCaHFk
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af579c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1Ip7nPS8rvKNqrQfddsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033


On Tue, 10 Nov 2026 11:01:10 +0100, Bartosz Golaszewski wrote:
> In gpiochip_add_hog(), parsing a device tree with an excessively large
> "#gpio-cells" property causes a stack out-of-bounds write when populating
> the GPIO specification.
> 
> The value read from #gpio-cells is used to copy the values into right
> places in struct fwnode_reference_args but that struct's args field is
> an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
> make the loop write past the end of that array.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
      https://git.kernel.org/brgl/c/f8a4fdf57cedb9cb3f47d94269ff27fea8e819e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
