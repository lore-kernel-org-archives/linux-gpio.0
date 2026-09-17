Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBE3093C1
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 03:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614900; cv=none; b=CwjhfmshUY8FnIZxAc+a52BTMyik7iX5FY3DSBQbpP6+8AVS0kZmpq2bseMg4AmD2qvnBguSFXcrgDHOJBwPGxyga5HJ+F8XCA3w0V4/vTcRZ3SNHs+E1NntmqW7qbz2BWnXGJheKIFCu09+240dXRHr8ck9hYp+T7z4h31VbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614900; c=relaxed/simple;
	bh=YdH+rcUUwQG4jTDbECCNSQbx1lQSLf+Jy7CGiJvJn8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N40TRU1kIh57HoyuMgyjOwRxXvfO1aGtMqnsALn+3AQHjULrG18CGKOH8UTRMW7EoI8tzEVcurvJ3kPCCf9QysWwRhy9SJwao1XXbZP76Q/v5uOJUxYyNq8bOrQ2S5CFw5ZXlOOp+NiIBFYnibHjpb1cUXV7bZAdZHCC/YeU70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZgBUrtP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAWCa1Sn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZgBUrtP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAWCa1Sn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0t7Pb3402924
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 03:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hocXG8IEOu26x3uoW/8TyWIU
	kuS1tUtxSAPk96bBQFY=; b=JZgBUrtP7mjYA/2c+XdWjFStdwCF3IGdcTGKxh1w
	u7QnHdvUH9+pSM/ZnwOrTtxJFnSPk8eEf/JRSJS/PrQbPLEhkgwt7TJ2lBacKkl1
	uIvfBt/aJHdceqkqZPNdBR2OvtFIuBApHaCMsdA6dfNkFIB9cZyxTcpvI0PL8tea
	s4OI2J82YYimlmiL79aPywhwsRyOVIWWc5uipDUyU+4gRGWU9oBtBjBDr4BDn81o
	OeMcLN2WiSp2GJf3TfhFqU5NruuSb8OmD1pnMKPAfsc8+RhPbhjc5n7bZwIZSb0A
	4LtYTDN7iHYDfWmtdmoOhlGrsqNGi1rQ9DclJqDM5GmhEA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d28cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 03:14:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088203so354077a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614897; x=1790219697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hocXG8IEOu26x3uoW/8TyWIUkuS1tUtxSAPk96bBQFY=;
        b=IAWCa1Sn/wlvZT3fuFndrivmiBBmCyj2kQ/5cuMQA4KU2fvabrNF62wmR6QOMIG8D5
         5KA1BJfrxjwz+c2DfStICHbXg1itqlFwSBd4E+dr7klaJfhYW5yx4/9TirLJ9E3gAbFN
         fIORsj5B96mMPPYNqTo7Q2lMRPVIEBDQ9QMESaQVleWrLx4xjr5x82Ul0Cc6ubRMVHjp
         utr7b8exYLBZDAmz0zC71rTNmkF26FbnuoYLK/wuD0HaLtTSwGs/BbgRZRJ013zPt7+T
         BqdWGyb956D0hI+9AcrDAqGGzAld+Yj9Ts6f3Z8U6FSXoPPx5NkWVebAbxbdf4BL/oEF
         WTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614897; x=1790219697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hocXG8IEOu26x3uoW/8TyWIUkuS1tUtxSAPk96bBQFY=;
        b=gvrPfTgY/Mjx2DeBfnYAQgfpNBrTj7j5gtd6JTYX+bVQXMtREmUha4mpQr05xGa7o3
         SiIVbOM6ONyjpT8Qo8zJECLQSifkXq6wP255su2xDtuW70NBfNOQuhIivTqYTiLqlrUo
         9PTHehsc/6H6RY/b9d1tvv3MpP3F0SJWQpLxJmOkZnRQ6xy4qs2Hb6HZx0jVbz9P0grS
         dJbaSqg+gpdy39TCZHaU/TbIkWdtXfHGKGNlgvqIw+tYZ1BEiY9gtkVUF01wM0VoccRC
         pRmK8Z6Tqrm/cSH82FDd8M9JnoICig3L7fijwsXp2p7Q/7UoAkX8ovbCL5I8UhVHTC23
         mVxg==
X-Forwarded-Encrypted: i=1; AKwUvBzHPZQAvWisUw7aBkVxlZpmAbKcylKNk0Z9cGAf0LI1agPXfchs9kprV+gza+p7w0rh8hflrmzVl4lJ@vger.kernel.org
X-Gm-Message-State: AFuF++ka5+ugamOpy9f2w291qGhNNz219NngJp8xt27ygijDi552xLIG
	KhqPvoSChyO9+LBtjVW91iVjN9d7qo9TVuuPWzfhPGuBzFPvltDq05xOPlQeV3hW+lLmtWx3xBi
	EDB9S7vG2+Xl3EG6piQfsU4msIMEiA2AEZJ7l3hwz6AmaCGANOSCLVvMNqa6DsLOh
X-Gm-Gg: AYBFou1evd0kVdMZuLD8G6ADcSZ7cDcCx2D64Xxg+chiThMcEsA+/+KGN8CAmeRyjQ0
	m5LY4Di6neTgjvo/6Q9RVs6NXiBi5cvfbIP2N/Trx317R1QrJ3omqsGanlGuaswOrHFKIDIMl/v
	e2VNKlFpKECqTSuHeavIkveQEgBAIFqldCnnM9RBmS8QlZ13sUNIiFRijmzlTF0X77b7TqwzIuw
	ZPqNT1P/VnDl7UndXfRBQL49YglpjDEHhK6zx+ryCVMIL465pxGv8Hw0IxAlf5fBPzeTa8Fa7LC
	jWQDFsYQbPhXfXhy1+9Om/T78XFavQdsoZ+DnnVYSF6LkA8jgl1sOtYoAnkLtpyvo2uIguP5lN9
	M++TFfske8DzcsDX+5TKXkdMZkzp4rgfTMflNyLJxMkU=
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3dd5f5d86a1mr13812178637.17.1789614897222;
        Wed, 16 Sep 2026 20:14:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3dd5f5d86a1mr13812119637.17.1789614896794;
        Wed, 16 Sep 2026 20:14:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm9963228c88.1.2026.09.16.20.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:14:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:14:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: linusw@kernel.org, andersson@kernel.org, brgl@kernel.org,
        pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
Message-ID: <aqtbKlBVxoFqohsN@QCOM-aGQu4IUr3Y>
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kOFR6TqhmE_gE_3GfG0dygyhcU4j4uOz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzOSBTYWx0ZWRfX6YGDj90xiY8d
 8cU6ECFGC+HXHdJ0+I77luKN1J8BQ8BScCLirBBtzXxpLUYyTCXnFU6wiN0DUzW+2ZkVbJyKznN
 rVK5Ahr7x0yqmwSXjiCWkl/8GdvKnbE=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab5b31 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NCczGnymYEpDLu10qSUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: kOFR6TqhmE_gE_3GfG0dygyhcU4j4uOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzOSBTYWx0ZWRfX6a+ID6t6zSIz
 D4jmj7jyl/fwdPislHO0SSRkXkjZxIqm8lUrP37P/82cAY7NPEy8mH5W5Lfk7kIuoBdWqKWU4oy
 SjCSWRsYk2CLVIR4ta2W2H4THpbZeAR7rc7yF07nMFBalv8rcqNRyePzwCWThM5YbxP+KbtbjVk
 klNgEauL24AtB4dFcPLMAEIFFcXXB8JEhe4JygPJJ58EE7vNlsUkr86cyxSF7wCJjvaAwtnkk6N
 d3sGPrLcJr8pLqvIs+7Gy37OlcuLYOuOL4o/REZyXFEIgZK7QIRicohAbFPnhfztLQRPZmcBTMg
 eciTSurNGZV/jCPqLvqsUFIIZjEVF+pwuG6t3GKEHaB+LbYfbw7R6QzKAecN7p4wELPKA3O0e2i
 HQGXst4CAhCU8GqU0w2BWkJ5vBG0mHk6ukHupVXgGWuoUgSWivtHQZfHt49bw/dzGUZejl/Rsse
 /Rjv6XO75lrcw8LmLBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170039

On Wed, Sep 16, 2026 at 04:57:20PM +0800, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> The GPIO interrupt status is consequently latched, but the HMSS TLMM
> summary interrupt at GIC SPI 208 is never asserted. This affects all Nord
> GPIO interrupts using the TLMM summary path, including the Ethernet PHY
> interrupts on GPIO55 and GPIO141.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
