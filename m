Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E242E8CB
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972917; cv=none; b=nRCePha6V7ccsNyVThGPpy3Wdhj2V09wR7lolsMUxhO3PCY9Znm94jhEiPY3F0LzQxSbUcGXDWPpPZj2wZhX69tp53rkm7idfoI5mYm/LtYXCin1JNNgFxV+pjBGi/8BVw4vqTmvXOxoH2RKWFpQUfcothwTxV38OguLjYkI+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972917; c=relaxed/simple;
	bh=NDGPWt+D2ZXDyHyMBO6JKFeHYSXg9EA5515WHJ+RyIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIdrsQHaF+gKL8heKxWJbZgyD87YhS+k8zknSsQe3d1qm6beS/C30N80odpFBQkjblNFLa7pNnit1h7pu6UQQ3WxHJ1lkKBM05kILeuzv2hFPCWmAWEH5fTbpI1VzK7Sn04Vej7Z//6UUdOnCvWoo3Dq5xIaTa6Ku4gVZrjFqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilduPxHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ0jrZII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilduPxHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ0jrZII"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6C981193619
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=; b=ilduPxHA0sBskZxW
	F72jyL5bIcSb5+4/z+0L7B/VrXJicmILlzbC6JdOK0E7qHK5yAPBSau8eYsJA4DI
	rpFbzunOHevAcun0cqaS1ZqfL6yeDkz/MoM/J4feC3TQEBmdA9BxXcCRmcg68JU8
	mpIh5pr5/AnbvwClxq7h+OA76TpRFXe7AesWUliQEIwLb5feV8eIQNNigEVZ8ivZ
	uexvATzARclHEnZPExaRrmhZubBBR34AWW26tG/p8WxEsRN5ai28/1j2nLa8Zy5g
	H+5HC+SmJg2N33E53LcDZB1WoRMFHTxFNtwqjrTgGYf2UbvwQnl7xQaL0i3Ndu5J
	B2YXHA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1eju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:21:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c2af3df365so44397e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972914; x=1787577714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=EJ0jrZIIGohJ+19y5ZCvaCQh4N1xlig/rimrvXM1I6HylAmQ+xNbAfvuzc7SLtnvsP
         oVnageqgtr7D1rbFQsS9HEedlBxTV1GJMgsLlPm5mGFDvIueMUOIakwjE0v8kCBKoYWl
         Bdd2z81Af/u9MiV7animnlqZmF5Dv+/gBLFwtUoiINJNqH1B0ktVI0k6UTu9r2OZMnSK
         4dexwIgV60cE9nQg8Smw2xHduIorXH+1yHGN5F9abhogdYuHqu8BxeLFIsZ2J5bcQBMA
         XybFZX2w1S++rFNxW9AlFrDIRdXbw3MojBhEU4ghGeEGUxkJsSCUTWKEJvRiZ+n5TeRy
         gejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972914; x=1787577714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=RtOya6bzboumSHNM1S8BPhIAar7bTjg7X8LZO8fz+KH8CcDWvtt2VERUUwNgaoTvZw
         DDWxrhERcPqcpQnLDMj50mM/fQmKwlOJL68dWGjMRFQgsCb+ciiUQghjQrlGcW90d3h7
         75Kxz8MTpofsgvXjiiYlC/URPNSyqRI0kMigzQ6N+Zea21BEPmFAsZEjiQrJzCmTCAt5
         tmyS1ENh+T6wmfBmiIshHUviptYLgY1UgeUDKF1IeFyvldifm2RtkiZfXT1UARPQym5R
         cbSHxzBi6SYMWtR4bDN7Wm7yRdZV438SoDm+hqA7xW+rEBlRRf1Fizf7xS57Z8tQtrUw
         A18A==
X-Forwarded-Encrypted: i=1; AHgh+RqQe5jh4ayH4V0zSzXqM9Av3ojxuUHAo16vRGcQ+YrhHjiE6eA6+DQkjTWO8AS6GJJQBfjq3cqs3BFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OZ714x/+BB9t7WyeokKpJ3lAvyazdT5UTMRLaSlKQJAZBs8D
	AD+rGGUocgcieSzjQvb20zopId8AYdScTKEqYRvbi9SIJFKw9wOPlJ9z7aRgj3YzbqIHdeJvSM6
	Tzj9fbYnHIiX9CbzkavqNdl8t7Rv3wqwliZICBnHiJf0hEe2h6paUbOkKftjiRc5M
X-Gm-Gg: AR+sD12i5tdvAC27GBe1J8xIZqwT1PGbZGKQXf4n91SW1CeZNHPS3v5Hg/xB/CHYvcm
	bvZbdrH6KR/Cpw/YqmvSvfUqwJYr2ZLeeuUfi8iwSW7Rgcasq1q/tgxjsaqE1iBHYhEXImHGMcO
	63oHqRgMPc3QqGP85k/xfcoC4KsaDWluqd3/o0SWvUncWB2dm7/nFy7m+qDUuLTkd3G7Zg+fwkW
	CkmO7PaFBDoeXORjnUeEd+Q71aSLgg/XvJwzgcEnVDj4MDIUuvQFER2+2ouHdGk7wT3glve2vbm
	/LobhM15TGtsVzNnGB5keaZxbNvQoj0cSViRUaMxvOuC7jw29TrBey8wxLrXkRtmFJajpSeqctr
	B2LNf3PQKWSjIAgpMSfxVjC8y
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610861137.1.1786972913705;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610848137.1.1786972913305;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm28129966b.50.2026.08.17.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:21:52 -0700 (PDT)
Message-ID: <97d391b2-4d8e-4141-a139-a41eeed7c6bc@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
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
 <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX5f4MsX7oFXQp
 11LY1BnbJvoB10/z2nBRvSSbg9fsAo58QXoaYOhmEpHnBScScSVDsdBzQd5NvqP3N37bi78YLMy
 2zGyfSto/UkHVYu32PyErlyOJmhCIq8MSq3u8/Macoy+6C9BMJSX3ZbmfP81ykwhrl+JcH3EQaO
 4iGLBuO8utEtRSgdmLpINxPa4XNtvRxve8KwK5Aj2SKeCY8RH+LQQTMz87L23e2wbGmYiagQYCV
 ZiFAO95bO38zU7la2Nksntsfd2+TYe0hMcIlR46rdgesCd4p5fpn6mkQszqAmot1QWGcHxyWB8a
 DHJpyBfm8fEK+rVILmFsdT6U6dQYwSP5Rrwdgw75CnLo86yqvtzeDLHcdgjP2fbG0KtFOyUx/WA
 BfjyDPhT05uqlEQ2jT2Gc3MhiYjjXwuG1Y7ly5ZgSbAG5WAWyqbL4yPXTh5P43tfP4U3N+yeKNT
 HO7uJW8qL2Tg/UquYXA==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830af2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: kHQfsozY_mT57qI0af9XV4V0kQck3iCQ
X-Proofpoint-GUID: kHQfsozY_mT57qI0af9XV4V0kQck3iCQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX7dqzqFUw1vF7
 iJKpsEuJDF+zqu5qpczqC4i/OVWhaMmNCSHtkNX2ZY+Bcb6zONbPvMjVfAv9H8HrXHYBrm+bvW+
 B3JS2OTzh1kvBAQdGSK4uzrSJPWz0+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
