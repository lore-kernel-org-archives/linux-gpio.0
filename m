Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9CE54A7F8
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958347; cv=none; b=TDpyXnXtrRMJ9Qnt2Rtof3gAxXAnhlqmwgQjIwjpS85Ee4XzGRZim/xPGJmPUr8RdwmyLC83v6BRzW6wx30MscSlk2ZTB/kIgmJUGEzRy4LuQJcjLENv0n7NHVa71Iap1NpAVdH47FGumJlCumChqqjxv96gfxyE+Y8vq7jFAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958347; c=relaxed/simple;
	bh=cXvKb72H0RorSkYji2BUaKKOmRWzyLka5DqCZ/QXA5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYhVX3bzRCNNL0vLVfb1vplP2mJKA+6wsv03hOUNJqQV26riKwrM0BBlwX8j/eZghzjbZS1PplUN1H0a64JslMOUMaO2ureoKyr+vDNbNji0OB3Cl6LVFP7+v3bNf2fL8YHQMLAv6UBrWNMBBBF+2Uv8CVDQ1D6uV7xXPEwxppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTmkYS9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWHg3a52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTmkYS9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWHg3a52"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4lh1183711
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 12:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=; b=BTmkYS9RPRLzZtgg
	ydHh+ZUEKk15dXcGuRmGDIihvg+taWZBQvfLY+5f7DckGqs1bGfAIC79VUAxI2k3
	byuF2VDQWyiQRrk90F9SoXxf4oehlVnNkTZFj6l2L045As7ghMagDyYWQMUWlp4G
	NxVONX7F6B0aLi+v+rlzgKoO4zAJgokh+C1BNd9uMSVl269ACmk5f20a2XwjQ2Rp
	KYExKvu8bKvrUDELdWewxi/nvMa3nMH1smsYZXu7ltenxCvX2FrEmc/aid7/W5zu
	hgYwe8cEUKa9pqzRlI77lBLFrQa/4MI23w3ADSQ0YMUcRsworkxNUpxCAP4En4au
	lT5KKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rnd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 12:52:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso1367146085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958345; x=1789563145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=JWHg3a52VPZ11T60WbD16TglPx4RUPY5SzU/g2UNkXJiydXyoM5sEQi1YkEdHVUFNK
         FYmT31K7dLV3iYyCVqswcfhQIiSbC2h/icWUVcHVxRlmgzBWVoTRV0ux++8UDBMvFmKR
         ThtjPNlWf7H+spJL/CLqwSZBvzhrdOxpgkHGWWAAWTsmpkWii/9D76mtN7j4mDLudJu3
         tuHXl0nCG+XQhsBp+of2IvJlOEoq1Qk7vM95HCOOJBt7ytmF2vpu1/VOhqrueRaIdeVu
         qNKUHR06p3w8PKeN9bj29biFvCSCJ5qszG64cVC+O5H2LFJ1MXzD5wrbkYZ5qUpe2DSA
         SSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958345; x=1789563145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=l11srkZuQc/iTjyqfZs4huW3V/iQnkod/eFIfCaLBjItukyn7lVK6elX+CcKJOXeHF
         r+MvPhQlN77lCj3LH1CDPHrKSYG4Gg376hNlv6xO/j78xdzZr3Fmv7XefsIh7puo7bNt
         D3/rYLEUrJjpFfJIsU3T0Derf+kstqGUoasacgMLyP9mEVwKZr4pcliMF/xrAAKFQkfe
         C5YEEl0w/rVLmFxMv79U+6rJgDG9bwgFj+DKFat9aU01001xlPOlqO+QOK+aOcxdi9zG
         v0qTkqLmMWAvGPLHFstX1gDrC2lG92+zsfnXEDaXAf9k588J44iov45Yt+5rzFQ5fxNg
         XwuA==
X-Forwarded-Encrypted: i=1; AKwUvByIWT7S9IM6h2jVryWt2zEuprYxhWRkJvCngk0FTK8TxodnyXGAw4sTumpPxa/SYEFpghMDiuiXD43f@vger.kernel.org
X-Gm-Message-State: AFuF++mhfJStEHfoW2i2iWO/hROqnxLErTlig+EhT+hPysKum2xQS1iR
	5F3DleFi+zOFLJ6t9LdqjgZJ7Q/A0nmgjpHWMAC/8jynb+B5eKOOoj8NLoT0P7T4lshBqqFGinl
	Sc2t3o6+D9TWAhyZ03/cHZO70AoouDARAzc+byd2Ppkwq8Rev40lR10SoCb4+A4Id
X-Gm-Gg: AYBFou0doFVRiUjgiiVLTpKCF9v4oRuIhFYKJeY8FBbsXpazAXae1X1kSKPkTEFgIJp
	Ro2BqjqiFE6GNaGlhE0eyu41pOqHIp6I6uX93f68pNot4ESuFGLdMpY+T0b0SnugITwKLO5MBTc
	X27JxzMpe8jbEmwSzglgeI1nIwLXHIqPO/eLQilmo3MbLfU/G55cdA9LVpmPOsSqT+FGr/thP8B
	Xo+esn2vLv7qMWvRjMTGLx7GU/NlTtcwanekSySKtk0CDyiAKNS9aHUjl/lUyoa3EDhbH4WGIyp
	PXMk4NZ+UYxC+8mKKEGrAL+6Enx0G2fJhUIj1yBsnCycgWwDCHmXFJYZHdKX9k+gUgqB1XS4K2O
	/a5zjgprzaxDzQCcwbFxYDx//cwo=
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268631685a.29.1788958344816;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268627385a.29.1788958344263;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm768027666b.11.2026.09.09.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:52:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add pinctrl support for MSM8952
Date: Wed,  9 Sep 2026 14:52:20 +0200
Message-ID: <178895833828.30492.93870770541896598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa15689 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mPusQoNMmh5jHkL4POYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9h5IuXcJivybNmgsRvy-tTr-nEs6KLu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX+YraIZnDN4g6
 5f37M0p2mwTHQO3j5tCzWLdHMcf5GVm8gnI2r3O8R2tPcpsOhVB/hJ3vNqJp05pBam4luhirTBu
 8oVBaLjxeJnfPwaZJ5dot6E4doCJIFI=
X-Proofpoint-GUID: 9h5IuXcJivybNmgsRvy-tTr-nEs6KLu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfXx1iper//Kmht
 uyiXuFEcjVH4Z6LMqOFfvjn4kqNinguO5vortQ8brolp5lUycjEpO6ajYdF+ZhUuNRZPioLiMRC
 BYoNgaeIEqwR6NZPv7lxJeMV6w43ZzBoBSsSblIScngmCPwQRB3b/1Rtu/L4eb2G4PKB6HmknMd
 TwTJW/+ou/14j0nvpTW4b0OH2n33qMOWieiBVLbK5rFHypWIxH33vlA3VpM4vOx2zJT8C+fKQSS
 AjaL0G26luPL6nZcyRHzJawbgPBQr2vRe2OnZmDGhpWbXoZuP+BRqalQ79g/YhQ35BGiAl4tDjM
 Sju97azbuW15p00k3EhAvL4id8wQo/2r+Cs3vjGyAeQeFnQPjAZcSWWRxSFBT9Eg1tX6RFZ3hVU
 LvPMkxcIIFnXIqQZKwjIWWMvUfdqtpr3UPLkxe2HGB/0141aOGd5LCHcVnaPrdyFuC2kvw01wPD
 5upOIwktciSZHIAw86w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144


On Mon, 07 Sep 2026 19:05:23 +0300, Muzaffer Kadir wrote:
> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver tested on General Mobile GM 5 Plus.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      https://git.kernel.org/brgl/c/2f006f5c617a56afe7683b607727349e0aea7814
[2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
      https://git.kernel.org/brgl/c/b53a6210af0fe559670e298349968beae2c7448b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
