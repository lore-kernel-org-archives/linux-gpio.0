Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448201;
	b=jaSuqC8B7fXyUSKq+1RQnkW/57HznpMpMBWXXJnNOoKfp5kXToX976F5mnPYdcEyVXcH
	 6d/M2QjAfwtAP92LKj3b9smup4UNvy/tuQcOxLT1j8xpQm3zaTH/ms84VyrQRaxCnwZPk
	 RXMCmnnJsKRW+3Eb3oPB4b+ZCr3+DVP2xP7pMLbfP4DBpd7oFbfotFWs6Iv3GQx7DITGQ
	 fQuupUvVVPbE4ChENB+yUATA4ek+6kKofcjBLcakjzuFNGu/WbFFX9hFQlwpALtNRVt5S
	 z3NzeUM7tz124xQgwezXiXX5RJpd9hYX1AyRVIDTRL3T25lxFhMcOLlHs5pan8AuSDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
	b=aARQa68hkM788RHqxFr1ec+JGODppOAo7oOLm8lJEsCUyPC3eAbtHPZLG3q71tFQK9Yv
	 TbI2/r+mryP4XkDSgxPKs7mlATtCNFPW5eub0hnsNADFzevR3otlpWNap/OJpjLM09F5J
	 V9HP+a9/I18lsetNx9br9+rlHQQSJ1PXsVN/D/7SjTzlpb5Wbl4IJtDlz6/Q0x595GD4D
	 01U/9/iAzD04hdHxXReJngXFP3EMnkXIQpCVN9bD2qkQKR1DGwuX4pcwDvj2F6XC+ak6B
	 Enx29Wb2LOe+KNq7IUSG/nMFZoBD2mje3T4ekxjmYja3foiKgtDWloYxT27aMH78X0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHmAIdAk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAANYfAL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34F606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D34F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHmAIdAk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAANYfAL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKulZ3329305
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=; b=JHmAIdAk0Y7K5umg
	MotVtHTh0DtNfje87OEo/VTXdu9dqbwxVvkz+pnm0xqoSQZPchLOeVQQim6sTkGV
	2Vhi+JMU9hNKME9fVWEZ2S6gpTRICyf/arx49I9vYwyKdZANTOEacwe3pxb8FB/9
	MyIRFsCNvYNvRrAOaSjS4wQ6HDX1RH+OowjKVqv7Ng4+L87cgz33Guf2RzCicNz5
	/tG0pXxWTD/kEIO0uJb5Rq5ZHd8c4vdNDYI7JLsSSCU4OUYlozwWDlFSPWpmbxGB
	w7hc4jShv7iZ77uZDYGWleC/zLhQAq/AAcJPokiG35WEvq/WhgEwcVkFocnM1jLL
	phOAUQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd24dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:36:39 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4ed72293aso49258417b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448199; x=1796052999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
        b=TAANYfAL1pkgr76S4qvJTLlpZGRqRd6ZVx4uRWwl0/00G4ioGnacuMjhWNtnEVDiZw
         Ue4ASlHoRLm6YISfW5Ou8FhPyEibXzxXK6i9tOvnWzh4XLxAeen/T0xh2+mBq0QsXwYQ
         q8VMDniACdNrrPNfovojoXQd6kKezqWVZKlBUXfD/u0K0wN+xqmGk27wNIjBBGmq7ne6
         wQvPqKFpVmwYWPiAFgzVpOTinx4DdKiQ7XcYbByyAbu/oLPpx38kJg4MzA5bcCFtzPuw
         AjUT4DNJxlm3JhSRCA2/bFVqOgBu+r/RemD7Ggw0CQXRZm1JioqDNm5lVhw5vvUNRRtb
         N4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448199; x=1796052999;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
        b=y65ArP6gQQIKqK3FuWELaPOdsH3CLwlTtWgA5wnJ3UihJWMKleNmvmeI6phPYCqkvq
         uXWIXQBtKU2t4aKgk3kvTaPz6D4NqFeSLHlosWLpWY+RhjREV4i9SdMaZXsHmQZPdWys
         UIpApltNa+B+4EQR5xJC4/cK6mbIgRdRDS9mpApZEVyK99qTJJwlqmbhCNhMyapEw23J
         fOfVy+vWaCClYgUKampF5+sbacxb7i/gZMpZZ2GgFz8XvCGMBJYI/UKOdrwf+zVE5o11
         ArYLCdAlB8dfmJIZo6EZ67vMjtwkKP5gXeQfzBcfqVpKuoJlTvK2wKsRgEkMhqcXdIw9
         hcNw==
X-Forwarded-Encrypted: i=1; AL+hErHzFUfjhIdASPPwrO4A8asgO/F/1WhFOwLq1xLmlUw+dfSkBXYoPozuLlAYtzTnecwQ2jhlf9YJkp0N@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gap9Uf/1iUaHW4lKPGHPJVrNTZcWdyNIwxjQC52FdZHV1VL7z
	SrM4W1/G+Ac6z35udnSl0XIec0uhI2wao3KbikFWZzwLMHIxe5QDNg5uLDhx3W4ajl7tCQPRyTd
	DTKD9DXtLrP7xCf2JeWeKnntiHDwIZgfbULUQdH4c+PdYvAC784Ye/Wf2nJ6lxDPC
X-Gm-Gg: AZFdTZfSpytsfiLif2K8SeVVeV3J2h8fMeE8aiDcZTm3E8QnuppXnFJeS55ZRSq0vrL
	LwdTIyPaqhWRWJW+2d/PhMiU40d7rdlM2Xeh5FH67zeIy6FvTc/qmd0iKWSnt8WsVvHtWtoVlbt
	T07fEP9Xb+ijrM5JYoN6HLiIv2+JbiGLYUhpBCU7YPKwqtdQv1/nMGWCMhG2c3JYovk7C1WDspz
	17AiNwc8CoZkkgZbNtYReeNWJjBgatLqYFQDADeDQhiuQeA4Z1zuPCZlrxAFrTjo4ZjEtZ8H2fB
	kfDDBhpGEAuV7Sv3rO54PKEnar3e80JSnaT8AbGuozTkt1+bH7fdVlBMPxPv+N4380wDsmAT2Yh
	+7KhB5AaNwhGUu7O5Q1GY7MnpG4TDr4hKtukzv8NVgQCCLF1vdwSJRcAuySWANY2a7OP3oGvPRq
	4Xwe1ha7aZtErhNVKwaxFEDcTw/QmCksmUf/BgT8f933yjCg+dj54wFGj1yq21bA==
X-Received: by 2002:a05:690c:c9e:b0:8b4:e95f:d20d with SMTP id 00721157ae682-8b520435b7dmr44457967b3.25.1795448198785;
        Mon, 23 Nov 2026 07:36:38 -0800 (PST)
X-Received: by 2002:a05:690c:c9e:b0:8b4:e95f:d20d with SMTP id 00721157ae682-8b520435b7dmr44457837b3.25.1795448198396;
        Mon, 23 Nov 2026 07:36:38 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22903514f8f.41.2026.11.23.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:36:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
Date: Mon, 23 Nov 2026 16:36:35 +0100
Message-ID: <179544819292.86961.11905467964163223654.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
References: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
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
X-Proofpoint-ORIG-GUID: 15fVkVjNIfXbmUmhwsgdSIZWAkVxcBEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX8J61rJ0q8uIi
 N9un6OXjqii0IK8ctTUPmaSn7ziEcxTHrLNmAu57wj9oMi//9/lBK5lPYRnUgzDpUB7lDdqFXkw
 UkuiUBpnesb5HUyf/+PDPwRjURgMbOlAIXXbUxpoBcyhN3VC1l0r9N3phB19Eowh+IF/S+vI7ml
 5C6iiPlMXn+cpwzAcE0cNpl4fPQZyQZQPO+EDnuDXITtk0VXKNbBvui3YZlJaAK+Zyr/LukT7G1
 5iG5UwTtwx70AGptcP0Rqh86D7/9v7OnYTylPfDLAvXjT3H86YVrAdpcYB0HJxoCkPefa/rsrhb
 klyubnnFnJOdLh0mlEUvZmF4zAWzNpZMgp/HSjiwtcLmwInlP1tNDAS/6ZUNrO3j5Fb4jWfkhI4
 HnBlwCzOInzGAUnOUUGbojbfBUcfSXeOlmdIj5WBdJrQpaPYHkAm24Qg4juebvH0k/SJZ6+6FRe
 4wNsl0hDCXZPjcuzn+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX7ibMMWTr2P5+
 QjGMZe7MOSYmG7V0E+2IScqQEFix8i8SW39di25A3hVmGh/ocLpE6P4zsEvTdjEfTyhFBonbozD
 kOkFGYRzb6r3NrNH1WGmrn1ZBy9xCJU=
X-Proofpoint-GUID: 15fVkVjNIfXbmUmhwsgdSIZWAkVxcBEX
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045d87 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q9h6UfjCcGEWxBkGLjAA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062


On Sun, 22 Nov 2026 01:45:27 +0800, Chen Jung Ku wrote:
> Replace hardcoded function names with __func__ in the dev_dbg()
> messages to fix checkpatch.pl warnings.
> 
> No functional changes.
> 
> 

Applied, thanks!

[1/1] gpio: amdpt: Use __func__ instead of hardcoded function names
      https://git.kernel.org/brgl/c/0e1941b7d0b0a0405b16567678a9bc3b20be6340

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
