Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD4380FFE
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410908; cv=none; b=dBmgfdErY56TdLBo9p4ApCvnlbcYxTwAHvNa2/+A81S1FQ9uMsepq1VPJ5/Rk3edvpqGKRCejmFz+lEhRlu6gfurFRSt+eQuSWFWtJ3eLj8J7RpbUQVUAeuvmIl647FoMCqUziik43cNoiGxTX9q0NWaQOBWXJJufd3s3cJj53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410908; c=relaxed/simple;
	bh=GueRRaGK153pH2lJbZ8XAdC1P9r2Q+bS3QvQGYSD6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8QYElq9E5Tw9UwDyTe66jyOAPQF0moFg18+SBrXfWgUflaBTtLNPZkR4UKJPwADUanj8+httI1JTAWwnnGkvCLByJUDE3yzSBsagFg3Uig0nZ8TZfiYYG7eysdchzS5cTqOToTzOssXoOwntLulqXvNuH+DLm8lsoYgt4Eoegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isu7Zsmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Boq5MrXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isu7Zsmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Boq5MrXN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqNmG2937779
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGaUnVMUNJgXa28mOYG9JE92
	ABLir+NK9V0hKydCvc4=; b=Isu7ZsmxeG/DdK1qdM8rQPW5sU18oqleRDKkyXS5
	KK1SIMJwez3qh4KCOnHBbjGXadVXbfzEE/CjtM7/L4ztfGRca2DrCtqYkzQpwB5E
	jf0WqZXFuETpkUD2ZX+1UcoUw6dxmqFu1iTOmXjW8SixqCUFCjeyPobZSxbyBECy
	527CYDKYCj3O5JfqBYwpV6jChtUgPVL7waX2UqGW85h1C42SWzqonwDanul2xPXr
	CHFVtJxoWuUPiXeKwvGN2fyCfk5oR48IQ/Jiq/O+T7WXguMzO/XrcemJIAAzseYJ
	QuHwt27KZrIrh8vF0iKnXtqK+MmxTKbmHUgGpk/on8lWsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv1rbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:15:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso4955351cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 18:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410905; x=1787015705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=Boq5MrXN67JbyUwUfoGbG31wYICW4SE0EFs10HpqdMu/8W72tKG0VtO/C67hT2KIiE
         Ut900h+smkXMKZe0PE5Zd0iRnk+FzhFTUbyRrzGKbYjdw0h7gdvkzYYLrwOV8vyDKqSE
         ZYDcVe6uFWHbCeJWDzL8pVSWb5PLOfLmvWVtLNW3x1fMPefg1O+JdN+aIzzwMV+U91LG
         yxv9GrJDDiT6O/1FL+yYJ8y3gAp89r9p8Q728LGXEyw0YsjC7ShMsZo8XtCeE1wwo0Ra
         RZJN7ctDq38W47rWfgXOUHPxUvHcErs7pQNy6fhduc8/80WlcifiNTVPS/7FQKpCfuPa
         xCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410905; x=1787015705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=kH1ThzhaRz3i8zvlVB7IJcLzzuX/CfUFHL/RqfDv8XIGWYQfeLYcwgxWUIrviUCS2Q
         7GGZmA3mFyuj4TZm6q/cY9blBgFagBGZRrarJ6GB3N8wPKnKbLLmL7mqyzP1jpdmShhk
         urYtRQ0NQqEBjRxkCQqeUPnt1jgQkPSVo0j7bVPoKEIao42YPBlxFdsdi430Jkvz7t+h
         FYfvEPOq6yDxh7KrxU4ugEZQ2k7ZTnlu9Gn0i29sgjG0he5TbVK1sujqe2WQxPEViCBl
         2NlZM03c3brw4iLQH8U2iAK0wW2HbUkAkH0Iwa1RZPpB/04Fe6bi45nqST/a0ddtY5bI
         KlfA==
X-Forwarded-Encrypted: i=1; AHgh+RrqhZOaAlLMhoY7S4pYa569/mjUy4AzQcOHY3g9XVpAPylSuVONbogJudBzKhY2NpAUAVjs0gvmWdBx@vger.kernel.org
X-Gm-Message-State: AOJu0YynGeapt/WY5ut+KstbIJ9ombgg0jo0DWDde7Wtc3EKOPPgSJdn
	3abmV3kp6DnFWtk+vH0ILlbbAyVA1gporqK/ODhBJgbeLvX4HwBHybOHSWj5O5JZwrLPZFom7uc
	5ye5wyu1FfQvrfO4NG9XpJ7ZwYmhymA2LHZG7F+D12gfr7saGFzXCafa/blqxlatv
X-Gm-Gg: AR+sD13LUCp96wCT2BNSXCaDVjEJ//xz35ry0MGChFIxDETvycDO9VAuxyQUqNQpE62
	fPXZmW6xce6DR6NtZzvlAT1h9OY+CjXaU8yLDvVUHyLYKtEMswKZYj5ddASRzyqOeM9iXbCUfCt
	djXaclcwpnwtyDEHzfSHrkKz2PvzaQnP88Xaw9wN6UEumO/k529wNxWFNd+0cd6oT9+eQaubRC3
	Ks07NmxqQH8qVnYOdVxX8aLgJaNg6jm+bGFIS/j0ry4Ebr2f2I2jvF1ROD4EtPgGcpEwBtEJMiv
	D69fLwKIoOvjJUftEzFa/oxjexgP2U14XwiPsL69h8Ne+6NK5GjFYD9YDfUVJ+hDH1mLKnYppS2
	KjaeC44TfBfw3TyYTewmQ0yfyDLm+tsgIiDSZU8Vn6TMuzbXF5bqcugEfNTVT4PjZM7tfYfEByT
	jfwvlk4KvCTOne0Q==
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102731cf.10.1786410905067;
        Mon, 10 Aug 2026 18:15:05 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102351cf.10.1786410904654;
        Mon, 10 Aug 2026 18:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056eafc0sm2347318e87.76.2026.08.10.18.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:15:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:15:00 +0300
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
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX5gllhCX6ErPY
 XU1lbJyziKpfWq0qySJClmK1tghSF2XWvA3DQ9LC9AXyyS0QWxPw7LNxVPWI9QBqgkGVXmREtp7
 pnmMeu/Mtn2U6dyJcdnqxXJDrdw44xjVFh+zA+q3Tggg3Jxm9Q5S/+E4bw8c7+9AZPSXEslcGYx
 cJ6S7mVhH8phqFy/MkDEV7qmMb5o/blvmFwD5mbeIkZ02mOZFy1jTHA72C76MqgCcRNbdPC7pCA
 WFCI9M1CQLTBOUGFGRhcdvojkzwjG2MEN50tHt75V/Qaz41+7KtuezlYIJh818axGxt2WMS+G1r
 K/cLmWSqFQX45DzTAh74WAckGle3ODPckjCWlLAC69M79h3shepITOa1YlQ7tksm6CbAstRlLOR
 VL37Z14MDHsURpVzuuLsUabNqKoCkjJk9hCax7zFinpJyhTh7ov9/nIt/pq5xd/vTHokg+MeJBA
 g+GA6oaL/QuMkbAWIOQ==
X-Proofpoint-ORIG-GUID: BCMbyhgGRUOVnK8pUM89VTw1R39vA6K7
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7a7799 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SI9sQr29kBuAMZg-vOEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BCMbyhgGRUOVnK8pUM89VTw1R39vA6K7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX98uj9IVoKzau
 j4fzy37t6gfSNfDr6xlEA8+m7hckXZOpFDRAiZKhrHSSr32WkgWeZ4MXkXrafjIKUoigPcn/v9m
 QoO+6xuWDmQ4+58KIyyAYaBVWTHTXjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110007

On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> > Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> > assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> > hardware.
> > 
> > Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> > wrapper for its debug UART, so this assumption no longer holds.
> > 
> > Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index fd4d4ecd2df0..5b3c9d31fd7f 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
> >  
> >  config QCOM_GENI_SE
> >  	tristate "Qualcomm GENI Serial Engine Driver"
> > -	depends on ARM64 || COMPILE_TEST
> 
> depends on ARM || ARM64 || COMPILE_TEST

Or depends on ARCH_QCOM || COMPILE_TEST

> 
> >  	default ARCH_QCOM
> >  	help
> >  	  This driver is used to manage Generic Interface (GENI) firmware based
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
