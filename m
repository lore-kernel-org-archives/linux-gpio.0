Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2AD33DEC2
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409915; cv=none; b=hgj+3aXcjn4x9k9Q2RcqDBQ9nMV9nuRT/arCcjWDwtxqhSp9xYArXtIo/88BuFXzaVT4valbO8Lg0rFq1/+yN11INmiGXpNP9mkRiMLLFj8wNc7fesQxPWUCRRbnJPOu50S3Dx4JGH2yqnzCckOdv9+YZ8RoXV9WmS3DynHFplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409915; c=relaxed/simple;
	bh=pErCnijODy4fEgUHDnc72g3nTdTWc7uPAXgFC+YdY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+GbiwnY9mAdKJvGg7I63+3/rDs/OpSSrIGB47NqyiMpHP8IBvv5aIbfDNH+nExcHtQQrzfCL3ZGS4VzaRQ4iqJzJ1DTR61lWHp3Ug5PZj4pXAKzgwrlLot+VXNW9DTO6GH+XfxvJkgQwEvsMqPVmgI4gzjTxPVmy7ChEJq8Dkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu5PUPsN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp4PjF4d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cu5PUPsN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp4PjF4d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpqvr2649812
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkBx6g0ZwIllK7kPvgkzwBWW
	DwY+Y8f971ch+fkJ02g=; b=Cu5PUPsNJ2vv5nMJOVn/TWvRx3ePaKRMbudwcJwg
	+Po/S6NdQAo12XAgFqZQyZ8jrVsF5SIQdezznxr2ocljEFLhDDUA3yJIoK1FOGta
	VByxyKdnG61FbeAmaN9DRFUmu+zUEwx5AhHNIVMANEeYaVLDQJgmyied/jmizJ/n
	GzE5JItvcFnKK47Vs0dfcbRSBeRjUAVcdAtYoGWWjjliJOJnkHBx6pWHXOcRb7wM
	uCDX7yakeTXgDmy9SX5KJcJhm/wSFE6gEc+ygg2x/Zpz7Dlcyzkd+5MIM96OyOXO
	N+ran2TizBy+XC03fa66psVMpXdAT83CJb8gi+KSSH5RyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqujyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:58:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4f6ac06aso43312211cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 17:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409910; x=1787014710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=Jp4PjF4dPaL39MdU+R6rfFKkRdoiYGnr1M90Kk9RGWHWd/IcBWiN2+iaaag9+2wKZR
         8IBHxUttz5GbMWzjtrmhLkwF9Um2HSz1PSBQEa+ox6CUuJyOhOnJRnpvBeaaT1DmmAtp
         DlBLkxSiPkV1CRI7sQtYX+EsIuiAf2e8aqaAhCbshR2bqCNF/p8vfDtwBmYIetcXMCu0
         ckpn5XB0VGWG80hyGt2RCvKWSgVmnOec4uvnVnK+z8agd3bQl7h9VZlS9JnJyVqkVmJx
         KL3J0dUyzsw/2FT10XG+H/XR5ov0bz10XDT65G3wwGmkzWCbdaL+WyKcM1R0GTkMH7P5
         lmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409910; x=1787014710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=QP31gjIgRGxxpNOSJm9tE1L1uLYMILognAk+ZNlqkPCFalohdKMZBt7znrtiuahTtQ
         1rW7ErrcnED5FxgwPSy8sIffy+VQI1dx9m+3juuX9Arsj8cThr4reC399lmg6MWW3rdv
         Uqh/OxXjzoyufiqoqmbhF03h6yeU9ynphUEbvq//YlaOqntdgsfiSMd4mNaEHnXnqLVb
         WJsxgtyPoC6OorFD7JCXQSitOoep+SS73rO0n1PiQAZHOL2mSdKyGHN7LC19VZh+eiJ9
         4ZaZfRTKNNKxdgLWpv78et9AjB8RFiQAwbzT30JUciYLeg+atXA6M1RmFS9/jsG8LqFC
         skbA==
X-Forwarded-Encrypted: i=1; AHgh+RoFrrhsS9Su/3wiBtTs607WbtqQXIwVCYbRNbUCO0BOMMCcSnoJg+iocCYu+PUkHS5DMIF3SUhZhVtx@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnNY/JtjXClRKGEkGWR5L22rC1HLcSY7Rk3701rQIDLHiyqqR
	InznXfJFedJQdreocT2WtjIZLaFINhVhhdGtn5tvx5Ft/1ShQkzVkVhSdcnQ6qSIYZj8kEc3k05
	Y852nwsfhCG3Ntm+F96zkCgNNurwgY/sDqQVeBssjz4Xt6oM4Ug2hFTdg8oIeqnAq
X-Gm-Gg: AR+sD111HkQUkThhCdi+pXq41V5vsPCeUwy1LEwm0er1zHjETImwVdmpUZoJTNW754Y
	5tD36m7HWLErn4jI7Kfde9mpIU7gYoy0SVWYLSatg01GEEfI+tNKv7zfCG7xpdUvLUMsEjWPjNW
	qkShuzlivH10HIbiPNZPXOnhNm00I5ARKiCQt5QCrb0t/58DwRdB/4dzyOc9fqLQkO0w2TTuRHr
	0heJzLDaSvaAT05ediqV8Hda6WLtZuDY+t16F8zjlWDBuYZzfhHn22lXkruxvRUexVSpgUtwWx+
	k6bNawojox7TMh9D9yzY8MPcPHM8Xl7S2r+fzxwTrKENnLM3d0GWEdnDTWtvWqqUVf97UrM/H2x
	WmbBND6QhJar6li+WP9vqw/8sBmVBjmX/gqGPK4ztSjFqkC+pucL5U0/O37qzEdIUoEcjHSR0OT
	CjlM+kTh0eVTzrWg==
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830831cf.5.1786409910280;
        Mon, 10 Aug 2026 17:58:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830621cf.5.1786409909933;
        Mon, 10 Aug 2026 17:58:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055e9752sm2279876e87.59.2026.08.10.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:58:28 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <4ovnsghrryj5gxvggztpw5qst3t2qwrxu4p54iyhm5tf2twcd6@stuooi7j4jo3>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-GUID: z3HMHc02uqtLmiL-FUFm4sWpYfTrppCU
X-Proofpoint-ORIG-GUID: z3HMHc02uqtLmiL-FUFm4sWpYfTrppCU
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a7a73b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfXyxa4KKUdS5/Q
 kSHodT7EDX9f/y+6XtprcPGdIuWe29gqWfslNoMSCMqCr65QNEP789NnIpNDtbS62lVFYdZ/cWe
 J3VPk5kW4JKGaidVQ9L2VjM6FURDOCKaQWS/bXewcKGfnNiorz5Q1ARGhEHPuUiA14uGjE7ENw7
 QowIXtvzPdsjt6S1A8A4WswfzsitBS9pL3Oc6a6/hIxvIG0yVLAZmQrSp/Bq94hTnmTWP++wkWg
 Tw0i+kgBScr11MGMxSCL9Kdye+UG9Yb4qhhAIzHbX5mBihs/5iew1wOoaRH0gjbUGZGr9YBcz9d
 DgaWBh7iUr1aJLGpvkhc1dBj1dKb85FcZ95w6yNStCL7yZ05OsRHLg1vPPbdf3Y6Kj89CqUO81t
 rvhgCVMNyxNKGmjSY45qUtvuhtFUf/owvvT5f1JckC80xCenwNHXiNPUHQPdoTEisql9J/BYzgz
 yy+vdGXUEgLVA7Lvm4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX856gprOqMAsZ
 zFJOqZNPrjseMMWmIy1PWlO34RfrVH//C2GoLHYQoITtY6OvT4tu0aMQX7wjWbnbz5X6dnndVJp
 CqnOhIRNQXxlXYjSUox4ncJt9diTbLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:04PM +0530, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
