Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70743CC315
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537047; cv=none; b=Lvf8N6ErSIfaz/mVgkf41RUv+bsAfhzzxubCjAV82LAbHWWBDxFjA8o7lxMCZFpF/1BgNil0cRMzbeoClKpCPKVjxdeSkjHia7swaj5I/zYagdA+AY/lBhHDncWuVu/DufeHObiPqn8JA5cL2XGKm4DLD4xyRF2f95/Uv/ASiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537047; c=relaxed/simple;
	bh=X9c4GzGT8qhRHB9Hodv1J7Q7GA2MHFDjaY9D2UXMQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwIYD9m07Bv5yOPmpaPZhk4YSCOeHZvbptbf83I4GXPOEjMX1ND2DSxfn92s6RV3z3xuDsZkDER3uH/pVs7Q8x4lekmyz04AaWNUZkK5AttHurVwXEbn7N4IRSQRjWCwZia4JTC54U6Ps2qP+r6FRQB/Pv+ZsyX03cgj0xl4YAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AknK9Qwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a698s6qH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AknK9Qwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a698s6qH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RZs81506373
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=; b=AknK9Qwc0u9l1cA+
	5SHWeYukgusWa4oyebLcXZl5hz+eu0BWWIy/JLB7qsTVAII4IHRbl+GxZ6UBQQnZ
	ZozdXveBw42P6XksShRhA8WhObyXXs78ptlJsC51IKhR28tMg6r5+9ni7TFNFXC1
	DwHJGgdWWwq+9PQOUJhVSasL9gI/CT8m3NP3e4ZIQzwyqJDQrbKgoD61bMKTMmOY
	oIn+4bn2jelDC7c1Clu+RWYjCmt5EoPN/63Nfg5CNmKZVZoIa6uZ8GLhGl0TfLpz
	Gxo04riTju8A9GyvoDpZUzzjbanRYnr+cjl2hEs7qEIWBLT4WOHcj53OEWU8tPpQ
	5xIHhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvw82x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:44:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so21456385a.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537045; x=1785141845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=;
        b=a698s6qHG3bDsvU23Z+5IJ2wsZRNlmm5bS7k2FTnqcAwkdkwD1PJzqM1PWI3mcZZV2
         4RPUFv48sEtO0HAcaJb4w5xq+apEke6R5XsX8DRSZjmRdtwMXFumQ7cpMLnWAeXWm8LW
         HNUPhtXnyPTDMDmlP3Nn6CT/BbLk17b629jSLx8HlBvuiWn1I+3CCN0QXcjxw3zLUIoI
         c7SCZsR1dBRP3sqEW/Z2O3pxIi7p5IZlDqZOT7/NAgqhuVGxSssVX5HdMFRmlZXLNKMp
         kRjHRHSQtlQenRcXG+uSM/uy940GPDfpYBHNszTNkZGmQ/2Y0BvApiWhyrF+6kX1oquT
         Pn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537045; x=1785141845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=;
        b=UfqIl3s+woj1oiENREHPge8QUPG2G2J3rFVauvRWewqMAKetb9kpKXndJGAqiy/Jod
         5ZtTnXra10QLE2OaUUWmuOzP/BTpGDIjjoPnGI1IYj3QqNgcZu96uNHtgFJzE9uqZ6LJ
         8GBB+ypdrEE3D2yiOA0z1aRVrfteecpxvfNnx1B5KnYhG4Y6Ve2/C+F/DCSg3eOIlxQ3
         mPpG5def9tfU6nt19LTxdzXpkRRLXQ8g3+qSrT1QVoQCVDh09A2Xt6ysxel9GflcxjWV
         SrtmwArkQtTwo+8fqVyh3SQTWLkG0gZNta/XfAj4A7oGyTTMjEYgvKcPDhB9e1RiOTX2
         z+ag==
X-Forwarded-Encrypted: i=1; AHgh+RqKlof8nGuxw0QtFl9JyTNK67nkYx04caZfwgAzaD1U9EevzAtasaDmx8RtB7qMpAp+XCZBA5Xij/O8@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqSa7gT6EVW3/feU0Q9/6hgts4LNLJHKYtuZar5uqtfGNGJ7c
	8IYt9nkphxIrHiQOPj1lkVtRgyQQ0gTyAXQ/LDKNgx2MHkLcRXftiwbOlY4QW8GfS1nkNBR3z9m
	Aq98p2/c2WFqZxAjTCqFJR0cmiD6IDzpSoixdVP38Uc4uyRqCPpw/WpZ/DrdMBdFF
X-Gm-Gg: AfdE7ckkZBGqenO4EnGtJGxrPaGgFj334+KK7sW7XUILUSQjJ0PXvj2f4MtvEeUfAlu
	os9Eq03es7ZMQgRywZWC2EkOmeC4l54Hto+ZP7jaA3s5y77LnfKXLgYYbcXmPRa8G7jo5h6r2Ye
	aIkeo0pNFy7TclheGQJ/7JvmGBwFpDhUzbEMmD7nER3SKHORtqCWe8HeY7YPnjYjrnjND3Sdi7Q
	vg0MAnc+twogZjickatowXlwnGxR9ewS88SkQD/00nclB7X3wMUBDmn9MPct+Du9gg537H/xy61
	d1zifGXaGpCMPG+eYKtXR2W03LWfuBl93TbSqO1QWHosm65pYTVBT8DTC9jE66OGUopgE3riLpv
	ymRPsgM2tyAQvGLHYHrwincFV
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr906619085a.6.1784537045080;
        Mon, 20 Jul 2026 01:44:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr906617285a.6.1784537044675;
        Mon, 20 Jul 2026 01:44:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm431659866b.14.2026.07.20.01.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:44:03 -0700 (PDT)
Message-ID: <f175d941-9912-42b0-90e7-ce86cbaff82f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group
 pins
To: Taceddin Sancak <ts.solidarity@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ycBZI3DORCU5F19N5hrxDqE1DjlEOpq6
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5ddfd6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fW5ZgvKe1gcteIz5WIgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX9HZmDHMMZl+f
 eD78wqcrpitl68E47pBt7hiIUZ+Ct66q4RlShUO/WjMR/SboUmqQJTxU966n4Ys98rIQnZ7WdbV
 tXBKLsMRsmdPrpDPUnWTzLrtIzzpXGxHbuI4fpx0HVF2PDkS2b7ID0EwPiYzl6ENSIQKMi9V1gQ
 F3D4qLW8Fi14B5JGa4Mj8MKnf0HKc67pVdYsrS+5rbjcKtoSAY6gRzx7sApg35LXG2dAQoQpFIu
 mk3PklarzwXttnwpzh1vg36p0Y5dATPvY53uMJRuhT7Pcyp1TIST+ZdRf+9ji/PhxIv5B2oZQ0A
 ikmIXZaq6VF6Edo3IxnDWdNtr28RzgzA2uSaBj8QhhA/JwyPkY5+IbBJtezXCw+J3cHkq4VeWZt
 IJ1c2leOzU49R1ToFfXMgndJ25V1/7av8FTyGEv+E63v5Qxr7nGki5c7IkrYFbEfRVzoLp+3hUG
 zhW1GXgRSGCiZDWasGA==
X-Proofpoint-ORIG-GUID: ycBZI3DORCU5F19N5hrxDqE1DjlEOpq6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX20buN9kIjCG8
 uqzchW80c5p96wK4Br0dbUQ5hPhR6fzRbjZrKykkoOcDD7/xv1GGRm9qfoqsQqrG/UI1h7mbivh
 LG9XXhDKPrwmZt7gIPrsaS1CEKIjEoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200096

On 7/18/26 2:21 AM, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
> 
> Point both groups at gpio39, matching the pingroup table. This also
> mirrors the primary audio MCLK pair, where the mclk0 and mclk1
> variants live on separate pins (gpio53 and gpio51 respectively).
> 
> Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
