Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAB4A6CDC
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859055; cv=none; b=a9RZo/nwWoc+IjkLYb89tthzPlqCWeuHC/omZrSiqvJ/QxAeRqbf7HejzrIenFhkUG8pBNi58C9Kyd1GKFueCJPUyM8QMDwQqq+uBbJ8UfuzKQzhBNjtmjl5RyXKQt597oCjhANknR4x0jpjN+6LW+l+EhiX520+5bWlqqyRnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859055; c=relaxed/simple;
	bh=qsNumoTBSrwUbU7OFJ613pVZJ7eY+2K0f3zdIYvMA/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq/kx/XQvb/ZvxdF9k+kOnENyP8leHlTZK9UOoxC1ubKP8HOk3QOSR1mZfzQQffQ8laDTcECsPl7eHokDxLRL281NKFGDYXP0CmHpujC+wOP7VTaQ+aiwKBIYNEBhw7UckubVn3ZR401KnQ8UX7jTQPB46iuinIO2tK+k5pEqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUTKbEZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ttke/296; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUTKbEZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ttke/296"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CPigY1062276
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=; b=JUTKbEZTXKMh5x3v
	VcOxq+OX0snveClbfS8PvAGvErOeT3BQHd5pgUONLYyycNhzpGxkuouNV9W6xzrq
	USF5+RCJwCcnv6BAgJQ4pJZtsIPR87M72cUQPvx3viLPnOTGlS40pZZNcl9IFa9F
	uaw5pjE5wHHx+7fP7Lyzv8Wup5qjbm1GsRj31a9vHj2IBEiXaoIsyeyGcAHai3ad
	0dEPM/hgMCwgDiSZkx3sY1WYDtMCFko9J5lMVzxl3AdKo2NwAhGqIF5lbsUvoCDv
	jNJ6yuYZL4za2zOmMozq5QCVq5c9C5658t2+JuOm0GqVN8ICH11KYdueKfHhndHH
	usIV/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuvx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:50:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso121846485a.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790859052; x=1791463852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=Ttke/2963NoQMVMmxF+umV0oyGF7XgvktodBhviBNl2pO0UnufonHE8QWovuG9K3pI
         UQ9ThdSSw4zdXIPrYXBsFSupF0wjMWK1ohe0bV9P3R2qNA3erkq2UQXeBj6li076w9DP
         R7rLM0gICiS4Sa059UL8wR331f3cfU6ZflrdxhpLJVWVfDITIxzhAvydRRFa6FNsusVy
         8zB91ZCBq33EN8O+8GWM0H3CV4A0DWSLIpJEAFRuUTHHm3GE/8AjPP+o+MJM5UVgnwHO
         0ZFCdInd8+SH3muP2fylf/ceGY+5XIW3PBhIV9nHmCqXvargC0YwmMstrr3GyCRow5vP
         o+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859052; x=1791463852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=Pm7g8/ya8I1GZRDvtlG5XaOFlVZBw7m0svxPyXcg/bt96I72BUAbsr/V98I+QhC9O/
         Ce7HLO9IlsfcS82jVMjtbY2xFyVayGrSH/5lcKogVD9E+1M8we3uLGeU7nEORsleZjHT
         XjWfoBhJ8/LHKYoy8pQn3H4MHuZAqq3l3e0/t++mywTn/u5BrxYFxIXbB99joLXEzJOv
         yJc/AtUL3ScRn1SCoeFQ3DisgNAuUtsZG5htFDl6tQVTTyUGWWDrptoON5f00WizN2uM
         masXTSlE5Aqc3QGmI5F+zggIsfWQTdVdcJMN1zbDx2GUI8JOC1q9vQza1aTpWEbEobos
         6YPg==
X-Forwarded-Encrypted: i=1; AKwUvBwQZb26TmjzEkIxVoW4YHedTpMHjHRU92ndutDQ4QM8aJOCxZW5aPV4aBFNiXTHCEnHZUgkfHAVqv+Y@vger.kernel.org
X-Gm-Message-State: AFuF++kUlGUC9VCGLQ9VcTbfgMGxD5KBvr3qZHCs9WV5ELJeRAn/j54B
	M396aySkUCozZWXvJYZS/T7ovo5Yp1PVPkHAMbi9bsTDZ1BoXDBhnOc4b15oaZOWw+FQnuK3COI
	jUBdOVb6cC73+q1ucsX3UkZDwjmoogl/+JhcRgt1XpOeZb/Zw4ZBkrahfgC6XaN/v
X-Gm-Gg: AYBFou3E2ujJuU846pgJtmKhfs63GbQ8D+syiOkRQAjkUiLi2+TVbtZXTzpgmf5iPSi
	PRFu1vPso7Z6cCNMxGxFlZLYqC//pxbu5fIdMACn9xDdtu3T6Ip3zjclg3cGBsNbXLSajp/ITRf
	toJxt24M1Qi8IBjWO6Om6rX3cYwCEbM+5OAziaCI8vR/eo1K2e78Gens1ZzHmAUu469+nYyyvBj
	zykNcL3XNEUYJH4iKDwAjjwLYRkDiMbvWANwD3oa1WX50nQgy1LYJFqlepmOy8lIj7zH3V4GXrA
	ET+WI0atnpDxofWkwIWiOJvuA2hzpkBk9UTkxg2L13QWH0YCEX+nnAeoJB49UIoR/UpyYSDssVv
	noNhGp+LMvqgVZ4z8bRoZqQ==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826924485a.1.1790859052053;
        Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826917785a.1.1790859051341;
        Thu, 01 Oct 2026 05:50:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e333b8bb1sm139289066b.21.2026.10.01.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:50:50 -0700 (PDT)
Message-ID: <e3e8b0b5-3da8-47bc-80d6-c47edf153d32@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control
 entry
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, brgl@kernel.org
References: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xFhGp0o5H2XElUzdg11E2eX7W69KhvKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfX2JeowFVqEF9F
 1M8UEBLRnU7c2HiVzwEPWmAXXlxY7XU4FKcroVhThtTKdku59ZrLHTg9+GcGeaYWWJN2fQbaq3/
 apyn8riI/p1bPtNdtGT6UcZST+k4mnvom71GsuU38J7INah5o24oICQRfFwA7E/+X+Vd7Xjx3TE
 cisy3fEcJa5LJZ0RZk3W0rMlNxeh8BMuDsR3tmy4YQZoWrpwZt6j4Mc6Zl8u3ZJuhkjI+GOkikc
 TbZL3jQKS9lbg8/K/t1WOK3OPaGMNkYZY4Ar8p47U0gMpjNnVwDOBGBLO0HcswqU6IHJNDp+L6q
 SVtgRiDAL2bbOtA6s2EHBB1LyBQ4xmdtQbiJvAHRXR0Ipt3KA9ySvl0hnEczoovBXFe2o+S5U9t
 KxuyzOnBR8EU9evIqwOkUIN7odWbj+S2bPA2wltc2cDSeWwAM9YfO63/nR20pG72GSCm3HrCSVK
 QMucva4+V4U46RCaQNg==
X-Proofpoint-GUID: xFhGp0o5H2XElUzdg11E2eX7W69KhvKh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfX5UpuaNwHFUXv
 4yS5o6og/09SMu5uN1jqh30A25LDT2DsRZaSxL/fMFBSj/ifesdhSU6HhHA4oqssLTqeIxG1Dga
 YulRwoNOk0feufp6xagz3tPTQhtCMWo=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe572d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kjj55Q4xDMlVXKy7ifgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010051

On 10/1/26 2:37 PM, Bartosz Golaszewski wrote:
> I stage Qualcomm pin control changes in my own tree before sending them
> upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
