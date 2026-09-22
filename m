Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149DF4EB847
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060448; cv=none; b=crGT+2seCvqGMG1Dvi1jltFwMW4LVv2evGe9/iDwZIc9FkmYYdWnNrby9G+Cb2Igrg+Rbabztphd/FrDxYFDb2e69/qMl4qTSMQ2qF/czOg3j9PRkU0lreZZ6atMcqmsDHYef7S8DmKgMnplnOiScEa5Efo6zNVZHV20izFo1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060448; c=relaxed/simple;
	bh=TCrbWvqf63u8uXM2YiguOWjo1ni+/8UwmnOPk+ac3f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sduArO3xjgdkhcNlUi+egEl/qtHeTryRTKH+E+Dp04MDCsqIeZ16Pq/q/IfEIgRR5e/fbuPaWVWNUqBT1Kh9IwS5ZKHZWQbkYTg6Bn/PtBVShkDdX0fSReH9A1F2+vF9y2xBhm2uRFnhUkEjnyke9dDRN4sXA5WIETgv5/atPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp2LTTKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsxhGoFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp2LTTKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsxhGoFq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M705Ri1978710
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5eN7YD3va4RMrrzBayQIdcp
	WFIP8aIvsPpJCSIUZcs=; b=Kp2LTTKcleB60FIKu7DkVnOONOM2SN7ZzVe9Dhev
	ZL+x8nu7BUks5qG3mX4lN2S0xF99Vcst7r2yjN96PbgnvgobXF7j14C3XSw3HNLK
	jtv9fsZ8bdtkL3q9GunHU68eCXsyC6KUNkmwA+vB3FsjY0JffxzFMPWkVkqokRiy
	TB7SDdyHobWBs9EUlQgbHMD9VTdqLUaAXaQxKKO2FqweSTSuDe6t/0+GlzyaA7u8
	rxYJorIdbgkVGk5GWfJc9I6hE3GfD3DTAFEpTxaGIMNZ6qIlUb7t3Spt1XXaO4PZ
	d1gY2jpoud7Me1YNb28XutwMblzsMarqlsW7zkLwlhNDMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hgck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:00:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso62891375ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 00:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060446; x=1790665246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=YsxhGoFq/aZ2Y6gNJFu8v0WIuphu/yP450BNQmNXc5VnYI/9qgA7V0EP3KugtsmuDF
         PqvK+JQWIX379hgRUvDOFK+DqSuWZa8susYym1rXqbjB2sCq3jVG+SkOKIjDJ4k5MPaq
         D0L+awXaG/k+6TiMkByhJ3tO7cTvfAro2ZBNZ9GyoU4iylAU1q+pVQ+iZk96+Vo01f+C
         Imdh3BPRXdP9LnoKD/mszF4YyYhPSlQIrTG6w5+vgmKcm8gih7PTljUsOSXUq0+wbh51
         evWGyPL8EhbPTfQEKR5mj0scI0ixOvKbPkHlgmFXlhlmAMIZM9JBDccmgUKxNP09jlWc
         xsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060446; x=1790665246;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=WGai94ASaIbn3idzEoqnxNJMfL7EmAfCpgVGQSaDGfx1YFr0UDrtxbTxIk8LrOd57v
         okwCbWxvQWzOeST0DJhD/KiSh4rLFtY7AFE44hyhze902e+DqJwg9Mh9XfpEfdzc7Hc7
         bkilldwTHdAnGdmHgElUlAICtABEM5IroLjqDVqv5QU8okmZXF27q0QtKiNr5P4YU0a3
         vN4SbtOqJiJy0IaeFVjN7YZlC7BRyBPXIVv2+EA+kptO5EemswRWBfhoxQ6Nuyz58GYW
         E5TolmiUZJKfoUDL/OGzeUGP3UbQLGN5zGK/E4PHM4JPAeVaOjf2jJ6opPz7NRmd7H/+
         pX1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDv99bpGWmS9Imuul1K6lXRoSN6a7p7RZMdFNQwKMc89YqWzhqy4MmxmKg3uDz3GQc6670sf2Y97FA@vger.kernel.org
X-Gm-Message-State: AFuF++mZTpStmclpRTX/CUsolXs6MG6e1B37OlbN+aCaBMOajwIBRrJY
	SZ0jE2bDZX3RpCt+zHsLXRYaWZWupe220ORbMzKk6vQzKdrWkMRbPFRBlhxbo71kAmelBJvg8/V
	OZ/h1NWdUcmRs+01OnyUsUn+DJWGW2fA96KZbUgl5g9ForcmHzlFgORzBX/ALyhBQ
X-Gm-Gg: AYBFou1vz6beNwkkYT2MALU+dWL1HeYvvOgxEJ12lTJOs2tSrSRuuxiW6qhOjHRkO31
	G4s3GyOkEYGSZHuokiOde01u9K2XQsQRuU2qgwSp5RjcZBF5P11agEwOJ4+EchWuqFI/yeOxg6k
	UB4H1xRaBxBILdFwnPxSLCn7Tr66hD4onxXungOSVnGhtfITd4qxw92hDkxhNKLuOyRK/vTDg5N
	Dy4oBaO8iRNTGgBK77Y8S7Z/f3tt5aNM20yHZIEgjSvrjWtjHcda/02Xkdf3fExMDRPMMSqMsWQ
	1/JwZ2tGhqDL7/wzOZbfqrM10gNQSzTQdB+UGaCUizFDwx60W7gP/H+z/qG+vp885UZf3BoRloa
	G86Wqq8NdqrtGZUg1P+2UU9CNSqirpuS0PyZlZfg0Fw==
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2467345ad.44.1790060440955;
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2467075ad.44.1790060440408;
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm3347130eec.3.2026.09.22.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:00:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arInku1hs9nTHd4t@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
 <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 8mkYbs-0PEXVSUZzk_ndeIhg3MbVcBr7
X-Proofpoint-GUID: 8mkYbs-0PEXVSUZzk_ndeIhg3MbVcBr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX/G8YcxO1+/8S
 pQdEhPGDvJ5ejEFtHJ/4xEfzDnnJQKM22aC26sG0ci1/oWOYsiBVz63xOfbx6zcGBfPJDgRCTVW
 mr7rATg5pAL39hIVGYha5iB6Typdx4DkUDyhDXPo7Q+PGuyobf7jUop8L2MdqgrucnxR+nZ914H
 9z2iTpK99bA5tTz8TOY+LqBAnCqvaPcPyvd5tu4NJRQdJyeRR3SQAueyo9d5xZoF0K9F63DxLj9
 95TBe5Uwb+R4EV0E0wZeLZQm5GvYiEsgz1SEcFs1uXmLiP4SGMYy4ICiIB8ITgUW4s5GySOFbH8
 rMBUlS8JbGHIpmwYIWKJ54c7i+Du45Q+6vrbhNXx/Kz1yqQtt/46RfLMY14LGECtGJiRn9HauBk
 XmcSLF9uEeXCmKv3r1sanjA7Zz0/U7HPaA7ukFI82pimHeAO+8adkeACXV6vgx1sXAL1w9rmUvN
 gKm6iR7SF1Zprw6QakQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX/CI3G7+6D/DN
 LZRxtp2lyYcHItwWo2zSprv50FlgANMNVhrrfdLJJdi84lNMy6m371EO6neQsptQ8x96F+MixXu
 bHI78+9DhlKNCfcu0vCH5fHGGGncdTg=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2279e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OddHCmqlFxd8KxF8cHwA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099

On Fri, Sep 18, 2026 at 03:05:30AM -0500, Bartosz Golaszewski wrote:
> On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> >>
> >> Personally I would prefer patch 1 instead of this change.
> >
> > As I mentioned in the cover letter, both patches are fixing real bugs
> > existing at different level. So I prefer to merge both. But it's a call
> > up to Bartosz.
> >
> 
> I'd take both but I'm not sure if the ASIS case for shared proxy can be
> addressed without reading back the direction.

Sent v2 by keeping 2/2 only and updating Fixes tag.

Shawn
