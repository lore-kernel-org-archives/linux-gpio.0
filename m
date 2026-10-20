Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501838;
	b=zzT1XVQdw+VKGJgG+nKvj2gubChlLqFPJ4hG45ljQwrA+tC92ywz+f9UyjtWFQjuKiG8
	 p40G4Vz9mYGYDXVbLAt5ZquUqcudvxvHr5F4m/sVKGVXwb7WUbrKfkvI7cwQyRlWOk19h
	 ulh4xZy7ALUJQ5+dNOkxFrfninu4Si9ODpACJz71H7tHzR4CP2NzF6SNngaYL2Eu8B7R9
	 rzHrUbSm/Ga/FhIdTQKCEWI+0lP8bgTSsEWOFF2ne5tOpPB3CQrPSirWViTC9XShhRPHB
	 9xvBK6KZRVq0tXzqSMaJhw4c+/PPLvpDz3e4fXxCxPnLFzynkAtdOpYjvYKOQEK3f7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wi9AvJhL7GgsscewEQS8+q56OJBQ3yQwjM1qgKgX71s=;
	b=DQCxuKAJVDXTKxdofWWbSZHtcR3xwm/qIZmSN2Wgek0YUQu/4fCTZ7152viOQttRaGPm
	 SNqW5DR2lG23LeeDlh7qCtKhU3OxONoxqi8vH+LFoZTjg1kglkzm+blHeylqEBqdUYoFT
	 f+wgrrPKCbNkkcPTNVUNcyO+FL9l49bKJuG+r/LzO1A0UtGbF3Q1+3RaTiq5Y301h56Sp
	 3vMqoEl2V8+sSJ0QE9RBucaW7M89P2zGjWZaMjItkyDQuPNu6m9XGwKjtgUzzkYD+mmLo
	 Jm8DRWz8E+jOnNOvkZcfbIQKqFS1nSqwIEJXpbjUWTVVXiJ5v7tYhN2smmGaZEUjvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue03qOvF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ia3FC2Tn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A05A606A328
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A05A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue03qOvF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ia3FC2Tn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9sJP2809535
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wi9AvJhL7GgsscewEQS8+q56OJBQ3yQwjM1qgKgX71s=; b=Ue03qOvFd0O8GNPf
	tEBEaGVcgd/KX2T30GzGbEXknJu7AcgtadtRb7QfGzcvKokqFkgNx2SKmmTxmr0f
	ibg5lYEdTYfEqR9Pbq6N5XBnzvrKZqlX2kBj/noukd27krGciHb32bEHqYCieWVL
	7nPCcd651viuOI+oXDJZ+7bsX28I1O+xVE6ttfJOvhq9ZEZowqP0ewwyxjlvAgMe
	forpCGFKw3C2oAi2TYJmYbHGW67J0K9TvY80HQfw5PKBdBmtR7FHdFbdGp79GyXe
	UzcnTMWzuyxbrcRDFE7nQCmgclx8idlU987uwo1kSSI4kwJfjLYr8f2FQxXtTk2s
	wCZ7AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2kxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:10:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so658480285a.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501836; x=1793106636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wi9AvJhL7GgsscewEQS8+q56OJBQ3yQwjM1qgKgX71s=;
        b=Ia3FC2TnVSZqn/JoAAW8qS4noQVNR9jyO30DJU2PixuTsb673FXn8SawUyqAKILYI+
         GoZMSzKEnGmFJfcOVaAMCC9SZNQV6Rrxd+2zfPjFzbKEe9p0Y6yLrEapS6pc1cAPxNV/
         KYW2Z/mQwLzC9plehjHGC/kiM1HqIG1UdaNzIala5cEivDn0EwqXlfRWd1njm3QlsLw5
         lVRbNY2fp6BJBi499G4PiAEs6X6sEPVpOWy+EDqK+4RpGFdYgzzfMcm6huhNY8gqEKBA
         4e4cGSdswWWR93TykdaYPLTy2AmyhPAJ6+axdqLEh0hxNxMqvswHax+18dJl6l6V19rO
         LLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501836; x=1793106636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wi9AvJhL7GgsscewEQS8+q56OJBQ3yQwjM1qgKgX71s=;
        b=DWMsKBIwG3IwsSrlJ9MrCP6PNbsL/kiEfqaQXGWIMPvdN/Amc56WvgthG4KnJRd2wC
         dclEy9D8hB84waU9yOfC6SSOYIiYRK2TU2E9yhkc2suNvNPrn4LAisIywjhXfdOGg4+W
         JmV/0phbVJSKQ2hg9fhbTQS8hIfCNxlc2/1zi7LMTKOdFpQc20HU6vnOknLWMRqOjMF0
         C8359ZWtDLD9zxqVld9oKob3chbK+uLDdGBkcyqZOxtvt0jXgDBtN14cBv9a7FkTjaFy
         MRWgzk4Vga14SD+6l3cT+kOG5S8bsC4PHdy2fMah9f0/Zx5b1XrgU4PujoSagyVxeyw/
         kxZg==
X-Gm-Message-State: AFq9FYJ4Zc1P5KhFT/4LqfbPwwLLdxAFfHSlkEXX2fgbesDUKgmA+sX2
	qCa0O6zhzHNCbzPOhTdvH3tmGn/HMFf7qAsVdJj+tM/QZz43qHnpedU71hr+mJFPWLqDQOWFJ47
	/FYBlEF71JOX1ibEnjOyI4gKGeR+YOqEEoGELB/hTioucfn8Y39Yg+8wPojW6Gj//mp9jOIG0
X-Gm-Gg: AYBFou05X3Sr98Q/DymxlwxWeLJUxwi8vojsk3/rob0md0X8zZzkM0n6nTyFBJUfE5c
	C5RigKWiiLTxpJnNC7gA6s5y0IlO1JsBnojvVMGHTv/n3b6+kl/ZqjE/xaJ/Cj0MN0Lwv6yMhRN
	W+fSGTIX2Op6vGjU/VwkVvrar2lMzOGiRmL+9O+4aDjUPy6YvydREUpdeFIGn7mI+v76D3lfOME
	/Zvi+vDsAmIMTEQG9+MZNow7oi6bcu3axhk79JOAGMWb+5twwCB6I5ELIVnK9yjKyMrjx/UhyIK
	jruEFvYPqggO+rSdZ9vyG7ZbJo0CEpsgJJjrMbBmXhFMSsuzTpbfgLSU8NGox0GOdjobChFmqwo
	nIT7aePSQ5kEBUTmnB0lghhJBGFg=
X-Received: by 2002:a05:620a:7001:b0:93e:c12c:f12a with SMTP id af79cd13be357-93f29dd4321mr1860871085a.69.1792501836491;
        Tue, 20 Oct 2026 06:10:36 -0700 (PDT)
X-Received: by 2002:a05:620a:7001:b0:93e:c12c:f12a with SMTP id af79cd13be357-93f29dd4321mr1860864885a.69.1792501835849;
        Tue, 20 Oct 2026 06:10:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm6135962f8f.27.2026.10.20.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: (subset) [libgpiod][PATCH 00/14] bindings: python: cleanup and support Python 3.15
Date: Tue, 20 Oct 2026 15:10:31 +0200
Message-ID: <179250182886.32658.11228549993990527050.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
References: <20261020003728.13669-1-vfazio@gmail.com>
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
X-Proofpoint-ORIG-GUID: 1iUyQ2Jx2_XBKTUOCpkMgMTAPgIWRwhy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX7o16BiGORM6l
 JW6Ut13ZQc/ltgX1JJ6VZvjxkXl9VSGxhcqQQUYw5M0RjtuBDVa6zFdoa+8I0ZVXS/AD1rC0Rmz
 EfQCYVGBFBQEqSnoLWWxLiIcON8X+mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXzHps0cTr6KJo
 btB2ZWB2jR30Mbi2vB11zwNx7tNymC1j3M5tDeh6yKdPqSmgPuB8mrW+5sFUpFLIfziy8GyhBh1
 2aKo9RWyFpIa9h3XPiAla1SObZLt9w/xXNUUcYqTIRro4JDusVZffjUvFvIGlIF+4tZ0vxOWjdi
 OE4wvNYe+o4cHOjIP5SBGAIvddqeTqyfoGXywh2Mux4NPO8LZV19Erx0eN/pEDQuVcuvtHfXJsU
 A0DxtMo/eyEogbJ4rKzSJjbwChXZjsm9CofMWI2lon1TZzi8vA0HkmCLXlOZNtWj9zQQjYVjl13
 u8T9R3TOlpDakMYO7uBbNHOk2/AqZAYlBwSYeNBZEr5uT2ifYZjxOU4yOhZN90USgmhQ1qjAHtI
 3qUEiFUa6QondV4lWBhQsIcs4b8H54xNTMeV4WActefbXAYPyFLlUig9pTAYXgRgUxa17PlXgOC
 7Eps/Klsvd3ibUggFbg==
X-Proofpoint-GUID: 1iUyQ2Jx2_XBKTUOCpkMgMTAPgIWRwhy
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad7684d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GrFWRIhoB2QzIYLf3d4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052


On Mon, 19 Oct 2026 19:37:14 -0500, Vincent Fazio wrote:
> This series prepares the Python bindings for release to support Python
> 3.15 by performing some minor clean ups, fixes to the bindings
> themselves, and fixes to the script that generates the PyPI artifacts.
> 
> Patches 1-9 apply fixes for linter callouts based on the default ruleset
> selected by ruff 0.17. There are no functional changes.
> 
> [...]

Applied, thanks!

[01/14] bindings: python: _internal: sort exports
        https://git.kernel.org/brgl/c/3e074d711e6b4ecb99ee149afe079d628dfa8322
[02/14] bindings: python: _internal: simplify poll_fd calculation
        https://git.kernel.org/brgl/c/766348cc6d2cae49a82c1e808578c33223b7913e
[03/14] bindings: python: _internal: collapse isinstance checks
        https://git.kernel.org/brgl/c/5524758ab4c3b898b675a1371c7a7fb390546344
[04/14] bindings: python: setup: use a context manager to manage files
        https://git.kernel.org/brgl/c/5a2d64e1a49d2827d033dc66501121246170cac2
[05/14] bindings: python: line: sort exports
        https://git.kernel.org/brgl/c/f007d1fbed61647da208bea8780837c726467c5d
[06/14] bindings: python: line_request: simplify __bool__ expression
        https://git.kernel.org/brgl/c/cba46d470a37bb37ee71b26ffbcd7095b3bf2779
[07/14] bindings: python: chip: simplify __bool__ expression
        https://git.kernel.org/brgl/c/18677083510ec995340c04a0cca65838352a2f8c
[08/14] bindings: python: chip: drop redundant exception in reraise
        https://git.kernel.org/brgl/c/c2e9287333d7be588b3acaed7bbb1c58d7b551be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
