Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179173;
	b=oXtFQXp7Aqrlo3g+6BSIYyc326tz/Mf7RE/VbPk8icKtQgEm7J6BeHh8T5mDbj/rhBJq
	 6qui0fKgmAqUSHG4zNNyj4JSbm3UmQVf0jXNduaYAPCkgcLSQ9vhVudc/X/vYfdvAQygh
	 b6mMc3BeP4f9W7vukMHvKZbsNcW8MFwHoXLKy2M3CkPZdIanZqzJy+RMknK43OJ5I7tsc
	 2OAzs5HyB0QJX67n9tr29DJb2Njguo99psqsDCYx1GPixsJPLjoXb4s+vN1u22MzUd+wX
	 JfC9iORhPyfiM5c6CH/1906cp9RVuHZ3s0ZWNT1vOmD6DwBVHuu8yONFkBp/i+A86JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lkqIlXNaGTbe6FP546gGNq2k4OGVES+Sftf7nHtdgMI=;
	b=jjENL6NXtuqIPoHiX4zkR68j5uPGyjqHAsJMuZ/6+VBDYiNgXlZDImKf8p7olCXlN4Q5
	 qWVzoaQ1iEsn1hW/MPO5Hjv8w+3sPnKibs/unNixynrtpwaR+IMfGPsjR9icrzNOdtb6W
	 5EWIwwP5AenDyGLFTHtxOd7WZIYukKjnhr8mKQgRjtnPLhK7kOZDhysTDRo/zJM1dxoDp
	 vLKCmsKywhvpw1wA/kEf7oZqbkb/SGABPcJHKtAYMqwIRL8D7FuqTCNida2JBaI0Y2ccY
	 JRDmQMBFTJPWQbXKtfnk2s0pq3LDlnPIeuNI3N/bbCODPgBQmsTBVu4J8XIXPIjs6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izj4in9N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvFHNq9U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6ED606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izj4in9N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvFHNq9U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JsAq611817
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkqIlXNaGTbe6FP546gGNq2k4OGVES+Sftf7nHtdgMI=; b=izj4in9NBk2sNUPW
	V/APHAJQsGuW0Zwhz1alTqyFMnG0fulz4S//VVjNY77nDVSEgEcP+/MbaPbWkyJB
	TiX4BxeaLiBHxCkKl7Diira7yTOisZufhPKFRLsPoY0iitZVvatkSlE6I5IEwoiI
	T4gLwZrxYO+gmqyu9cDwaRCzH7Py6YURkEzY+pumUwNRoaxfVKhfRm3g+JePRo2B
	W2ogHd1zSE/xWukvtWGhrAOJriFQDmhEMCFeDasHLFm6T6GehO07wZK9sdI/ug2n
	fJ0rPkXvEWncQNBE3zj/tObIz75NqUkGO+Ln1fce0GZlkzrvpDvxSQEcRTxI6sZB
	AzeTyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8nvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:19:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so102180885a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179171; x=1793783971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkqIlXNaGTbe6FP546gGNq2k4OGVES+Sftf7nHtdgMI=;
        b=FvFHNq9ULzAYwTRDBXVJPy97ha2bfSNuiOi1u7h0A8jPvNWgHr77zrQDddr4wfcx9/
         yGEXQkKL6OXNPxcXIohEpL0sJGOxnknoP5XKrUHTqVCHRYQcXXX/pcHtrkskrPTnjdXn
         g1YWtK49xUeo+s8ivOdlZUHiAEvAnqzhH9ABWzky0PN8SIXKGHuPgBgiCNlez8M3kyvA
         P10/KPNmFm5pJ+lro9jpxzlp78qZpg8cXdudAt0BnAiwyxrlt1M9r1Jsm+9e+zGBTK6Z
         vRtePhSRvR6X4sowzv4cmRzDrs74F8nfmL3ZL+Mr22Izj/5vzgU4+yZ/KHmwQ2kWTaP/
         WSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179171; x=1793783971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkqIlXNaGTbe6FP546gGNq2k4OGVES+Sftf7nHtdgMI=;
        b=hT0fCa8IfMAVHaGgY8/NI+bVXGuHD3GtUnA2U3IYLwuBuDbyvgVbZ/tea9ziflJIS8
         W7fD72CQdWrmDQh4x9nz4iwovP3k4EaGUnbm1MU7jT2puXTM+NmhbzdltTG7ym7J1Brz
         4dwJ95o48++BprM1+KK8p4WW8T9DXm9ORNJPae/BcZOV0DOFpv2ntwICeqBVHEeTNqAY
         U1eUprfNwQ7FZnpYzRg7/RwWdxDSnmGSQusE9f5QPfTPGBEfmGyGO+YrOuvp5TUNyaKd
         RNE9Zi7aNA0koord1JwzHOwpIpSDRntmnR5UnW6vKMjk9Q4gOccbxjzos/VwlqnmYnUZ
         JnMw==
X-Gm-Message-State: AFq9FYIRxjfx0FX3rCUHU4A4QuExG0ShL+lGzM52pncfadzntZ42ICFR
	hNR8u+QezLh5k3aHdMZ3hWG/zP5eNgEqRSmaNYlRSyGZ91ZHUSYtQnWqlCYDVCLUpoCHjGNOPV2
	CqohbgxPMFYokh2scQwnCFOD0OcLTBQORixjmlbU1XMaK4LcHSStpDji7yTCTyX1eG0AQqpRT
X-Gm-Gg: AYBFou2bM1EVXBGkFXbfCGdEUu0fLXAPcbiJkQWD7+ZJW12vpxKaYN0n5fPBsWwXj8d
	DbXQfzUmsRauKNt6DmIYXU1ERJc2IvGMGq4n1RZaLGvmMHDISvnrKgAW2vUDonb+i1utOuozL++
	Pf7hyfwfyFP7NmrlzN0aqd0AsummpZZBsgY+B7OSUsY+2Bp3r7dfVVwsYMApB0Vj3k8FJty/XDQ
	U49udSq8pdJIJ1DLPk6LrmLg34IT0d69yWqwrnKEO4GMh2gl/UKd+pd8L6TMSm/4jLZvGMldGnl
	5podKuiprK5q1qn7BLNrwYI4Zoat33aNS00qNHFy30Ym8ewBOmy5BXOOy1vYLaBPp6ZIBTBSeWo
	P9rYygD54X3OxGcmqiTcewdFeAEGCh7qXT1u2NDC/5r5iZWcqStVFgFWp1Y5rOUKXbwCbLbIQ+f
	6f
X-Received: by 2002:a05:620a:1995:b0:93b:bc51:b40 with SMTP id af79cd13be357-94408942f92mr242251585a.2.1793179170955;
        Wed, 28 Oct 2026 02:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:93b:bc51:b40 with SMTP id af79cd13be357-94408942f92mr242249685a.2.1793179170420;
        Wed, 28 Oct 2026 02:19:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm25765598f8f.56.2026.10.28.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:19:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [libgpiod][PATCH v2 09/14] bindings: python: chip: use literals for dict/list and declare types
Date: Wed, 28 Oct 2026 10:19:27 +0100
Message-ID: <179317915917.9292.14978294653624440462.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024200048.25987-1-vfazio@gmail.com>
References: <20261024200048.25987-1-vfazio@gmail.com>
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
X-Proofpoint-GUID: xWsPjD8jOQWEqZ1jjS09Oo9PoAhZxpMw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNiBTYWx0ZWRfX7B8xPx2SM2to
 cXKiYYYrywLXOIs9QaPfgH+3bzU9YHaV/x4OwW8TOaDrR97u9EwrjKIjXBpTDqraBtkzmxTJ0jg
 Hn8WC+goqmj7cuvH0Oh08hZld5K7YYE=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1be24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LLGI-aoDx_lfFdoSsfkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xWsPjD8jOQWEqZ1jjS09Oo9PoAhZxpMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNiBTYWx0ZWRfXzgX2Wjbx6qdB
 QM4vWr4uX/gllvl4CIAZwis6PQFUXsop56cEntAvELgMYqfhD9IZOmC/h79uWImI2K5vtXD+6TL
 lQ9MmD8e8P3fJREBUXFccMylqewvget3ZMgQd8LWifMaVBRzh0yxCcnrymqF+pc8y1mq4nKnfUT
 CPHV63gIqudpjdZ7kYaW0Z5A8Z0P1kF+L0U+KozxWeMcF7CjbELJOh1X8RY9PkvHwe2xyZ82bE2
 z36o3Rq5lAKL8JA95IR4666lAfk/Tx5NKYmy8agYfhJoj4s6yaRPgC8MxP35VgZBawf26rc6Qvm
 euypDn5OwM4DZmDiFLyGvqM94hfr6SMzcLA3NJDE+4BLmoZM+fXAJfy1uGF6oYlRoAx2CSDp0y9
 cb8EpDReaX1NzAmiVCHJBMasXc+I6P48jG/PaleLL6afAhdLIFugAkq76f9LzzBFJHZ6Xqq9ZoX
 qg50TQZuT6Ukb1GyS/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280036


On Sat, 24 Oct 2026 15:00:43 -0500, Vincent Fazio wrote:
> Per linter recommendation [0], use the literal form of the dict and list
> constructors. The long form is not common in typical Python code so it
> stays as readable for someone familiar with the short form syntax and it
> has a very negligible performance benefit.
> 
> While making this change, specify type annotations for the collections
> to reflect their contents so type checkers do not try to determine their
> contents implicitly based on assignments.
> 
> [...]

Applied, thanks!

[09/14] bindings: python: chip: use literals for dict/list and declare types
        https://git.kernel.org/brgl/c/bc08d15e3070c6c18617019f324e30b76a142e0e
[10/14] bindings: python: bump ruff linter dependency
        https://git.kernel.org/brgl/c/984547d54d4c4f7270bfd83dbfb6d46412bc362f
[11/14] bindings: python: include Python.h before other headers
        https://git.kernel.org/brgl/c/ebd9313686c221cf87c8b1b420135200670cf1ca
[12/14] bindings: python: advertise Python 3.15 support
        https://git.kernel.org/brgl/c/b82f782b6d1d30e43dae71073703f1a5769e2f24
[13/14] bindings: python: fix directory validation in artifact script
        https://git.kernel.org/brgl/c/c8fc2496ead59f4a5b3c9d1d4892c370447f8342
[14/14] bindings: python: bump dependencies in artifact script
        https://git.kernel.org/brgl/c/0d95a5ffcfe3f813984d3dec46bc714b328d95d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
