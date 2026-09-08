Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD42192F4
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852816; cv=none; b=BDtXQgYeJUJPgtjCKcnIAs8MGkD4uQIlkykl9pagr3G8wQXhMR6H0XGzbtlULr2lIG6VfqZUt4rjcS3mL6akuTxkkRYHAAE89pBnZqFopa8AQXw5oQ7WydvGI8qjqa+L94ooyDl8FZgfiY8V4iCjCnIts64W2moLOE6RyyfOY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852816; c=relaxed/simple;
	bh=WyEiKwbmcVktQiUtPsSA5kbuiPpc1SzEgFhYJd1kOsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CPinIViqquJRt21/bGSgbQgGfP9K46XIhfIYFJogBxXWMR4Vy1lePXkSrI41K6RwVzZgYP3tEqQc3/ST1YMKwHdXBf8k1Q5CZTfhthpJzpC//V5HzCMNNZsqzDpnCgFSdbBBcSPMRcuS7qlTVx0jGc9VupsW//FfeIthMR/OiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsJZkG3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bACGaM2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsJZkG3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bACGaM2x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M3Ux2072795
	for <linux-gpio@vger.kernel.org>; Tue, 8 Sep 2026 07:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAVjKTm4Pn/HKXCZzPP0BGVIfDLnFhavf3k/SnjOgsA=; b=LsJZkG3ST6MAMuPD
	xeogie9gEkfBjRjMe3I3uwRT7h+TKlOioJPFBgyMnEWIdxTOVI6JiuWh6Ur+tSG1
	4jaA7uUHg5dRrii5ziBT6o/tIkKgojgfICJZ3y0b6BMek8gAcO79+Zk0cjPOCg7w
	9cASbTxpQMXLjySmo4ekIpf7/mNbmh5wDwopMCO18W8QuAGEDFT2MGFT28nVu6+J
	7DpB7Mf02s8hNvjIYVBrNrBnbugMHaqdZJXAIxs7VWBecQwHt3C/eaPbJ/xS35hl
	/B9hGAZn7Ja8SK0grR7MzAYtwbc7bEGQcAXNGTeQlPB4C/4VsDzs3mHPJKk3VyZY
	WyCA8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfymc7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 07:33:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso830240085a.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852813; x=1789457613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAVjKTm4Pn/HKXCZzPP0BGVIfDLnFhavf3k/SnjOgsA=;
        b=bACGaM2xXo+m40Nt+DuUu+Niys2+W9+m2KXw1NSWCU2/AyEjh0jvsDIYAE1hMMkOYt
         +ONjlzhvbkRNQT2ELjcMKUSZ+9ILOh7dgTdJ1fnSMi3cMOlhbp1pWgTl2Dq9sresayEw
         5QJAg5frVZHpzsVRucJozGYrJEOgAlkLAbfzusyGLzVAnLTd5DxxI+OY0Qt7wUEelMAl
         UqLpceeL1nyzTncbEMiL0nkXx9a4ysEDtAKcpJ6I/i22h3E4HTg6DEzu3HtboOYJlIGv
         fh0i+tgb5S0FUssf14sv9YInszWVBwxTtxDJBoBy9L2ESuymi7mX3d/DTbJa5r8JtYkT
         kQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852813; x=1789457613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAVjKTm4Pn/HKXCZzPP0BGVIfDLnFhavf3k/SnjOgsA=;
        b=Lc3ydJhIFaPbzM1G96bpbEa2dFFNyo29hd60Xgo1A/0FC8tQzwmSvtYDwO5dE+b6Ay
         tsOFF+kFXscRvwgTfGerMXV6po36hsuEJD8j9vHVH8s+4cqFsdL5yDGIehtHHGkl9qbi
         exyZMIlmoJY25L7RnnPQAjiRTW5wdml5iYMQc3gNIIO/HEBYJd7ty0JDUCohd/dx9tD3
         bCwQ3sRXwrGeBta5cgZPO95ePH70khf4QDqgF90tP5mAgML6KPS7twf4Ih3514Egp77f
         spofiznwsBfecFsB+B/VuXqkpo756vuyGVqOFwt51EvYjkt979j5jBEljOylcV097V0M
         RAzA==
X-Forwarded-Encrypted: i=1; AKwUvBxC3sML1DtH7HfPeiL0sDejr01i2UQzXaKNwOhMY3kgjCO7/aAwvKDrqfoPKfou8BZ2VEe60B/TcgaI@vger.kernel.org
X-Gm-Message-State: AFuF++np9r2y7sSWXb85JoFWFa5AJqNrmz3uI3IRlcFpQn5WVY/aBdvN
	xnJ3tJ3yr/nCAOB/5BEC3HJfbNkeAy0oBlH2mhjDo9eu/GQDOQGrJmjRanCIt/PsNuR7kt8X5+o
	ZvpmuN0Qmyb/3IietJuDooI5/ACLNeoeaeo8c3uMGl16d0JGMadfAoY9FbKYIA2K+
X-Gm-Gg: AYBFou32oyzvBOdZP37RhDXunfM4sg2F+wAYOUGxMmtwsn6tA9vbCBVWDpT/eiKCX97
	RKWxRvxhsv3mH5mzNFRn67ziLR2SQ8Ua7EvWKWLrOlbCVrJj9azzsfH1zXwvt3l6tmZ238JQqx7
	Dhdrc/7ZlL/LoWyftVRy+1cvI0sDk+sjAo+YUrEfWNwsfUjOPQd8e5M7SNY+xaPWKhzwQrh7eiW
	j6mabiU3OhunHFqw1bMVkHO8WTlMuoBS2SG+4abWoCh4Re25M5dpjKr2N9qnBtfUawpxsd/1y/+
	TEnfFM1Styf1XEpO3V37qLSHXoPdU9rzsNSKecfXtiTUb6iJeDvXkmcs5wMDQaUYJcgZQ52MmD+
	IfJNW+QuAbyuQhDsjg3PzVIzLgLk=
X-Received: by 2002:a05:620a:2a0b:b0:939:6de9:4cfd with SMTP id af79cd13be357-93980774882mr2700477185a.48.1788852813269;
        Tue, 08 Sep 2026 00:33:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0b:b0:939:6de9:4cfd with SMTP id af79cd13be357-93980774882mr2700474185a.48.1788852812904;
        Tue, 08 Sep 2026 00:33:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm34019157f8f.14.2026.09.08.00.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:33:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Drop marketing name-prefixed duplicate defines
Date: Tue,  8 Sep 2026 09:33:30 +0200
Message-ID: <178885280732.4383.1676609276287509804.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
References: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x-9dg1gYT6ub9AeHIEpZnWHoDFDpcpcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX525SyjW4RANX
 /ZLpAyhsoUBeCBbaAfi2T5af78fOZUNmO6ih4rkipQizQPQ3GJC/Gdk5fOs5dikjznfWfn8rw4x
 Gp6B7Y0Nhrvlmz0XeLkpfWzTAV3mX8+zTEX8FgAWdxuhkwzYYHJJkTKMof4ShrVttb86zhKucZ1
 WDfM2uEuEJ8HQLI/yvQ65aX4qYHG2RTqsrgAlg4W148MM1uABm8NO+1i3vqI7dr3Ye/dm49KEY2
 fyGzN2yFJsmeSA/LloOExcf2dM1nkbV4Yq+6lElNXs0I14AtqPxdGvFWqKRCFTp40sI4gs21YcX
 zTxCuRl9fhMarRr0NAXgFC5n5RW0lDttEvNR02/EJct+Z9f6+e++8h3eQfIl9Br1MxCQAjwkmOV
 fRuxg6GuFbmPSLqYdXyrd0gsAL1kt4wsWVUF4OJ2yv4nwbPFI1pgwnDj18Fil4S9QHWSfra3GCo
 898CmARKzxK2lm8gwkw==
X-Proofpoint-GUID: x-9dg1gYT6ub9AeHIEpZnWHoDFDpcpcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX3TTj7Bmyvj1R
 GJRp7k5RBSovQiNRVj+6l1bPNRd4EtQK9cKTJXJEUvJq30IcNCmd/LSFGiSvWcOVodZa2SwLo3Y
 Cz4TBAt0TxswaEzfOwRwILPGfa1TZcw=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fba4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JQ8xzEzk_z3bbdWvsuQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076


On Mon, 07 Sep 2026 10:11:31 +0200, Konrad Dybcio wrote:
> They are identical and of no use. Drop them and use the common MSM
> prefix.
> 
> 

Applied, thanks!

[1/1] pinctrl: qcom: Drop marketing name-prefixed duplicate defines
      https://git.kernel.org/brgl/c/fd702f895c5addaf9dea1a9d765209592e469cf0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
