Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702024;
	b=N4Q9X8JyweYaZYDSDAWvoi/hhfD1RswaEkIncKsm9J/bwVGRR8BGIN3444pkCO5WuZIi
	 ciKeTZJdUkLldY/6JHdzplLKO4Sk/G5kUjkGxejpI+AELsDGRm0X6QiOtN5t8bUe+kZcV
	 Ey1dOVL8bfVSu+0pSeINoKcvfx09LcUQjxvVQazBA/Xi2yikHsWtSqyTwL+QIecjLvPnP
	 /ncDRO5DEQomWbe/PUlO6quTMD0Ea5q4nrQwRZvJ6vsHTTI2RASPoTdRsydz8wPUYhDsV
	 hsvu09wca2SuuXTgkVQI4daojCVcJUuAVPd8gv2r64fhA7ppAZRXAStNAyTXCNCfZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
	b=Rjf8dLQeioR+XBC+UgyTMs0VqXVUusCMemhxchzhyrNaiG+Q0WXpxCD1LO+MC83twWMO
	 xC0Z1sbo69xz2mmVRdwokgjo1HJerRf+NM5hL3YqdwKuWjFIGAG5Moevt4xhAFLNPPPqr
	 57xX/Bl13IDeWSIeqwSRnqRGsGrvx2KpYCeQFGFndbha/Fp9RMARqdMQYWhqp1mIhbkYr
	 pD2monKCOsuOA36q/Oo7IKlOpvu4tMWURZgO0NtPei/3GBt8gMMdIE5NgrttnwvIeyiqP
	 PTPwveoUMDthzSJJWWTb5gR/wEx2gZlmR7JxRzODoASXKKAXfL6ZpxVUlkx4vkUNfag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4A606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D4A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVO9N3277867
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=; b=Sw5kGqNwFaTKAS2L
	IZeVisiDBKK82mwemBnbAy81qlmiMN1AUImIrNYT8pIEECDfD2aeT8YbyKZClQBA
	YPFS1RIHxSQhwZU7QiDamzxat9Qis5zBBXWhy5Nel4I7GOepm+pL0a9nktatsEM1
	XQZY+WwB+gtFisxUW19/+B4nWWimQdJGjV5v+U4hDbes6QmjOR41MHBEISAFQa9s
	bLhJIwwTvK2lad0UlA7DHEyihXQKlAMKkpE6FnUOwUTssr6HoEZMPgQZoGSf1L+r
	ifwv/DD2adf39rK5CfjoZHc+o8ACMdFoTcLRQD6b2lkKGInx+YUM/BfV+Vz+zMU/
	B1JthQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g97hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e2ae86687so157345241.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702022; x=1796306822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=X3PNFDfVk4txNkaGXm8Ur1KS/Rr6/X4nwpcMwLVIkM5utJp45jZUoie9WC/Y3cMkqT
         CxSn7WN/irAy4s47D9aWm7PMsnnwui2W1mEg9dQhROoDKSWEFk9w5DZht7t/ftwXWBMx
         rzu9mf/m5CQRi2ebafUdOj4YuyE7BFfi7wzzCBs4BM04OLF0jeDy/flhl4d3LGgwN0t3
         Gg8HbLH2ShmjTvNYZHbvFkTYFOvJcpgR+79Mo6G3ZRyVeUJbNbXFaYtNKqTmdDsy8Kiy
         T2Py/fN15gKUXYH3Y+Zq+rOGE4WXPfBEkFN8eNj1B1kuB1qp+jzWBTJiLjlOtTL9f+/l
         pNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702022; x=1796306822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=wrOJgHH4VQymiGUPEx8/Ey2t7zIQ83Cf3uanFOUWFMSCUzNcEuGTUDQ8G4J6Aqjx3w
         F31kPYNjZ8ElHGJF/e4amynHYU/A7g0UKiZqdAo/bB2Fx1IGBkq9/N7+6p+VCY3GBd36
         iQWAvd1kAxVPM01BjiMFYbZxQ5+DRGK2nDPQZwzVhNX4umuNhL2FDqn3c8WNVNUnwHbK
         cPNF9mCZSaCrR/k5MHwzc6pFprq13FIjFvtr/22TDP6wFwSD2OxvDFSA1/0Typ8VoXUw
         AuxDXqWf+xFTKjdSWVgZX70Rg8jcVGkE5uAynf6EtoMEA4EccB3mIKPYs0EENbbgHUWW
         +8fg==
X-Forwarded-Encrypted: i=1; AL+hErG6RKeALrH3Cu2dndSFRzrK0uMy9GTzcdtBTmOQD03mG7p/h3GX8D296jJ9zixvka6ZOBDxiLV+61Pd@vger.kernel.org
X-Gm-Message-State: APuU4Z+FFsCtg5y3yQJ494JjwLlMieF+7oFpil0PjNDFtXQq1Y9Imy9W
	Vjm/EyTDh/edQfbNwSAHvrhdb3YqGvGrPmEg1FgOFEIG55RQ1Zh+eXl9zrd1U4i9D6BX/7APB2D
	EBLpF3xLIGth++b9EdcUGrrrTksPm1y3lO4EX7EEXBoOFsbhVnH1toazx8GdDsZLQqMV3LbSJ
X-Gm-Gg: AZFdTZfzEhRZjo2ujpmwEa5bQGu6CQwulfgf76ZPo8evL7OaLf1PXaO4+8LBAn9W0eF
	B8yG6QUzagsCKRSUC4diAgnIDWnQQhu1GkM3B7l5GeR6b3ceM95xe1zzM1EdzJNI6B1LIh/NARA
	ucYiCMEriLL4XZlcbuNoOvFVhYJWN0ot3vwGPUhpar03Wm27yp0WdSW6jYpwds64V0CPgHokNzB
	Np2/9+Zo8rZGJk5DPJT7rxV6gOw19Vn2lLe/uLnhrkARQWaJ0y04UrBsKGYhCCEmdUQfYefdTYu
	+HiwIJONq8uiONO8qj35SszJQxw+9G81PB6DAbpD7wVKC1QKDzb6KmkGLFjQlvPYpyDysNaqivU
	zeF7zUMKYb2go79qVbrP2cuPF95jJ1Y5tDnB3Udn8HHjQWFmG4zmZXQ+M2xOAb8YPwSI3VojYaI
	HibA450eg=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218598e0c.5.1795702021762;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218529e0c.5.1795702021169;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm364063685e9.4.2026.11.26.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:07:00 -0800 (PST)
Message-ID: <cbf38851-d20b-4242-95b8-28eac985d21b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:06:58 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qLZS3SwRDVejEvOhIPGxLO0-2dqm4lbN
X-Proofpoint-GUID: qLZS3SwRDVejEvOhIPGxLO0-2dqm4lbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX4hLa9kXJ0HGG
 bY88QwHMs4nPSBSNTOsoPMpPR/UesQPP7QFngyXC34qRAsM1Hv8D+BdhIL4/GgCPL8zX9thLajg
 rBhUertcBbgqcWYWrZD8b3g0LpfkjENaQRXRhZCZ5z7NxMfji5EisNgz50JtlByZm6U5SwlFJml
 OXf3/dz0ExETMm0NHrpA6N3JjZdAn/pmfFZD7hEA6BJhrzirSZ7GhejMuXGqZPoXCaZQjfKEyte
 wG4959BudZ0spgCJ6kVKOF5x48MXqtHWotMQLcCx7D/CNc96aMDwEh1K1KYiEJqzS5WZdzi9Trm
 xnKiDvNWJ93kqoCxA1PVFyb+sYKgE3bwLmgbBYCNlvxAY//KN1KXYRgVa/xy1aQLvN51FZx4NQV
 59BY5K8ILZZmyQHg73RXLVFPNvyPY+okcVZZQ3R6k6yMavi7P3vuSAmIPJE9WpTJ/RTxg3+rXH0
 fh4q0drBRoFB0TsXWww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXyUVicj00o6Mb
 yxQbyRi2duCqHPxSy2YXWV4MJHmWphfRqvADhapVhfbG5Ju0hX/yNHeIN1JEnHfpXylhymx6KDR
 142OLNGUb4Xi6Bp2UHe8zMrXkhCzErk=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b083d06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CjxXgO3LAAAA:8 a=XEbodZ_ldB3zFuGnKb0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055



On 23-Nov-26 17:03, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 35 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Please drop this comment

Feedback from an LLM with doc access:

- Add gp_mn on GPIO127 at mux 2.
- Add gp_pdm_mira on GPIO35, GPIO146 and GPIO147 at mux 2.
- Add gp_pdm_mirb on GPIO63 and GPIO72 at mux 2, and GPIO88
  at mux 4. Keep each mirror route under one function; do not
  create per-lane functions.
- Add RFFE0 on GPIO138/139 at mux 1, RFFE1 on GPIO140/141 at
  mux 1, and RFFE2 on GPIO142/143 at mux 1 (Konrad: maybe
  let's keep them all named rffe?)
- Add grfc on GPIO79/85 at mux 1, GPIO138-143 at mux 2,
  GPIO144/145 at mux 1, GPIO150/151 at mux 1, and GPIO152 at
  mux 2.
- Keep qup2_se5 on GPIO17 at mux 2 for function qup2_se5_l3.
  Add a distinct qup2_se5_l6 selector on GPIO17
  at mux 3.
- Keep qup1_se5_mirb on GPIO202/203 at mux 1 for functions
  qup1_se5_l0_mirb and qup1_se5_l1_mirb. Add distinct
  qup1_se5_l2_mirb on GPIO202 and qup1_se5_l3_mirb on GPIO203
  at mux 2.

Konrad
