Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDB3BD640
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869440; cv=none; b=AdcJni0BmAK3YNW4qwEcP0b2nzJZpaiim8MhJtb8sFYjWKPHN5ZoBM0eUyZFHjhB6GK0bCa/dzRtFevzPQhUOKbnUR6Ll8R/b+uhVsWCQ4Z2PTRo488+mXMMv7qCW8scaRp0wauThfuxYnJSZGJ+X9NiRg9IjJqLmxKUb6IWPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869440; c=relaxed/simple;
	bh=FjhCAi0gVoqRl+3XGuUu7JAJns+HX17EQeKPrKbLZY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M7RVwNnsGZa9ebNPnssBV5Q4sLXX95GumeepEHRPE9CnvW4MsoONjR/3uX57gAbXMVNfrSI9+l4vV8nvLK1bkXRU0O0Ok5ACDLGVWCKpQEZLhLHkEYlFZc2bAjWL6fPa9THzxGlWT9I9BMPqN8r7aKMiPLGp5u0K6eC6mXZtF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixee0bFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzNiFg8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixee0bFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzNiFg8T"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UApnk12723200
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 11:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=; b=ixee0bFr/DSi9TZb
	F65YIVu9Droblh+dlTx8uw5+DpcxPTMCKZ82Oddj+rBQC1qpkfSEWaFBaKcwSDJn
	uQbCN6g5uB0B9A5ak8vFefhxjHsUkk1j5iQRh+sldv3/2k6JGllBhXy4w/1GSrkX
	WlO/zcwr6CJE202/H8jiTbsP78lGFcTwzXPXXa/zM/wxWEEKGjCAu5EOuI+pYtbr
	knMkorgil2Wlh/GYLDj66U6GXo2OK4HgyE2ntyZTmkyQjWQUgmzu2Ll4iihb4ajd
	oqtbL8ms+Ylu2WBzlJl35VO5qpfwOGqNTZkxYRoMeEIkN5BgSckCHQqq/ukzQOQ9
	Fj9H6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0g2ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 11:17:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so14611531cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869436; x=1775474236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=;
        b=NzNiFg8Tx5xPV8YEfqCJPyI/KMpWUGVRdztoYB4BED2tKAxToQO63ynxynBAo9i32Y
         vmbpmgjNkGpfpaIGvxeNY4FmBTZ6ngptUa+cmfjBr8lndAEXtCV2NVHZDfP6ykVcyuHf
         Kg76dg1O9/2qMTi3SqaAKXz9ZPHxy1E6WjeWGcFV5GHJ9CJiICT+/td6HXYRfXrbvTjW
         N4h/FaLEsFjkD9e+IP00JdQWEeYYPNQ8BkbREL6rsClwyC9drhM0BKGsLg/pSkp9iJj7
         OfvhaZHFlivsH2lYla63R+lm6XCuN9rZVqhLhXGb1mUThghkovdOn5MshoMbAAB+nqXF
         P1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869436; x=1775474236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=;
        b=XSfFPnk5lVNr81YfRke+Rav5/2ljuOBE3xZAeDH35Nt+dJNeoTu9J59HyG2TQghZnx
         UzxPAxSK0cEdKgLvE+yGzzjwEH3N+jyTIPSwWnpuXP5JDUS1+s1J/+bRTGFC3vtKkLL1
         RrzuhuxMg7woSQzoIHp3VTYR7VW/rEwp0FThNb7vErUSIC8j3rdf0sXaSI1bc7GOrp8N
         RWRumU9iyo628uMqZrBaAgQXHiXlw8tl/5wCX5IfiIsxgxY0VoVp3uPVCjXZx+qx2mdg
         t4eNRdvKgC6SvAGgmsUdCLJYcjXFiEFYdeg7zjGyrjlj7a/hlHGVKs3QhhwraQaEZaTx
         CpSA==
X-Forwarded-Encrypted: i=1; AJvYcCUNvvmSLYdhPhbY93yZ9QemM1WU+cqdifUNs7uRQREyLUdxtxPt4TV4osEzDdS7uqNBJAENmoffRa+u@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRBaURPd86+6iCloRAslnW1uVvrH1avNA249MXm0a6pmq/nmV
	7c59LBS8c8yEOOF+znFs4/2CRJZHJEM/hlUaGtNpxTZvH3NEzCQVtKOj4+UcUWpsdW3N2mlPt1B
	+xpHpJzLlFAE7zchCXUTfz8w5/Dr7vti/y5+j8UatErq8cNfvvygVIS+iC4HfMUje
X-Gm-Gg: ATEYQzxN4VXnq//brmLn38mU836bOfTi0uoDe+aDLQ+Je5jKYKMuxiT4v1Fri5hpHhb
	AehBUQ2tZQOfa8Fnmq/J25VGyvVLOqvrBmmlkMsWqOGImPA/7XUfI3eI7ekuZIa6XChyS11Z8+3
	YrAcWY+PDbvs82FO9Tey1HA56Zz9aeLHCN7EsFYPrNbot3PUnztGph9u25epQl3DqJAUf+7Q3L2
	EUVpvr3L+dsz0WHFuGjSgHGpKb++5D9xJOg89kGu1S/4OeRp6cDrZ4NKK0Jwz/oT35YFTln1RVh
	2z8UyY60+vIkvVXSig5kIaFWT65gUHVe0L+f8unwzbKIQg2cQahZTEsSip/U9SZepsZ2xKwKKJE
	m6KOCmE+v57s/0lblEBt/9ni60oVPR1W79UV8uTKJ77wrFwSDcM7VOjzcfE3d4IUYE1aA1Gnzov
	kvw3s=
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr125778001cf.3.1774869436105;
        Mon, 30 Mar 2026 04:17:16 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr125777661cf.3.1774869435552;
        Mon, 30 Mar 2026 04:17:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm283567366b.56.2026.03.30.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:17:14 -0700 (PDT)
Message-ID: <ad9bc963-3fc2-491b-85ee-c8926292d598@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260328021036.85945-1-mailingradian@gmail.com>
 <acc5dKPef3v4cvbC@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acc5dKPef3v4cvbC@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69ca5bbc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=3CczqlxHzE0MuJ1b_VAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YRhmPEB5cT8jjtV0XhpVkd6aUVhAQMgH
X-Proofpoint-ORIG-GUID: YRhmPEB5cT8jjtV0XhpVkd6aUVhAQMgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX/PkMuZ3pPmdU
 msGzs39D59hm7S6e+zh5iutsTd6G7tMaEhbH+qtbWnFamcI5wNtCm9zk0x0gBXFdszhvGmohVak
 bagX71vjwCpISWcSfovUPGMLmIhw0bQfojcYGNBU/CBhE4wTqkSoHjNVfU9JHHo+pzB0FlYuRRJ
 QMJqCYNPb1dn0JMviMuRcrvv3eluJPcWjr0nFSiQoIofX20haVWEgpROSNuYJOClFkdeGqJSajm
 cdGCqC61BNBnyR0iD5ZRbyKnBck9GfR9jiUyDfOT3PJF9ZKicOBd+NI59u7wnCZ1rJj6mu0cJCk
 iBAfHQqEAuGUiHtZqVcwYNbAJeu/0HZTIw8UyVCB9KGpfrOYi+MsF28uokd+B7GB/fe+A0diJM/
 m3D06/LdNAalbynv2izE4oF04MCCpUO2igkzN/AySmVLeCJ99Xkl3FK7iA63alMVp4vFcLDvoZU
 1AFRQe2xTZSzZGvYSdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300088

On 3/28/26 3:14 AM, Richard Acayan wrote:
> On Fri, Mar 27, 2026 at 10:10:31PM -0400, Richard Acayan wrote:
>> This adds support for the LPASS LPI pin controller on SDM670, which
>> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
>> not sent yet.
>>
>> Dependencies:
>> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
>> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
>>
>> Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
>> - add minItems and maxItems (1/5)
>> - add review tags (2-5/5)
> 
> Uh, it seems I dropped them (pun intended).

Please send a v4 with them re-collected (incl. Krzysztof's new tag
on your dt patch)

Konrad
