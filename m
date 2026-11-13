Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566202;
	b=ojuifjJgnvR5MUVkpiWW1PH7WFO1LW9hYImpx/GdWKCNDv1IItkrqJuWfIKiMReBKsq6
	 FoVFl4CxpF2tc/sGWlCJPGU2CIvW9WyevEuIHxwlDhtYK2zLI8m6Rm82gSpdjDJoqqghP
	 D6+5vgjauO8rqr49Z8X9XGYZKdp3iSflg2NOQOUWvXoSAr4YdpSJRKbKRSVAnyzQl0U+p
	 /7EWNv75odysomFSxLoQGEufg44bxJvqIAhhdNeHbFNJNUPcqqkdfa02Yx0Aj7HiYbSnc
	 XR+//5M0/RMQWHcNP98goqAeGGGPEPOS9GAMf8Uw0k9jS73TO1lsNl+jjo10lJ8yYng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
	b=MJuaI1n/n9mQF4DPWXKaPQWMGZmayBiq7terXzdAjw0Y+uwBhQnA/x7VQhqnE6ZhcpBy
	 soOmedAnn7y2bY7bhKLSSYXnv/+SZFxDKXX1/KhIOp0OJESESu9elX4Le7B15thwa2jyk
	 X8L5Sc1GvIGKNuf9RE7NeTwAKcrw2Pb83FagiT9wERPeYoU9Wu3B8hHv2rXqxS3M2Atbd
	 k7ppzX8lECsIE8y8GgbgorkOFh7CDD8aZS1u4Cgs3cakAlYaba87McKNhRTIgBVeq19qv
	 s2rzfOTpN08YYu2P70nQw2CXHLDkn6TMrlI4LUHaJTEAcwY6vkgTha1vlRzBcfBdKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j/7a+IS9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PiowsmQP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923F1606A321
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j/7a+IS9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PiowsmQP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDIv074859
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=; b=j/7a+IS9KtkitUm0
	U1+X/l8qLCEiqyzcHkRHohx/+V27/pOSHXufcbXOhYb5Cf7aY+kXWoXo+DkuYTn4
	kJVAz3LQb4zZwjCPgcUI2gQaQlZin/pVm159XZfcLdxAvzwbA8NyRRwF7rMtc9aI
	c+a+z6iqpLG9LofmYUb1XrKptwnvCFNnogv8cbKWWSh1k6nwe9K78yOifiIB4Q6l
	Rr8FordHS8ZGSndNN6Re8C0bCG/zF0k4MYoXyKJD2mE7+sEiavJHeUYV5OKBHhmp
	zffdhLnUtLiKpmCDlhUur1VHCHmOKjG/GOpub3B143sCNUs1bS3vevYmVvu+4QJb
	QdHLtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhwr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:36:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso174789585a.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566200; x=1795171000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
        b=PiowsmQPFtDtr70+mcK7MuRPkYINj/1HEbrIjya8GuriBX7J4N6U4aKLnALQaKNnOd
         PFkf0amdCH3/U3VL0wg2iZ7bfvEuz3NqwbNoCQryp5wE6RXgjQqfJqWS9Pt+m3LWUl6c
         i0tRWRqZGbict+OXi4OIDtDdpw0tCL8QuSsGB+FG/W8d5pysc9rwEe3B6G2FIo69lUYG
         GdX9kYO2LEO3Z/sUQmdoc4u7Zte1zjPvLrcL517WOKcpJvfHWL2oDlskjN9iGDnWtx7U
         RX12fMtoPRcw5uMl1WRdkkOQ+08ng3OfGjKMxSCLHnV1LmxAsBFpUb9NH8fnXRJdmqT9
         Qz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566200; x=1795171000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
        b=itmjMeBPGKzTjZREC6xh6Mlzcy04wh9OEc871M6GTdaJg1dLD4V87EfjIvUYkZCbvT
         VrTZBFgoS2Vq3coExPDspYSTKyeNsmVCU5iHwV/+AO9NKRHTKR1zelYR34/9Yo6xHQkG
         Q1+GjoOa8oyr017RNoBrFW2vFIIFG5bNgPyqvq1WshZq9Wb4DS0JRZYTEs4/7DIKnzEq
         7Y/Q0wnE3QWX3RD8bteFFYmQpvnavgi1Vm/gWRlovUua0TOWeczMkhy3wvhhKdEBym4E
         QqI+1IYBFrbZWI8Mo6y6lTgruV23qQpdeu8YR/tezPtudxL2LcmXdr8o87jEl0HIeqzF
         DlsQ==
X-Gm-Message-State: APuU4Z/Rt5GxDgXBCVrozOJvv4g+bGzVHUB5LAjOONEGDNoN6vIYHG+L
	WUWtJ4UphFXUtRbNPxP27F6+sqEOQr9OuxbFt3LU8pFPUh9/yeybiAwLMlwf/VcR6ZK5z5DLDmc
	hE6AI69l/2Q4kTwu4mLUAKfzGhwE1eCJKcS8eSEzs26BGumiehmKt7AMVieQaMsc8
X-Gm-Gg: AYBFou0OCHN1Lg2H8VOmIKit4MYpl0cIOR8Sx2eR9EMNQn7ooKMmhr/z4MMxofKzsVQ
	7Hj9gynNgUT9d+i8odsLBZJkbKKvN0Bc3BPZrhr88vCQOYECdrzK8UPKl5QOHTD5U6itHneUzFu
	ljIrGH121wHnLbemKOSLNpgac6afDQBG4Xp/SfNWP1RqE9+yH8CzhjJfx0FZ7dXfjDmDFACI2cR
	xIG396yew4VVzdPHMoCEEvzjOFLW8D2ATKGga3Mqt7F6+HiAF7xlO1OPH5Q1stAm1ec+JmraVBa
	K+2dCHozfWUkhyzq+U27BuUdvxcF1JwonDcyQ8GPOVEI5jNEBmQh3pmNeWqA2/YQCzXg88As+lC
	HIrpaTlzgJWA5HiyVq/dZCH+1mQqORQCil2PdPu9Djgqmvcyp9I/gJ4U9NY9jKQls8SQEMUidvS
	p/
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id af79cd13be357-9494bc2f497mr335809085a.55.1794566199752;
        Fri, 13 Nov 2026 02:36:39 -0800 (PST)
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id af79cd13be357-9494bc2f497mr335807185a.55.1794566199260;
        Fri, 13 Nov 2026 02:36:39 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4672388f8f.3.2026.11.13.02.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:36:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: improve concurrent access to the flags field of struct gpio_desc
Date: Fri, 13 Nov 2026 11:36:36 +0100
Message-ID: <179456619466.14668.6243591882039671593.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 33LRlxwYjC56hFDVpp7wQW3AMKf1zPZi
X-Proofpoint-ORIG-GUID: 33LRlxwYjC56hFDVpp7wQW3AMKf1zPZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX/NRdrjnfAIPH
 wyVpoJywKT+d3ah5AImOJ4CNzGZ+rbpt1BZ/shSSdywfiFWlJvW8FgID1VM9xJy/bOzBooX65WH
 x0FvzXJUZXZNtxDXaY20bZTFVzQzfvAHfVWcO0Snw543x0KDQxlOD76LnJnTRZfLDdquqzIR++s
 X2uSEe+ICIHYYMO2+uUeDnpG8/W7qt0awiAltn36TxyG923ylpVxTWomuidrWe2ZpGTVs7C17i4
 L7GXpgHtV28NX8TnpZlkg7vnqxWsWOaRBSQ1MSjXU2hdtkVgYNMcAlzXAINI3rwRwlVKoXqQFtR
 UbOr9hIjHlm0nqtnNzMYf0gQeWPC++9GeB4azArdBn1L8Hq8JEKPX5Ft+3yhQsdBAOatpqqBdpa
 Ueuo6TP8nOjK/46YxvH5ZX1qqocDjAausiykadwvJx05ZtenjMGINjXPHS/PbL/qqahas0zPMZf
 /hxpcUQ2HkohO/g9ipw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e838 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EyKgIFjRM3FL70iytX0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX61SL2LDfBZ6M
 M0E4ucWNQf1hTPjcpW1NE0OL6WHrpd7BbedL80pbrJr62ulq9FVs+QZrf92l+bZ/hxKZTrPppjW
 QIr4ihSk2ZDbwI0ObVcTDGYbcJUF6EQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042


On Tue, 10 Nov 2026 14:47:00 +0100, Bartosz Golaszewski wrote:
> This is a follow-up to our discussion[1] about desc->flags and possible
> races with users who don't/can't synchronize with other means.
> 
> It's an attempt to use try_cmpxchg() to update only the required flags
> atomically where needed + minor fixes using atomic variants of bitops
> where it makes sense.
> 
> [...]

Applied, thanks!

[1/5] gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      https://git.kernel.org/brgl/c/8ed87a9adf48703b5729f9d020eb15fa79ffb099
[2/5] gpio: shared: use atomic set_bit() for descriptor flags
      https://git.kernel.org/brgl/c/7d1d799d6251bc8cd1d5cfc881b0c09060b6b90d
[3/5] gpiolib: clear debounce period before the "requested" flag
      https://git.kernel.org/brgl/c/8509d643ffb7be508568c696c9fe45eb1f84c33c
[4/5] gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      https://git.kernel.org/brgl/c/63d7aedf6add8a24415af4c010588f63fa7296ab
[5/5] gpio: cdev: don't overwrite the whole flags field when configuring lines
      https://git.kernel.org/brgl/c/fa8bc4aa06674e78a4ee702966419aa4fdd8dc94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
