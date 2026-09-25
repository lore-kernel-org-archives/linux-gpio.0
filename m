Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D3350298
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324085; cv=none; b=E2sPrhFCCcUCubehETNeokJJ9hpKNjVajGXqCKw+dc8X1BOlAGWbAYoNguuOr8t79eYJTHMhaeAKXenVI8Tv+QUzdhgXSgvtqyRGT6Da4pfZ/r+PskeP6qnaKT/V90V7t7mSwVVNZ7weW7xjiljlqdA2l0J1LE2F4rwSD2bWEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324085; c=relaxed/simple;
	bh=W6CSnM3iFAotwz0hIA0yIEZi3XfCoJ2mRyKz9Egt6DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMJ3K0mHoJlsj2PdjQQNrTBQKhjIoxM2RQjga+fEydEp1g6Lr0M7GavdTQFCZ2Do5jqjGULpdgzhjI79KVoU9VfqIxi77acC/AHSLGXGQtM2Tfzz7z/wKzmuRjo+A8SARtpUszpzKPZmlkoXhT35YIRhUMok/MnKLjWtRVAj0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQk9wqXx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvW3ShCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQk9wqXx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvW3ShCU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J2Um756680
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=; b=XQk9wqXxh6qyOuD4
	E3h09v+KIyeiECaEHw9S+hwUg+dTmtNjbQZ8k0bDLBHNEdTrJty6XrxYfraCcESI
	0ys6/jPrabwIwOjwP0U1fRs/1EzQmHDaonU3aZeBKuI0gEy2tsxmL+j49haS2ltI
	4KDsjPD78yuDbb4AwbU9nOyb6DRHLVs+lLBp4PmweGN8hO7LOP0p26hqNh61AoI3
	f6E/NwcOjt4BsjQFAmCtyF+1omBa0TUUdqzjtOi/4AEIt7VtbF4sv4v6CK2X8gKb
	m4QaBHZo1JecN/sxCqJVgU6hUekfQp10VgQORhGrrlwaVo7nn7Ny73/PaDUFNQOY
	sKLzOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08gba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:14:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so132460085a.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324083; x=1790928883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=;
        b=MvW3ShCUTCQkyXv+FI4XW6+AqNOPgJKO7mKAYFcGhjEYVnHt1KVegcVMYc3QfWPWfX
         H/1YvxGAJZwsyDmO0KiR0HdxPNjSnTbgcT0GYRjA3w7z71QMkQQLX/Wh8rdBJS0om1Ga
         W/ChUJaKwRWDj62JJGA2CmV+9Cofo3yMqd7vY9eTejUht0+2S9lsEkI4ImLUIVW8RxS1
         TUXGTuLu4Cg1coJPeuAT8e75ZJW8gCSBoiIEPsvZHOGConlRxeYRDNaYNgzE0afGMpBs
         w+eymUaOJIAKYv2Fazq3hEnJrnX/DgeNy6xD+0GJB2LAZM5iEWviU7HzAwhl0QnEnQD6
         kPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324083; x=1790928883;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=;
        b=kE2Un8NDgw0uxQ3N25C0ZJP+kZ+bMPVt06nbiWkaOsW17pNnDexPlRDItMAaIBIp4U
         GtdZ4nxOHohaxVx2e0NRX7KqJc1gMAA8xpBBUQeO1ybMNNmUzIzXJsOP2J8SBXjy9ibj
         6Sm0yGhogMNQD1/XzLyBMtowMpYPWKRra7tonLENWhz5hdXimVxPnUXWiX8LSeB13Mqr
         YsNChSxyk54CHSy8VvAwuap0GEdeEfzJmJurkdBqNWwpxE5Lk9ebM/JO5EsXuh9pIUuW
         +SW3bjsaLrndct+sEJ7bSKG39nCED9oc8bj97n5SmlBA9n8h+QNJV70DIX7c9Nh2n01W
         cSIA==
X-Forwarded-Encrypted: i=1; AKwUvByVhQNgQyV5bTzqfntu0227XXCJNLFIukDy+NHaA6iNmPRo2ogh8H8NUqoNttEncw0ZnV0jgXlmP3n3@vger.kernel.org
X-Gm-Message-State: AFuF++lXYhIhKVvpAUSDBM25UHyjj1kcWgASLVnUvmT7Mjwajf4Po50Q
	KPVJLvJDFib/KyzlsIAXD+JH07+13TaVFRKcVdvcngvJeU8k+8wvCPzFbji1yzkjnamYEKlcoUi
	hizFQYtTpBpy6Qzq0h0KILEUnSkDSLSMtB//k/WDZBNwz08nSW1ILHtF0BLPrXNX+
X-Gm-Gg: AYBFou2kk6leiFIOl1/q46ekEy58RW20+qP1s40PMRMggRrw6vU/vjAqp2wZry5hXXM
	iHcsUE4uwN4Og2UJ7x3p5rNIEYylqr9Hph5nlygDPScjGXXu3CKFp/gTU2vd51oqdhVs3gWtlRP
	aIFZd7fudWTBnBtcxZNNkD1ToKKYL2eT54nFg2KSXLBlMO4sx3DPV4tVnY2udxZMkBf70OK30GU
	HnOsM7Rv1kCNreNKExyCaS2JAGVUeyIJynt5AZ31MVJqci7c2jKsUy/qo7/94LVq55uNa7lrq8G
	SCejQw4jCi9xfQsHq37cpOHahgfBPZkvN5bTnECG4xFv5yu65fVDqEwE1P27kesrHZeVLa1QK5z
	YglE8o8TT+LEuTqATzsZmSr9EPTI=
X-Received: by 2002:a05:620a:460e:b0:939:922b:3de1 with SMTP id af79cd13be357-93c43d15123mr300093085a.44.1790324082825;
        Fri, 25 Sep 2026 01:14:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:939:922b:3de1 with SMTP id af79cd13be357-93c43d15123mr300089385a.44.1790324082288;
        Fri, 25 Sep 2026 01:14:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm127647365e9.13.2026.09.25.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:14:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andy@kernel.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
Date: Fri, 25 Sep 2026 10:14:38 +0200
Message-ID: <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083512.461838-1-peng.fan@oss.nxp.com>
References: <20260924083512.461838-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX9iVBAIzX8fEs
 LvKep+PUpMsORmcONhUYqSm12fzyYD+uHoZC7B38UH+y3NxVgy6RpLiqFlXOQUVYnMuSnktMnLU
 7z/ZZOuItuWmdywkPSwGpyohXBr5hvk=
X-Proofpoint-GUID: Szd2kWPPQclPTINccg_1PevtF107i6ij
X-Proofpoint-ORIG-GUID: Szd2kWPPQclPTINccg_1PevtF107i6ij
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab62d73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=brAkMm5aftp64Q7YyQIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX7KK2MUjISLkX
 pBouZJRYTpwKvM+GeP36xtKw3MUmMQISa9cp0RXw30SYFa50o9gF230vZWzSIaWFox25d91rwIl
 149vrRdLPs3tnDxorIOur/IevYYNp89WVB88zqBq3K8kmM0RP6orndBIdV0n7v5ZWTQz4ICATKL
 Zo4f1wnEY1H0ZrVhAdGqXvYhQoQPhpzGV0UH+PH2al7MGup6Pp1tSbpWtSTX8hFJm2ajTjSJWvn
 Di/83vqV+wRXrX/VD9HCcHb7OYgjdIi/GY1r86H2Nfo1PqhluJswLOPWsx/SXWDj5oMaOvJxL3E
 8+6jBFgt6sr3s8OQWRgZcn5ORurE+7Vx9GyONRe4DuuN0Xb164d2gYq9Y1fenSEp1rQRA1tNA0S
 BO4wbXoQEs7dtifTRrDkx4UIf1IumCiRc76LS8GDRRQ7P/kJAukPr8lcGkJ19XkNldMw9uB5Lsj
 sdhdqCKkulGYgmNzRDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250032


On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> 

Applied, thanks!

[1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
      https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaaa85

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
