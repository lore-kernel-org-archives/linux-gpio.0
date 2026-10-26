Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027085;
	b=zJPzmkbFDeAwU1pnAXXMFqrNC3/4vYTHyCBEiFxL/fSpaeRx7OGHR9ef4Q/LtE7VqXJR
	 CSyOSw6wWrkakGO+iX/X5z5sFr2pcoSmZhYvOWT9eBt2TNMcpYwFbnQdPpRGxDKbkhOpr
	 ffaKc+0W6TiEuxGADzBw7Juxh7MN2BSKXH2AiW7vNqQL6RunbVkv3XEHGXfsPTizHTev9
	 HhKucN/0cxcvOHzmNGzlahrpdRI1UxNx/FeLs13cdvpYCNRM/E7k3nnKvuFkj1ZvxraCD
	 3Nvs/OpOnUekriY1ZsbQ+yiQ9yojBMOhXXCQfq8+qOdNOcghC2iCE1n6LDLHXsJuZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
	b=xvN2EHqGfSzQUt/YvWkhGXgTAWESFNQteV5eLKwwm/yUnHOXCm8GiKGsodHDw64HdUft
	 GThXleDaSZlKL9JmUqZwCaqsQyaIZ7RBttGedaduXIYMv5cFhDLnex7zEExmg0STD71hG
	 52UNEAAkWCgcGWFoGFxUhhsJPDBhBSxNDxVOnwtSmkS3o90CiI8vpsAwb39F6mrPF7tsb
	 qgr9t+IwZYhFU7IdNucoR2UWwrSfIxD8RXQdQeWZrn/dxpHuz18t0T0XU86XU7zoQrioH
	 abfHF0L4s8bQaEsfG1/GO/3N6T7x6K0UUizejcBLCVTPHdIkOFa+virMSP3PgfrwIFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE497606A31B
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE497606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvrBn3268491
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 15:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcaOJI2AGlsc/iw3sTAv3zZN
	ex+qopC3DMZYd+jAZ68=; b=Wp+k3qrIh+YaEOH3QJzYJFTiZ7PA6rrOlmzaK3Om
	g0UQtEA9Q2m329GTlC66MyOtkGxhNan8rDYhGD29qFbh3ruypWMjsWZkeB7N4V25
	PVDGMXx2FRX7zkhbe8g03lJrugJOSeokhLe+NQBkLkKWvh6ZTmhF7FVg3oz15MSe
	s4rzCO9TKJi4nRt5HmUeuZ0tN6IDkXvxQuJo4rmVXIu9B2t9f8HzvWqepL8RoPto
	DKIgDkFd4WL6Tpxvo9UD7qZ+fgYSJgdY2NTb/3SDs4Fl3wdAx9GD+VF+JXynZlfz
	97b/FgepqeH7Za/Ssajp0IW3600ju/57XVxoaytBKsXkCg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp98ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso2906663137.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027082; x=1793631882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=VjmFmoeX1gIg3U1SLoYXjP5pHsJIadjcDDRtukuCP6P7oLFt001C33ZLvqCA8ksUhf
         X4UITAixns5Ghdpj0oQokP/6kCyKxEIZC3St0NjOjOIN2QELdAddve6BGdE6HyhKF0dY
         lr/lLKpMIp4CvVmBWWByaoja0GfjFgFFuJBBtCHdX7hr1CIM8j135sK0lks7TnKhEs0U
         4pPaf6UKbdaSFLezt3uRO0yR9FX+3eETUKaZgV+5qJ7Hh8MPTN1DXQxk+jSIxx0bjvpt
         zAX+WUssAVM2kKHFHv82pedZPd6dUXhXzZP7eYkFPrBiccc+Q22zIR2CU3RSAcpHYBf6
         GmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027082; x=1793631882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=rr7bQuX28ybK73ezuLCYCthkRzHu+5cfuNpVVWcYDv5HWewiD+BxPTZjBsqygEcHMJ
         ixdWSeg1eot1xCAvIFyWc+rlWb89GyjIVbejBE04bUaN2fACm4yYQ5BPCveGG3vvHCgA
         4uKc4VGIFZm/jqxW2K1SEynn4VRo7/QfmMo/2ScPi3IRWWrjSCoeW26HiCMpNQX38b61
         eYRTRXj5Hn8FW1ud95l7I8WaB6pwWcEDjnoywnWNybsaMydbzmqM2KiHdQiSI6ATgr3S
         YvFYqtk4Qho2iaGp2T98AVLUh46UT8YHJyWK9tkL3HmYgUyMo+aS2fQXfh3Zhqy9qC/x
         N4UA==
X-Forwarded-Encrypted: i=1; AKwUvBzd47WurDCaeQ46JfCvN177C+xARL1PVcZkNU3BfZyTYh3b+xiILyJPexSGcZ0bFF60qdYF0bO+ne5E@vger.kernel.org
X-Gm-Message-State: AFq9FYK3gI5yGO8uvNO3w/xS8C/i3ws0eGPGkRw6KAqxKzOT4hJXLEwE
	NnO+jMroFzIlzTElNRozf8dMdudr5DQRnI6bi91X/krjbglDam4icreIFECo8xNgdwFhqySq/Ca
	Opp8LTPFCIU+CjcFMMNoOhH8yjlD/3sLLYVYEO6U61Zi4lAMg/EAARz6AI2VfJLbH
X-Gm-Gg: AYBFou1Qe0Ei5nFrTwubMx+V6Kn0lZhk0l+gEbBi+zjkYgb7R5BL6lGEFJ/M5Aj2h32
	C3n1FDLRpanh+yZoWXGfEW3u3BaRG0VcTbGzbWcHdQlFwuh+U1dfKL4sK2qcvCVk4dFtMwK20Tr
	pNRK6v6B4A8PFXy39dCfWQVEkxFUoPNr372W2i5xunzVsUGKYWDv+FZmyHpe/LHweVWXAlRYKUv
	UYbgtsaPAj6+UJaHqcIZ2B4+6ut7r7ZHSLjipBSB/F1b8bnCR7FZjj2IqwCMBjhTXoeQtkOE+mS
	bO4+LgKWcHlTJ4lVqbCxOgo91VIxb4hCnsnVW7CevtDFEyU/iJkFRFsZHLhbzGnLE5S5Kyx57Qh
	OQ7HSJp9qmWmsqdGR
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188349137.13.1793027082058;
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188337137.13.1793027081345;
        Mon, 26 Oct 2026 08:04:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm200370845e9.8.2026.10.26.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:04:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:04:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
Message-ID: <2zv6vf3kvlb2k5oopypae6fby72ykqyg4pb7mgiomzyptolez3@namz2jhghdgz>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX4mcY5VvGeC0l
 UW+zVUcKmzgK1hMJBa1z7ULjWIEVn9WaoszmTiuveqfoFeezni8YrPA9VRqtBn/LD6jKBULcvt8
 N8ChzTdgIMRUGBZxeWv/WcrSiK/n0XF3wE8yf4mP0dpKt56quP8PY+3P+sQf45OI8yXVfbuaIIV
 LWIvLhXSz0j7/nFF1fJMvFYnVR3iwd8XLSyVefmk/N9rnHYV9tz9m+IJcgO12K6hPJLXEDnZLxu
 3+SDZol1KAdLbI+WukaZS2CgBbysf8TCHwXNiO1yX8pSmcM4p5mQGUaJKmxXXkQ327LDzv/VFrC
 pce4tkcslkr1fpzP3VC/rLHqCb/wAAWWycc0meL4wWxeGi2q3yBGUhr7ny6kZAy4yyExi3qqLpF
 OhVT2rvtnQObCRtuous5lyv0kxWzlMxd8RxZFBuFVsqfvcrhDkfxVbaST9L+ea5eO0DxarZtljl
 LoV0ezWMrj3UEgkaxew==
X-Proofpoint-GUID: 5dys-ButvSNsll92K7aYg67vwllthbQy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX/Yesn+XtdOK/
 xrFwz8Z5tOD6KVna9jkiIZUzZ/NM7l75gZMtJ5nzyfnNZ4Tww39m0b6W+g5YkN1kQYlRW9F++xm
 5cl8/o6s+H8LVN0PoDgNrPz59EXq3yM=
X-Proofpoint-ORIG-GUID: 5dys-ButvSNsll92K7aYg67vwllthbQy
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf6c0b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X4WHrBvVKYo2O6Nn5h4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260059

On 26-10-26 16:59:30, Taniya Das wrote:
> Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
> requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
> GP_MND select the supported PDM source clock rates.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
