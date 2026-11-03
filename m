Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708880;
	b=knn6N1kZqWqTVjF4lObzmRHwVo7A1U1p6brb2uLzboHNKDEGhjoHZWtT3OvcHpPPkW1u
	 xtFMIMOQTCST0YfJXxU6XwxAcxXrSHGbHKgNBXP3vozeln/TPX8eCL5Y8ElznKR88mZPP
	 y15i+TBO4Ypy5d83DtMbMs8G2oy7fYX4oWqyGmTQqhCKPtIE2yDf69zpd9GX7m959t0D5
	 JGUNwGN+M8wOpVq2boxdo9Pa6bX/VNcMUSxVf9FSX1qH/GEGHhcNNR7t0Xr2igiP0v6Z8
	 3UO2/Hy6S52H6j75+5uH7J0T7FgAmC25OcQcsFwhCZEm8pz+Co+zdu/uuhtmOSiOFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
	b=jFohFqhx5EP1N9oV+gjJeE2FeU1Y2+52O09M9Iag4/H2RXG+nzHkNQPpgLn3tHoxiwQ6
	 eGJGylKfyb/1tYVferbwvkTBZwsnr91oqECgdL64LlW4IYOcOitcJOeC/His+UbOMrKjz
	 CUMTDJG1xwjsqjfgQcrT/D2W2UcKp/Yy7cK939Q0P2QGgrKmLwxTFg8SsEnzwjfXJmQcp
	 ApH34oG+29P18tmJtN4L+mwKPoQLuoeeyvYEIgPdDklsJ0KtbwHvYNjhCNprWMCeAqucP
	 pdZ5hD2ODJyPxy6QpSGZEBAaKNODIBELuVWcHJLLNj0P+eXcPgDJwKqa/ZrFdJsGvjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VhclsXH6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1VfbRAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886B606D832
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1886B606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VhclsXH6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1VfbRAr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CP7Or2848012
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 12:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=; b=VhclsXH6+Yv91vvl
	EovOPCN2eJHAfCD21gEdkn2kZYuhYi6kBl61YPaDGYQW6bQXrCOOnfxjuUPTKCq9
	5GtQxDtwGp0IcxgS3S0Dy0i812sgRwDh+uyPNRdHPY9vLAiLEGus0uIP1IUiXQVq
	c2DzhlU9pQ6ySXp4/munh385bNNY3EnYG2Q7zCFCVaoSoK5FeGq0GTaP1VS2CEMU
	GOzpSOkLFXobu1kGEpRWBv/OQuTaed2ZDHUE+rOazxS2UsjN4EGqzlZ4EBd2DkyM
	E6Azuf8OF3QIHB4Mt1JTlar+vOd8ww4e58KMkJdhTaHbH3UiZ9CLo94fqBF7BHY5
	fR5HDw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873p40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 12:27:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99081ea787eso3272808241.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708877; x=1794313677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
        b=T1VfbRArcKsKizfIpdLl7lKFSM/CUP/KIbyAc2zR6YIGMuJ8NRgk4grTDXLEVt7vBq
         9Nyo3M81FepRfGx9MJGb8kBsNALSv1IgTI7pdXNzzfIll4IUmkErpinmrgvZcjXxm3B/
         laJ+udEMrgXY3WvmZ+mJBhDe9V+1KyEbmBS3Gix67TkQcR/hjE2dgKj0J41lc+LsohdY
         DdqERsG4zhePD/a9J673qYBbC6vsHqV8a7trDNU2wQxUkpoPwrzMiNhjty8mEY8VGma1
         H0OA6+e6Gnxc8C+FfIUpBHr1P/6gKzQxS8dBfB0EVDbjhARwQ/HaBlPITnknyWSuO/8+
         I8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708877; x=1794313677;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
        b=gnj/KHo1JLYmTrgoS/+JVzIi8eSj6nPOWvRU1EgVlZ3HdNcBcqD5gYh5yWASYsl/9+
         1JXrGLZyCkG7FvR2z+1dez4jAmrRFsf9bgB/VDd+xnL0I9cYpZnA+QlBk9Mj15We4iSf
         RXvPLGrNYhj/Iou1135EWzw2aCUVmhOnsoNlORU5RbJOAeea2BGmxb+O0mJnl0xpel1d
         73p7Y/vF/AdQHtlEi4xVbr+tpGK8+F2eZjNOaR7+6ebRT2ysMKBZBhQiKAPOfs/umoB/
         L0pSQLEg9c6C8IENzL0tNpHgPugDCCNuBeWw3GaLt+bF+F5lVZDzAwU3wMery1yuXJCH
         bTCA==
X-Forwarded-Encrypted: i=1; AKwUvBxPFdQpLrVzKfhX2e00BnXISmIoLUpbjRmD/cLu+NmeFj0lenn4n8tyuX6Gem8IYfpg7rkeLrhsrpBf@vger.kernel.org
X-Gm-Message-State: APuU4Z9YwZDcqckZlSEmbTdDECZKVCtqUDwHL8uicUmBCxfRMH5nF37t
	cUvizKEiugz0SuMjMN5ilohBTCmw4sjGWv1Ekc5VHFbztVu6AoP6OSpSUNxgtV0G8wBd6dNGbPb
	IBVeu49z4Eb/jsPy9aGsHL93xXB2NB6g6q+jMwlvlyX/Az4YHujPRyuI2PGkTCsVp
X-Gm-Gg: AYBFou1rhjtGIanN7kJAheAXCMbYtGDgOs/Hx1CY2RbFT+gTDdbuKA/GXFqxxrR6sQb
	QF53T2XhYrcM4lg37ojzeb7SbFWFB/zgsqii5nVsOnKWI1s34tphsFpj7rorsaNgoFTHCOp46T9
	zDbYVD9ZQDsYp5Lb4e1cAVumb2ivf4FkLDMXA1C4yXCsYhdWBiylKO3KjOsJXStmp+jXYsbglRZ
	2ow8VS1ysZWB+sBCtwfZau6hB3u5HpnRvf7fxthn9ilEUdl+XF6qsbs3teKWA1ZPogtE22DVIR+
	RsDGkqU+/a3vinCkNd1Tt+67LRYqXw7fN1h7EOVRpaTWqYY9/gGe4TSjR9hylA1tBZwu9xRRnq/
	qUYMwvBH8QccwVI8GlbZa1i44FdqIPNtXX+5t1l+uJQznGg7UfPqie4WKNrov9WGfpoJpG8AImT
	wf
X-Received: by 2002:a05:6102:358d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d072d5e4a4mr6184611137.36.1793708877312;
        Tue, 03 Nov 2026 04:27:57 -0800 (PST)
X-Received: by 2002:a05:6102:358d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d072d5e4a4mr6184595137.36.1793708876792;
        Tue, 03 Nov 2026 04:27:56 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm23906739f8f.29.2026.11.03.04.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:27:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yu Zhang <yuz08559@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: remove the debugfs files before freeing the line data
Date: Tue,  3 Nov 2026 13:27:53 +0100
Message-ID: <179370887056.27597.16992402623638417415.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075707.41742-1-yuz08559@gmail.com>
References: <20261102075707.41742-1-yuz08559@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX8h5i9FkeZIaa
 XCSEvz+UdcVpthvWF3uFrWlIjTr2nRlUitgLCqaiA3uXHQHeSDel6DOtpf3etbeC9a3IYuefiws
 IrUgmThWpW78bYkL1PLZF7j7DKC78KY=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9d34e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=J7LRkWeI4YL75y-5Oa0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX5qypJDb8fedb
 VUS69FHwC6+pxB6w1vXuoLTejM+5UtvaR4HaR41d8idMDpTLPVwfw8uzvsPIIpoL+X9r6D4+1YE
 QFmjVF5QUaSb6rH6BTArEikG/ewWuzba/Juc8F18rO4Mbljkk9FVkAZxp8a4SGLeCrcfHgBXosE
 OgCETbvnVkhv46ocaoq6LTXvAyZOFTtEztm63U+fz+5cTz4UsSQgZ90wLZQkrwfYSc78Z9exUD3
 trBIk5wbKOt6xWfX/qj4eDFPQ8k/+wrKMgjm3MRTuxAv1NYHZqJPpxJnYOjaEs4/0Lz/SjeiXTr
 JZBB72uMQCOFDV0mMWrAgWsSrJuuzz0N6Ibn3TjdIDB6+/DaTfrJh9I23Wc7sve8woL3xLMuBKN
 wU9vZ50luQ8wiXBzV0+Qg0ItOf68kj1XX/a9Dk+ZBLjxpb4BXjQirZ3EdevRVaD5kfXasRYjkc9
 MZ6Eci6B2tgxrZpd9OA==
X-Proofpoint-ORIG-GUID: aYIfMruto8jJ144F7Ww8O6etWpdRTeMy
X-Proofpoint-GUID: aYIfMruto8jJ144F7Ww8O6etWpdRTeMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030049


On Mon, 02 Nov 2026 17:57:07 +1000, Yu Zhang wrote:
> gpio_virtuser_probe() registers the devm action that removes the debugfs
> directory before it allocates the per-line and per-array data that the
> debugfs files point to. devres releases resources in reverse order, so
> on unbind the line data is freed, the consumer_lock mutex is destroyed
> and the GPIO descriptors are put first, and the debugfs files are only
> removed afterwards.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: remove the debugfs files before freeing the line data
      https://git.kernel.org/brgl/c/c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
