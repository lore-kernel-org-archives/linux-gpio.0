Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610322;
	b=oHy5o2aqC5SUfcIrjMvtr5WluePEZD+CBmSdHecKCwU9bgkvJEK0WwyPuR3GOQvJIoZP
	 NlP/O4i3suI0gC/mjXXG7B1mLohoQCqHmbMFM8V+dyoQK6LTT3MeENr05V8IWbGlueDyV
	 Mkm45O698d3sVNKzb19l/AlwSLI2ETmpAKIcH1btA/iqYM7q4hoziR02jAh1d8LqdQfok
	 x6gjNpIEHzFU1rfl5jMjb+1lSqPDBQRikIF+1SpkilHm5Kim28FEjBskFcZplSAyjaGOe
	 fTzcABCM42wk+Wm4M8oynrsnysbhGrDtDoVIKkKM72l4xkAojCL+9AsoXzKosuTwTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
	b=bogDAtC1uf7bD/Skpwr2EzSwBP4Gtf8AUWT7M0cFb+pVZp0rzGWHU4qOAGpPlNafywa5
	 Y3rQRZmTioXGM+JLV/BcUevN67HpfQ0pf5GwCKfiQPtX+8+GeG5/XtVY7ASwsqJ7lF95p
	 3/xz5nEbljwmaJaxFs5CN72A0vlqWIZ3MwfNtH7q6GkQUgJc1w4EGfuhHaFcU6n92Op6x
	 ZitYvRsRm8sBUiW7xLtRKBVGrH8/JBAa4xI+hhTRanK7ui72ez4vzut5lWB+rIXWrZeXM
	 45jExCNpqApG9FzV9pwug2XbqDfcoIHeYWrCAKg/gTsgSgKlFmFxBk6Jl4NKxwaSM8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvQbCNf+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KD/l2EVW";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16C606A327
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC16C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvQbCNf+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KD/l2EVW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pluJ3121149
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=; b=dvQbCNf+TII7Rvcl
	QH3SWWJasayQGrXTuqTRLM+NOPKFLQV4DsqhOE3QRHqAKe3O9Tj+Nwp7pxoua1E9
	J3SNw+Qv+f8aRKXCWhFM/mmczh3xmM1OgYBHn0GSSwU2lFh9iaAjTRS1h/tW0uSG
	kz35QOGqEujVeJyZp3SJON2YYGWMt7kmfZrpZpkqvJ1eXAv8Jbuiai3n+zAXaeeT
	l1jsxq/oQRoYYTW5eOUT00VL8TbtF4h2NIvhSI9++mWpnrg/6rFaPaH6hXR+f2ft
	ZdBGpzPLodyKeTkMN4eU285Bg1dgeIlsSFKhb3X6GPTdaxOC8b/r8/2GXDpFDJEp
	xb+XzA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmergms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:05:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so505436137.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610320; x=1794215120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
        b=KD/l2EVWoMHDFJRHM21MvNTAcSndpgapwlOdD6OnSG+L98+7oh1T71weHqFJqQlExf
         SYeDCZfvHT0ungxLBcHLw82CuARSMw1o97ARCeefB4EFW8shzmykrB5DJeKsjfCSfTfk
         JFbCJQpcsYX2b9DqvshVLSLG2o6mGv3Dys9TRVV7qmgw2j7nxeBRtJsVQtxoOCxcQRAX
         yXQbQcN+4uoFf0nffedsTRi6RvLsXsPQY7gfRVN9ZvpUlr8MKiPXXThvHlODHxCSFX3u
         EUl3Gh5KfH2AF7SFdLhxEDsOiG4rAZOxPsfo3gRATdsKqK58toLI+DaIrzDddtuM0aKy
         mWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610320; x=1794215120;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
        b=k+xkx3sheGcxzaVNsamREe3kV4Ad/r3LAcZG1KVXMcYyOnX/6dzTgM0pE5YR596DjK
         uoCpd6guVm24nFm//wHxlHnB2AyVcbNEqGwYFteQ+qcauJZWQdXWdCUvpOxWTr5zMh2V
         CcLwicpfeBAuxToZ34Os6lJY4QfePTg/ylEF/90VsZ84SdCyhyeDMaug/Kuzk6sgBAvU
         XFyJmTftzlmXgRFcib/7KpEHkNLdj5Da8BFnW/XK5+Z8OOqaS/53sUsV8wwqQSDExFvv
         2M0yHynhKO8EnSEwhTzllb6/91CM7N+r3qlax4YuBAmTt+HVHTWYhtbFtGEUJBaSHNXF
         +TFw==
X-Gm-Message-State: APuU4Z9ia4a/YJB9naYwc3otIIIa0YZFAWTokK0oCNGIiv3qGjB/zhLX
	KzDda7CIM+Xp1+XYee7UKRoQ8/+rZtC+bQSGX5ygQNAthUnrDCVQ3hAzLHtvShjMFwBh0Fy27H+
	JYicR1jIJJg8go+qvs45950iSd6bGnE8w3hpHol3hXym5BeJm+bC4RA8gXu8RCrIG
X-Gm-Gg: AYBFou3vmKYmk8/SHQE3Ly5xCRUxza/GAZlJzzl1M/BDE+jvGllclT/salL5eUvjDl0
	zi3JaEU/ebHC2OX0PPuhiCAOsh9ZMMcZqMHEMi/DpPDTuo3ourSN7O31ZJUGZYQHoiYLcTWZ2Qi
	4TR634iJtisR0u9FMJVjnjYFW+KbKkb8xTEsytPbKiJXh/Jo4lL9nW1ew9m7PFcaKOqZURaj+/p
	V4KITGrW/WgX+YxuIeXQ7ZqnvsS4u1tx103kWq+zl91S/YrhAsAjPVYaBcn0Nh7e/hwNXT86vs3
	+gb8BQegtjxTZhJU1mqQAUHcmp+InS7+2Bhwu96/HPmQsRjvZ+HIRqCAmu1GZhDxctnB3gb49Cn
	XsEPsdEmLFQZ0x1tFgW7bXhHXQjkIyE4hqP7zb8lt1k03cguXEwK1RYLsTh/17E1RiOeyOpMVhX
	UJ
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr3405058137.1.1793610319967;
        Mon, 02 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr3405052137.1.1793610319510;
        Mon, 02 Nov 2026 01:05:19 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:12 +0100
Message-ID: <179361030997.39187.14281865642912768341.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
References: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae85250 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vBPT46HQKAXVtv7808kA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX1osMF9Sb3hbE
 gTMFJxBEsnM3LGJWn1rwj3NDgqxQy0pXe5ZA4e9+8Z9+eY0n5tRn3Nbe0d0O4vrV3F6VyrsXF8i
 gW6yI88Ve2597DhI6LeFchtsO/2HwpK4eJllUoOVSIwIZJbGX1Yl3ylAwA8C7Udd5aMrCJ4TBG5
 KdfCcH4yd+wY6iMGvaCPjbslKAgGleXB6kaa+Kl2EQ3pbHSGXIUsqnnQK0VX4n0mjYuTWKiZJLU
 mC3cHtt/cEbopQXVzndNzMO97PTCzL0uzLAWPYeL6AQKHG0SUWwmbffd+zSFzsoW7fI2m4gJid0
 fVuMAVcnaEs1ocNkYdjpiFlCOFa6zMMVpX9rYGRJCdXjzcqOEOKGVhqqLqP/zkhoymtyaIEa/Vc
 WoFi5ASB0fR5nvTZ89hDwseKW3v1BiQTot71CnlHGBs/IqBMZ2ujwzwcsiAGSJYGoActVyZjLKJ
 bJ06GC1CW1+Zw/fHyaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8DONoO2f3O0O
 KBP8sl5LjFvDlrdvHkoXT0lScxY9oGmEtoZeFdc3OENxFr9ZFeSD7gmrxI41qvy9lMBp+BQ5l76
 8CF72UEUyj7alq1c6Gkzw0RgI9k23bI=
X-Proofpoint-ORIG-GUID: G1p0iLB3uMmOKFKOv2K9cAtic4RlcEpl
X-Proofpoint-GUID: G1p0iLB3uMmOKFKOv2K9cAtic4RlcEpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036


On Wed, 21 Oct 2026 14:24:29 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-virtuser const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/6c0703e5b8214e3625ec2058236db4a27d4426f3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
