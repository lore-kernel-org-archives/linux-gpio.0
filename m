Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9A41F5D1
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693333; cv=none; b=dxgYiW3Y4tagJBo5dUm8Pa12mtSEFN7CK7CpEGzYN5FdLLRYL4Ui6KtYWsJ0JkAH6uWPYbWGOxNstZEBHyI6roBcexIi6+F5JWKysacW0ani80VR3zmHVKBaA1wFwpTHa7TwN67OMtxqfYmGEyVVan+pLSxx/CtZyL4Np4UPzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693333; c=relaxed/simple;
	bh=XfQFoy92YAbJRszFj4tSxRJz3Ixlm75wjudJorUS+Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFvKins8dIf7dMYwqLJ2OP3HMSJSwPJuz/rZ88i5umVE5E2aOXYY+zj2axC4JRmncITy027UN8bwnM3dxlk2Uh5IRGU73jYja/ctlhEmuJ899+2vup6U5rFgoOSdrwzB1OQqeWe/OgfzEc594hLyyFg5e8mK92Z+6UcrRmJnX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLaB4z+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjPDmf8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLaB4z+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjPDmf8X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fUjG1079126
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=; b=TLaB4z+QZfXwOQGg
	Cbtnvbf3oBaDekR0RbQ3A7rx1B3bXGq09su8+IOCAkdrdv1bb0bqc7Qak76tqPib
	eJBFZiq1xDRINkol4ZA8CNUotxcy4fDX9nij1mcfSMRkfqTHQD8LyEMQBelPwjN5
	tILZZv1kCzgzlI4OEm6VoJhgekXBT4w4yT7xH+4XCZFDH3DnL8LP6wXTwcuKxWrZ
	G8GSEZGQ/X0vlWwhO+7nxnBkzXHxjhSGACrh0EkFt0SU6Dd5BEOTsVNGiGzDYMBI
	bGNiySqZUhEeAjFGTQAWIIIs9L8iXOOfrt+j1nyI5H1awzmuCqHqJ1HRqB5X5oJa
	CfaCCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexg34j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so9759275ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693320; x=1787298120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=KjPDmf8Xcxn5/UM9Eg1Duke4d8s5R0q3gJiNXCADNUrSyW21eG1M4jeYzhT+U1jmJS
         XJO83Xs8gyyzJlF2ZvGAUie8SWHY2yVQvHH4qr/guqtnDoyePzalHEmW+kJuiAObzIM0
         geJVZRLKU7lv+11abtQ3tQ/KAkgngh9jiBf6xJCCh/GYMxX7Z+oxfp0C2JX1Q8PitQTZ
         0o3oVeHalalGeCJ0ojde2qOqkJKuTLWK/0GBbMXcqvcvFLYZi014SOez59OLmLp+5Uny
         9FiknsFzs2tuc2pxkcV/KtQOb0pJ/rr4kfWbUFwOKHzfQvoSeNqesoG1hu6VzEQ7K3uU
         J4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693320; x=1787298120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=UJasK8v/KlpsIiSPwas/yNER2VKVVahWUW9dwwhVx1LrfBW82i3D3nt1zvdECFll3S
         3aM8MtP4u9EnlvxR6/H1nRKmscaw1xSe9eFnX2OoFjt5uxhExMg4kHWiwLSf4Fggvahs
         cwDfW1kwGweqKzZk9tbTIAbNU4RKvx76PgAOHOL1xrjSqql0G/esZc9CRmjygST01Dku
         ciHIF/CM8N6DcremP4XYoIIJ+FEHSzjmnPNqjtxjzBqcsGu4AeQTlbe7WzkS7TjWpbzB
         ClZ1IvP/f8X+xJ7Oe06otuRlqziGILWdl1oLGREM6vGAa9MfI9SAFuZ+0u44ytAvPwYe
         bH5A==
X-Forwarded-Encrypted: i=1; AHgh+RocHG1cguTSzjd/VVCya6NiGtQYsJ+DcTezzfY3yvvjFndDWUqSli4/CH0LUe0dPdvTBuKnEuolFyv6@vger.kernel.org
X-Gm-Message-State: AOJu0YyorBIlW8Z0lcTRRntm/cEcBE9Kwf6Al63pKgGBKqClfyeMaMPa
	HY0Wrs4n4qYv/YLptgfhKCto63x9K7J1lSmV77SR5L+5F/E27N3KxZO50i1MX7jgYkz5ei2/brB
	6Vy+vbyhHDEPHh3Rl1vqUgHCK05P4NCdf9ntQdGOFDsLAqfXu5JJxD429OH0BrQNB
X-Gm-Gg: AR+sD11POazmWVCKUjjmZWizxoU3DAeZe69qXQ3ov9uIlXf5eGsFZYSdbwG17UHWP7Q
	i6WeZQubRd8XPJaWur/jF0y8OFB7rsYnQSVPIAStWxhM2MuARSoYYUSQoIgqD/10Xb5C9aR/65N
	xEimg2HcCgB43gjVBFBjhHkI6YQHu70xNLOlZfAyq3HwYeprk4GH8g7CelIE17Vd/D1JYPXabcr
	3j7T7SVFEHuNdOkOwA9/6g1gWCS3VwoofbZP5KsTEy+tvnHgbOBafS2fS72tGmN2/oCVtjQ9mbh
	1j37KvxH+VuA2BwauHMPiEDKCvNyXD7puPo0dX0WwVxRYgur2WhS0tEJvAZzXTxrhyKfvP/RdZU
	vwvKOcDGzvcwDDKCqOwZSPhzOdNvlw0WZTsDG7ezLanxoOCwgB3BKgZ+ecspyKLP8riEMWDslQx
	TUtAabmxObKvRjYJOOB7U=
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197325a91.11.1786693319743;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197268a91.11.1786693319213;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9a1301sm1542712a91.7.2026.08.14.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:41:58 -0700 (PDT)
Message-ID: <554fc371-f3cb-4c03-bb78-9fb5a06c2bc3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:11:50 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <anmbi_gXKslOw0bP@monoceros>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <anmbi_gXKslOw0bP@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX/nSqaGogMDPj
 kKCntgE6uEfXeqHm+s2bX/y7onMH3SK1EDbKnHIbZHphYd4qjsTS/TUREh+t5He+sf1HK4nvyqn
 j45RzonHNjaic0Sta+BZRIwYqg/U1Z4=
X-Proofpoint-GUID: gHXtWit9YCFk65Qh9PefNkVcLMjn2QSA
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7ec6c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qjwxEvNmO9gX62DwepMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzkZi3QgSu6oB
 ttWlZ4Fve4zckL40CXK5sf43n7ArVfM0Wk5oeLlMbgs6b0f7GgeioXZ5Q85CqFjhj1YrcOwkNbC
 fNSKlye4wbhLsAMU3nypS8WeLoBjaJypBChW2eGVqBMaa5hR+MNresDj2V3MYAiiq6WqxunrHC/
 cDPbUlXUOfWJ1dQspeGp4Q/QTOBYlZCEJ0KqdKd5IZAFDy/xtMxOmzYfNvmR1QYOeu0hhqo/+HS
 kUlB3LxrTuGgO+r6kPaJJ74LyLnbjZ72kPuFVR0H9eyNWi0VoS7m2/0R8fico3vKoQiu6nzQx5g
 iW2NGFOnaVmmsyppLbOolFLQwZbDzMPGXyf3hCeT48x9uy3ciGa7MjpBefNg17O09GH41hkwUrT
 pCDIOt6FzV0R5yKdcoBUUlXM+qWinX7m4VDUYLiwG4obryc14BqqZJK4NtVxtMsFnhp3vzXi4wK
 m5DB7mv+FOMWL87wmVQ==
X-Proofpoint-ORIG-GUID: gHXtWit9YCFk65Qh9PefNkVcLMjn2QSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/10/2026 3:07 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> +#include <linux/device.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide a definition for
> struct device_id and drop <linux/mod_devicetable.h>. The latter will go
> away soon.
>
> Best regards
> Uwe

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

