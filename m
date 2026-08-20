Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B6B70809
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 01:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787188531; cv=none; b=jGLrN7T02NC4K/KMQWV4zWzQZGSA00yWqbXU2jIQW4s7Ld/KBJZrJRMWTuGndcIHFYu91mRg7X5k4ffyKmc/sEtGlfeC9wD6fR7vyHJfuXKFjOce1PEJx3Y61R2uAPDGfcBUYzPtxYjtgL/1DKMLARiAfFXxXOcqhDTYVyil3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787188531; c=relaxed/simple;
	bh=KgpEoJCO3Eql8ygiswoOd4H8Lz4ky8d1ZHRA9p6pq5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGRLURXemBmeEEZY3eLDvgFFRQ/mylYfuji9bdKa1MkLeeOrXkrRUHdM4kb1LntWiEOHwcuLwXOJ+/tcsJvbKdD7FbuBjDrAoAWAhs2NsE2NdW/GskqpwrmTV5d+F8sGvBQ0924AMRfpYxUWefFYsWtp+UQcB08C7RCBDQtV2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeKx6M3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We7l0jZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeKx6M3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We7l0jZu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7qQg1006390
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 01:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MS9HKp5HNfB/B1jknKQleKYL
	L0pHPk+xwxCKcprCl8k=; b=MeKx6M3qvHSHWxmCQEEMJUEe08q1oSBR/aAEnlDy
	6tGwOF6rXdSOmGyUnMuL+CEGSlE1zepnyDUPT0gmGnBC9ncYD9uodcuD+Vg9L9iz
	TKTThhaDyTdJmJGxEbsJrKKwZHd5oZs213CKsWfElgUkNAhS7qnPAthDzJBdr5bL
	ssEqv93PHkszioOLbY2r20RheHiWxx1yhLLVrunDyFIS82kyVVD7IkrP3OcCIHnb
	sMlnPHa21mP82AXczK30qeOoyQRd22pvyDZedZkwpIgQQUWOLD6bxt9+Uu3eMugg
	LgCy9o4KWLp8l0dMnpHqAaDecVlF3Fzq1BZFiITJ6Ybj8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc2f1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 01:15:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2303934a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 18:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787188528; x=1787793328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MS9HKp5HNfB/B1jknKQleKYLL0pHPk+xwxCKcprCl8k=;
        b=We7l0jZu1/TNkxK+0BJ867Xd0QIkbIH2NkKOtYlFRCbfCusWJ3ZXx4EVIx2xhm0KY7
         D5/MKk1uyOMMvxh4MrFuQeWbwUmnWBVPXMqjbIzvhirLiSUWRGcoccE9LIPp4v4/gMSJ
         iZ7d8XHJrJ7z8yGatgEIxpRBvKKWztOLYE0GqM+s/HQ7tw8dloAuUwhhu8NFhZLwdbU7
         8kYIIdnUrKI22eo2uiOnBPK4mQSWIq7NieCo1+9gnUsQjJRCT305EL6Unm3FwvznwQ2k
         DwkWJutomvXn2CVLdMfEq18t+ISIfnpsYK0UZiFbTD/16vFRxn0C7nDpwiar/9q3ktX0
         9fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787188528; x=1787793328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MS9HKp5HNfB/B1jknKQleKYLL0pHPk+xwxCKcprCl8k=;
        b=N4qYqtfqLS4Ip7Hxxei4s/2geqoNqEnxYCbIP7NQ8pfq+o8DWgbkZiEB1j4f4Dm7Xf
         wTbWLw8yWC0GKDvsi1MaBoG9zGZSxJUw44kTJa8WyUY6lHeV66QC0t96RsNSaYy2Uden
         fk63TNcNas3iCItkL6+ctowAy/WRLtca5OHMTxWCOVuiNEhJ11VdQzuLkM+W8EbHZ+hy
         SHJMaCg5N2qHrgP/cu6EBnDP6lyLs+UjQgzyRBZSPKaV+eZFkrkzK5e/FFidjD9AQ7RG
         jnUERbMhYX9rZTlwPj+1oR1+/pr/Eq8BRJx9vDrGQstU+ZfWF5D4clT/NfdWhTkH0c4n
         i9pg==
X-Forwarded-Encrypted: i=1; AHgh+RrH7L4sIdSh+jduwKaApBZl9MMW02oQ1pZTxbJsFk2sdiiCtH9eEEBc0Aj577lo6WfXZPS9a09SifvU@vger.kernel.org
X-Gm-Message-State: AFuF++k+HqNK0TNtdS57//0pH3aZthhQDKBJIN9Eg+5uJDSgivm6l0Bc
	6xA6lFAoO90zXx/8nYW0in+6/P4oLnHisYagfcsEKTpQNejcljZ3bli/nEMywvXKg5FFCgrIpeP
	mpe+j1KuztvVvHSMnhqzwm1hTCS8mfdo5WolNINqaO1t27xSJtFxuMlQFCsUwx7oK
X-Gm-Gg: AR+sD11xnrZuZzKx5EwPk9DgmkOIK9aXwP78yDH7KMDa99RJlbpo+SW7fhZ1EbGqRC7
	ixMo/YBwJrOG7pKXxSj3NWxJmkiW+ZGZ5ZL/hNwzHuEQaHHc3YLZTN4ATzmar+9IypT1GfYVYab
	h7NZTTFkJvZxK/l1Skwvel3hR38WzqsOiwmbOhsE+PToAJfybl/Rf0kwbi9I0yKMfPJza5sY5eN
	0wGiF0c216DLxMZbjSMV/wZddD5rGUvB13m0FhjNr+WmZCNZAewESuLIE8m706fPZ8X6dzvxPRf
	dmLHyaZSsREpBdsjnS3Aa9e0g/B+KTOpYUvs5KiFEE59bQv5ssIkZi5LJYbdAqxKsr+Y79Izz1S
	G9ck2ZiYNDh41YbAbwTeWXI1uHULTSe63Evbk2lzf2gU=
X-Received: by 2002:a17:90b:3bcd:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39580accbebmr16841140a91.5.1787188528308;
        Wed, 19 Aug 2026 18:15:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcd:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39580accbebmr16841065a91.5.1787188527782;
        Wed, 19 Aug 2026 18:15:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm18684875c88.13.2026.08.19.18.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 18:15:27 -0700 (PDT)
Date: Thu, 20 Aug 2026 09:15:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
Message-ID: <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
 <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
X-Proofpoint-GUID: FZqafvsMO1qD5eyOtoXMeqj3luqY8M0t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAwNiBTYWx0ZWRfX0uZ53MpGiA7T
 R8WY+NEfpHVwRR8eh3qVsEJ44gX5Sghkk9Mr6wR3EeBw+A3U+3I1FOio1i136OzcDPs9Mwm7nih
 27VjPexb9cpScr2dVLTc8slFLq4d79w=
X-Proofpoint-ORIG-GUID: FZqafvsMO1qD5eyOtoXMeqj3luqY8M0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAwNiBTYWx0ZWRfX0seuGLWBZj8W
 ZHjfEQPnkzt9O9hArUy5xDurzjGefJv9dsN0jjIZpvm55qED1BxAjiVvhXX4k72sg9ZsZlGqnEX
 vPtVevTNT5OnC5O5vJ6KrxbC8mRjaQwhPmMdHBnXmdUgrGAImdgtwthRLp9MiK+aCkNIJKBYyef
 BUsxc5SLJ1lxMqYRaw4sNE7Pn2ZoMsfpo/GT3Eh+67d1FA4mrzvSqJFTwt5+TaCZhe0dIX8nmU/
 jlY38vRs+J5YmOvEUXZnMnHRphnshKk9EqKj6PUyV9msr8sLPqgpEwl7OiIxIMiF7XCEquukQqJ
 9kS8JpOVeHaqLmLiCfoST+HbOme+GOb5MMfjAN2veJvE4pZnFBM0K9yF8n78ufVLKf2D54pzU3u
 ChvAFS942+HrfN6VpjydauOKLtGOGdB3mBFAtoSRbB72zuDN2rXjtl08nIrtPjwVoOSCc4YvA0X
 WXBvLVdtnvm86bZow3A==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a865530 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ScvHTCLV6CLG8ETh_pMA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200006

On Wed, Aug 19, 2026 at 05:27:34PM +0200, Konrad Dybcio wrote:
> On 8/19/26 5:23 PM, Shawn Guo wrote:
> > QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> > pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> > TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> > respectively.
> 
> [...]
> 
> > +	msm_mux_qup1_se2_01,
> 
> other drivers where this is necessary stick an 'l' before the
> lane indices, e.g. se2_l2, let's keep this 

I can see that for single lane function. But for lane-pair function,
it's not a new thing with nord, and the naming convention seems to be
without 'l', based on what I see from shikra, eliza, hawi and maili
drivers.

> 
> The bindings change must be separate

I understand that's mandatory for new feature changes, but for such
a bug fix where both binding and driver changes are closely coupled,
it seems more reasonable to not split.

Shawn
