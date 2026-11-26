Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702466;
	b=ZFvXGofPg3xr3HGUTxd8xBl8p0p4rNrc4MhYywlTLq87Ph9XjXNeCQbI48HUK/GZPdD0
	 J332+KSc0aA85QpF1Q4fiKI0bJG/51NhMPh1JD/Y40W0ZSW91NHmKgCs981i07SP8u4sI
	 RpggiQ5dnehEM2v9A5Zm8xZvaX6Egjqx+6X0H4coyJ9SGHKu4yrYP7Ani2OAVw4HXNDl7
	 3sRk1UXQH10a92yyTuOJDwY3S0+PAQum6iAxlWYPcwgQ1n6rTwp44peYjucFdZQtE5JgG
	 aujGY7Gz7uaqbV7JKKEfgUIE6hPL3aAbgalAKd312OWZQRlfHSt7Y+I6h3RZYf/kYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
	b=N+5wGPNdWK4QiO1gmRo/SR7TfcsVrKVI3AHw/BR9cV6D46l9MOvUerY5CgAeQyycjISw
	 0byPHR+vB1o6te8omFUcbbkwLGJTgN2udYhSExi/fm4LrNy94gzxoOIuqcWBHrbAqBsK7
	 SRo/OuK2UjWr8Ejc+axpDfUWtU1nfcFlu1qiVYrGHeZC5OvKMy5mFyAbGRdMoKnfumRUb
	 e9uc9eTXOisjdNyaFPQiavk2VGqbffa9g1/cmQRnudeB5NQ+SbqUKezmxgi+NO4MeSKPF
	 M55uqx9/LDFmksBTzXecxS3TrKp+zk1XORspPSi4qdNcjRUg4oJRCnrk6KDL9VCzqDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfhgYxiJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBFzkuXJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DC606A68D
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42DC606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfhgYxiJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBFzkuXJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQwI2785104
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=; b=LfhgYxiJFNqGdxdX
	YorrbJ7nybNBDZlQY+/KS1HZHhqV+XjewdU66K3GK7aLZDJS4ts4Dk8TIX2FG2Q8
	c2KLPfa0jEyJwcM6zzNbvsv0GZc5ECxqwENoUkpkI1TUH2YgNEomsPqymOB7Yg+l
	ZSl6x5o0wG5BA/JdR2plXDtd5CYZP6/GmVfCmX+fYrKQGUIrUxQB7QstGyRxJTfO
	yCWCjbftmB8rHkcU90FwBY6Hme1KyCDozsDPw0dhlvrK3nSeRUaQkhhlFJHfLD8L
	iM/7A6TZAM9hqC0rY3bQamwS/3kuqZ1hH2XxDlHJLmfNg/B+5JHJJsNobdDdEBcu
	Gi9Lnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb89x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:14:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so1185584785a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702464; x=1796307264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
        b=TBFzkuXJvtNfF7dIK0vyxU7GCWP8JPXJ0mfptZKaCmio4NDsXEwP6vS94QsHtHK+RH
         FhPcMvfj7sHrU5RoSr8LOHY3L+NDiqX7mlXBumBF5amHyfKJYNXGDeKWs8eE2y/PvVp0
         1JWSF3pmqZ+8G2QdyXmYBsJAzH4Ew29m0kB6Z/nMYVXfucNs0clMM09dqyIFLCfP6QLq
         MRko0LN38OgSur+vVSsIEBXqZWPMf9zH5LOKFml04oYeYuVM/anbcDEZzfQfyqhC3Upx
         kTOiNOrwwghwh/ntQj3U//y0GP4/3a+1RsTa9hb74tSfSfM7F74zdp4avgkwgSVNgIHg
         V2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702464; x=1796307264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
        b=GViF8Mo+Y8Lza+Ctx72i2f/guez80g1EQ1Egelz1U1t5d1rd2IrTPkUj98xGtrkCcL
         hQWKiXAjR3mBRcr4y0Gb7Ag7Xq6qzCH7+Kz0qn0y6s3F8SvRGKO6f9TK/LBwyuhZGDB4
         yVZI5IgRU7TmO39SXiRcqVD3gyHSAOhd3yv5lO6iPvncELRi0OogCwIf1xMqQ5Kgat6D
         53cVcgUuj6jHofZOjhCNi9efdQS/PvWkmDYEpj+PCIszojCG0SMcSh/MugHW1uqkXuJt
         pJgqlWVDHtS1ort/0tNEgqiOXd6XZ2xFVsucsHndp8WSMIbUvsWdnqOe6dyCW48wYyZa
         slWw==
X-Forwarded-Encrypted: i=1; AL+hErGxNCwwwblVJ5/F54AKu+xYo+2MKaTb89Hf+3VQXH/G013dwKI4EvgaZI83FcTv4psRkAzLQG+bWkt7@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cj7QAFcK67vbjWZslzHEQqdAup8ck9GTJrMDaUVH8rFzGDNII
	rYVTu0IlcR8m29YPjnU9RucmH+O5HeiSgRx6x+bPpJOBvF4kzWFtJoRxqDIwE6FiAgL0RftvlTA
	nsH6cCM+BJnfeeobsii3utSA6EilKJotUqtf9FUVZQQI/Lo01QClCvr7xZXmLMW4p
X-Gm-Gg: AZFdTZeUaApbkJKmdlqTJ4swKoA+LVjiQowdlc18uaeEsDSG3BfpNFUoj2Kyi7zAyAt
	wU3MnpIN2Sxy/xeCWYTo5MrjdUkIss63fqfqBNoJ+fMB2bO0c9V7f3Uh+jn8PZoDFMnavp87Yp+
	uZ1+N7oFmK9kdqKwjR8T3NvBfFg0YOl77Ks4XrHXu0Ned2+Ez4WzWDbItzdbBPfZ/RukofamVto
	uiPGcuYSLpjgO5bjVoeBwgcjNKAZa8gNskDa7KTGZLAh7Wj85kAm1BipTwY3yFJxsjMHxE69yQY
	AcDHFsyYtvVvuV/5Eb1r2JlxzHTaT+e06kE5AQoDvAvZTtSc/DON/ak1OR4bz2uQDzwV2lQV9hN
	DLcJi3wZ60KLLxGgL531VJ2NlSCiNBlvCzYD+9u90zx3dziZY0Oe35y0Ujg2deRJOJb3w3108Yp
	lnk+Kk0toZODnGZoBq/LqL9UkEMtK7pzrBJvmDQlo0gmSx1fpcaMhtyZcAHli1pA==
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr3713802585a.32.1795702464029;
        Thu, 26 Nov 2026 06:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr3713797285a.32.1795702463576;
        Thu, 26 Nov 2026 06:14:23 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm18305812f8f.12.2026.11.26.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:14:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: Unify KConfig choices between clk, pinctrl and interconnect
Date: Thu, 26 Nov 2026 15:14:20 +0100
Message-ID: <179570245889.22980.13720050976779642192.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gYUe4eewDe_Y4x1O36Jkvulf0DfKu8Fs
X-Proofpoint-GUID: gYUe4eewDe_Y4x1O36Jkvulf0DfKu8Fs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX54/Jfom+gXpN
 UY2TKflnQPN6TuXlXiO+dIvJnoDh2JvhRkPzZKAxAtX7xguUD7hUY50gt9J3zrsHJutnWh73I/8
 Uwsk1bGUKgHREco4WGcKQ6wZPlfFHOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXydSSCrX7oUg0
 q+g+v54uGIkaRpRov3oFQZBuU31SOqoYeymbALQVAV1p6j0RvFLbVYkqmRpl3uJ1gWJUowAvfFL
 jtaYp3DRvDouV/Q+r1h4Y9z9jNvriNxPYO5UKKyKgUvu0jZyhLV1sH6bl5oFZkRGHVuDASU/0vs
 h0+tSj+rv33VIK8/fba03s7P+VcDbXKEa6oTdp82biLVL3WUIqUEToWnc4+9bVpbbwZmHLBsZu7
 00OxqsPfN/LfTOYA509/7KUIxQIxB25LWwv553eqfMUtWql6dVOD6SDbr1+o6s/Ek7YHrmGUfd5
 zOTbg3xG4F4cLhWyDvqLJKRRsXo808fAGanN2bt8JQ/EWS4Pf9z9zHd/5H8RHANAK4ovIozymHs
 ZLF7tB3XOp4XZgYsFDCWtppG1kfbgSRTDqUS7M6Of30mR3UzDXj+19V7RTk8YsozbtUvcf2SfKq
 Apf7bYLYWb2QXF3CDbg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083ec0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=okmazTnOSgZu4-ssoSwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Mon, 23 Nov 2026 08:44:45 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #3: Do not touch MSM8996, because it should stay arm64 only (see
>   clock patchset)
> - Link to v1: https://patch.msgid.link/20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com
> 
> Recent commits adding defaults to clock, pinctrl and interconnect
> drivers left a options inconsistent between them, e.g. SDX65 clock
> driver not enabled by default but its pin controller enabled. This
> should be a consistent choice - we want by default all critical drivers
> enabled.
> 
> [...]

Applied, thanks!

[1/4] pinctrl: qcom: Consistently restrict MSM8917 to ARM64
      https://git.kernel.org/brgl/c/272820c2cedff7102e482273ba6b717c25cc4a22
[2/4] pinctrl: qcom: Enable by default MSM8917 and SAR2130P
      https://git.kernel.org/brgl/c/b7394b0aa8c7ddcf72d16770438b1e7890507c3d
[3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953 and others
      https://git.kernel.org/brgl/c/67bb200fb9ae8629cd79851ae4410267865df136
[4/4] pinctrl: qcom: Correct indentation
      https://git.kernel.org/brgl/c/d1e44b75cd10eead6750f929e3cf68febab8586a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
