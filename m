Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603832;
	b=d1lPKe8sL0M12vJsybPRb3Mb4zSHzN8SuBK7WmddSVHe3cwnj1EORLMpVyFUyK90mbnx
	 TEA6jcwwbA/7C/wD4ZJsZa0j/nZ70lsh3BRZKSnVOlfDVfi1io1JibEBNu7XzONUd79LX
	 lyOJuWABZyGGjO6UK5oG1Q05Pe7dmMkcfb+97d4n+JNryaGbKSZ3NsWJMkNDALWEvCFTj
	 lgpy2yjwzdreNF+S5hb1Zb2yZlQgFgDyTpDD/5Cphl/q37Ca+1p1StTku0gj7eeEZ8hba
	 6FI6gZt4T+Ek9aUVoFgUz+eHIer81U1fzxJGmvsDUZSURZ5lOAJs6tUy0PbblpmAepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
	b=syYRD7DwYrDivjAYUKyDNrhckQVqNyoktVVxCOoR/GJqMgo3K3GXEBS928ETwH/81KXX
	 p28ZSKIAuWaaoCALhg0weLSwPJNCvKEESTdgftfR4yFKdBC8QUZ+E6hzEAfDyqRqxnpUB
	 NLZ0ulury1eKTkkrRWpSsDne15whua1yMHCHNvhBDeOA3RzVEkCNWKTcveVgwRQeOaIvn
	 yGyKHZH2uJsK8tereueGKuzgGLqHZteLb3yKxjLhCMbhkCMZTvxt1dK6JXRMN8oEYmVeP
	 Jm9epkg1xU3ORq0pSs/zHLq4RDKUxHuHla1p0qPGImabxyeTbZXy6LIXCP/HMh+0VjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2BB606A321
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nlC31505248
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=; b=hB61JRxsX8FfHAST
	nuSPnLvl/Et3RzhY+S4vtXxPMVhGcfRM9gxNBzVh8Dfzlr8h0SRTSidsxj1waO8F
	C1kSl/KaEAkH8b647LMM19KRWKt6HevMM4krRmiTi8/9OBaqt7utSEoOWwGR55DB
	+cjFuwYw8MdfLTc2zWSnQ4NBpT6DMfYWMkd7fqYTnG0DiFNCFJrsb51+fVzB81Tx
	LvPLx6yZbUWAROHQY7VVdx0sHBEO0duTTP/xHqHURPR0PGyNnK03rU33xBS9DG9H
	q+D3lnCeQTn6wIC+tj2MRcvKCva8ETJNDIhSsdTwdoEBzCMiEpe7vqJaTcHkgfuw
	SerH9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29tyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16937661cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603831; x=1796208631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=AGH2n7NdMuiGVTSYiR4Jhxlk59jv+RnDvlqYX+oMK2Ck8/DP9+TxulgLgzlMgPzSu/
         3mOdUqNca/XWR/+byDAYi1Ku6LmbiZV/HKxoPYvGDGubzCzBZq4DMbv0QP9DHm0ebHgC
         JJM3ryS/1qwdw+UkGKzo4qxe7jk1vk1mc8f0o/5u+dP1NMIuY9FvcbVOHKK7F3YbVxu4
         VbJPuJzr+bLCZ4bi/tHcSGvnkBmzbSNp8mkd7dviMXD7oPSWbMALdjva304WfVoBgjNe
         ovv0T6kAmhelOb92YXItPuy/9Jl7Ge/N8trDwC0I4cFPDi2mbtM9h68vlcRidgzfZQM7
         35sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603831; x=1796208631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=zSAWAygLef37ZMi74Etwz2f4G20+ATronTpKQ83G2F4SKhE3QFnLuECgYEaZDzPy3Y
         OyytIYcLVsuFSBl4kE78GBDM7UIcTKWX/2dhaFlyI+4X9Vq3FEemUpJsIKVHnlXYNVql
         xYdfeGTgYqh6gQTNqCcEF1hnGXMp5uRFs3ddrfmWD6UQDjDNaAf8ynKxYzxIW5K85SEl
         HRL5RRu4AWjKCepmLtFyhrZFu7OK+spSxdtZUuFOwvsl1wkHty0iUaS/5HE62kLFGCo/
         jJ0k46yUEvp+lHkPIhuOFbhSwgYHNleWxyylTCm0QKYqa4grWjYZSaWpJ37oj2iu5wai
         vjQg==
X-Forwarded-Encrypted: i=1; AL+hErH5TmB1bNchWEpG3tTVb3vTh9ylyWUEzOASMKTAOUzwqwarBIpoAPSzAaGohFj2d7t7YdbVsMA3Xe5R@vger.kernel.org
X-Gm-Message-State: APuU4Z/wQdn/02jkxkkXjfOC/lInz3eOVTGtngmrVVezCjmVbkjqFgvL
	Mk6yhW8mvEZlIPrce/AEtxpXusAAfmqHkIknDhXW1+iAvdpFtub8mGFIfoXwhTKtviTO8Ccm3n+
	h9ofgll7yaKe3z6/W6mgHIZ8CzrH1poWjMLPOJBtolonO+GLWJGJPcR5eNSceEMzK
X-Gm-Gg: AZFdTZc1akJa07k3H2PUTK984Eza4+RtcUrubBB0fyQ3CsUcqJAZuX1WyWwJmabxOyk
	8Cq853aTshXal8v33YVyg0wcE/qVWP3CJUeyIBR+XM6Gz2V1WZ4KM56HWGmPsDSdE+wSAiDKsDK
	y3u5LZyeNGnmcOGyFnLHFj14IiL5JjuFsbvDdrZGwKTSGIFRXtLGV+6+lXIBICUozQxgYIKadB3
	Ij0rXCGt4ENYlzV8wNphxamRFzhlfo4a/W3tPb2zsjCdizaQTJ8HidWNnOOoxIbP7GxAuGbtJrb
	crlfWEGZrl/+qsdxSvgnM0Dz39AIyD6QYIofgCrJQr80qk6BSNzgtp0dYc1YRReByNlG58jjBI8
	B37ZdsuE8qBRIuNV/Abf81pNjor18LtPFj8NNHEGOeTvgzjPVWpOPJFV+RoEAxwaLiUbY1Rg=
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312121191cf.4.1795603830697;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312120901cf.4.1795603830306;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:29 -0800 (PST)
Message-ID: <25cb1a07-b334-49ea-9259-04c25459e8c8@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:27 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TuXqsykhiY2iR_5mB2Al7Rt4lyOWIyai
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX+wIgjhHfyGpL
 gGGr5PLWY65TCw8UWBhWs11CdDedTbYnc/cBDFZmw7RX3MePzNo60razR7RcSOgM8bp5HMgp6tf
 mfpCDBJg8hZiM8VBDM/fPpBHlTgqLVA=
X-Proofpoint-GUID: TuXqsykhiY2iR_5mB2Al7Rt4lyOWIyai
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06bd77 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sghjjhV7bxI5PrJzascA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX4L1IFIYEPn9s
 lXztlEGkzwNrQrPfX23+ZQIqH+3VIsbbOSA61+8UCyhd7hXUrZbJ+iUc9aMDoRKSlLdqPwGayC7
 tJjPnOq0D7RQkNRffsUNhwbqPpgSKAjVQ9auZlu16Qu07ECqpN8qI7CH9CStutmER+CAXbXRhU0
 TBh2cfLqvFKLjwtUApC00hUnpuRowjBJzW0UK+BoLDC+MrAOF26jSmGiQrhVfx5jj2cpX45csGy
 V6ylc4PWRr/1l2zH3WumwQa4ZQ3F5ZpKetB+AiLEJkML7b62BzQgifOV1aa6glUtD9jOZg1pULj
 zp/+Ne6gr70YrcuAVAfAQ2rZwV8OtarZrWbjMeyl5jDA+K5iqoBnNSwQX/+AX7bLK14fBibBhhO
 jjm3kYL2gAgqlTWl6ASP8sSZcycA47zm3SLj/fG7RJiEZd5JfEGfbsmh5rzqA9BlOxIyOeadtuY
 rFRhylvJC0d5Ul3OcbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the eliza driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

