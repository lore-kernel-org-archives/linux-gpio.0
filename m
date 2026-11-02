Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617268;
	b=SUQBfV64jq62KtrO+4ItpW0n697ubmw3eK7qQLBbIoAAWevdl5QWbkt/MexzY2tlZO0k
	 hklRwfmq1M1hkxtkctxHtj2DN9M3cBcVBKwsCWITirloFe6QgRx8nV5kevDkCdDhugMEq
	 qMGAdpHkYvl5rgMsFTnpyB8HuP9+5TQN0GZgEy6zE8EC9B/ETDb/ItwQzOu4QY0zwRd6F
	 CfHn1xVHa8yrtVUGuS9tEt9HU2zvLxgIxAFI9Ec+S2jy2D1iEA3vgc1hHwsngwguXlhg/
	 cyZko5GPfUec/zMoHZjE4sR9BmPeyUYD3UCBzsDiKMhpELlcWJI4quMTwGkSaQlB2xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
	b=wgYjCJeSkRSjg36VFbZjcjHI+f9Dglo1+nU4eUl5m0pycVNVimhywSY15UL6UhDYkY3o
	 0Ip7ATG04OHd1CfoUGsVL/N/s6gch13/P5J9hz2DTIIPD4plL/DOV2MiNB1a4yv8lScqc
	 VlmWi/iKynOOebraqYxKiEO3tZ6sx96iTcapRxbxV/68glRJ/tSufhO6sxfJpbjytzwmX
	 2IEXvHNyjobe1CVU11tdm2n5Te97WrMQ7/mSnN0vR9AklcmXlFsWkzCiRS/cnGVosp6gi
	 7D4d6VloLkcMesBgfrojVfBEIz2SKR7+aZdBOnrwqpnr+X+UC6GHzhqprr3E2Py1fGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Td/GvzRq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AB9606A33A
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 11:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82AB9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Td/GvzRq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AeCK3440643
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=; b=VXwguMPStlKTKDs/
	RJCUy0czi/rIxTpAeFen7Tn/Ch7F/g/ZwWvzOi6jpTBdRUXVC68vwzvw8TYshZtP
	b9rTkENozyhWn3s0RpEqigKuiTrRhJyw4wh//6cOS0OtlZhyOb/mmZqz6PAJx5Fl
	SGSpAFjHJT4Ma96omIX/O7ta52bffIU9lNIYwo8y6z6w+hOkSBIrfxpqlbQslukP
	gz+ZNsDFDvdKbN0QdyyH0vHSBRu43moVt6op0bBEohnRCXyYSYVsKpwNrxIi+lhh
	4e1mpU4/0yJTFKw1ONMq5G6UaLgF5hR+VWdFuLx+LoTQ1YBxrLgXzy3P3duCvlhi
	8mCdCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg2020jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 11:01:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso48154185a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617266; x=1794222066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=Td/GvzRqUG4glI1UuvVhA5WKdMB2lw5J+QHOz60x0EHTJS9BECRKdd7BM3MdaXpqrE
         2WgQgMN1i2gn6fODHlaM/2shGvWZT2I5HDKIwSW3sVPdF/E2BfXBWRFvGnfleBO1xGys
         Mf6IdYWo3IuGZHM9NChEa2TjW/zqDJTiqfS3HW+gGQO4TSgbBX9j3nV0GT6HCyiAGX17
         +EKe400tqYJOF6aKxEiZ9k96VM4j6TeITHmbcm/V+2S4RqtJNAGuJ7AWaRMOdkkpqTJm
         0vGiYbmzyx+1YPgxwSPkBU4YWWEvCUYyX6PBbX4IW3AyhLJihwqREjDfsyIMCzMfugtH
         1xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617266; x=1794222066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=k5v2N8oa+Mir7MdHAlA7NYvm7yUjlisPN49R9FpWcKKptGlvJRmceZNIkw+kH6Og/c
         BzvQwg3ADS+6L1yiVeSm6Ul6jMySH+Ulhm9SUzvWuHKwsheStjr9K+MMIfzIMnmontNu
         IhcBGwaQnY6txrkwrqNLv4zSljjzDpVxVnHTZ6N1X/gsljJSFZjRWFJE1mrN3oYp0/9h
         vli2+VWNSVkvkGjOkSvQ3xDbepWd9Y6XHypIR4rKbW6g+Fh6xmBUQ8PRe9ncYzFkn0lH
         UumCJZLJeE4MayIFuM+0gGhpoBvoLm4ILDG5bngssXJ/xZ+uz1zctbd+AlyIYuTjykgX
         siwA==
X-Forwarded-Encrypted: i=1; AKwUvBzM9MgvaseeQ4jITv6LU6mywepZ7cWjRAajukea0SsEoIZAMc0GaAPhcgHRzOwd8YbksT9e+K5FmNYN@vger.kernel.org
X-Gm-Message-State: AFq9FYJOPH9SITyzu0iiBRS+d7b/Y94rZPqh+8ZK8ga5gE2l+49o0kuc
	nDkzCzBQzYDTHo5+88xpcgZPZ8MSOeYbp/qMWcgxUPynxGva1CdzpYBCm2xipXAzvKcpUvkmmmK
	O9000F222OHbzV+NqknSH/N7ns+gDKPu8vqRkwitnM2IXvYBEiv7D66+plCwBWUaI
X-Gm-Gg: AYBFou2GI//lvpl5W4UUnPA029zzPydAftEJn97H8qavJf/u4STibJS7oNX6tirry84
	TMiQbce0OMX+B8c11eVyDeGQD/DBOjVpVfxYL3OWntqtn0gump4DY+IknV7ceV2Gw3T0Qiaacx7
	u7VlA/9uTH10hvixW5yLeLRkBLl/FXCG5T/bxo2x7TzhfODtvEa90JfT0tNsHfgD9l/xJwCbGQO
	jfI62CBNUsVNMuZBsU83f8Yf/p4XlG63CqzdvgE2zxNjzb9wSM5A8pkvSC/PpzDhBXote4xnhWe
	zfRph8gruW55tdAn5hKyPjdXiJGqX3ZDrF7sryNlJ81w1HYZECLIIjsiRKTRQFXHUNnGbrGXyyK
	uO3aoAIEM1H2xNZJ1zDJjmIbW/FK0nu2hKJcXBOVflfSrF1SG1Uic/xMnjK/Nym80ffgYq9M=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674242985a.1.1793617265875;
        Mon, 02 Nov 2026 03:01:05 -0800 (PST)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674193085a.1.1793617260644;
        Mon, 02 Nov 2026 03:01:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3157671a12.15.2026.11.02.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:00:59 -0800 (PST)
Message-ID: <b20d98d0-566c-406e-918a-730eeb21fe25@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:00:57 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1irDC8ZPOCsgFuSrQrSy76zFi2BPNOUh
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae86d72 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=chyuMTtChKMO7gno4G8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1irDC8ZPOCsgFuSrQrSy76zFi2BPNOUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX9RmZdIC6A2hj
 bYDsCLjd4gTlofUNghbPioNC3NFQCHZT2W1nfU4aA9kWoizdHvA2jLRlypYPqKTQ6PBrKX2sJ06
 lWHZofpZwkhHGLSmDZ/oaoZ2WoeEPER3v5OBUJM145x+ex7w7KkpzHCzQRAU4NLP1dVyWkycd0I
 /CO1ewD/CwQLlUFB4L0lvPhxGU6fDEFofEdzFYP4Vml+bjDMYFHizq4vxFB5tTh5mKF9fqK6s5p
 lLYHcE8KO1pIWxY1TIU+QdfgeNxk5Na0crynYpxitkgp4+nzp22hWH+BRu0ECtYrd4Mm5G9vxtV
 1nqe9NtTT8s95L34dX//8C64imEzJqNN+9K/BtmFwa3vUAbTKVwLznDSIfoZej0pbmNLNBn8TIA
 pG+kczdg8KS6vWiWAHcvIGKPCJ2aTUzhX2D8RM2mNKk1k572y6uZVuwlCq8nrk+ouTg6N2cjhnY
 wQLD2JSQM4Ota8R6K/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXyc9FbZ6Bgrfz
 +ubbLP4PLC59znEToEUY2IDNhlPTkyLvjKrbvkgyBYd1Z4QERyi8L1vnahW8Qf7BpirMVecOX7z
 ze1WnSD4ESdVE4uhvw1uONNxyH/W6gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 11/1/26 11:00 AM, Suraj Sonawane wrote:
> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
> 
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
> 
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
> 
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index a61df10d4..278d5fac8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -34,6 +34,7 @@ enum lpass_lpi_functions {
>  	LPI_MUX_swr_tx_data,
>  	LPI_MUX_wsa_swr_clk,
>  	LPI_MUX_wsa_swr_data,
> +	LPI_MUX_ext_mclk1_c,

This name happens to match the kodiak hw specification too

FWIW you need to update the dt-bindings to accomodate it

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
