Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447370;
	b=18/yPglDi6MbC0n4EXbpUI88Yq3SXmVbtWuxMKsRX9VYhfU2S5XFfLBNzA9NK0NjjZH+
	 y5mhuW7PrnrcZex14/7CsZbVpR3dOa6aulbzjlaCgrxtoJyYJVc4QYy08y95fI8tYanbT
	 byU3m0wTSEXzHRHGJ2wSpg8u9p1/L+tNBSHCrDdrp4lGZgXCdIZvQEylSWGI1baOeaEyt
	 l4A0hfUA3uaBM0EP/Eb8Dvx8BCMsKvZJgT3D6INIWnd4Vv9olD9r3pxiseCpwSqTNydy4
	 K7sQmyAHzkB0DfeVusMaxAoQ0mTnpHmR2bskbvooFDFBFuApCyBFtv/x7cTnB0h4/GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
	b=SOROaOJWvo6SbE7mirVew+kdqpIO10a0X2mTw/Qq0mPM8hiZnsEj2cxBfvJXhtxg9t6O
	 cqflriE4/xVTu3qZGDYik2b1vsQTyIonOUCnwmMzcP3/HBXQqAtSo4Lt5PuBUn4gOv3d1
	 WL7w4KYy2OHGpHbg/EgV1DOJrlgYwip9dQdzPlBDOJcom21EPM6+rwhjwUhX7QFl5Bq0K
	 0lr/sqtUnn+pXoqIW/Ao8jMo5dCFTaQ2jFo5GPrFu3xKIk7RhYwWAZu1IrwcQZiQ6d9iV
	 dr0Jwfg8bqwBgP7zzEe3JYayRgkTHbHTr1bfXGFqpjOXiKaLlwsqkfZZNQhezfmtqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB2cPdUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6utw2Vw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A72D606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A72D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB2cPdUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6utw2Vw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLTqn446428
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=; b=LB2cPdUmJlyGHCFc
	eGkrnkQEJM262ipiDDR9nnTOFGEvriK/mewuu85pe4tGE+XPkEffQAmanbxw7ip/
	ZQdzPKOC5Gb/oI/bcjTFN7Bi+pbr9eIXctpd2pTLA5hhWyOl7cqFSTI/rBeyJGRG
	Eezl7D70MSrUOEQcLTgN8HDJAu+DcSoGenhu4XR6CUdwEyhtuZELpXKm7sWoMAKd
	KmnOA7rJVmqi+cr6wYkmD9JrOXvbyKkNr7yK2pAKvYf7aiNJgTP901gd3VZIbQc+
	/SsyA2+nPfdI4tNpPi8/VzcHeqVuH6uWu4vEQYV0q8c4YHJmEWLN9lb5HjqC5hAd
	VeMDtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7421cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a4540f2so19913485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447368; x=1796052168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
        b=X6utw2VwUjNQN8VLWnIpucMXEPlUlWbCmiQ1il33weES018A0CB9xP8IomJpXK3tvw
         2pTsNcssYyHixar4zvLbrC0FnU5TVk8Yldz9yjzzfUXb8uwQ+2n20gIcPK/NYlomcpgL
         az0DaxfDydCgoMPul1qD1lS88+WgdBs/pVheSgIi9085kzh3C1H8Xrbp0VAQ63SA6Nci
         bHA3s49Q87OypGCThsVgKycuANJxce54u4Av44CD4OCo+EfpIjJJGhjVE60hihV48Kuu
         zlC8/CVfYEew+diMn+V30mvJ3muteGsWAokSHz2QBj77i2B9CHTBriyZj2r7e8WTj1GS
         eG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447368; x=1796052168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
        b=ZYKpppTmCsU+zWvvIWDPYb6n8f9gFQkBy5mZg9hghAlKsV5heQI9V6zN8TqxmE+Jmm
         dGYzehjwbYoq3bOEnHA9r1Y4ITJuSOjO3nvJfn9GPxEEyZeZeppbUIrlh/hkki/vCrY3
         coQ6cPIF0HEtX8gnYkVsU82P0d+1tXvn/4NDTzYcyiazeJEp5fWjfuaK3AaskFGSGUWo
         hqz51anz0vD/yStDfYg85o0dJqg7SARg+euRwi/kxy0qIFUqnCNRyME1pfL9ahnz2nON
         28e7Y0GXOUB1hHccc3729ZwUggQfOmFb+PvnEG8+T9eg2iyCq8mlspBOxHbYS+96GD5+
         4cXw==
X-Forwarded-Encrypted: i=1; AL+hErHilzQkCAY9rdwIP9t1cE9B2Otd3Ex8QuQRwwo6Klyaxo0DrUNLakgESofT0hHNJUe7DCzlr/O13vDx@vger.kernel.org
X-Gm-Message-State: APuU4Z92uRVXO2lNZt33BM/SI5fnW4S2MORYDUvELlQohsmU4ewYeYz+
	7yZGlYZPW6XainP6D0qYFW3qUW9GLEzFQlw5hT8KW6zE4Pfr2XqnYn6IdDumvuS5qPh+cSLifoa
	/vrc7oLWYU/J1ynzYPX4wnEkOzZEVauKi2fgboO4PKCua6nS2j6mh3Gj4BV8ou3dA3CBlVnQf
X-Gm-Gg: AZFdTZdopLS7urMsBmaZL2scph4kr9iUR0AOQ8G2qW42TZTRJ0JcAs6QIrUz+ECUE7R
	m3G0P2m08/+dQS0wPSvVEVYnZU5hdqwTFz71VCiDzVKzKcmJHQuACFNaCEyjUhAqix6g1qAwONj
	RczfylzH9nkN4re9TeUrP39sZ4nbt62r0Kq02qIxvN4ySHo1mA8AIMBqC9pGKmz97qGKXgolZ0c
	vjwXT3ivcn+9P1kvDV2UEiyP4/Ds8aRhTAKN4YmDQhIUQMxizwMl0oaRHxg2rWWSNTTZhG8Njfk
	XdD9BE9KyDYbtEo9Cec6FmMGC7ABMBb+Wa+Co+m5AnnUoyTIsiVO0/xdl4c10VU6turWb8lklvh
	ZFiFEY0dQKabamj1JBScm+sgaphGj4UWUB3b6AAcPg/z0TqLVM3kGz2WvTtrHNrWdv9CspYE=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635382585a.3.1795447368300;
        Mon, 23 Nov 2026 07:22:48 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635378085a.3.1795447367740;
        Mon, 23 Nov 2026 07:22:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm422901166b.83.2026.11.23.07.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:47 -0800 (PST)
Message-ID: <adceaabb-d8b9-46cf-8e7c-62fb116cc96b@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:46 +0100
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
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-4-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-4-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qFZIZuQYfe4q-qZENv0Xm5LOPyyhcKUP
X-Proofpoint-ORIG-GUID: qFZIZuQYfe4q-qZENv0Xm5LOPyyhcKUP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX+5JLKOKTay8a
 iQSaoe8KPQbzhSM/oY9mzg5arelgVCfOhsV3P0NGg8DreVpHy1TUyBnkSCvWFpCDtjEiZY+TzCB
 vLlONYfwufE3vKHCX2kRjLd/MEQRF/Y=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045a49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kuyjF62R-fLzJYMBhd0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX4dzcwGUDGa/A
 DwvFh5pTiyHyiruntLAlaPffBAbq+awacMCj/i4obuSByUs9tofIlU3FSjXEdNpOcPcGIq1bA6R
 IV7/kOwm/HZFmu5QQzO2nYHdA5uUN6k1q/LXRnbyewUNrKWnsy4Q610y70hyKHqYDP6rvCN7HCx
 7S8/IcHyYFhqXWu7e+pJ4frqA1G5ikaNTGDyRmYnYm+0B7VqE9dqGZ6BTGUdggYWutcWTJRoqXO
 U51Db0RJnYZqxvJbsxKGk5SczWD5Ts8w0ezicA02xU2rNowCZ0L7XaDj+KxfDDd2SPVUupyAFb9
 VnoEW93rtQBowrT4GutMfYkU+EBIfVMv0TrbklSgl0vdFs/4kCezMFY6tDJcNJ0qQc0g+B2o8/I
 SPm/H5YqdU7m+L0Uyc+fkMbx54Y0cszC495JG7kwPebQqQJ+c7k694JHQB80IiRR+TU9KApS6hj
 wM7O2oviYP/nddmfw8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Correct Kconfig indentation style to expected tab, instead of spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
