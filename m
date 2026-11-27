Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770670;
	b=O6vK1XmJB0Bko6rwL1HVeiVuGpsYNd5U8yJCJ8IAOLgq6w2l7XSk5Yth73xplBx6yMTv
	 XJx2dyqzJmaVsUEO9/iiz2mbuP3d/D3WJmjDbA1PVWrebWyoF3+WiF523JJnkQBfrYlFI
	 taMZ2HWI+GObfz7WMHXL20RG7cMGxVo3x6+Y3M0g6ZWnPjBWTFa5f4w19/lxr87JSUuae
	 9OOdvjwLdOMMCWCMTsdCV7R6E5sSnV2qAKRqOaos3Ttv3Di1uns7iNR15LGJfkDXgN14w
	 eErqVJjxrQT2QW+nAEISolZ0AbGhnwMxBG+Lj+aWdDbVCttOqObNix4yJ+kp+zIp+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
	b=xMvpSFUjGrCjMh9qDpdEALi3A8LsDaIGqj4qkW9EoTb1xn6TCSLefY6p9mVNmDUfLei9
	 nJCfA9uE+k7lKiIh2mpGTSy47LNw7zCn1dYJq8v+MicD4m9COHqWSy3DV1Y82h4qRxhBZ
	 Xa1d6Bvrdudo7Xp6n+GknLUovYOP8IvlFWHazpsavgzTyRQKHYRv2nKqFJByhoIB32bk/
	 QdYiS6koCv73IVjPbmoP+mg9nOEXZtw9Q/vFCMlLdDbyua/+Sl4ZxDSZXZyryUplue5EA
	 T2G/I9muAjhSqJlSeSTWhtbDJJC2i0ZDvfaYMQ0UlhKj2BegU01ZjW+WtJz1H/qUv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U9hc3B/j";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E87606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9hc3B/j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GSUm1197194
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=; b=Xj3Z3CobRIVJY8WD
	UnqJ/SMwLSCDazOFshwsUrN0xRwkHhr/r4mDo3e7WQJJDpap8dala8XgfPLQcu4l
	7JveU0dyBEKXzdu20o/kTIBkkMTpVKEVif1pQOP6EimGKAd+9HhXbAsKKw+reOm9
	QYzVXhA+WGtmpv4M+pZnkfyFMJHKUaix8RktRRjjk3YsdINu7rF1/yeI21Xa2GGe
	isBrxxB51PZ3014BEUdRdaGRn/SpLuim55rihyMQUZFATtQQtsJFmXWr/Rqu/EH2
	7aw1jPQn2yxIl4pA6sZFmEfIvfjMv1OlVf997L7NZZrCRvgAS6b58ls4fu3t4tzP
	lkgx7g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8f8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso361003e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770668; x=1796375468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=U9hc3B/jq6cSUfq2g6GMrZjaQF8x99qU7tOwkAT2xSbr72byJ/w0GR3fsviDbQ3qKm
         wP96mRwfmYdM0RDJHPHxkCvwLwCD+zJ+p6FgTTY54YCCw3AaKBbvZ8iyOB/Y+pJp4ar2
         /EsimNX4DZMPBpGwmE49BjGpUdB6u/sE0mXHFfx5RcP0PXycLeL9gYbwwsuRUo2MOzFk
         xMZCFQHBsOYik26OTevns1hbwKuiwkjAZoVZRCfLCZAzWP+rWxuG5x9s8xGAgouBB/2x
         /H/vBFa4fsarVUC1bXAxgqx5caLvVEepu6uRHC6icMTTD6gEyrr6FX3sA2NNPCLUhO5Z
         h9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770669; x=1796375469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=WdEGE84u7RRTc8PuxOPL/8FPKODX0p4uv4XDK5r68E4edjYJavuFLvqNhKOwcA1Px/
         Efkh4SiIRlgmStNuyppGPEgfkpjfJc7j1lWTE046Tv7dMr7iFoILk+yXyi5sDUZajh7S
         nqNW3vV0R8meof4zf8YOPr1XhLfhG+6wtLbLX9RwW0nwnIkvxcLulAZPi2USLtmp22Nn
         NWnA3xSxMEaBldRMwzQ5XEuB6MEUlY4tSaFRs2RuX6suZIfk11tPzHOuvRp/o5ogLcJV
         M/m05b+L7f/0nK1MJL5/r45yPWxbmIbrXe4SGa0OBeBWK7VgEubEV1mBqEZk2hgPTITz
         l3PQ==
X-Forwarded-Encrypted: i=1; AL+hErGlTqXeG8GDkmzMF48jv2vkjBzFsEAq5PuJXb+4Uy0JdrHE+ia8whvFBZ+AAe8fZszmbi1r0fzFlAjQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/kxO57rIrHX6SbqT0pYOQ0117VmXX2VlL7ZHFgx+WQiSAPub4g
	AxBFdVx8Na+EZZnEG9Kx52mCnuhnLPd89AEg39BbTesxuxRVnoENEXth0XeGOipIRJW3E86Sc8Z
	Jlli7FPSYnS0dM858YeOqf+/TRJLuz2VrqqZLua6UrwHYC4C0tFBo9sC5mN0hVGso
X-Gm-Gg: AZFdTZeqZKvNqP+MXVOFZ+9EKCb9XCinlhr5Hpkd3vnjKeDOHtl9UgvqYqmxbrk0vDY
	wEiK9GbGJCN/gRvSx71Mm0p7YhMa2P6FowhKuQiKkH6YRxLaO/9IWAtE3TP7Vkpqag6M/7mGErJ
	33c6+TkOSArlQBjLGHQ5VTWYZa9YsmaTCKN9JLI/rbwjimRKFN8VeKSYXknHOJRz4YhGF5u0slX
	CKG+jIq2nm9Q7o8LrTtCcUE1czFYeZPbwAAHM6xQNMEEPYNdXHRVkvawhrnbipb8KejnMtM1kwN
	T1q22YB8xIRPBK/9GkZdvK3nMpgFmSnauUSmZj31doJXG+sYLDWnX32o6usaK/sjoN1kF6eL722
	dnE5ULk+S/1dPhq/ZIZYl96XDVeSnnIamLq1680wmcJ/jXt79kPxPj5nnz5hm6Lo5HvchSbU=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322609e0c.0.1795770668617;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322603e0c.0.1795770668162;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm840417766b.87.2026.11.27.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:07 -0800 (PST)
Message-ID: <4aa25716-37ab-43ba-b3d1-b0b48671dfc5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:11:04 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
 <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX7yG4AE1LEqEP
 EafcA9dGhMtC/YEW9s3JJtJWx2yFbBoyvMuuJNhe3AeKh0xi6F+IfgdXGUrSDgpUnRSoXYQl9pZ
 klzto4T+4XXBUCC5gfJTJFgCoNCrSd6f/qeegB5NWcg4ceckhhHYpx/jDAIizZZtORjhBNWldll
 VLjnpdUHBH9vB/LwxvQKPhMk/1SMNKpZlhRCM/YIqs/dJMFgxXWz7GGpPc6VyUYeN0Y3EIfaZzO
 nnJQWWXlPb+xql/x70/3Mgx8NfwVm5EhbAL/IVXRklgcAVAlM91jCqncWyoOjhsb0GUPD2P+PyV
 PEjNsyZWd/OA/xBkpW84xqg6pa/aSU+mFqjoZPmbwVOUDDEzfVWhpvVyJ4dpT/4tBPfwTwy/ksP
 Vx+UKAek3mn7zRpoopa5n6dKpoB2cF4LbbVC4BPzWndEKlVaMPC32n4QzddJfMfgZGrVkS6PoUy
 fb4ckc4kxyfC5YgN8xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX+kZE6oJbCoWY
 /48wm8r5ME5Ors2Cuq4hRPGVLEeTgFa9y/fMcI0oKSJtuf+1t1TVbGz1YD/epaVdScG5ImxTb1N
 iaGP0kJMphtQOeavubMs/NmJxjdptMc=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09492d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=tfEBk67aE7w0iaTIDxoA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: OhigQEMM-k_nPjAvQFw1ypbZwD459TIT
X-Proofpoint-ORIG-GUID: OhigQEMM-k_nPjAvQFw1ypbZwD459TIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/26/26 5:51 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 29 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
