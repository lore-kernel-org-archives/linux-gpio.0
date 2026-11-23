Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442952;
	b=gZPCQVZ9QQqFVaalkDXE7vy9l0p3AybLPvLUjHXPfnoMGPSYhX6WYcvG3BEvqka2z4UQ
	 Sy9uyyUJfpBoloDNdS21IIaPaoSxnaNVKtZcxefS8mer6LDmiW9o8I1TRBYOm0cjYPsTu
	 tzMn4PQNyFOz02HgYYl8bALCxj8q2eXPUv81o7Xxe2jC4BZiB8s6YnLGlLUXNC3hCUO5U
	 XC3G6y5oWlH8H2rA3Pak+pKZJxiGjms1HqyNEd8BEWu8Zxo+R2+8/MBo+312UBF8CrHSe
	 0bvkrAJQoF8SAqqiTBgoZ5G/Oem1SUh1VoCemNI5HhOveS5qSTzEhXr0lGApO7oV2wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JczGDs9MjrUu5rMOWEmYjK3lOwPzuvneYIioUvsi8Lc=;
	b=YxhiN8aVhmL7bsfW26e7KGlp9/hN1EEhT8E5UI/bAM85u6UUEzBpqJK/YGAUjdDiykbp
	 7VAE9Z3voWSX+U7vDjm5uAh7RLpIiR4frKovbvCOSRdU+eManxUzsi3QGXDsRjZG++Wfm
	 zZqHAO13I0cc17JIe7U/97dWtXLPDW0BXy+FB9ar5yYlI4Cjwtt0KFHagvmFDMbfmTs8A
	 pW63YB4AeMG9D+sToJ9Gx5EuGz4vRgCiQmwsVNgY9VMEpy76IBDryLsKoZGAU+v3oQKcj
	 MiGMlYA0Xn8hBZ0OfM1icxeynVG/dmh6xbcoU0Ya0oLNCgU35Nmo/C4Eir+ptMYwndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXOfgOKG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnQCNAkd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455D606A688
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2455D606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXOfgOKG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnQCNAkd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKuSY2369193
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JczGDs9MjrUu5rMOWEmYjK3lOwPzuvneYIioUvsi8Lc=; b=mXOfgOKG4vuXe6sn
	KgR5kwpTOLm4wyZ+XAO59W5IfscKyIYBDyoVForQw/Wrp0qo+Pp6XS9tv9hk+7mZ
	Vyz7VUVtVpRprmm41ylMwzsbSWrpVv/GGTYQeDi8em9lKuHx3//BEZcODoH09/01
	J5FLLCs/CYZVoJrlyqWO9n8VffZgYaAeFTNKxfMD3J7/ttNp9lIgjjfP92EYt52p
	Z8fu/8uIt4Mkf2WWUP2DlRL3M91K8Ec3Ue2K7Qf5qpW8qhTj78x/Z6UUyer5FZOd
	azzVHbYajjSX0NWO2etsDjPjYRfVfYDnVTiVMfPQZwgKZqXhOfftaYh5ewZ2i7Gl
	D7tokQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9nxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:11 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b155f4eb8eso46473467b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442950; x=1796047750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JczGDs9MjrUu5rMOWEmYjK3lOwPzuvneYIioUvsi8Lc=;
        b=fnQCNAkd3+xRKGB4bNINGFlr1wlpdkOp1FM/huq6Wu7SHKp3yu9KyD2PrlUanQ50ep
         1YxixOgAzMSISmHSxpYATqGCEoGOyA9LdTNW2SAXWG7w7DZD8wvbbwQ3KgQwpft4sPGQ
         HtVnsmWerm4HLw9fWxvbsO4GYbc8EfRSzNblFMm5sesAmXx6NPTg4kPzEnfX47IoO6Dv
         Cv7BCrYfstFg/fYcvenQC1bC5dolNlUBWuYalRkrQLxsR5XqPxoEdFA2ZRLb1JFBIoIK
         4MBtfJ0Uklw3h0L9fGiD8G9NSWKF/pTij+q8tWVLSMGWvkJvBzfbJcFpNIpxLgrtoUTY
         NjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442950; x=1796047750;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JczGDs9MjrUu5rMOWEmYjK3lOwPzuvneYIioUvsi8Lc=;
        b=YdzFedITSHsA2Pk4BmnVtO5HMY6bSL8uRhmJ7R6k4D1JoThh+2vuy3bvcng7xb6oAp
         7Y1jfnTUTCSYP5/E1vDR6yGvzV2S1oRvsqeMB0Uc4bBcXF8lNB0n8jSZ78ctv66UEx9+
         sdhbvYv9L/Zx73AYLhXCl4T6Vdg5D9QMC3GiLXeTuIbwcFfaqPMEhyrUUMznCAbFfzL+
         +9QhKLHAKOIaUka+tYXiApTNDyKWgsq/HFK92H6xyolnRuFxZbarNCesGvtnFZjemaku
         xPVjhFiVJ/ooBtAotd9C/Wbyx/eXpgLfpVt3sdbHZHAQqlKRZG0L5ere8WXXXrTfz6XW
         CJ6Q==
X-Forwarded-Encrypted: i=1; AL+hErGdmCzFAYhx3rEAGZ2BIitE4ii0m0oOwqY3wVwrEvuWg9oZVuhWAy5rZB2g18cCNkB5uC4mDlVfqZPm@vger.kernel.org
X-Gm-Message-State: APuU4Z+0oewE3jKKjjh4pTy2sm9WfAq+ZmeRM/siPX4NpG4JZpW5W2An
	UYDNY63fUdFYmFfw3QtTK/V/UwnG2U225ycD0xcF7xpUJjMWsi8StGfDVe7xi7GuenFNTISbXEP
	eEDx4anoiYa+/sYr4VZeGFQIqTIbNL5dWR3sZTgrfUKOMeNmvEOakifzQow4eqCjM
X-Gm-Gg: AZFdTZcxyeIVCS4imnnVMXi42Gzrh0TbAkwRt1X8IEql0m2bW9BzyaZWJN3I+sF0wqd
	4j69eAnfPsFZqPxZo40oHDZhYujVU4B5iDrImntmD92TKUbfGkK2mIbUrpG3tKgqlLvo8z+chNt
	FgNJ5U1WL8d9NdJySe2iSrBMh10eMl5oM5z8Sxb68IiGMBIPSuc2oJVZI9BKCsPZoIBIPcegP5t
	2AO4BARGM2LA4+apDp5/kzFiwb6E/H/gOqq3tZBKkDqxixyvzaY1mel/GQnEl0VZNr2jnl0faSR
	sSiwvNVJHmtMH+eILTdSfnmer0oUwv02EICOHHjY5yAD/X2RuIcUwGn5LevCwWyO595Vg6O8FZa
	lUJN1uIuju40AWNbRhkoOz8EL1S6Bhz/QwVxELDnob6BZ7JlogganEd9FT4hRa8d+4rwCNWnnCh
	sM
X-Received: by 2002:a05:690c:d0b:b0:8b3:4598:315 with SMTP id 00721157ae682-8b5204efc9dmr45491387b3.55.1795442950299;
        Mon, 23 Nov 2026 06:09:10 -0800 (PST)
X-Received: by 2002:a05:690c:d0b:b0:8b3:4598:315 with SMTP id 00721157ae682-8b5204efc9dmr45490937b3.55.1795442949672;
        Mon, 23 Nov 2026 06:09:09 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm23866920f8f.11.2026.11.23.06.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, linusw@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: Preserve device listing errors in lsgpio
Date: Mon, 23 Nov 2026 15:09:02 +0100
Message-ID: <179544293817.66058.16680885628945509478.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120062053.98356-1-zhujun2@cmss.chinamobile.com>
References: <20261120062053.98356-1-zhujun2@cmss.chinamobile.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX+a4v4kSr5j3/
 +XjbSsK2NfsNOw7baVzAnT6AIY9MnviQYE5dhYkTHXcRJgnX/mXsrayVPzuwNvwCC+TWDxLcsr/
 eiYOU14yu7LHQ9NA0+oS0f4AkXgrfvuI6PWAcRVqtIUjsViOa6eaANyFC8xrBQ+MBxdjR3j2LCh
 G1nRD6kh/V2e7LV1zsnfaJoSLX03bm9vUzDQimApyJo3OQ65zK2pLf93OlEWcwRtJJ9381wuk5h
 RkwEaf/ueDaKBItbXDOo58yOP+r5gbBQUUYDyL8x0hNM4OZVNzBiK1LckEzA8rrEJp6XyEtGAxo
 DWQ882REtibaYM9JXBuJfMIZJvz0VwA2u5xLLozFbUAlmv5syRXuJmCDb7lzzKdyvXN5Q1LdDMn
 qmIDAa5dJ7c1t4GIfXQZPnSNWzMVIo12JFEn6LRYxiSu4qP+oBFgRR9NNgWhU+yTYkZjyVTSf1U
 3oOKCN/jiqSshG55nmg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b044907 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6i_0KEAFTPzAQe_vKbEA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: pBz24h1L6uExpEte6KEeT6TU6IMNdj7e
X-Proofpoint-ORIG-GUID: pBz24h1L6uExpEte6KEeT6TU6IMNdj7e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX8NWpUxovGRtU
 Zm8YRTrf/u3i1yi4m2ex6Ca5fxLyCKwLEQKJlRV/IphkFOZi+LDSiCvqftMYeFkZszhn7Qpi4QD
 /fsvGZziS+QfdqxVwBzLBb1N89DnV1A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230056


On Fri, 20 Nov 2026 14:20:53 +0800, Zhu Jun wrote:
> When no chip is selected, lsgpio breaks out of the directory scan on a
> list_device() failure, then unconditionally resets ret to zero. A chip
> that cannot be opened or queried is therefore reported as success.
> 
> Initialize ret to zero before scanning instead, so an empty scan still
> succeeds and errors from list_device() reach the caller.
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: Preserve device listing errors in lsgpio
      https://git.kernel.org/brgl/c/809117fc28453aafa7164ad45ea853f900974d08

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
