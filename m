Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170869;
	b=jgx/6QrSq9Ge2KEt391feADMMSxv8Ce3zpArLN6FX0+0rC6YYNM1nrz2fnuA99iyddF/
	 KgA7wlg7vAzXT6+bhM3uGhMBNxOlfaJCsGkHk43cgQDD4VCLa/EfiCEz7fPZR8qOF20rG
	 Gqc1EbBqKeDcUwGiskAEY/Pv7keSt9cWv0cVbYxuTyoqc+JLXFkVQ6z8Vf4rir8Tlq4/q
	 h2//niG5Tdl3lyAZvbBFfVNqFxgFFLzlRyy28KjZIXFymwgRJo5WkYbwjFdEdxJMeVa4k
	 HPNMIE85CAriyxk1WkuNg9yO4n2YEqrvTNtEGErym9QTuMCfTUEbN5zC6axsLK/Cxkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
	b=OeuYsEs//52jWHqmQ7oevubJ/Z/PjV5FlzxmM0U7ZoHXOWdaU7Y0cuXgcLYXVEC4gmX+
	 XAOydxa4iuZpuw7dGh5rSZmZ7qKtqzXoTdapElFNZpWqMGMmXuRzE6gu4svnsaiVSWDik
	 Lyb3a21yBj+wWvFfW0lqmcggQaFT9DzNldmixzz03CPFcixGzn2QKpP8OUF70qTajiyoT
	 j3O+ZZ/jrtxIEJS4NRd15G3nopCnBAdoXO1MsjpeH7HIZJQ1wTEXnNAhKsM+t2E0gWauJ
	 Uk/1EgHgzaWeaLsb1/2yvoLP/L0nAuECqOZDqP6FY31L7pWdWcJ4PYW7fJTuP73Ox3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08568606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08568606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PT023748946
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9FRLt4KkgBqQmPMg3ZZXr2HU
	I1ClBesmUd+I8ZCER5Y=; b=bMCCRajk2UoRkhg8aXgnGRd+nW6cHI7/NdezcXN1
	i/3hIm8UScGeG672kUThb3GHCLW89tQUVl3CzzVlev56VQWRDqn6gnahOn6wgV2O
	iUS1OJbejQ5ubyD1SVEGNUiiP7zrcZq2r+r8cTOv540LGfu9FXHSlv8kaGaKqG8h
	5XPrHsznLMKr6BuTqbtEEc4EDFpTxAeEX16GcI8tEa9bfd6HlNZpOvWQuaFc3/5r
	Ivt9b6Vgmj5wHvZvvj3743i5v/8sW6H5xqKbeFuz68zlut9T8kK4+0ARcLUHhsJw
	qACxliQO+65d7cu8oALQPbCvmgz5QvbN/vKNEDWgRpL/EA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g2wmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso986250b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170867; x=1793775667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=dpFKCs+4taeJuOLFx3tM1RPWZSrtvL2wq8/ILE2FliNJDKR4rnkAQ6/BYJVcnS/4Hr
         jNNJ8hJwGx5+ggQdODJGbX2NWHM6IhzcMb3kvLv7p/g+9wul9pfAL/df2cHQvj+zJsva
         np8vyK5CCOI/BfSaYC4ojRMn5SByAYJesVjzOrLGFIyKJXh7tpSDNTrUU6dXiOH++9DD
         2wkMuKwKecxwuSf0n+rwCRfA6Oo/PQlcumhi5HdIQTeWaNWQ2KMEGHyNTmuhMSgweKUf
         2WPWp//FL1BZSCL1fcbJ9AI5SsZaXN+txkkiMaxAWWoFxnDubRUDh9iufm4UHtJVWGFq
         GoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170867; x=1793775667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=Oi7MQJrIC7S7cGILBmAyarqK/vk6LrT6BOUgkFa9wFaWIHFH6hWTtb8JrWk1jzgLAf
         k7aKcA9OVB9RFnSEIXqFd+9wvuylY+3SezvaYFZqWLYb4dgvJE2Ba/0pQNViGST3yZ5s
         gcLvTDz1WVz+yumnptKmOB/Vzka0a4fzGHGpwfxSnBa21TSK7S4AR5AVJ4efrkfJ1O8R
         PrNf4HXnqnbkjZ57BKKeZbZ6418xZC0WaHKLlewVLAgOjuOMrueXZm+eLnPsHGe3w+RF
         +qKgAYgqemyWzTGnXHlTWzF9OyZiCyyMYODBPluV5Qkrz741EKgfh9xiOQx8ixXs5zUO
         kcvg==
X-Gm-Message-State: AFq9FYImKO51yvlDLPxM5HpgXbi0sIoSFfLb+G1OC04wIyLgSGuhMfw/
	WjyGfpu2A0eOISVOtHxDsD8XMJSWc4kmbwhsEPEqwxHtL05tK7a9yZGvy0NXqaNJKQZmgAA9fOF
	udoHBwYzCeLxwcNOqucpPiDcsYXi7mx7UdHFXBXjHkiJZpkEWRxJrGMQ3Bnk9QFpE
X-Gm-Gg: AYBFou3tTf3ROeNkEJayzp4fqk0I8KAcMNyI32mD2ZRZGSwsD4rRtLatMw79tEHeYON
	o+2HwwcxHBQ8CEMBAdQF4v3Jj3GJajgeT1DdOh9ATDPvThuFZ62pp10JdztPRm9YJ5I2rLgXAnx
	DySEo8jvu9CXEMmHnbhrBAS2evjEf90MEIJftfEEU7zdZkbgKT9JifAKZLFqBn8T8BB1SQgwkCL
	d3g422mN1BH+gAvCZf0nunxfh5XaSjuBLntXt37BnkkeJ2oipRO1tBe/BE7jQxl5gyL0PCEVmob
	ta/+P4iGzh9SLLgjfatAkvEnrtzLOCqGiFkx3hHTNE0jUGZ7hGhzuC7J2tbF9IeWwS6U31Xz5Va
	M8eI1xqYAWQu8dNrAyUJW+zkXZIcynciA2cj0uzsSxAJoMIgUDVf+98woCDOr2SeaQ/C9iSD8Pq
	sCTU/a9bySqSfq4AQ=
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121107b3a.39.1793170867370;
        Wed, 28 Oct 2026 00:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121090b3a.39.1793170866899;
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662ba00sm759515b3a.23.2026.10.28.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:01:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
Message-ID: <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
 <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX2ggIqURNxXZ1
 /Se8wMdiVa6EBJf1vp0aOBw8iPWaWLT1c9/g+t+IbYmmfEMgE7yxgP5lP7gD2Gglv3uEaEauTrI
 vI3CCkAcwj2S3QN6SVaq+gQFNz8eFth0ZhQNcqEnr6tM7eq8+FkG6wwGvVoCEG2TQ0VWTto4eHC
 OZNhwch8lstHDcZwOqhsPmuA0PLj0TUIG51mNsZ3E9OfpjddQ2PVwNnZrNXON0MhiwtNnvBTgwP
 2Mp7XNq90g/7kgWnUd6dG4628wgHybI9kclpLQ5Yu6Jgq+y3Te4cOz+SxQ0XOFHzDBJoVRA9kKF
 jeJPkLoz5FbvBVnWjBBvk83FC9IASfFDUJLHz1VtchsLN3/Slfrpta9+FI1cRtiUOyH+y0nY111
 Cys5FB7gpnk2OWi0L9bNKrwfd3ON15TZyWKicZwTjSlC/jSvSbuWCYtjk59PIdfEW7x4yZRMUH1
 7qa78dTS3AxIyMQ26ow==
X-Proofpoint-GUID: ZNEzVi2nat2-1wk7N51u5DT4E5QvuO6j
X-Proofpoint-ORIG-GUID: ZNEzVi2nat2-1wk7N51u5DT4E5QvuO6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXwIenXybt5bJt
 kr5FMZ1iH2jNkUZcd0yVHzF3dPF2hCN3VGOG2FVm9QhfAQ4QUa11CyP10zeqeXvu66+IhmkegD+
 6fUxk8Q5vsduVyXUrl9shwRQ2Yj50cA=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae19db4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-atq8JDSDYGcsakhjvoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 09:17:00AM -0400, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > A consumer that requests a shared line with GPIOD_ASIS never calls
> > direction_output(), so def_val keeps its initial value of 0. If the
> > line was left high, for instance by the bootloader, a later
> > gpiod_set_value(0) from that consumer matches def_val and the proxy
> > treats it as withdrawing a vote it never cast. It returns success
> > without writing the hardware, and the line stays high.
> >
> > The consumer has no way to tell. Its request to drive the line low is
> > silently ignored until it first votes for high and then withdraws
> > that vote.
> >
> > When the requested value is the default and no votes are
> > outstanding, write it to the hardware instead of returning early.
> > For lines configured via direction_output() this is a redundant
> > write of the value the line already has. With votes outstanding the
> > request remains a no-op, as the line must stay at the voted value.
> >
> 
> Wouldn't this only matter for a line requested as-is? We could avoid the
> redundant write if we only did it for such lines instead of for all
> unconditionally.

It also matters for a line configured via direction_output(), after
patch 2. When a proxy releases the line and restoring the default value
fails, gpio_shared_proxy_free() still drops its vote. The line is then
at the non-default value with votecnt == 0, so "no votes outstanding"
no longer implies "line is at the default" either way. The unconditional
write lets any remaining user that sets the default bring the line back.
Gating it on as-is lines would leave it stuck there.

The proxy also has no direct notion of as-is; it would need a flag in
gpio_shared_desc tracking whether def_val has ever been written to the
hardware, set and cleared in the init paths of direction_output() and
direction_input().

The write itself is cheap and rare: it only happens when a proxy that
hasn't voted sets the default while no votes are outstanding.

If you still prefer the gating, I can do that in v5 and keep the
free-failure case recoverable some other way. Otherwise I'll add the
reasoning above to the commit message.

Shawn
