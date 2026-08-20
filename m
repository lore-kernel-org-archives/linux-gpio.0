Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41133D9DAD
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214334; cv=none; b=k1o9gvZgvYykyBqHw2ay/giCb7oddx7eKk4/0Q4PzAku/21IbNnGZyGS/bsmR9MsxGWRDILIr4VGgyz9NfaZ6/3IBNOx/0qyOSJzboyVkz3RgPxlkbYsWj2c4Aw7a8HGyoSWyUAuBtUlvH/qvQ2PwLR7SuPXTSFAQ5o+3VE6flM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214334; c=relaxed/simple;
	bh=YYyZ53DbcXWDtn7UM44D2X5nsQp3/Oxu5WxxX3MnfSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iox2RVoGAqAN4rCfnLtkuooE18abPph7wuwPEtnG5tUBvb+NQYicnxLMppnv4nkjPpMn45D2HTJ+8/dcO+3nz3aJn2V+WrrllkqPurzUlzu1fD3q30LHb4k0iInDXoSbQrPJb29wGnFxdeYq+i/qy4BOfPSjRtlgQ7j6aKJEGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiWaisKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWtL2g7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiWaisKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWtL2g7i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LNB22753363
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=223qQlWuY3f+8iK33zdbyvUr
	oKwN1OIa3V2war/hhpk=; b=ZiWaisKmLP4/ZEJAJktEotllGzVr3U9erUWQesZl
	K9FWNzrFitsgOv6Tqy2u/RoBU0vmvgBAAWV0qUVjj4fbb5mNS22zZ6Ltq59ujyvq
	skSRP4q5QmNngi4tpckc/lplVOF/Ars/V3+mmJ5KbPPTZMQU89j2nKl26o4dRT2v
	QnzLii5ZsTZ4SVlcXiCZQursU0D2osCO42AkdU0YAE9GTpnKreQZxOX2zDDhLHiY
	/55OidG8lVxkQgmV17BO7GIFO1TibLDYVKvBh7/qcbwFuP8jS0KL/36JGU9rNw/E
	vA0Okrpm0kegm5P3LzfUtSWFVHUGcNdlRPn4u0EZFoBwHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w4987hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:25:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9368f2b7b2bso207138885a.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214330; x=1787819130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=TWtL2g7iV44SnfmO9G+xE2uwiiGK4WFmu14YVID4x0/JyBxWx3izjWLT+CQScEr9ZM
         ixrxtEXR8OiCiJ1xwZ0xZknQ7fz2JKYehOX41UBJ0G1GMx9YuwdvqaG7OZJ2/uJfiuCg
         dAfCImWOWi+J8D3zZDk7ZiNY6jKPDzaNTpY6sB15qX3w4OHCDMkKMLBZJ6KyNYOMhkhO
         V38J+Mbnt32Tdikm32EXJh7PO0z0hPdIZl8DxsSIiv4YmNqsZEREBYsU3yWdTFGIVhbP
         4BnRU4zUddQppee/yKRXr7HjIb69XdG8babh0+vBv1zLO4VA7UwkbnnuxWzZ3Itz48Eq
         oXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214330; x=1787819130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=VxNC1bhyVOIpVWR829maG8uK+5NjIv8EX9lsuyzlOIuKAsQdlM8CbedVExYbXae6Qs
         HITFcUz0ktnH3D2fZcAlPzok4CXC/EC97JJyTrmFPn2kX1N8MzX/HLp9rPlFaYC8ZB63
         Wbk2diaZ8fTtJ02A14iknPZiJm+6+1GIYSM4OKKlTqAGYHDsUBzIr+jH6o2WdBVpmbzq
         Wq5lvBT95IFsDghRiiRQ4vBNnvy/4NxBP0CPnvtj/+0E42zf1SPScWZvHIDex3jEC7v/
         HO/50Phsic764YCb0V68nIP+0NwP9Xi/gk2xGazm/I51lwP4v3Ob7Qka6dt8Sm2BThuX
         PeXw==
X-Forwarded-Encrypted: i=1; AHgh+Roc07seV2s7IsVNUKSFHAGAOpTqtlddHUCNSfrDgERee1yJ7MhU7cvV8ztjDLf2bW6mcXOTvXobJQwv@vger.kernel.org
X-Gm-Message-State: AOJu0YxjHayb4xhBvL3uR/D7IF3RhIvkAOH8ufa1VDLO6rj3rySo0ies
	csFeF2R19WqdDQ3GaSvYmF1Rccq24SEDkNwT/97z/ZJvFDbsbmXjaU6xSzU/f46ifYMT2cm6Ahl
	eqwKPb23X7tk0+kQ5JkgrxBDPvCfyABhq/eiOYJ+Dhonw0NltUKKaxIB9aSbgMALi
X-Gm-Gg: AR+sD11m/GunzYKhsfN9TR85VzpaR7VSVVW+g/nyV5VfPQ41Bi9HYu4uGqX+jtwE/Rl
	JGQ6mOlLp9E3sRo1cKBLAecyaUAoVRlHvaakhI+CFyagz15V7kY574YF5o32LRPsCh8VtvA5PeW
	zoaL9NmoJ1Pz7aT62etLWPjADAPP3r5TbIlyB0QYICnTeEJi+BgCr1xl+kLzwADUvF9LJsXJ0Tt
	xnVPhB7SK3FwQyWdouHgkNNn0Id+A/3HxIudGisgG+9XPztJ4+G/hDg5lo28MrObNWohupY21/4
	EXLb69dbLuX6yBp1jXY3PBDr/St8cEKRGd5xEz79EBzNzKI90EOE6W2/DxLi3HKNVq75/1Ako4a
	fl6QtoIPTOfP9Bvw=
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946979185a.30.1787214329902;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946974785a.30.1787214329361;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm11809010f8f.10.2026.08.20.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:25:28 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:25:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB
 controller
Message-ID: <oocip6a35iv7wsxtiudapckeklgv34d3cigftdc76jinixxy37@qdd7xsjxvkjf>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfXzB58pOCezHhv
 iBepSvV/uLRYEu95LVKTtc0dnE4souAFLidpN063DnpVqAYqzMbPljml+NvHMqyYS2xTMUMXhv9
 iOFmyns3bp9HXg7N44l3NJpnn1+5zG0=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86b9fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GX6hXX8UDECmu-q5ZscA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cfCZvIUlw-FY5k_xsUU1DV57FOML0vXE
X-Proofpoint-GUID: cfCZvIUlw-FY5k_xsUU1DV57FOML0vXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfXwr8rpweeAUVB
 NFCHnzM3eEKG92FkbKWd6R5PsumAWE0BtMMMBbgS0/kQ4Q6Gy2ki7ulRdmzm8eqb9+z1JW+6OnW
 i5K9DYrvXiUOBnLuI5qbCL0KKCLt7KX8ZH6mwMFkIDqK9pS76wciktN9A1ULiy3McqponYzHDcN
 Qh0uOpK1AASdj+M5W1mTe0prL0Tm8wCJOuN/V+IPR5WZXxWEACvkctzRZYNq4wTBL8Hw31Rkqvd
 TJxIv3v+Pmhw9CutvMDOsH/I9o/FEcenz/zAa5nniOX6mnFE3sIebUIUFfWJgJQOFxzO1K8XLB9
 DpFoW5FHvQwfsxRVwFBz3H/PgLFkXXxYi7ePmeTKxRCiOv1QvNgZk+04tEe/hz8mesPi73VD5fz
 PWUEQmij/oz32uLoeo3J1PuQFbGKCG5VlSNS9AdKEIHFrwy3sr0DMb1PPrBbaa6ayyDnUG5OEtG
 4YRj0RhGSiTRgxxHRKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200059

On 26-08-10 18:42:13, Dmitry Baryshkov wrote:
> The MSM8974 HSIC USB host - a third Chipidea controller with a
> dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
> described, leaving boards with HSIC-attached hubs or modems without
> upstream support.
> 
> Add the controller and PHY nodes. The PHY is a ULPI bus driver present
> inside the ulpi subnode.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
