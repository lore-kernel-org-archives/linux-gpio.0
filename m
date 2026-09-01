Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC4353A9C
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272254; cv=none; b=qqIN7/c86B3I9MWnOnDLPfr5GkeMPLv3PNdog/CfXg8Hbjr42MFE+t3v2b/TY3J7ydqJPZTGhltc/+ZA2rfvBojH3ww1B1M4WKyaUW5vj/+iG2S9xsFZBOS1Q4XywtQ0K7DCSpb51IwX8l0njwynkxAwpe6VX3lCQ0+L7LRPeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272254; c=relaxed/simple;
	bh=Ag+3Gxwth8scj4spb7kinR45PS61DL85tZPM3vUaGBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sicozFVV53ytmhDw2xS2lg57QbQzHcKAZw6IKn6/eAK3dAfZei6uWKLaFJyFyIJKW0Uk8cJkVSIhfBgz3GaIQpULlZe/DMT6//k/MWNQVRANENOuNOPaZWbsPnYJCYPbH931FGzGVfNLTd223i6WBxzJacmSZU5YMUZCxU8G7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfREpZUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gARul/1y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfREpZUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gARul/1y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8XIM3256375
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=; b=DfREpZUE17EnVXWt
	FsfvZnSl8y0oz3seSNn36W8vVQlcx9BmPZ1tbeB4g8+miJh8a5XEIDe8nAk/reWc
	eqPzvUE/CBhpFp1fBaeOR/mpbFjTDAVXfV3HTz2k5qUU6bhsG7dODoAkntR+7MuI
	myXv/LFolnqeGAWOUyidi7usccMXvaCVDj5laKJolcA4g9mK0dV1d/51akXLuPsS
	iM0GwsNfLfEG8TMMKnsAmvAime+DqCvyn3RMte8Q982wI3w7sssHbgwf0Fu/HZsg
	u15usGLKjh7u4OD7X/Zh+dPaPXaW9yyjU5e+I/H1WT4wO7PvFDdz9Sh04NrSqI2O
	gqW3pw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt0675-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 14:17:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e97e2b643so31942241.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272251; x=1788877051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=;
        b=gARul/1yDzZJa1BeKFug9rwx4JLcOfsRwAIVCUtk3W4OJP7X+a4p1ECJ39YvtTO8bK
         V3vuK2bFKAh7KblI6impfuZCXcEGEJcc5HiOxOLt1qnufNdvC7y2VAuYM6f7Wk+AqYeU
         IkOKwFYvQZt9jIaFUG73JYZk2vBy+p+OU4IzhgeoS61dNpGMJTU3uobqac1AY0t4fZjz
         1Zzm7HZrHf3TpFXnIPgtoMQONhkygy1krDfXaduMBEshqoPaT9AUc8GGuXlNOeZ8sNIt
         p4HB9InLwjHFjwMCVdVZLDNEevk6XisxxInNWaozT+mwo97BKMbIWocEgvMvSWHgTy1F
         /hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272251; x=1788877051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=;
        b=Ht4dSNVj0ZqKpN7WHKComt6rkiYEVzSZmeSRPZAd5HMCilDfKgVs8IrsgDTsu2UXKq
         R+PRg5sJsAKbOjtsbcRM+My2Qeu2/q0pcd4OWapFkFR+cyqWROgU9C+OJGFlZA7f07vU
         Icq+kR7Crn3AA9gXhpBhl2tsrfb0YNAtbBgRuYbR0N+prgMNkUnvyxQYftCaGZaios1M
         b6WYzoF23/KaT4a5pUHIRhU/JD++yNZXRL5j5RB5GVEQxshStXFs/tw1m1c2HfWMTtVd
         Eg1J0mDGceV+v6fqQkD2XnPYGWY0FVF0Rag2YwzaU38CAayJ3PNEJllrnOXrmmJqymLc
         d7fw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2a9h97VLYSDs2rH4+44ceg7WdHEeBGNEc7p0xEX697Wj8UmmJFAH9txVy2j6PQ56FlqYIqwHktJSV@vger.kernel.org
X-Gm-Message-State: AFuF++m6lLrI/walbEjlv3Xf8j7EDeiB4a9UoyoUFp8VJg6vGUjBKtet
	1IfACciaoANGvgh0IRc98jpZI/Lg1GHfIveQUuS4rmCOUX7BIHJ4o8zHY771G4x3yX1Czii/kP3
	LiQoqjqsO2TWNYpkYxr7qv0tgOwW0q/YdtQoqaF50Ylfj19k61oo+80TQ0H6NAutA
X-Gm-Gg: AR+sD13vwOYJDoZ+MwDFXh+IVYtTObRM9+gGiFX7obxXQfsmkZs7QVyRD2YW7Jk/b9L
	WmpwcwmYlOBzVV8irv9myZgWPmCwpsGmqU7SrWCrYcZiVO4xd/+m07Vx3KH2ydx9VpAJEVJn+jY
	e4HLo9sEQZJvcxNRTxjPffZoBMiAeLx0VcO17OOCwEj0Hl1Sts1cd1MS5mHx0Yqlm3KtoQ6l/nQ
	19PsMiAM32qBbrirzyPSBrZpfZX7u6i+QFZKdxKBJylM9mhz57v1MJPHk1PLlmb7jd/UYBke443
	yPxXNBYomVCVb+0Y8uN2xEottP6ztMrckFXfiaWLLyev9M6Pz6G+9pftz++dqS2OuqPySUcFbHL
	4ZTYZfqNppZRMqNdQbb9uzA==
X-Received: by 2002:a05:6122:c2d1:10b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c6814304b4mr4067451e0c.2.1788272251348;
        Tue, 01 Sep 2026 07:17:31 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d1:10b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c6814304b4mr4067408e0c.2.1788272250419;
        Tue, 01 Sep 2026 07:17:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm597611966b.22.2026.09.01.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:17:29 -0700 (PDT)
Message-ID: <a5702e89-d083-4dd6-859a-9a52faeebfd2@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow
 gpio-line-names
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfXww7FG3mmec9+
 axuUuo4gXiyKnW0lkI+Xvy5TgkDj7CQ06DvV2FTnP7B05eCXbJ6vhyihQTddoLCMjnd+pG/qRMj
 II8X0A75uzyUraaLwLRY2DFi9vxgfl8TD2Pu7eMZTDbVB7wRIrFH4M1o+9zICqwky1X+QwLNfmt
 ccuPGk/Z+tELuxkUAAXzwQeFxCRxZrNXXcAgUPZ+5GrP92WN2wxuM1uuyL+FRN0bhZYu+Q4wiCS
 9hStOnSlnS2Xo8/+tvwu8MJkW5ie6LFbcFP2qR98qW+s0iD9NNTIuP9+Di5C7Xe/eUPQYDHCF+E
 pE+mA6fLOZDeQsxXpCkrlItfManOg2i0fVglK7RA1G8nGEqSH2U91PYbmYdSVUKUrq0gNDaXUuP
 fgvZN5CKITyAYpt69zxvcHlNtIR2q87g2rVk2+moQWQh8vdWKiF4Nx4l18pw2HBVpPiq8HZ+MvI
 FpAzii5dPuf3XWof1YA==
X-Proofpoint-ORIG-GUID: nEKYtEc0e-GAbpbn-UQIO5bwZ6ox5kNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX7PkY8O/7FnVM
 w642zJ8UEeFIvhM8W8C8datyB6G39qK2MUAk99pEnqM9L/mPaJm5w6V5e2UYSr4ED4IxUH0pz7U
 FQjlpyJBLzlN6Ldu60Mjt5NGy94RUag=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96de7b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=hDogp9jCFjaJvwT77eQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: nEKYtEc0e-GAbpbn-UQIO5bwZ6ox5kNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010127

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The SC8280XP TLMM GPIO controller exposes 230 GPIO lines. Allow boards to
> provide descriptive names for these lines and constrain the list to the
> number of GPIOs exposed by the controller.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
