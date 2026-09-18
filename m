Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9143A806
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731097; cv=none; b=BoxU63333VrGUpQwLVvGc3vZWVz89OwNYxzOLoCyQ1INBNrNyBeztfBvH0qSSemV5WiBB9H6RJRLbV6Cb7ihqCAD5i7aDrToKE1v+cDZVA96hkibI6l5wcCt6giCWliM0ks/2cCNEiKtFCx+GqZzkh2fYmnRGM3FhzXO4Uw+JBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731097; c=relaxed/simple;
	bh=nSJiNBakj4emOsSacF3nvZXhxu4+N+4Jm9sSlg+AafI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uo+eQ15XVK5kQ4d2vN3Z2zWin3Mb/EOkO3IupBxKFZ6mf0NTPJwRr+ThGZDMyguyQfr8+v7CMF7aD2HHm5aUneflsF+ZUFkWH25SkkLaqZh/WHe/701CsqFeJsLBUnHF4o1T1Mw8qY1fxdRHHeaiHh8l/jk4ml6Ybe/QQMYRdHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7VF9xQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFAMh6qG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7VF9xQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFAMh6qG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dZff1404282
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=; b=n7VF9xQM70RRj+t8
	ENq2TnfEwl75DANZo2i6Fo+CSCDZjO+nhrCARSZ/IfO0Z+yqgV7k4aenR3OedW5r
	VrvL67T9eTu6BAIwz3nuAToaaSXzKHxoHlKsHlF+j836AZdrkfHpRyuGqlphXcb2
	U8awAxEWg5T5nXsW4OLxLJU6XCetwbRCGvfGMT8u+795CSBYkz0wD4B1EwTQ6Ffu
	r6GlloMdsSGhut2HopRLW5k1+QVESgJaU7+LtTsqqLNXjkvebBP9HS3aZfHB7lPd
	mMszHiWOMJuoLx4eSWFQ+WRtTuqAAFaFOZ/DPvs/v5criSr35F6f6NVRsB3SvY+Q
	Rq2L/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdptdr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1657943a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789731093; x=1790335893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=SFAMh6qG71wzZOKBabWyCCVC1EIRjEy0mxZV1jrqtgkdWYV7HcetJ7FrgDYQA8gsxY
         wGdSpid/sOWepC2Y8uzcrKf7u25hexNc/WsuHujT7KQZ9KsTMS6diwlKa3wNomg6CSgX
         oXCnxW8HMR4+27dRjS37NwL3uKbzi7AxKIyavhuqIAaXsTyfHa9B6Gzg380NLn/RBUZD
         0wsPSD1vxl1jhoIQVUQNW8gx6TiumbxHWMTg4Q6hRxITHjMXNz7qLZczesnqL71dKsZw
         kbZZfvzjQwFzgXXZataNA32p1UgOTN4ZDE0/deFeiztFTImiTNcyMOazcErpNBivgs0O
         ZpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731093; x=1790335893;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=RjdVlg0JST+mvloOwCAhJcr5ZOxtBf4Zlk5TmSWu6x7LhKy9WrvYQ2XF1WXtfZxwuF
         X1hA+Azidrdp/lOyWC6lCJEdk8VUiEn84LzCVwx1lYZmaaSeC+7XWI3AGiAHcCag/2l1
         JNypeqweZuyoh8dL3kkr4O8Ng9w/QO9naPEJEvf8en0ZVNMuK+SOqBilBtgA7b2JPfIb
         trhlAqdhUnuIf4l7deWuDh7nlmDx76uPihG8cyUxsH//aQV84SqfkJEjjY5KTmq+uDk2
         HQmWAwzDusfL0t3ZTgeaD5WmfesniFIK3AVw88LcD+su1aCMjujuX2cWGHksKW2gkGKK
         6Z8w==
X-Forwarded-Encrypted: i=1; AKwUvBx47qAsn+mKMoaqQG01qT/R5PM2HHymyPXpVC2GMf4Hm9zn2aXIO0PmWeRCcw6QayCUeQ0JzzkFpGRQ@vger.kernel.org
X-Gm-Message-State: AFuF++leuipxWVV3lVDifT/lQlJPwU7K/BFyy8xoa7qm78k71yX8PDR7
	6LN4VGDvLNaGdtH8AuAJcBw6kUpF8UbZjEq+vjwPBhYOnrimetoYOHupzgfjA6yknYNZUACzpUx
	Ru0lEDePzQGaiigPXNGdPuliK5PmF5dvfyZUigzylP+zJgn31kjbhce45ar2qpUPR
X-Gm-Gg: AYBFou1/bWYtsVipIeK5rn6kSP20AdiYBNElJUrHGQEcl5uuJELItCH//2ecwUpxoQf
	j9gqeaaH344x0K4qeG2hUc6SMqZCBiGoqUSTyQPA/QGDRLHITSBSypJtx5+AMMpsjtBOurFKxCS
	Zwvl+HN2aMDF90BLVRUltGzRgaEaDYHgEQdOGhMxOJejFdyLVEKzvbCHnmRyXbqkI06H+DfRSqh
	W4HI0JQRsrScwak6H+4qHY7WLrPQ297Tzrvy/KsykijSD/yTLvLu+OtZ+DtBiuLNJI42jQaLmuk
	y3+wwhtOFcS3eLExaQflRM/TQMxw1nztNxNnTZhDOeKxT0BIhkVXMBmT29wJaKb6ruprGec5/RA
	JPp8cM50m8keFkZw4XgF6VLhP
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059767a91.22.1789731092702;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059729a91.22.1789731092255;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876965dsm5375819eec.19.2026.09.18.04.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 04:31:31 -0700 (PDT)
Message-ID: <cf538030-63be-46e0-8800-10dfb941a388@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
 <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfX3vPXkclUsRxp
 8na8MQYWMAnFLpGfgWbHpc6gPYcwpK+SKN/8TgibVrKoMdNK1ha0OZ8HEtvj2keCXX0qGbS7ro1
 Tmy7vQIzrMv8HaMdP6rr5EMuXocx9u59eP73A1KZPkrDVKKzlbnJ+hVxfpHwf/N1DVMHuv/6qhW
 YOZJoyUAejGdm4USMVh5rdSDiVqnizWRVN5i5ZLkENbB+F3F+QL5Gdv3T0sm3QMjBAdVt3kRvMK
 kMejU6fUIHlS55pd/KoKMUlc2yybccw+Kvk9yhSuBecmak4K2zvVgyz6IlWN20EfXo2qNz5J5v2
 jbx66YrUf/czoljDvkbAK0bzM70t2+mK+B7gzO+j8IqC6csB8c18Au5yC0+Dy5HnzwDOculImRc
 7O3cDB6M3qE8r5Dyei/CF8llR1K4gOhi+FG+i9HAwAq00+059O2WIdnhsTsFCn7Zyg+cGMmU9VM
 6RYMJ8LR+EwQPmntlXQ==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad2115 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=iMoLkvK7-tmY2ETxFN8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfX9vcao+/0QCSp
 rJKPzj+uvWVCQx6EiqekCmsPrXYDa5UJPLv3tpIiSzcXSFXsozV/oavy16URUcOAVZeu8cs+iM9
 UqPltylhXUiwur+i+o8g3i2bvhOWFhE=
X-Proofpoint-ORIG-GUID: KbGTfNoZ4WvBiQsuNSc1eHRMeKYqLxH_
X-Proofpoint-GUID: KbGTfNoZ4WvBiQsuNSc1eHRMeKYqLxH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180161



On 9/17/2026 5:35 PM, Karthik S wrote:
> As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
> works fine, the alternate functions seem to be similar between sdm670 
> and QCS615, we will use the existing pinctrl driver and post the dts and 
> machine driver changes for the same.

hi Konrad,

but we will have to add pm_ops support for enablement of clocks, similar 
to sc8280xp lpi to scdm670 lpass lpi pinctrl driver.

Thanks and regards,
karthik S
