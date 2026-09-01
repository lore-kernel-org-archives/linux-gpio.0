Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60543C7DB
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278538; cv=none; b=uI7YTM9LHbrzoBby0Zop6/w+K/Mie3TuL8vWcYkqnsUOOJk9DY0PDma9831wLB7P64ZlZnsyUDB/7x1PQ0R7k2JmE60HXUdUZPrecgdmpiXfv0q9yfOzg6P4hoFMT6viaHRsg9ttkldw/z0OYfqNcrpmqY2oqbNBdTpl3x82pPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278538; c=relaxed/simple;
	bh=w4mM5Ssoiev7XYTuaP4BQ0VP2VrO/qBImVxraWj4CfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuGXeSaueQvwnQlrsj/1W7t+BBU7XkEFwRzFACIkpINgkMfFyVwfqmziaz3mCNs4aBpO18Hmufw4AnClL/N7UtnCBqQXNLxeY3Wujszz4SSNBVojvHy/DDkp+wxV85aXP65OkhrfheGsMTC0Bq9gSQ2OSmNwIcqQ6Hgthkm67gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODS6pkaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR4EipQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODS6pkaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR4EipQc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E95922217552
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 16:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=; b=ODS6pkaLPLTANowl
	4iG9bEBSYyMSSlPy++dbr0cyqIYAWV8r0MY0D8036Bwex2TlbYbfUWCWCILomsBk
	MdCocYYyRH9W8I0UiJWUrWU07EH/2NM5iwMfOb0Vw40Of3BBQpUPQNn/6DOmF4lA
	VLu8jqXfRCAUfBv6ZXF1Xk3UfGuMhJROHsbTwce/tY9b3+Zpemg4Bzip6ZBKSzAd
	BH9xn5iCtBEla5Xqe3S/e61ftW5nYx7KuWyOLtNG/yejMHtRbzqTq1ElYr+3WhzR
	CHIFaSIxpwkqINM/k2C1OOhBNWgr6u2woHV/sGlA4weNcDj1OWDmp+FXZRvQUvwQ
	q1iutQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxbj01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 16:02:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7850f24e668so10597137.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278534; x=1788883334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=MR4EipQcxoLgA0yz1BZ5Roq9b7knFm/ExNTqIIs3QoE/ihkO2O2AAnVgmIFyDBPDEv
         +crxzfEx7nFH8/HcCo4kl4sZxpQrHS7wilju2wjkKaJ37+Q8KAuL66+O6N0ZuGOLkzzn
         d/wx1/lLhTB048IGv9gZux5jYyg9AIhrlgBcSv2z9yFoEmAKssk8JG8Aq1np9K2fhX9j
         nEa3O1EUIlbHKtiG2By6sY9uotXHXxuuPJXP8oNnHk7bgt+tjjwJO9L6cnfF5aiheywO
         DsrDWtY9bt4/OJr/uyZE5qbGvZ4RUnoQRSMiZxoEbUnsb4d00vKYaltbLEv1RI2vmlj/
         KYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278534; x=1788883334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=gvQiAwy+9FGFPppGKrifkMjuBYb5nnDU4sSqzOSVKUrLkIcV+Bss4uD6qeEae6fyPz
         N2lHxwU7CRsBUBMXEKF/GpTvWN0a0eI61h1Z7N1VoNzcW24/OBwaekfOu0QK9yqQSvZa
         MfaavczdkuOtcXy/IXj6HEiHmjL3bfR1SXY/CtszgnY2WvFEGLctJkfXeE0Jt7HeSxW8
         Ld6ifeBnTs3cTWEsbg/dKaKVMzlII5bLxd3IBxO+lnS6u6YiEtt2exYe4YHgyZw9rc2Z
         ZWASk7HlTewc9XlNFUFV/aKvMjEGlanupuBiKKvJ7qrS3BQk9TaSMMvrh8eE3wWrR/4n
         jq2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jkhvdn3u+U1o1SvhyTg17OQo+aIcWGCuuCL4CQOEKX/ZjQ3AXMC0HcA5PgQay+h30fnVY1TiksRa@vger.kernel.org
X-Gm-Message-State: AFuF++kHnhSbR+aMRw5fYwlUUL0W+tynQ+GpuAuuMGCgaMEATxI/8dm2
	T7K08Wpf9Utg5Tugybad2C9B45n2i64XcGqK1IXQmQNEwNeszmfZmLta/BZz8bt+Y8eIkqCyBwV
	15hsQqpMPuv10ZrgCEtAST5Dqaxxbr5ScAdTXxCoHa77IrkZbBGzgeTurI2DRrmSq
X-Gm-Gg: AR+sD10WLON3p3iC9CFbjZURu66WFkCxgCK3TCzK8afpONeq0tBUYTSaUXpxVdM8zUI
	MDD2jcDnop9AOTcGCOYcrfB4KvcReZYD3yBfH4+QPQdIOvjHMG/+DFJIfqCUSquxmTOlIJST6TL
	mhKuevOTTy0xXR0sVR/WBD1lClMRCzuOscDH9DBHJv9Qc673kwtHlTd/hXVzBT1WcxhoCohqM4f
	INvud3d7uQeCU+BRHSUQoacoIFy8rQKLxRxGQjMeykbqYCeiTtoMTE2zXPUFpmJbfGbN/3WdccA
	NBvfDeDoU6Mb9lAADUpDmRKbxyghtkm+HwixIS2h4t7WRJ/Rut5oLl0DyNzcG7EJatiq6hKZ1Ge
	F0po6tIRJTJ7bwB6Vk0r7XvQ3MQ==
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11326058137.2.1788278533846;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11325986137.2.1788278533185;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10f08sm77090785e9.7.2026.09.01.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:02:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] pinctrl: qcom: Add Hawi LPASS LPI pinctrl support
Date: Tue,  1 Sep 2026 18:02:09 +0200
Message-ID: <178827852464.39834.11620315583830437575.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U7LdIV4oLx34XIJrrk77y7Fngh7sVIlt
X-Proofpoint-ORIG-GUID: U7LdIV4oLx34XIJrrk77y7Fngh7sVIlt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX7eKuqu9Ol+9R
 GlZba+uzAp59VesUFJlUfXyT6r974QYzrejUI66RQDUe2DcqlvP0zDcFrqCZhe/yBXjjm9nLnN4
 Nin7ob+vWM8jSwdErtsk263Au2dcufg=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96f706 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_3pKljZcgwLS8jvdWFwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX9TeFn0tMGDb1
 hWXueH9Q+uXIRWDCPHrdDabWvamXN6RDfP3E1YmAVNh8Q4ltJM0CWX4egRvAho3mjefG+SAvsrx
 Tg9jJ0NnEnJ944VFmXthJWt+1Dj7q18GPh0JcRi0KlfVsG6N/oz8cWfBqlpgycp3MnPKOH70ePd
 i7omDLMFk+OTPG8vxDpXkJWioD+uY9vCjd2PxWe+l7X9p69iBWLRAum1MtQHaRG6IrLvCHOEuB5
 /NpFFrv38PUCx0jGnZEo/iaQoewLUPIF9t54rGBZ143G5V5eYU34CxkNBubbVLI7pd/gcKhehE+
 OPS3/S4mbYvCEMXRnohTFjRtJcj4rtDKyu2edGagZTk3R7fFc2aZLxdYYSH3HckTM05grLat2Nz
 rlQwJ1ofwLsW4jfjqD73D80J0wGcA6gzqaORL8iQRm32OwScKUPMIUcNtwefI9UwcrkXzv5mqfg
 dyv7N9TSCBWy2JHm1Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010142


On Fri, 21 Aug 2026 17:05:46 +0530, Prasad Kumpatla wrote:
> Patches 1-3 from the previous revision have been merged, so this
> revision contains only the remaining Hawi LPASS LPI pinctrl support
> patches.
> 
> Patch 1 adds the DT binding for the Hawi LPASS LPI pinctrl controller.
> Patch 2 adds the corresponding Hawi LPASS LPI TLMM driver support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      https://git.kernel.org/brgl/c/a67c78364f8b3312d36c3518fe839af8f8385101
[2/2] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
      https://git.kernel.org/brgl/c/6f168dea0db7bf35089a7fe942f1df6214464fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
