Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353B3876A0
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163726; cv=none; b=O8PrqsFAitc3qUjQK97Apkzq4oj9hCzr8bPlpERhd2gmdxB4efaZbvXyft6DCHbf87cc1Fg8I7NeZMA8223Zitd3FjA+kmMTNv4IrkG+xmB2HpY9JpGfwtza/9RHEH/JTV7XPJ6ESl3KeND/4+BPK7iR8cFMOHDschcUpx/w5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163726; c=relaxed/simple;
	bh=N4s7OvZaL1ndieVWn4UkLoN/unkwpPgaNpfvmFseIAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Up5MsuMchzIlGepGMfkNT6WTUuiwhprlEg4FecZGLHauTO8/c55akivD3VV5ifW/tPYbPwwoxLcLb7s4aOS/x0E5jmLenBoeyPo3QBRdoGwsDP9qQyuk+c5zXu3uz5pGtc7J7HuquJGR+u50XQ7nclPOIBu4Bx8hmjnFfelAjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1mfa1fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsIlec84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1mfa1fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsIlec84"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlrh43787465
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=; b=d1mfa1fWdKNijENh
	HTkoNQBDv4w6fEwy1vnGBYCRKMBNDwG/9PehnHSEv9nIIxqrq1kNQjJSpHny84W0
	5IUNjGxedTHhmF+0DlD9HWXWzrULgsAq7+z2LjPRcnjZ73hE7CaObb2sOSIWWze9
	Cpo21Gv3TCXpTgdBiY/gpFiASLVO97WJg9OVtY2lnwdffJcM4P76NMe4J8FRPQMw
	Eid0pLbI3rNwQUuFYVMnpJK1SnZG0Co1vJxPxIhdx2hyTEU2qssjIb2anf0UGmjo
	GqDpd5x5UAk4RBZMISlHJCf7mk58VR7cvLGwmNhTLUXcaDztT/KZKazp6FdMrMf0
	P/QIzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hfep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:48:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso59336931cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163721; x=1785768521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=;
        b=QsIlec84RCGbZyBwUI8b+IuQ6MUs1Bql1DFqE5aJoFonCs9767EeQ46Qi2uOF4WfXG
         hWXcdHfYdbBP6g/UgqEP3B7pBphlQQsLL6j5p6uVUKbgnx4hEmvxpo2NS6iKy11Djzb7
         bk4ev3ysLOUdIrn0+HgRhTAk4N4YQ+VxHWfgSgfoLPlXoZIrUnArEtVqOIovp3MjpD8G
         sWuhXNPdpDcu+AHRFRVXUfQiOFgVm9A8kZGaJx+JyimH3V7J2iTPNzoiHiTwk1NzBgdj
         c0jKNpa19My79ydYQ2QqzyiaoZWe6riVxBV0gc2ygE2rJdRhoNsdMRczpkUS9VzrAM32
         cR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163721; x=1785768521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=;
        b=nMq9I2hq2ItYG251ps9RELi9yj/uEV3HPIkt+uQMqYXWfi24uzi5xFn4T1yk0kX0aP
         ynJUIef2gu5Z4YK1qj9XuCWT4FZj+qvm3xDAittYJPrhpz/fjlnA8h+3ev39hPU5Ynvt
         iJBXXYhSOxS3cwx2w1vLt4um4sDokHk5ik8vrE5CeFncZzvmTRBf5l5fyqDyHzt++/Ez
         wQKVxnJ8Aqimd21AHPHiFkFg/jT5oPKu4Z2V7vY8XIkH18pjSskN+lulJ8SwNvFNjBOE
         /y94a4FPseHGotljurFLD0SONBXwaeB7j2J8gT5twBN1dYPgEO6mvUwVxdGI7HDinU0N
         rRlg==
X-Forwarded-Encrypted: i=1; AHgh+RrQuWz8e/CJaziOjhdevug9etljD37IfF7RyXKUSDaSE/YTCFL3df+ksk5MTka5Kk69KPxRtvkGPG3H@vger.kernel.org
X-Gm-Message-State: AOJu0YzN21AIaMQWK7pawSshPx3kKCMrvzWnuKKrw1RghkEFnqtMgPDl
	7K05kATmA24uU+9/lyNQb3yMKj/j+Ywlsyy3HJqwxS50foxLhN2PWNETB98lRkEAoQGK/WoK5DE
	2YQ9bMyobuE7g/d/WxlvkWnwfh9WWUN4L6uJYht8r5ofIxViLwEaLdB5obRnPRjzO
X-Gm-Gg: AR+sD1115Wbjsi5abBqX2nfxhaZM1skDWWZbE9cnuyorBj7xFPLLojaBzVdG3fcwyYU
	+rSEM31i4s/hPsJ9ZSAgHKn7AX2Of3gDcgcQBEoqgVKC3qTh1HLVihauqU1FzX17J3fr6DdnK3C
	ix2I1cOQd3/RBWJn5zTIMxwTZMuOllcY0ClWpLKLVfN8XEuKgA6/Z/ascdHojQiTw1pnboRqhVW
	Gha9EAaA3LqigoWM2S9V9W+41MxSCOlkxGFgv47ilFOmjid1APR2rWwCeuq1qNdCC3DpNhtmHa3
	QYcmi3BfdmyVVB7qg+77kUac02QR+JX5WUNbiKLUMnw4KRuW98Ix1xGJ/xSj5bz+fU0YHfBMkRp
	MHacz4Ivo0K7h/5LYfeK/WWLJmNc=
X-Received: by 2002:a05:622a:5590:b0:516:dc75:1aca with SMTP id d75a77b69052e-5295d377ea2mr115068061cf.26.1785163721531;
        Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5590:b0:516:dc75:1aca with SMTP id d75a77b69052e-5295d377ea2mr115067721cf.26.1785163721043;
        Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm50527449f8f.6.2026.07.27.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:48:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Taceddin Sancak <ts.solidarity@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
Date: Mon, 27 Jul 2026 16:48:38 +0200
Message-ID: <178516371435.62304.2693813045161690629.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX47NO4X18HU9E
 EsZkoyh0iKnndjkukzQX3BOYK/peCpjsnX19C9Q6fCwpST+S9mru10WeZ4l6we+HfQsCYjU7jwT
 bOq8Za2+cMeCyjjeBtJGAphE0ChOHmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX/EemSGr5VIXJ
 GfoL1//fFp00OzaBoh250E0ZCLMvMxGEDtrrNEHEOnStD7r8eI+tHQ93JtPb1fMNvv3E+S39itb
 tGWMo+b3Rfuc7VK3Cyb0iEil087lf7dq3OThODlracoIzCusGUkFZPXl071AKuu2GYzbefSVoto
 YWbvbaMryEWlTIPxn7RiUDjDFqWWkXVRoPqaDupEWoiDjH2WTT5tziGMTm9Lb6XFBBlpKymIH/b
 OCwBJxM9+N93VYkI6HrBl3S0xcNUsu4ZGZBox903LFda0u7v0A7mRwqSqVb+3twmlm5mrks3d+3
 bFQcP/CzaW5UvuTdWcDa6unjH8uVDw7gApbqHp+ZLRRX7rIkM5DmTG2YCu8g7SuMEHqeaXU/J+9
 TZLh+eGpehDh3chgk2eWFNjpVmzgNSd3kkCkyRuriVEcoFfZPL2a5qq2Zqjft4nErPSU7pm7/Ne
 KGKSqwHpZn//Q+P4tlw==
X-Proofpoint-GUID: zj6IRD3zb3UX70v7hcalo4IembmpCweC
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a676fca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fW5ZgvKe1gcteIz5WIgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zj6IRD3zb3UX70v7hcalo4IembmpCweC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139


On Sat, 18 Jul 2026 03:21:46 +0300, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
      https://git.kernel.org/brgl/c/4a2e2c563b0ee2253a7902f775bf71232820186d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
