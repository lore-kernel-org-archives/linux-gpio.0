Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769492;
	b=dUkWuVrcaDqXlIVEE1A7KNoXElYOrhQpt+gU1UW15FJ6+h9zIUjSkUexmwzazrC7BdyY
	 VVVINKpr9qhxjC/FOSuxqP8T5hTlIcJzqGHI4/qjz+gPLzKx8YNYJbz3fW2oBcbENzCgl
	 XxW/PnazpFbT+8c2/eQjTXiKFWv8sElEEXZf5E3zUozDg6zORiftwyk1dbrKD1ioTlzFx
	 Je0u38CkQXOPzIaXaTU12eZ6aEbdtFvTMZRtO18Uh2ZLgURqImLRv5vcz4vPtfZlUuZgM
	 SDxmgGy17YlatQRZ4obrMrc4UevCUNAtIV5Ud1Ut1+0N2m/hyitTAwFCiLsVsXx3b6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
	b=Yvdcd2/bhqDpBcrag2DVv0KCaHDeDEEioWonJEF6PFOPqhT9RLwdyepnuYfRM887VFb/
	 DU/GZFZsaLfVQcMMUcvFZUbS2+cmIFDkEpKbDjUGdewkQ3nM1KfeAkTP4jGnwyuicKWRW
	 0NsmqiCkscA/RtsJofVtIz28U220M3EiU1849+hAdkoK2D4uEFQu39LCY20Mx1I8Q+LOe
	 OMc9TTQAXf3GhxOOujJbNvwWW6+eYYieKlvw3Qlk+UOnvbzQvvQ0Bdqh7RE48EnH8Jize
	 gtO/TQSHSQ+rq3G7oOb4I5B/fmuVZpGwEeldsU9y16nuOwm7rdOCnHswJAxxNrLw6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkDv+KTW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E4606A334
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16E4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkDv+KTW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GfCD905299
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=; b=YcLlb51+4v2NN04o
	5zS4k2bopuvWlh0VcLauCjavalzbzCU9Iy8GINWU2h4Td5r1NJIZwFQ1+QXRR57u
	m7qMUP/fpXMOUP+7bXmAOR/n9daanr1Y8T+Mw7J1PhYavLzenv/LjNw63Q4UJWCw
	ifdHNBr2S8bG+IjxAuBgqGA5XXqI3vWC9UnP4+TzqTJvy4UkgN/coQYDa0gTBeUQ
	wMXkXWBjodLboeeksYpKcu43tzkdy8/S89xp9TUYLj0GRtrBZu8gpucgtv73SsLD
	UQ1YQ5w3LHIDBn5YKZym0GD5pwHZmjogdqNm1s4uErA2g8mzfZd/fFCWEBUB2aQL
	A4nhEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39r71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so24588841cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 00:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769487; x=1796374287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=DkDv+KTWcRp68l4Z1QewTxjiGKny5VH79dtunWdjdE97VubDQ77+IooR83YE0Gf/Tx
         K1HnzZ1yaz4aMAkwgT0rk2G47uGte/r7ei964FbNa5purcAaCXnzwrfMLf8EW0FZ77PI
         mWTobCpSn6+ZEdR3m3sjAvEwAiKbuEy37/YsY6If9h3XSvE6y/G2DxoF4+594yrEEHgc
         WsCHtiDr1+GuG4kDuacw8YJx6xb6pgPa8oRG1F0bvjhL7iGrHn/0LJI+qnL45pd7NDmg
         zLgVIS3hs5xJ2ZiPPrUM/sToO2Jb6C/t8d6U7awBhvBvVxkJsGNIuBffyxU41rOxQzRc
         pFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769487; x=1796374287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=JA+hXEp3f1cbnzED7lApB7ef2n50WnhkOL3IfRrOYOpXG1v87IDSa1SDusUPyCJDP8
         i4/xsvC/C4Z7okBA240pWAEXv+yAqX2goCDWRILLPibsB/7cr8/cihyOj7KZxJhe0Xq3
         vQBacwBGYT/B0VbHxJlQrzBHxYhRycF3wsKFHO6Rw5kao1q2/amSyNJOJOLzJMuzKs6o
         KkgtKblsfPmYKzwO5HFhSnYwoKtyt5CMG+GVfUM9EP4jvZy9Q0hf3WMZKG7pYvSEtVDp
         Cf8Evai702hgj0WDBN6QUf8qO9ec3BSyJ4KHaEyTtPDaHouPR36rf7+gYL97BXiq1pfm
         xniw==
X-Forwarded-Encrypted: i=1; AL+hErFMMyKdT4W2s5DbFYqJ6XIzCC7Hm8y2kFb2BV7oK9tuBnVjNgbwRfVAUwmiWvHwx6F2h/ybiaMLnqvw@vger.kernel.org
X-Gm-Message-State: APuU4Z/XvvsupxxZagrB95zAWeJ5rny9Lk7Rqd0lsVq3o5v711k8OeRm
	XrPTjz3jSPwVwBi+Jv0DLoVNVsc9a/WCeuFI1FTAL/p0yoC3B51fIBsmjkObLlTpi19eio1OqpX
	lgExf2CwrHKXOKRgHRuG3NstaHh0r0wMc8OErf5pgWnBnMPUCK3ME/VdHBUqF6YUX
X-Gm-Gg: AZFdTZeYa6/1KGdXy0OtgyzuItfe0dtqzjGvVM4TBxCZoZhvokVll1Pl+fVoxPrqwvT
	LaBatX8JrTFEVniIIKAESeA82lFjOmIUcPgr70mopsLQrH8oMsBMW9Yly3NfEZN8QgH+oHaYP2s
	oW7x2vTxB/NRfZWrmp9HWUT9Jvjj6diKyis+JNKv3UHyqa134sR1PQPt1JM3LmxIu9afLwuRsG2
	dXrWPxMDqcadsEwBpGQkvcIdP1bGiu0hqeOm6+GdqYdgwn7de+BgZ/cJvl5cRKOVqiNIlMpKOBZ
	kzg/QNlCpPJsQB0g169v8hmMQ3OHQYYzfheYxlUYMDlsqhe9Ks/WOoCNAmMV8XCnn5kIS3D69BQ
	IVk2QNRolwj22v9idNREbE1HZkkxopVUwnH+rOR7WfvctYzPePnlZC44GJWljNxzRgh39xV3Qlo
	hXjBhiKHk=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881940785a.2.1795769486579;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881937585a.2.1795769486037;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm260458785e9.3.2026.11.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:51:25 -0800 (PST)
Message-ID: <dd5b2309-fe69-4c78-abdf-8be998247c62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:51:23 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Netrani TLMM support
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
 <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094492 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1w543XZNT9zSpPk5rH8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Nvs7Zx1-276iQb7O4p948s4ZIynogiJ-
X-Proofpoint-ORIG-GUID: Nvs7Zx1-276iQb7O4p948s4ZIynogiJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXzAyGl22dkbFy
 eQQoVaYPjLWzszW/75aHmITOrud+PKreiVif2xNrXIi9Y73m1VcZCcMghD3F4REcB9DI+Xvtgjn
 IbAXJ94O7Ofd9KNc1snAnriDqDPWndNistMZCFFA7nPHsahAkozGxzrBFlhuYHGtwoX0w8tIhUb
 A4vmzU8WYRFGWK/dp/K/4pic0MT2QxX1LNJn2FgJfw4306lRcH70S4GAxETXsWiUy+JiRQgFlJE
 L4s5KhrC0G+MZvzZMyByX48d4UZE8s2p1jSHVUJUHdiFqq2ZjFi4MvJpT0DrJK5DHFgAcKtWmWt
 gYIkAcuSoV7OJP0IHZNW3KHKN6kYuMtitGkYqCMv4u8Iu/ziOD/lvNeUVE2w4QI/ym1xK+fqvSD
 QvvlVNk/AdbwEjWZAX48LlTqTn80HDJh+0JL4axPcVSEUbtO2g3CJ7Gxf5UsBDVXpOeiOn8Ankq
 3iYzMTZr5s2P5i0k+iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX2ZLGqYHoTh1D
 JRC64j+mEodbeYZxxe1CSCQyZEvYU8aik8po5mZFUwfBH1PyaE898gwPVwJMMBapXT/CCcNpOvQ
 ZIrN4ygmAMTRzQGRknrdnPetEgIZ97k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035



On 27-Nov-26 03:47, SignKirigami wrote:
> Add build support and the driver for the Netrani TLMM controller, which
> provides 142 GPIOs, pin configuration, eGPIO and dedicated SDC/UFS pins.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---


Feedback from an LLM with doc access:

Move gp_mn on GPIO18 from selector 2 to selector 4.

Add gp_pdm_mira on GPIO14/selector 4 and GPIO15, 17/selector 3.
Add gp_pdm_mirb on GPIO59, 60/selector 2 and GPIO61/selector 1.

Add rffe0_clk/data through rffe4_clk/data at selector 1 on
GPIO76-85, in order. Add grfc0-grfc9 at selector 2 on GPIO76-85,
in order. Also add grfc12 at GPIO86/selector 1, grfc0_mira at
GPIO87/selector 1, grfc10 at GPIO90/selector 1, and grfc11 at
GPIO91/selector 1.

The rest checks out.

Konrad
