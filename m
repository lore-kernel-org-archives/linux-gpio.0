Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603847;
	b=z+kh/BBGG28aQg0jkO1VGIYhU1OzfGF9H4+9GDJac37JVJRrvKtqY9upmG92Imxr+s+6
	 wZsjC9fN0VMEAl0lKOcu2PP7s4uWiP9y+e6dY41pHB9EtQ4c4ICALTiqUlP24lziiRZYQ
	 HUGRAxxA6lnuriFEZ/kz9RDS1/J/95Q/PWuShSYmsuGw7Uqwc7zq4hSrqXuU6RNvvTYUO
	 UC6VjlurMW77qh3LW7fnrsCKqU9m63SrKyNqAuLMlzMswhFdZH+U9AdVx4HLP8v5Ogrr3
	 D2kjG4+XhJtvyuERuHb/eQcp6H7zkAPzCI8LqfvjDXnYf15Se2QKDi8W4DJSvHBb5ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
	b=aLCha//g3cwFTHSAjaS91c67tcR06Pbao/PNWHOaXnRnTjCD+lL/ZQ/ey9e/GhnvADxY
	 gqpDCunCZ1b2X8JGryyou5wj29tV4AcWUmzZfYsglsJU7VZGWz5k1EWvVPM0pNQ0eG/50
	 qoDOCG8UFIpvJ1jtQmRetYpSRoYpTcPfQkxGL57VA3eAGRHF2c0TiOWBZGpGrLMl+adps
	 wNN7SkY5I3XOO1buaGm0rF3HTM3ZAzZf1YaWbq53HSqXHln+7X7j84Gt4GkIG7idmWDbV
	 Cn/hn/HmwuG4qxQGogJtzAfh2ORgzZ5DmqPoO+RitDCdYDKd/XoDCmbjTcqQi5U23GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TdzD+GO/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1E606A332
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A1E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TdzD+GO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkG41505230
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=; b=TdzD+GO/kXtb5DDk
	iiQ8TAlSDmVWjIjqcfdRUXCclCB3/n6dN3v6J1wHiXZcKBIlGD0baCQlN+U8h/4Q
	DLM5iABHb5NAAG26K5wjYjAwLg+/V60Zu8OpYT4AXkyUGKP+XeRb/YRIrZPT+hqI
	LLRKGtSkpPhG0vZAvIkSGd8gqMZw0PV2j1iUyUt6WlwkUrsMx/B5/7wTSbdGrGug
	Z8p9OmqvJC3GS2f2AnRfdSsVuRwmeDmMYcJwiyNRKNsfgmzX0uebiPizxtoYwwck
	pGNByZ8epYMbMYsni8A2b8kM2rYLiLNzynfvCCQkK3Eka/E4c6+qmSSqcTKq4Dkf
	OBfbxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29u1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so18124751cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603845; x=1796208645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=VtW0JMYdhB4CPTEjJxalIy/04+DknY32XYeuFaddw2D45qYwslnM4VzxCXfVP7MXhi
         Qqj6rQScbCwOF8BP24mwvUA5Bf/uCPFDbuGYJJk/gR//dpOytfUiHQIN+u8KPmygDqzr
         ZbQhRuQB8lRPwwnpfHsfr/Nsoub0c2+/QTF7FD7ZHIhBhc0g7MCi3vO+CzVvf+dCTSzA
         1gyGsuM3gf+3CxOjkZXoDVwBUZDAuNsqkPF6+SrPpqw+bNR3u4VZti9gR59Qmt1D4JJl
         FaJJn6dYJHbJzFbXz5e0et6VLxV4sgdBa7rM39RTyN2HtCySm9uwX9ugtuU4FTZiX3fH
         oyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603845; x=1796208645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=vRcMP8dmaBw9rJ27Qu+1Q7uKxslHPHqkUdBpFtUPJDV3cImiY7PEPNhJqtWL2GawPp
         gYbhyMweUObEHbb3UtKWL0d7XhId4uQNOdFCOpmwMeDQaYMaYusddtbUu66fqPPWrW9V
         IaFceKsJV43XhHQoN3fww0qbWdXHz/NLrgbwSLidn6zItFseP2DCVmRzx2Sowm5VEQoA
         P4krTRLYBKyykr0J5N0TO+nHkbQOe1LP6ai3QswEJqkaMHDRq2vo7l1GUm5RfzXQZJ7S
         fFRMDURUgOHS0SCETF90ycA2QqdwiDTGMna3nODxW/NkZoj6AegbCUfcjxCoXdDuVGc0
         TMCA==
X-Forwarded-Encrypted: i=1; AL+hErH4elO9tJc4RwnKA+sCGGuUQNeYF0GBKDtN3DO8RmRh1Ntg3hacwwTEMa4LDrz2uN3Wsr+rHDgY36lj@vger.kernel.org
X-Gm-Message-State: APuU4Z8XDrDcubFh8D4zp28KYjhEP3RLJOptSPatxyjmaw+Ek/sIRDVP
	j9cu/noMe5Wvn96Q63KO2V8zu+uxghMbdTaL2ZJPjKyfyFzEkVD9thD0S0MqdQGJaEBmpESbeeX
	y7L8duLna0BlOsD83Q1YpSLw2ilbICx1HsVbn3lMUPojUSL2oy2c7o65gwPc43gYP
X-Gm-Gg: AZFdTZfUH/W18WGhwuGGMQs0fEhaGXOiVJ1o8mIcr0opAV44scbEf6TLVmfgRRIiGwC
	jGB5EYFWhc4gpK8Z32tiCfmXHEx0MsqcZNIglfkeTDOI1Y6IJhJ3TzfKbb/JaKZvycKSYp4PXwO
	/u+9/29NQDkuRLoH4cPpKbcifHQWoOrzdH476ou+QGcT+bgUCouKNRtBoduxaDxv+dW8mAAiDTs
	RQ/tQLO3r/0uuHVVNTSzwBtg2bPpWTx5cnsf6LbSQ+nMxJgduy7LqgsO035RjjYF+AlOTA2PRvo
	TcH2J/WKOOeISaWoyg+8NmnhvtK1ZcZVHIc4ZWu8otycR8z4VkSyQlpXPIDrCROzlnouw64399U
	xQO4R5rzrryAp11+lUHiIirM6SYvQsOF9PkIZ8Pl+K4a5SfSfTWu25zWokZRtblhcbGsppCo=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082471cf.5.1795603844975;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082051cf.5.1795603844557;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm617406766b.70.2026.11.25.02.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:43 -0800 (PST)
Message-ID: <2e7662c5-d025-4186-977a-a011a66c582a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:41 +0100
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
Subject: Re: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
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
 <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4X7u1iKpYjx44TudtAmAGZMXMBhst90z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX+7SKFnZLrH6d
 TamirqMw0xSQ7UD2fN2y9HI8QkflT5IjUZXRGsISOK6vHXVkEv+UH70/cShNh7ozW+sPG1NPrQZ
 tC+dytvrttM0CVhRTLA6shfKOO7qA68=
X-Proofpoint-GUID: 4X7u1iKpYjx44TudtAmAGZMXMBhst90z
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06bd85 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AUjckUqZSjTMZ1qE35IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXyNg6DVldcXjn
 kAKYdbmeCpNEmANgM0O2ZcylRDSZDsvrmz1QEQ8bQjEWfcaLxO2uK/QqaG23cmcKwL7ck6mbhMW
 3Bo/BbycuPV4V3uDaKvv8+3icwNi4rHLk7DAsN8Qa3KH/z52/ho74E+G9fM4EAJjnHhNHRZBtlA
 n8QnYRK6BQhgDSALw2ow8UK6VyfQ8VBm+sozrdcQFhTGxKvnxNIGnc4xK5S0OUNpeqEC2MqtPEL
 Q8XW8I5Y7BLASPBFMuHl+fk2ir8xQYGIq17CHHW9acWF39dIe12me5xeilwOx9zEt0rlwM1aP3q
 Bnmc9K2l2axnDmqgK4G3HOSGqbhAfBQBfE6exJIm5r1IchJYTclxnJR/4dupTmpaEyTAbGGc5UH
 5wC33JArcXvBZ55yckFmuhIZGblSfsu0vkXHaPpOSSiJxZ6j9lW4DSAQUxThJYcwMPGPW/OT7/Y
 IDDgb7EpDO35TFcgbWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the maili driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
