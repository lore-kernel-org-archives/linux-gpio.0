Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878949E144
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997382; cv=none; b=mtiRhtRKoeJqMY3ZYOivSEkpROyecREv8hBoWlNKTYE8ZzRM1DhZTDP0uCZWoOa7X4Bb1Q4GCt+lFZSBaFtEkqrjsuRkVKuwjkIK7Qrrfn3Uu+bT5AL7ejLpGU/PLIVQpRFy8DifjjsOiV01PMxIGL9JO8AOqXSjTNYC4V2smcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997382; c=relaxed/simple;
	bh=VtMKS1pxmLVhRvyRqpDRBgXm639lmKJmTQWPgi0oJPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogG3MPGyhr+4yXBDTG/rGTxp/jpmcTuZkk3RSjNEmV/RXzxUDJAkhTYWcejEiOFJk4cZd/3xg4abU/bztGaeCfWlTVZVPkHStpFUmlWw5GKEZYxvW4p04AKapjU7+w02dK1+oRBq/bfeDbR9CneU/JGyYnUY6Gtb6aGyQOZMB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iR7ZErP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzH19x4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iR7ZErP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzH19x4I"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4lxn1129676
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 13:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZb1Nz99r2b3gBf6iCMiSVF+
	bGDeXeMBh3XVaKxovJ8=; b=iR7ZErP8OYnstgQIU2ZM3GXIqA+oF3iJSRj2/qmA
	cGEDrb7OoE0d6NnQQv0SNHH4SxUHn2TOPuNq0SLRZEFkbKncupLPyyKq664UcOcA
	O1sKo98wcvmAAuPCDQ0GSnxuFUGqwLVz573qNZFHgc0QW/RcBIKP2j1J1emfJDVX
	Bn58cMaqhfgJF4lofnByyFestwvxIQJO7cPeBPs9yalzqDlD6EUK3/Y+6hRnMWF6
	CZUbeUd6FSK78CWqINIeUioR27Iq34rV0ZarUtjK2AfF63YY6SX0Dt3yorX4pvzM
	CM/gr61YsGJNif7x5pD9bIDIQv6jAABzsoL7K6g5KSuTXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csghk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 13:29:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so20445995ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997380; x=1790602180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZb1Nz99r2b3gBf6iCMiSVF+bGDeXeMBh3XVaKxovJ8=;
        b=LzH19x4I0isRbeOCYTdhgPoNZvlNyM6mof4idJcV/JG4CPNa6Mfg+ylO7yVyhTI+LP
         PbQt7veWeAI63ayVg7kxSljo8ZH2Wp/+UhRQXX+kIf2liCfTIcuLhxOiW8sXOBQnGG+l
         9pfz4uRG4ZSBtZ4Zvrba86AWQMoKMWDObzd6vjl+3pX5ehGCtVvPnrIdEPZ0L4sB3EnC
         oboooJ+gt10QzXNyrA+khUSRCkkIQxnJbaEUCJnI6Ov8lhbWG80QtfEw71xWZNAIcghi
         T22TSsjjNFUVkvB6pY5Eh97Y67mSpzy4GdNfQYEtfz/hnzx2AdbMfcfSjKT94i/86+ji
         wPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997380; x=1790602180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZb1Nz99r2b3gBf6iCMiSVF+bGDeXeMBh3XVaKxovJ8=;
        b=BSMejERSPuySMvv02VPWCilcPlScXTEVSZgmQQO+IudsgAtBZcpe+pwkV6BiDoBHxs
         Yi2DwdLAGzlCnuqffmLMyEmC5aAOyvUFizwIf2uqkx6lX1u40iFoMZCKzlvI1DiBIzWV
         MQfKNyCCy6+fCPI4I0ZawgCbJ44Iym40W/hRD9SZP/okj7V7bWox5ErNPAMV0HPNGmXB
         GzJtKmhx+Q5jBBPiPggd/7sl6SBTNUxRRx9TTi5HWdF3RbVbmwszoNl2Ik0xtvY9gynw
         MZ9HCERFlwfv2q3DuNqefk96ZT8KKQvhVlZ1UEdIrX/YH8D/MwFMcnBMCL6ysf+5LgN4
         Vspg==
X-Forwarded-Encrypted: i=1; AKwUvBxCTVRtrDAVTVfplquUyFEX7Bd1JpJ+Qq8mHoZQovIxkdmB5vrRcACMOQ4KTKDvbGZl+dJ9EGENypHa@vger.kernel.org
X-Gm-Message-State: AFuF++mwtTrUmBs79iUwPrUsZx+JC41ajNdGIuvrMlFX9ONYwMBLiSfm
	T5v/qjMineOdz7G8wxG5IwUAhtoXfbszgI+sdSBqrzI4pvdUtEsWALLW/3oyIAOReEkjlbHI1Ny
	XRrqA8bDpiWa27nLCrfon2tl+dyQNML7TjqKPyUOoTUKQszfQ6K2+PlqndKETXD8W
X-Gm-Gg: AYBFou2q2nLyGvvAOeCBljTgYhZpWDoGh7KRuEg+bJaEyY3VVywSiH2l9Omch/pMg03
	Ab8t7jHPzU27ejOoG288QazXJnIJlmr4c3q/RclgsR+AoAVzlOOmJeRMK29EpgLIzl6WpXCsOI1
	a2N7eDgNjBECmOm7KwZd8hYSJM1jM9jgnVuSwlienEcOnP2GaPHZWfEJqpstAwSWFfA/v9MEtxN
	ZNsfghxafXJgJsWk15vzrpYGQNVBexFUDziILn2xLol2gVUUbVqX1YHvlQ/FeTzlOCwlBD3SBdy
	Y+uJJcZzTcfR6elpnK2m6Y5yoib/OrAK8yUM/wUY79Igkph4x4zXiqOqeoWbjHRoN7RRWs5JkFN
	QRRCXzmHka39LAc3VnWpIFGr4mjfYcNcIMUtSg3eInw==
X-Received: by 2002:a17:902:c944:b0:2dd:ad73:c980 with SMTP id d9443c01a7336-2ddb1b86d6amr152937975ad.24.1789997379965;
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2dd:ad73:c980 with SMTP id d9443c01a7336-2ddb1b86d6amr152937665ad.24.1789997379389;
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm21905803eec.8.2026.09.21.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:29:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arExPWGbLm1MLgXz@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
 <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX9gNY2Pf9YRDc
 G3WkXSlO0189QfUKlBiJr2ISW0Lu7sYH2z/uwTK3MaEBjKcmnYX9lQExwMPFJqYRDoZvwChGqtH
 yNkGPmXE159Vqlraeekf3IbJ9VIDd00=
X-Proofpoint-GUID: K7anR46ZUun5L_O8zmQTiywkoPGZvT4D
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab13144 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OddHCmqlFxd8KxF8cHwA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX+tAKduc+8CDL
 MG7W9rmBcvJuTr7B4vskf8NzsgZxR/i3Na/S5h6aTIExpfDMCKXs8aypXm4gLjsf8efGxc/1l/K
 o1CzpIRsWwvedTCSAvcitBbIsyVIlcCNbL6lrue/EfvRdRJX6jV9HdxmNIL2H8zikI+2J6yQlez
 oz8dilDdqlOhH7ICZCfxd8JiAStDTYrrJCeXYkfWwPuYsEZmwtG0mp7gDK55GiwkIb3fKssV5gs
 ZzOFOQlWgqG9WNb5l/DBf8/cf6QJqPvv1zILOG/GKXFkmwx/9qAJavqNSK74v2g31XtjkXjSvJc
 M6rix2+pW885RRp+FhNkay5Cb5ZCOL3zhQkv7c+OQ7+8kKDBK18y9Xq8bTw/Eym++ejkVf/8XR4
 aD3ykZToD502S2YZt3oGG3PVcSby4bvQfFKONj3BOhDuU2xjOd9dYwTLYaZOHTxujzoxbBEezoy
 CUg06wY32pX3+yY3sPQ==
X-Proofpoint-ORIG-GUID: K7anR46ZUun5L_O8zmQTiywkoPGZvT4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210196

On Fri, Sep 18, 2026 at 03:05:30AM -0500, Bartosz Golaszewski wrote:
> On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> >>
> >> Personally I would prefer patch 1 instead of this change.
> >
> > As I mentioned in the cover letter, both patches are fixing real bugs
> > existing at different level. So I prefer to merge both. But it's a call
> > up to Bartosz.
> >
> 
> I'd take both but I'm not sure if the ASIS case for shared proxy can be
> addressed without reading back the direction.

Hi Bartosz,

Ah, yes, the concern on ASIS case is valid. Let's disregard 1/2 and take
2/2 only. Let me know if you want a resend.

Shawn
