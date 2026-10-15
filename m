Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772B4E36CB
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065947; cv=none; b=uBB93BuIoXrQTJFYMX4ZMfhYHVGr6eGmb4wS7zMk9TquV99JIKASiu0Ug3OdcnOTZK4Gs1nD/W4PuJnFYg3M5lQzBO0fFJBpDD1gPsNgIVNIBv4DPkcppnPqcO4IYSX3SP5OQzECiwH5MrH7oFr7fK7LZ2VYwm6fgF1juwyUluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065947; c=relaxed/simple;
	bh=UhZCuoHKFO6/SHXSdGSbs8xir+tWBEiWJP10u6bQKFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ji8jYuLnUJ4SN6CQCNcqyjc9dgPSMuIViepM0WhNKrs+rdPinsOnBQjL9VOcHgm8PXdk+VDJ5/d+6WsNPb9q7VT19EwPlG98hOjvKg3WkKDTpr5EjGVYIhMqjq+lEa1pFlIVDUrzAoPQHoHrHbFzjer4NLT3uUURQG47rFhmP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvskOuUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWjPq7HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvskOuUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWjPq7HA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnwH3408857
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=; b=WvskOuUE004BD3dr
	8gQIVyJQBCklqtnijUax42Qed2ZyY98UuMcjanIASH4x4u04lDc2F0csXU5xZOfU
	cfdRkD/hw0Eypn3Vc5iXrvQGBqL1EihcdnGQegDy5tfHwcU/aY7WehikMQzyEOSu
	dfJMHE/O9mDz4CRI0omUWumREd78ytIOFC+xJjsbulbDE/yUX1+MWLp9CXOkGPj7
	g8se4UPuyC0AyADBpcUqN2TJpTq/9wfVpNx6ctZ5nz1K53dSBqdFaqtwAJhDzvfK
	s+HaFs5ysj7tfGNtioI96zq7F1v2oCIhjTOH757Z/Fgz3+k5G7qz7TTqHUFmF0nZ
	+2ChQA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2n0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:05:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d6105ab658so1309755e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065944; x=1792670744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=;
        b=OWjPq7HAULHL5V1fhnwsY4ItZ2L5OLFFgY3wRgMRqcXngGtQGX8+FehkTcx9QKLcHC
         O4v6RTrtcNS48QHpmPucte8yiCdkIpd6p/fvQcVLlOeWP2fPJRjI1Gl9sOtuCXzFcTsD
         skGjthOw+V0AYz15/Rln7DPSNHkNlPn5f6bYCrjkpBqixMjMs+dbJMCQMZOgPXkQaFAv
         oFovv0+a1yEzO8DADeV0NBBV5J/f49iZ9mYbSXDsyzZvmSHcbHJiNoZiGufuoK0Xkw4U
         JdloCqWz45TOt4Vw8RE/DPt9Sg2PzyykWOzO3ulyJqVGv3Kuz9FFHtTWr/uWh0Y2OUUZ
         XqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065944; x=1792670744;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=;
        b=JcvSFzAsz4/EJ297k01ZPzy5pmF4gfBgVT1RZiJKefjwKXe8kt53intxCZL87FKjDD
         NRDhrugDwubGujCnhaxNuh79lxLmh7iVMuHGHsnKgM4+8gzUgdgMCIFfLFowv4OiyjRB
         rFX+calAWJ8O9CKAljxr9HIC0rBecBlEr/DfCQF3AIkV0EFzoh3jcadvQLBEm3U0n97s
         2ssp4HgEQiFpNeIkXsQvkNpeyVChHL5eyZo0M4y3FZc9DmpNxHKJDqhCBisOEAVsLu5j
         LntJZEoPFphEDZpG7vR4dJgE4ApYIv/BUsBTeLJFd4O8s3DqBlW3pTtMmlEbqlOjbVbr
         qnaw==
X-Forwarded-Encrypted: i=1; AKwUvBwWTNbuikf/qVTcE4Wp5VwP3HBlpHJCSVrBJR1ZMl2+x+YRgfOrikXG2Y2QWIkF7A/jyKnQ+IGQ1AIM@vger.kernel.org
X-Gm-Message-State: AFq9FYIOnkmt5lklHIOkZmrBTSWZaTNAJmZbs6EvzKt3tAEPlIVANSF1
	+QdnfxLgKCsz8sltsDpiKE5++Qfiku2HCd9bxp3LmS9irfVbyVa0hF7EVjKtfI55R8WMVhWGPJ0
	KK4y8WEHdp0JZtgyEcugQ07Z1A4N7w87zWk+7kamRBJbbYeN5WQ5052Q6rJg+Jx64
X-Gm-Gg: AYBFou1gwBwbUTNLoavhXh/Zr3Ba2d8jMbKogUvS6do77PAysUpyLvse7uVKUAY2hx0
	ZJ8cgihCW/d22/Ney9jozSz6sO3kQUEn9FXCEVSBPkX4ltf0e36zUAqMu0pwAzFfxRgzjNU8+uY
	EfAChocB/J6qrCSz3j/NY4d7BVWeJRnHZEdptKxxWHDIqVTvXC5MSEezBq/wMBOlMisrAMi/5Ct
	Kuth1WuhhQGtUulW45N7SM/ttqFaYUfRuYcp2qwC+LzYYGGB6z0KACOS8RPnjufwDaFecxOZNd8
	r47BUeCYucbn0rnpholzFfZBY/08FhXWwkkT1FXMa5PmHG5p+luWV6JTTJsStA8OA6BwyaWL7Rq
	hYpndWZxuD942yrmv05+GaUZWqnc=
X-Received: by 2002:a05:6122:a5c7:20b0:5ea:4ce1:95de with SMTP id 71dfb90a1353d-5ea4ce198b3mr287182e0c.2.1792065943955;
        Thu, 15 Oct 2026 05:05:43 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:20b0:5ea:4ce1:95de with SMTP id 71dfb90a1353d-5ea4ce198b3mr287177e0c.2.1792065943496;
        Thu, 15 Oct 2026 05:05:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd5e9dd7sm43316775e9.0.2026.10.15.05.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:05:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] gpio: shared: replace platform lookup with dummy software nodes
Date: Thu, 15 Oct 2026 14:05:40 +0200
Message-ID: <179206593570.9466.9314765423671491807.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXzHnh1WWdqmoo
 xphTAjahbmmSpRGBR4wC4pGDFD42aCVwCLrcStmsF0MTs+4NtsfXrOpkgYD68Bi9DuKXvEO2zMM
 DV0QAnNQEDYQudbAiwwDjFj2Mtvue7zeCRON3L5qRtpFigqo+UI4bdqH3Qwaz5fihoQpkBuJrWp
 jUs/iKSHt251JHqSsB4Nq7XolnArelEd737sLoyfPk9wRzQJlpX49WUIsyF7I52aMgHZN9lHICn
 Wkgq/ZqnzCz5xn7ADQA+0o4tVjOSDGcKTfhila2PIVEWwjrKDmZpQCqfNl8wTItXwi2z0ItZdi3
 D/bKLEl57VU6kv0SYSxEdG3foD94a0dLYYRq1xOoFTq4LB5db+G+/e07Bb1wjlQAqgxBR3OfHgp
 K3lGyhS0aA8CnG6gVH6dMv17ZaePHiSvf7P7OcMSFQFPtxfmzjoTggIj5rMvBWx+RJ4euRo5mMS
 BEzlB3Uqn/xTKsQAHvQ==
X-Proofpoint-GUID: bC87zm47D7iGSfyb5YCo9BhMhjZD_nQL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX2VcZXp+8OmZK
 ahdNb17ftYBtGwSwnNESqn9SOfbD8fWo5DG02a1gQGqJPJMxtHwrdiGmUSf8hNhv9WOPKez+naD
 m7y/B0RHh8OB8EOiMl4A13hTmPJcAA8=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0c198 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p18oh3DA-0Dk6BgrZE4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: bC87zm47D7iGSfyb5YCo9BhMhjZD_nQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150048


On Wed, 14 Oct 2026 11:38:24 +0200, Bartosz Golaszewski wrote:
> Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
> shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
> for shared GPIOs. In fact: we trigger a NULL-pointer deference.
> 
> Making it work requires a more serious rework. This is what patch 4/4
> does with 3/4 introducing a preparatory improvement.
> 
> [...]

Applied, thanks!

[1/4] gpio: shared: fix use-after-free bug when adding shared proxies
      https://git.kernel.org/brgl/c/bd22f7e63509fa758cf500d9af3e88a3d3df96be
[2/4] gpio: shared: gracefully handle no-device lookup of shared GPIOs
      https://git.kernel.org/brgl/c/cf73c3fc03c43a8a86fd487c62390b4744eff9ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
