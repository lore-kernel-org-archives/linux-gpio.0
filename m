Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B521ABBB
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881320; cv=none; b=XXmhKNSMcp99NiIKjpE9G7qP+TKE58jK/Qlm3QztHtZighHob3IklWqGavONLTD0ImCcIx+b8+GESv92Ri1GkQdXw9AriMPE5KxBM7adZw2FXapOYA/MOAPnaP+rm3kQ521Nq0Lk0h6eraJv9agfopw15JRlyy02w++X2f35ukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881320; c=relaxed/simple;
	bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIbg6MzqrA8azqEzxkvnH6oJzIi/k1SZ7VyBAHmv8jPRuSXTKy6xV6uLuYxk9qHzeuB6Z8e48WCyfLLK2C3oikfry/PirK+NM88adxOe/LisnAUqHDvCMvF24iMo6QvwAy8I0pFgLbLESW7u/SZRKKnX4X2MPaYOFfD1SYlVT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1fQoYH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkIoUNPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1fQoYH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkIoUNPt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NVTJ3752530
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=; b=N1fQoYH754tUxWIe
	vRzsEUvObZj9pY05lkTTTbFXlYwbtpDTS8M0XWu4Mh/FpKHMf2POz8NQ7HvsTz4h
	O54KR1ezuEMSc8mVgfSDv5OCfWfeQFYJ2NW1PKPyardkT6TT1OAfIMmKHbqTl/mK
	A7IBEk89eHG/A8yGtI+1jaYGP7lGYxtfpfonE3u3uytXLJPl0mMpXX0fl5wDF9Sq
	LGgRkX2vJQULjuiZpQiLMieHISByRQfz4qRoy7NydA8k/wZFaE8xEx2yc1i3eFvi
	3P6Y+KrylK+CYEa6+Fldp4Zwm4jf9xh66rjBBiM4uhgwJE5SjFCyyOLapGRSrPX2
	WMM5ZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w35qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:48:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so14573785a.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881316; x=1792486116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=YkIoUNPtCxbhIHJC+YdARX5lOBUhRlBuf22ayUkM/hLGFRsYw6ldaYEN2F/UnA43bg
         u+tvZzifm6edgNvT9wnECV9CRVz35fEgk8luaBfnxrz8jGRGZK1OZ8pityEfRw67hJoc
         ch9ayjN/ShzRUT31KqT5Id7NMAZZx4qJruvaHvAAjIhKCb9xNxEDaQsCar5Q8Pk28njU
         FRJbghUW5Okui8Eq/DuJoRA2eJpN4CahEz0+47XmauxCMzMvemNtxPL6YJw8uUCISnGA
         OZqI6QtT/ihwHZgNLN2fwwoAUMiYC+ngJmemRVR35ew7p9FrCVSy0M82vXGoivyyH07T
         O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881316; x=1792486116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=1nqCdHhCc70P06+VZjFtnYh51oX/iSJfU2IcT03q2i+5FG2+41YFUF7TntIvqMVqB6
         CT8rmNtzK5F5pkHhN2BukFU546pvc/WCsEFqccFxs5PGru8pZMjkNcWsUG7mIuVDYt7x
         Zr+61dNJS3g2tQS1gowZeJC4c/WPCKeikXeylul+r+MDSPWZ4+LyV1jbPBtscVFL+wgo
         zTrjqCKKu+1qvComC0tBaLLAbIAWnK44ghcnc1iNKgrpD/5iYW6VV8Pn+l3/UyldvtkQ
         zNbnXuzcvLfEJHg43Yod0LHd0c8A+mEsLY9Zyqaz+ya+4MW5VcZKga1bbVawlmwzaBkn
         RClQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6N+IHQMpK+RZk6dVFI/5VhiB5zUlfPKG97TdFp1DtL/TakAs50YME6wPTzL9oQe5T+1QBb+8629Jw@vger.kernel.org
X-Gm-Message-State: AFq9FYIpsn+iKHpXayDBgDzn9HXzIOAjBE2BepJW76TcNz2DuJZmLT2K
	MkCRAn45zbAGnb3DIeMQByDyb/t/1HB5g7IvZCnKjm++2KWLHUGK99ygiv9Yjo4wVB83/mW47GL
	6Q3evX6H3F9vZ1f5PioC18mSE/h0wquTxUW3an+VOt4VPrqnrhZG6ERzmYYu5UEUF
X-Gm-Gg: AYBFou2w/mFHBXTeeqLj0jfdbq6zf12zr546oqHDRXpTU1dppNVagE7ez0MYtUGS0WD
	Xsv8mCS4BOLhJ42oE/6RD2gVFaHzJS8vRFTXlpBjlP+N3V/jfZz1WbtJEc48G9VCnsV4f451G5s
	5OnDALX/Ju/n3LlkBZc80WyLhm/xfMnNUj9Mnk2olXcslc3qLTPx02rjeCJNuPhxM21YK62Ktf3
	Lg9pTi3SaK6uSxb2evRuOdv9dO5hz6ZtHtKZ3CfgSzXg2tR7jrg5DOfWBN7vl9hh/xCGOEixT96
	I+QYbdv2cFkts8vrvfI+DECzaWbrNWb0t5icx8xPn9saZkaJmXWcMPLdDRtmKaAdb57snoEIMb3
	r4ZlR6rzNxLKDpq8psxjTwg==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038961385a.0.1791881316202;
        Tue, 13 Oct 2026 01:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038957485a.0.1791881315427;
        Tue, 13 Oct 2026 01:48:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1ce47f8acsm1792713a12.24.2026.10.13.01.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:48:34 -0700 (PDT)
Message-ID: <cca9b4fc-bfb3-405f-b818-b8b6c0278b3e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on
 gpio12
To: Adriel Santos <adriel@adriel.eu>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002160958.908424-1-adriel@adriel.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V67xY4prBAhBQPytzayc12hcNAZXyJP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXxfaxx3iVLG/o
 nFxJs07kRpCpqoeYGEYzLBFxL0mQJvvtcC6omA/l+14e8JdhOrKI0TU4LGOsWYijl3XDCsZQSTz
 iiSg7JjncZ/JXuUZDEDm3OXupOELGLLyvvuIPol+GJ21aAiuBGW+vjoaBLcTOQAg/4HZ3+0sn3/
 vWXEHflQKoctMFGWJ3iCPVL930GIjMvsyO7C5934ylgwgYeyXPs/5HSChGrNqyAivTBKcmD5WGG
 deMs4pUGqrb1wzK9QyXINb/77865u2y17p15VXKzvD0lqgI5hhzN+IPxTvKKMZ9ySz5IwvPazrU
 w7zhZConbSYU7i94y8qH7KrDCtdnrmaYQQa1Hy7eoQ5UzeuQ1G4Jqk4ME/h8OT6/KUDSMO3Hwbn
 DKqt+3lrVvt2YfXwHczO2LLXETq8mgVjG5EW9WPGMWs0TYY6xevrmzVS33RSPmmuLGkt0LLb1Cw
 jwGgTB4pJIeRaJ4eqaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXwMmqtKJY5Oc4
 swvqOPCEqYVCW6aXjUlETmg6yrztpfdnP85fNem2B9zJ3tPnSVPCeeXBAtOrlgNnbyQrpsMuJWO
 nC0dHeI04pTkNp2B/N2zEb58IkR96ro=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdf064 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gsNUEyUwMFFXpnDrQ7IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: V67xY4prBAhBQPytzayc12hcNAZXyJP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/2/26 6:09 PM, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
