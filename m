Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015C04AF9EA
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637682; cv=none; b=tDK9xWGHWbyy1fh9wTk6F95/QzfZZ5JLpLaeLbogpnk6NfBCyrcFtfCxxCYvRCJhyXITDYWh/X3hmkM6r6e4VyjnaWySz0O6NQz9e1zpQcNIpHDtosEFdYsMi2E4KK4EbV79WVY05qrywGd/SZcdJealI97wemBj6h/Ms/0d77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637682; c=relaxed/simple;
	bh=TSLSZyuMBa5SVWwas0bnBhlpq8LoE0QvEzp119jes5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq+kvgeyQYLo2yDJVWEkMw1/hEjVIYDawPmxrG8tIQk5/1gP3O8RPrOhB8HTPlrSsFMuuoG0aPAJbfwgWJ7Pkb9cFeQeN3+anLsflkaieSzAp74lQXnKLOC5M6MBpmb1j6YLe4xRU7+L6Dcqd/Ax0i4sx30KtcmCXmOqHmDhzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJSCnOnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnPvLvHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJSCnOnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnPvLvHa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Ofo1721422
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ImJcDo6K9U71W/J8ldEqrjv
	Rhfj4zEjtObZ2EJ/BYs=; b=oJSCnOnuPUltWD3lMsRbX5u1jF2sDzLxLVmqdln0
	0U1a8AT/ovW1kYGFMXRK5OXPuMRKoVqQlatqeH+5PSoR0MZq523NAQNorW9IcQ8n
	t2ReJz4Q9xbshy0PI7eKxv8Fe9d4bmGfTh6I6VHd1+zxF9ZHABc7xcN/OrotuFaF
	e+3k4w4jzEiHfGizh9RczXew2F4r/JTz7vaO9vCnjT3sItaWTn9GwejmG26o9cmT
	vCXoulNZkPs/QxrX5cpN3IGHtli94oHmKukA3T7EaS5lxe+86skW9ayexsWjRdAc
	qXac7UhR3uMgcHcCq18yykrz6OgnRMXMhqmuaf07/BKklw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1k2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a59faf521so1113802b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637660; x=1790242460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=NnPvLvHafgaXfnmgBvTA0qck3WqQVIxnqPl2wVs48e/tLn+g2V3XQuGuIBvJX2jlPG
         JJGNf082yLgNjXgi5L8OHlintcFv4U1AjHp+0sSsG8Q3qGVRtLw6wCijGSg2Dhj4gLR1
         DF8eOJLr/XGI7SuZZbnFgtA4KIRYDgIpcGla9SA8oImwQvGFddJH33BNmNqgoNjsXdMx
         AFfvMBG3z+Yug59SFfNgXnGc9QAzt1QXNzgMnWi+57IIID81cvFBc45GEw2k6sebZ5rR
         nwjmL4l0JQjSbwu36xyC00yvI3bbgxH0Im10wgPtfVrbg51AD2NfJCNuWQpCey7JmHmh
         m+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637660; x=1790242460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=k6LTMDEzvVC4e7vGKZYhtKz/GmtxTxvhIws50swEHEviOY96JEx2LJ2lE1YTRn33aq
         SOg3EqiEYMeZKD7bjMTy6eIjc5mCCtslN87RQlKNL094gWaLOGJr6BL/tWUaJ2OT8ZMq
         9MvbJVLJa4fVuIU20ETdUl/G2kk/4OUMCrJxmU7suwUUa2ykZYYGhTPfrz5jPqKQgJBD
         87Zp1EuvF696gVj17ZkRl4KtqddYpqLfRyfep7GKqbDmnTt93vjqrOZ1wP8VEldlaPSb
         bTewPl+4zuIC6jyntOfyeyoKqkaKoCyqdmvLnjdNwQiE4Un/8dmrHVLpgmwchzypCjYc
         Pfog==
X-Forwarded-Encrypted: i=1; AKwUvBw0rdjrus+NjUrVCEPUBceIiYeqH8ffvZTfVqxz1EhVZ7o9VqXiHxKVBucILXEqmGniybxhIyClofJJ@vger.kernel.org
X-Gm-Message-State: AFuF++kGLuBaU6G/RyGojhMIFJllFwb10T4gLe4v951WNpXrY9TTvWLv
	cf/XzMTlmnW43hkBEGfX+42cj46IVKxM9tULE+tY12NZTi876nuuxOlWHcpo0XcwJSNihHZkOrh
	fHDCFSu7Wu/2y5kgwaxm+yTrUJWc3jpLOIEwa3IKZs8JA+W7Y0QpEGLP52J5rT4UP
X-Gm-Gg: AYBFou00qS4oxWhfPd9Vi8ZEWcYkCMumHwin39bsAW7EoTshr/XEJoI3FxKHA5ty8OC
	+mS4zWuRUE8ouRYR5mMxx79rRHC+CxSGY5dUAXQ/I1clRx57XYnZTc8EdylszxfEZHWgll/zLEe
	XvcisFgpSl7Cww22ItD7egAaAPwaH6W5u04CaIKKtpYi7/pf5S6b0pOn+z9cemGOkKlha1iqlk/
	0CD0jCO0dXoQQHhdNlLH8lG7rNoglKQBG67v3dgrAAj3cVLLCxDDLNZHviWaqbvVJ+XrL00fw8E
	iU1qKKZse7JSIO/FYIuLtoR/8XcwwM+ku+NDqd4nLRs2/1z73vYSvVgkRAcFjDdcDvPzkmp3071
	5bqurdkkL5N44gv6ShqDDVRkreVIpSnkjiep5pGcrXws=
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785617637.28.1789637660234;
        Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785551637.28.1789637659819;
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm11453434c88.9.2026.09.17.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 17:34:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Message-ID: <aqu0FebMYP13xfA_@QCOM-aGQu4IUr3Y>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb41c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x6tdKxaZRr1psv9HlzsA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3ZJdYJAwF1Fenkn8qzSLkDvLqrSbzLGH
X-Proofpoint-ORIG-GUID: 3ZJdYJAwF1Fenkn8qzSLkDvLqrSbzLGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfXyEdAEPnwe5iY
 4xWKt74SIOzJVQvVXR9f+QOglmDowyATLfjAZHYmsAKRt8Wq+Ge8PQjiXjs9WPw9JSxdNznQbUS
 ueQu6pTedjxAB2j/SIxRn/Okaxi9TC7fX3zjzI/moyxO9A+34PDIMO9NqCjWHup8MQWieEplIyL
 ze/A60tgwQGurfWAQMhjjp8SdGbAzASTQ6+n9R0L41A47DSP9GnHds4WjhH9acFO1UxyS9CzAlH
 cGjcRJ/bgQYZ3xPxcv5ErDM18kmnqp4mYZ3XxrBHA2aXTtq8VKDGYVRWR5AiFLJYk5now7OtmVK
 QcSXp5qxOeTnO/TWHZ4qKpflJtRo5qPwbmtNZThZ6ddiQA5R/12alL7GrgTy7HzqeBUaUCuEOk8
 fZXQVOmp+pYY0MNUok4Lm5VB5O3EF9omswg3GUqENrY7MdDtB8WqvRt4M7d+3+DZUDY41STrrRW
 7omqFq+w0bK0bpwZcxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfXyD0+nS+t3EAI
 gWh1AEAKheMQv2H/0jcLUdNh8KYI0DoFfU5GFUy3LKxxOxu2WHjejsTkHJoGPiLxVvuUEFPMSnd
 ypT7CHc+sBPo8Q/t/OCS0TbXJpqxG6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170130

On Thu, Sep 17, 2026 at 11:03:24AM +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up. 
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       pinctrl: qcom: hawi: Fix intr_target_width
>       pinctrl: qcom: maili: Fix intr_target_width
>       pinctrl: qcom: qcs8300: Fix intr_target_width

For the series:

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
