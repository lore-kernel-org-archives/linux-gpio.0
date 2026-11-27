Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772197;
	b=VU1w2sNUb2DzwL9SOOgbx4YHiI1EFHiLc5LFdMY8XBZUgAz+tmypFIW02j1UtfF+Ftjs
	 AHgHpXQGjwmZpc/QTewO37FCsonRJ99d6gnJDs3B7HkveSmK8QMm64IaYaeeKk5pVGXus
	 sdcQjbsGBQkuGzKMIArz+M9VMS2mnJNF9z8yHv4bAT0JusL/oo6w3HeIHg9aGYYIGAR4x
	 yFJfIReH0gZNBcAn2BJ8Qj4bejTOf7FIH0QgmO8H4SiWQtPQ+3Kl++pmO1YM4jWWJaD4v
	 wKe8NmPuZRKm/4qtfJ5So6pIZsmrAJ0JRJSAchLsiwV9J4MRIaMPFFPVLe6/jBpPlLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
	b=vS16EmHel86aKJFxjkO1Eo4YPCDkf2YV0Kpv/yqA63Go8d8AOF8KCh36gyGZI2im2d95
	 ZEOe/yVI2ze9sOzOicSqrBYoOa6wWamDejB4XwYfXtOTo77GUEMPZiAX8MTM6QwHUi+yF
	 ENF0ABpM1Hw1L1aOari6axUl24hyHAjExaVTckKmbhdnw1pqUaVayUkDX6yBt2pxuVLi9
	 GqEFcC58PpD1tFEeC4ki5XOPcF+3jT3MuafA9XV0bOR5I6j3u51VFBn2E27e84VRDHbAu
	 kzH3g3yWnbBUo5NQMlqrplmfqn00+QbbSJjXteTPoyP3Ex6RJe1CPF9AFDIKDEwuCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FA606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbiO3983841
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xCYv2w/5Bys
	KW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=; b=eepVaFkOnyM83UTWIHlNgbUxcWG
	BajkL0lCb3KCqRsnLolSsnEx4/6q9o00bp/rAh5ifI/UMrVAw80iSJBQNKSF+Bb4
	zS4zqySl/tXHYsJ8FE1wVkhnaVHV0Q0J+Gp64blhnBaFQlEaCvbETJkdCQYqGAsy
	zGTXhavPSvQfRUUU2AYkHSEkTZWu/uIH5fconA+ZpXJKMLG364732+hSeSa7dq6p
	nZy1Dmd+ruEHXX4pYN30mBNS6DVnElgE9MJ37ZN3Vbt/uVErHEALQuKhmjJS1poc
	eZMJHc48I9PW7CbxHLLHiPJ4a1c/fKI1ozrCQc8oGQLc/cGH/lkGFgmDHtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49aarq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:36:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so5449089b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772195; x=1796376995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=jjk4lqsmdjW0BvlwFEoUMjJR9sikOhsmhuEkKgabTL/3OK2ZUeoAaWycmYK3qgEXVQ
         sAK6wT3YE0LPXwI54x/fdPHgTLnzeQv3oStnsqYT0Qm04WsBy5PYuQDM50yXfy+RyhyA
         7OVlCtm9jolmgha5EGVZspUdjnWgmN2Av65PK1/B2e09o2Kw5GtXJI+0goFeBqMFR3wo
         39jV8+YYAR+WGXddwc77JHNsWMJQB5LCbMZetTSO52cfCTVUXBjAc0xRyCwtqYjdZOhb
         IML8QvWlWzoXf1SXVVrWHp+RZ7UIUsgSJJbpzK/O4TsOmprIH102GSHSiUOhTKGseQdu
         nmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772195; x=1796376995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=irz05Yrj4DfZdfVtLzs3+0b7I70yB0fvZF8JGWlCnoHCJZhRBebc7mqUJzaaPbdI+f
         Kdl3MSxWzxU9HAmlAYj4+6oxT86enkYD4W/HDVMu2Uajhgb5vnjbh5TLilIfZoCuncWr
         w8e5Qokp8Owx7WIp8gFbPl+0oK/PgtlhKhFQ3O7nS4FylrVqCKylpC0VL6WcrzwZXDbu
         n8qDNX234xfIRcT6bUkWz/4fBYps4P4oR+ym9ILU27uT1jvEO0MP1HwHYGZ3/25I3Jx7
         pVisLAqZ5yum41itz4tk5Yp0Cxr3jCgVFW6OldgkQDEcWAp3UkGxQ8KsVO8hZVkQu3B7
         aCNQ==
X-Forwarded-Encrypted: i=1; AL+hErFsxjmuqEO2P1DuLs9xqbOGH1mFEqtFGxjuklu/IlMBdV1P/V5koixo6yrVSe0NS6cg+8owi1mbqNNL@vger.kernel.org
X-Gm-Message-State: APuU4Z9saCig8rvdkCld3jFFpnQPEEcQYuXIpcUQYhRVICKYTozIdIZ3
	xiQSN+gRdkWRtvmNOHwis7oIS6TiRjUlfQey8K2UCBkWHJYUmvPs7uEDp57QLnxv4bQkUKqBziF
	kKI0CvX5UCqeZ3t1gq5jSLuO4ThR1NdnXy74xr3sNS9hgU2by6tskYBJ5anX7WWL0
X-Gm-Gg: AZFdTZca3LRuCUV93p9UFW+4CWRZ8K6844/oezequ7XGGidPFyR9yVeUi92L2pyHnaR
	C7gPfCYSrEpFsKQXhzuwN6ud0QGI5OIwh2xEd0tpB584ZwR56/HK/2vZDM38WXKKqKSeIAYQx7p
	1OJbEyMnoiEP3cVe3ZAQGMziTekMNmZ2wd/Qxh9NmczQvEaJAOoDOKBvmo3ciTAaCp85VisItfB
	jFFVkKAcCDMKfbUiFINnVyZegfwSPkCxpww5JMSojxfPHyr221MwNSeEbgAxxm9XVhBIS3kVGgu
	ttF3acYC97z60BDqbuiCUPuhA2BxYZ3T7lBKUSHKGDqHmTxapBP3Yb6easaSrXF1rAgxQEGnuJV
	RrfFFIZMR0kDEqZx9ZvfVb+RcAYI+u7wXvu2fhQx9aytYmsm8YudS65/MQM+78XoNZ0QNWKlOn3
	GR7HZUaAg4w/qId5ZS1XyeVFjoW8tFfkB5oH3Ad386dC7PmE3bDkRTTH0=
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23327029b3a.38.1795772195425;
        Fri, 27 Nov 2026 01:36:35 -0800 (PST)
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23326998b3a.38.1795772194965;
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm12384340b3a.53.2026.11.27.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Fri, 27 Nov 2026 15:06:27 +0530
Message-ID: <20261127093627.3292152-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com> <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
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
X-Proofpoint-GUID: 9VBXz43-qsixSdRjUTD6gq2O0W3HMZF6
X-Proofpoint-ORIG-GUID: 9VBXz43-qsixSdRjUTD6gq2O0W3HMZF6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX/eyReg7iRjWB
 CO7klVeD0DJ21+6HARhblU8XR5WxP55m+jixjBQqsPDwOp5dRKpJV6KPkV3S9OzDb3hhuPDqXQ/
 GtxTgf3QhWfgJ48leNGLuS3DFqSb08s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX0mVvJMBNBHXT
 CuqAj76hdy8lbJHi9K+NCegpN3esQp06ZPQd5XenvlOBXu84LoKPpzEsgHZVZvD5hSFaw3w/bKv
 okbBCU2QRP6EMBT05WB8JI7ZOEDzBiFTs+7elZBOfXAZvnNyzYp6LT2qvsMxymNtjiyRcYSULbj
 4zcyMv7knRdaiyP3ZmqV5rQEeovNMR51ZRmQ+lNeU+wrvZcNkRv/uyljhyarWwyVkD47EZcbISG
 6kbnuWas7g+7gXeyV0bcRb804UKTSzi0yxZktaNSvzBAskqaG7mF7ZUQa0pzm81U54Ao0JZvTR0
 f/bwNK1GbUqpNxsJ9zOaPClLU0XDAhPwKLRb2z7LeA2ygGBheuVdjII5CWzPXcoe4V+kdjZFysc
 C3dC0uXcQnt+gkxN9MdcLH2jGAPg3i4R8WNmbAoWkQX124nXyNRAqIOy6+y5/SdUozoPaM/excb
 juB4K3MlQwUo2Ck49sg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094f24 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RgwWSSqwODVOsrknLmAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 05:26:14PM +0530, Mukesh Ojha wrote:
> On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> > Add the TLMM pin controller binding and driver for the Qualcomm Seca
> > automotive SoC.
>
> Where is the introduction of Seca ? what is  Seca..?

Seca is a Qualcomm automotive SoC. Its base device tree and the Seca
Ride reference board were posted separately:

https://lore.kernel.org/r/cover.1795517711.git.yadu.mg@oss.qualcomm.com

v2 will add a short introduction of the SoC to this cover letter and
link the DTS series, so the pinctrl series can be read on its own.

Yadu
