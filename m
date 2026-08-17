Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97342587A
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973094; cv=none; b=qHidwdRNozXCX44UXHy6xSzKUAW7DtMvQzudZ+/EZRcPprpy92JAb0dBCFwnt8L/d+KZywS3SW7aYjaBWJWV4C3npWln4cjUxjRBT/jVcvzezR8ji0ednzu9Ij9EfoOD5FC4a72yAulFuGmyhZTyV6uh7fYjWh9z8uG4Vwrft7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973094; c=relaxed/simple;
	bh=F1GSXwfyenJO1Pubr31ZUbjndWp9oS4SeHv8I9RZGlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgaiQ5duBfE+JZ7kcvP052UbBhSy3gMtYwnc8YY346Bvk6/tO5eQ6l0VZdnlGw/EjL/m/36N8Vu8JHfdRFHHHD1TrRyCuXv3pc6ADxmCx7xMajiNGaHdOTj2utvfToLfbSfxyibngi1oxwpjJO/IjCtlR7BnmtRIk1RlYMDDj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA87aj+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOEPzJnA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA87aj+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOEPzJnA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6JdQ2431661
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=iA87aj+Z9SmKi8be
	luOzuB6NnY9KfUCiUofqNM0EyXl+NG2Tiej+CVCma3IAxAdFwTpVtRxaQJ0c9JF8
	WAQ6SylQLt2BXfX8Z8/avmXtOPgz4WaquOX3tNzvy5yyQ2uj37DsxZip/6TvoiFx
	MgEW7f8sQkPF235TI+A4kG/Fhm5dYEAtfP0ZpP30Y0PKU3OqHOa/u+yK4rnTJOKc
	4tEIMNeykXFVa4tjCGmaT1E/pcbGoMvLsdvFy2OMSeUyFuSq0IJ2aWExG9JiWZsB
	hkXk+l8FOq85mXyGNHAOzsqK/GT0P4sTB+fiAGJ3KoPnyMQN98T6c0UdlSFBw6Px
	dm4TdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrehd5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:24:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso4191461cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973092; x=1787577892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=TOEPzJnAavvjVaqUALAkqCuG87TaQ0yB9FekfvlX3jcsozXQWeaH1YLfsENRP35D0U
         hN1y0s1FGv6VuKSPh+KnZ5TW2E+8pViTgNfFCz/p1calJFEwDVFzYLeIhr53I5aNHfYy
         C88dlTbD3XR7kvX+h3fP8fNLmtB7uswIvn+/j0/zX2p9nkW2wooM2khd1isRhwozSM6B
         GKoGHxr6HwvsqJAznULFVLkAwppB6wq44JlG7Uf7sbdLFcg1qQBzkumb4GIzkhddES/O
         jp7S3Idw7VzTFyEU20Mef2bPgFm0k++xbYSYlNynkNNcR+APzFlc+weSmJRO/1H1P/LI
         KORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973092; x=1787577892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=RsZovbF+Hodfgx5JIZ0p44O3v+DVn2nlkXNMVaAbCYXo57P1eGR+mLmR2UOjRSc+yk
         O0tbMckMIIzjMPJiGBS/NzunvDoF0aVZ37cijegW/OQe8f/ZHARWDHN4fWUdWiGmKsQv
         ey0Gtx23UsRjexjB5EfN2PNCleKrnp9MXdu1Ua8QXcwz2KpN0jaWNEaj+/ADwoYo8Cvi
         2HvDyvSTqnjI96z500H0jbuzlikk8nFc4mumpG+MVxFW9GJyVXzs+ePypktiwyr66XUQ
         YonskzURQBG8mL4ggJD5K0HGODsY182JIAeyPbpKDrTeJ2isqtLZ/JCIYA/ywPG4EQhr
         +RxA==
X-Forwarded-Encrypted: i=1; AHgh+RqRbVM/jjz8ZKqVlHBw2tF0nRLOaecRsVs4jndlKYtio8dcEWLMhHTbyw3PQa+abtZ9CFs3uleNjyXV@vger.kernel.org
X-Gm-Message-State: AOJu0YwPoVZGjkPEtVHfXsEi60vGotFVbGLYAtxzZgu0Nji8zXsJWw+z
	z2OWEbetdkDRL4Hn0SGTS8UGM7g1bgsgEcW1OLshURoyGzX/QumBLPUxOjnSNPA8euRoZLGjp4E
	h8K97OQkiMkREi3rDJJjol61VIFrgBQ2QTukAY93MK/0yAluuXUzCDVi55Nb1vy9p
X-Gm-Gg: AR+sD13sOY1/LF9ukFbLoMiclHGSpF/lhx27h+NRWWrEfmAZByvN+/Cez32bgo+Vu7k
	KJv3cvlOjN2XR5NX+waJjk6BS4XflbsQ3psaB6WwgLYIqAlfA3F1WeUOx5jyffYAqoAv27qgmv/
	VjM2amv4ha8Tn8cigtfw7+OOAi9htCw4201cPSoJay6EjLLosKamuwEbUJyM9YWR1DYOJime9Ky
	JRTd8BxpwFgYO+6jhIYOlmdJO2OyeEqt8YJyWbXswOtSsnfiJsLK3aHn16SlnZxYrh0erMbaHhs
	Mf6kFyq42viYy45cgA2ukquex5ud5kQTKrehwJjnlS9hEXHJTios7/At/2EHDx9ghqv/IrFCd2h
	uVRGH6h46+ucouS1Nucygok1j
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953941cf.1.1786973091571;
        Mon, 17 Aug 2026 06:24:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953141cf.1.1786973090323;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66a7sm26799466b.59.2026.08.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:24:49 -0700 (PDT)
Message-ID: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:24:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
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
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a830ba4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T0MoUWMXW-0JYzzGwAoNSHS2InEgy9VD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX32L5bml5dWCz
 yQ3t0TQK03WHtNCFiro1uUcPjsA7i0m/RkIWuj0yJacg7VWx/sG5HB0egBAyV81fla5wUQYtD5r
 hWcuYR8wycDuDXk5lEP3ID4P+7PJnSKo0fjXPSUoQ54T2FzazzvBm7ydXED7ai9EPBvsE2ZrZyv
 69X0v/kAc3j65UtDYZYOd6QQnbpAvgbKxFdHcfOGspLXiafxIoPtpM294MmhASn5ZIxw7clLcPA
 YcDqsFv3XOckk0VshxGtiDArYBPRmtMZGsVdS+0ePG99laUIWjTE2NmeTKRypV3WXYS7X+RpNDi
 VtkCs3FlevwozSuFUdhkJWJ27hlUf46J3qpG69H/k7SZ2WnS0VFG5oV2H62Dtu58KocSG5bGP2o
 36NCDsx/tbOdQqdjRx7HlWNvc4Q8QFvvjZlxI7LH3YuTHvWwv8qM6eRPP77G4kDS4Jnbo7sVaAT
 xcasR5rNy4Yl7+AKI8g==
X-Proofpoint-GUID: T0MoUWMXW-0JYzzGwAoNSHS2InEgy9VD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX3ONPcy0tDGuC
 t5h1Rhooce1ED5Deg0Z7f7IS6Ho1w+HBF3eTX6fMtB+7RHPW/l0b6WNewouokGPLDf+JQsacul2
 +8HanDSa7yKDdQOzSwgLdYth3onS6JA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),

Function3 can't be selected because of repeating names

In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
Perhaps there was a longer name that got truncated?

Konrad
