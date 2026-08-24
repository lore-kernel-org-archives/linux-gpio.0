Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1A43A4274
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558299; cv=none; b=aFhm98ix5f2kKuB2DV6cXedJnZ3xPI65aW47rXW3FVoHAe8jgP2pQfJ8e9B79qVht+X7adWXyr+yUrkRxMpYDASnr7qyTbx4O05mxVFQUToKuXu9s8m9tx8GkgpYKmPsoWnOjQELMJB6FHB1rb5HbgPdx0KoWxK14k4cReXvBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558299; c=relaxed/simple;
	bh=7w/Cop/8rNMh5YXb1tw3zR8IZlpF/K6B4/PsyH/OZpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqBNc7A/Z+mw2lpKz0SWX7Sn/UsMEEkcjYEfdf3G9l9SQ34QcOM3jM7LFx3KAcTKKM5bP946Fv7JwH45a9O8ilFprtZlS0I6B6unRBL5/WR6h3TeCVmaH5fyNAOmvfWmSOkgaQ9X6pwQQfpfHCysaTVBcwB7kEzK9HDEEQmUjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaoAd8OC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xora3GP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaoAd8OC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xora3GP+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7PvkL2666074
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3JASRzJPlo+L0XP2XXFPrSY
	1nf08xrvhVUiRcRtrM0=; b=YaoAd8OCi9DqGPBxfZmdQzFZTBGOTh05ZV4pMxUQ
	nBWSDydWpm9WYRA2YudNwG8ywZuOH4YfoTvOG1jlIK+/o/t9gRzlBCXH9tfrcQpc
	ZjpCTSribdeK46rPIgTh70Slq3s/zGsFnQhzFfWIXXTRB6deKvvzUPuS1YQmpaTn
	LhtposxvL6rY6AqzNsz2NyZ8IVrgugMYY4eyLs/t1E3olgJQShZ1hooGalPc6lBQ
	XOmJdT2atBWdyZR+Efg+HEm96e8f0MLW2ORq+WFiWXTcg+k2xt+UlbrOXukSvPFj
	Ph4EmJYaGZvoy3iHFC7Vkb0UyUleXSQsSIdeeb5tvK2Xhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr43x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:58:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so42087861cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558293; x=1788163093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=Xora3GP+ZyvTVwCW6eqPDjBSh5ZJi2kQYY3ghwq5D20+xe7q19MveUo85EMhdZ8KeO
         IYUzNeyN50d+4Q6QET2+Y/iJY3opGQN9Sl1ac7pbPt+hoMWuePPGXBYr++593FknW6Pn
         rk+QX8hiHVEA+bbkpD8UzTxRLeITzK/aIdKvXuuXrRy8Uq7MKKAbv5Fh4raVcFD+3acr
         Dy0SzJVQmJ217qF/4H1h6rV52ONT7yIvQ4dZrhJtZ+PgMJUXOF2xOrgmZTRFxq0vwYyy
         heXH/AW5ZyXAd0OOjBQMQVFRlorKcdaPu9Jxz44iZcH8lqopHmwFRQAbK33Eqae6EvJs
         S6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558293; x=1788163093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=oreFNR//wV7hy8K3NhuUnSVPM5gGE3XNFRyyEsWLjWHzMPlZP3Sz/FQHOO3aK5T6ZI
         l6SRCp+MT/WOMvptEnOSjtOjbW/qnZbGjGEw2/9UmbpxkoElCvFpzTUtIkItGImbLWVV
         +0iw15cjnLdn4bCUwtJrGbDdtxFERdA6N54IH+I32+KQJuXEte6xlFcnJHqT9IOP+txa
         DuFJD9jAxxFEvZaMMt5pE26zAxkmC8VcIjHJlRByhJsxBst01q+S1AlzvG1MYSB8ZmsV
         E4IPcRtAwMP1F5JzEyooDVU2tpDc1X9ZKz8gYlQXF13lZXfWBC+SfpYCUf3hGUhvczQ2
         Edzw==
X-Forwarded-Encrypted: i=1; AHgh+RrYm4AkBOutOguXprHBRmsWUUMXmR0MN4QcUOlC/H1M2eZVmeCGKx+Wjl63bW30rOezXurjhOR6IjYC@vger.kernel.org
X-Gm-Message-State: AFuF++mgrXQxDjTyAPkvbRvG/lTbeo+Z7UAim9PFpGr0SWzSExuy/uHW
	G/msY5Qfm1hYcZkBAUb4/VfBsn8rKOzq/dpxc2btT5dElZF2FerNQBeliBnvUIh3bT4S6oAaojF
	+vOK2xy9NJqM4BbLEMBhZMO56HAxLrelVwriOV1cPqKH+fKaQc++ZsDh3neNSxDke
X-Gm-Gg: AR+sD10kSiAbQvS2mXro0lDkFW263kJt45kUOe9g4O1X7DMVqKQdC2fOBgcBULb5RKu
	DwfI1rlzbo/DSAbENbtmdUBh0TOhKEjqkFqEf2XWnVrTzsHJXuSvHvOCtcxDMs5Re0GLjP+hF0s
	erg7AgtN52Xy12xRV/5UYSJ79yi+2GB1llrYqjQdpQOO8ven2KPKqECUOULgpi7g2YNrkEim+7G
	t1sUeX+qOlgwMYHd0kR7E2PmkX8vaTjAh8NGCOo1CJtgH/QfWcChKiNFbfqi+i24DnVt6YiSe11
	vUm0dGDifRf99iaPSehFqYQs1yyOCaeUFb1ZQiDtwzyQCjNtfiPbbfShqFfIsPFdIx+bMxjn5I9
	0GSiJhoZ24pnfep8=
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751861cf.33.1787558292495;
        Mon, 24 Aug 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751541cf.33.1787558291971;
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296aa0sm1198117166b.19.2026.08.24.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:58:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Message-ID: <gqmzboqh3njrjgyf3yla7gzmagk73hgeb7qt3qcg3afi64suww@4llrqww5kke7>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX1p4PPBJCy/lM
 oO0vvcwLGsJj72ekUb4j9FbQ1k6UHllvTyY8STjK9c4syHVn9HIb7J4GDY0aj843gYsjCtFNl9B
 0NhBrvxBqagZdd9e7iWB6QLc5o+lpVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX07dl+4GynTWO
 LPy8wGJ3tKACs+c7Kkzqm7NARUDRwQnN3VrAt6LQP2WPHhlL4swiS53RIJ0GZ4zkPVTBjuvTfKe
 /AUhI2yLrGMHqngT52NHy4s3GruHYpSpTv7eXIuIE6LCDYiDVOzexyJTVEhHogqDHkv33LLUFmN
 FZmNp8zlY2FqJXJi8+2FUjwhwBiGOt01bep42IGzDDGSnTrU9qF7h92JLOvxATQ5LT0Esw6lf5Z
 B2jHnGdm+Iz+Kkmq7f7iovE20zgGMdocxDEKsv9ebZt15gUkLGgxr84votkyEXRVGjGfkjqP9yC
 5D8bgjFDBzOqs6xzsUWBBc5ULlNTpuRmchXaK8hPgwR/yng3dCoT9p9KaLDFqklWQt1xv+mQIMd
 dF4XhdlBpnWf4+OhcBTmgDQsoPUu/aOjbHi12O1oJpzcNFc6+zFDL97BTWcweWCoRjcpwKvoTgs
 ksb2R2MU1j/gwMnmzsA==
X-Proofpoint-ORIG-GUID: VG2oddV7FMUAVrq9bc5hXkVEEwKoRIpL
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8bf995 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VG2oddV7FMUAVrq9bc5hXkVEEwKoRIpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240069

On 26-08-21 21:38:56, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
