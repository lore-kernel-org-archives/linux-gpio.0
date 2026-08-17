Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE09431A37
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972852; cv=none; b=hNyfbbSyrQrszZk/ZZ5UACgadXIjx0oQrIaTCW9a21WZj+GbVlvOXafgb93ewQ7mdXtxr34ujiY3nAbcWyW3KBLlgcTc+2NTS54q0hAQkM4m4boSDh2KgJeIPkKVxJ/W3iBgtblNOETyONIkb17swbAYU5Jc3glEaYq2mEih244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972852; c=relaxed/simple;
	bh=jB9+En6C0wpuP3D8iuDZbNRYZSDkZeqCj5UjzMgKESs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiW+nuJUoT/pSrRzg1bo4vDOrGuJhGCvtfuheJgu56VateMxLBpXF4evRvK2E8q/MzOqtTM2/cTJKUxeob66Z3dwLVs2zkTZeT/+ZR6We3OjbE4J1NL+9T+5IOAVD959qQ9KEJuE8Bh6IAo6JwMf+LBmh96RAVrFIF9ZS/wPegA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAgyUF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Obyrx0w6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAgyUF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Obyrx0w6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD68Xk2749203
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=; b=iAgyUF+3adJhRbYC
	QGE5a7WprO0TC42n8ntx8pOcHns3jtk1c/RdvleDXLbxWyeuHEAWKExP26f3WpMJ
	8WuOH1KfektebBJ0kTeGsQJ5ahf08nQBKQzCk4z3gqQSwk9cRXKjC7oB91OGLH8M
	YM/UgjtyiBWXxv/Cu5nUZysGxtMMICPBVUFddbegHqK5WQ9KdrHVFh0VVx/0xTZA
	DjIKyaG5poFrRzlkliOuPRsGw774QCZE7UYLui+fuPYutBSkG+F9WwJO4RjJln8h
	ghPjnO0h5P5jBGbWi4d+4dfFNeMs6yg3HsvqVkKFqsy79AUYn1Bxh/nHI8SNgU4v
	nW9NqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7790gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d35a38fafso2781291cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972848; x=1787577648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=Obyrx0w6MesthIQ6rULf71kIpTq4MGgqisZyPlTF/ZadMaXVyhco1FV762gQEvxHNs
         RTKS+sdTTt9fMnGsElkCU1YAq0FK02KQROINlAFg9pmGXJcEYjnFZOq6MU3wLSsgBkDS
         AKzo63HNcdomf6N4JqGZwg+HkJcRWZoonphzbBDg1kkS00+MZo8IoLCE1PhNwy9Sf5VL
         YvNe5ebqSdkXVvUZGcDmREwWbgSI55vhOX3MM+YsoVDTYvd9fxmFsisBc3YLmL3M6oTV
         P8UsgrcbOhEyUmZYQ+xLdomKPfacbMn/ng9v3S2cLbirbtzRn7xHTrtBLuR3G9QcHT7Z
         NJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972848; x=1787577648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=cBmGnIZRR+nAExJ52zDS+DZ/+3uUeKRFrzEN0Zymmn8K+dhoNWuZ5z0EDzVKHysbGw
         Iqf4kfzc/TaX2Uu52CMIi/jSw78rLoAu3LuacyPeEtDox9dQ+gOdDZiKuKCSiap7G5cR
         j7OIjnktzrHw2/uVygFTbtrkhwwhrn8Q1gcVGtcM7M8ILu7FfEsfnRJJjBDvzTwrUcAW
         1OGaFYrRnEkwMkWEWn6zObsR8R9fV5bvg+U5BtRTaL2nKWLH7V+NoMIlwJBsyGZ67sSW
         xKUQlrq4YZTt+0sLb7qlTdcW6l3euJQRMHU1l4sk4wmI4Gp9Jq4Mhm+PJIXh76gLTQo1
         dc7A==
X-Forwarded-Encrypted: i=1; AHgh+RrqSlGq4EKcrY2kPpOWiUSJBstV780ZWJTyb9xYvt7P/7heFm0W6jQVy/lxTXLERhe9IiPG/dUcTSzh@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHXtICp5GyEennlgjYrCFIV2l8LWBaCtwIRr+hNDyC4Gh0ItD
	+sTJez4+oSPr1eRT21LrSZPq6Y4a33JF/76frCVXqMjc3BPODNTOGVkn/srTPQFjzNJf+F3GPrM
	6g9v4i9/oNgbPOA5R7nZiqhwW2FK7u1OrBjlMPbUbiNjlKTazJUtRcAg83Dvf5YbT
X-Gm-Gg: AR+sD13eFCqMOtTaL0k4E6cz6/kE4tSu3/Iclc2vtM7SJSyFRgcWsZE1aWeBZZPHuuQ
	v0K76851LBYwHr9PoVx7isAMM7iiwTuP/UiFFjodvDVe3VsGLGggBabLyEkurKV0yRGyWRp199Z
	XGUlUO4eYaUNczWlbRuobV+uUCwmED+eFfsjqrmyG2SnTKSZnrbi2JPPIDW/KtLlzSWIvqYSZL9
	cJO88BE1uDuuX23Nz6hb5hmRns+ZUXlt1+LnuEtxS8Uh2KxLqOlNz3SzhaAr0gI+nlk6Tho2W9w
	MbM389s0GAPVOIKj0Ap5JsU6qEUOhKPbsHH8VYmx6xCXH1gOG/ktelWMk6K0+sVCmBLthGB54Ca
	GTA1MwliGP2aNOMKtPnCw5Chf
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197811cf.1.1786972847662;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197221cf.1.1786972847102;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
Message-ID: <a7a7257b-b1df-41d6-bfb9-9496f00bb25b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX5Jd8Y7nhfXyQ
 8zG6byp+iWZqZ7ruIrTiRKPMp2ft5P4eUEeFOTYdO9/r0mn9g/SvudnF6qaMD6oJ0ZHwo1L8BXY
 J65i6HRa9HFvRvPwR3ZClRpAWCniGRMEZN3ys7EBuqkGaD0plzf+dnUNbGamq8SH87GX4QEbyEX
 msLlSxAWb1RXN4iCYZFnOl1WUS1vrlELoRe4WKNO5ls62fhegUlcW9RCDoFj+idhgSP7S7ZtNsK
 FTRmmuLOA06ZOCFGx//b683ZeYs9tzQLmbYPCljG/PSuhC8sYL5jktRGH6wcv3P/bcCngVO72nx
 pbLil0uM2mAeXZngUZVWbNBhs/Iz9W4IGHWYvGxgY63Yp8wX5xKRY06+57UlVqvELj4jfjF6163
 Qe90gzv7LYVBKXUXl9/BavW70u58+Ek2j/fpNGGk/WWwkXfi1AO1i8R+f1Flq65MUfDPeFyTfZD
 PNH89ZIOg+VAtYmhi8g==
X-Proofpoint-ORIG-GUID: hmwdWNp6QcZJI26bDamWlaV1Jhn9B80_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXxtBypphnpXb8
 wNchkUFcIjD0JKP6KrIV9xyBS7lHHzXC/5MOKj8MCOHzQ3/UqNOpXFcfuSEeEaLsmvnLXsH6ZKb
 UNHmP4bUbLvsaXk0kEbEjn32yXvesIM=
X-Proofpoint-GUID: hmwdWNp6QcZJI26bDamWlaV1Jhn9B80_
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a830ab0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
