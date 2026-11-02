Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626711;
	b=pm6anF5b8g/Bfj92dNA3KR9zQ0y9KkBlBLr9O04GIOMNQSbXhdxP7JJi9f1DG8vKranR
	 yiDkVw17xHYSfucvw+aaGnTmEKbNmKXN32TMH4BwHQ5Pn2Z9XGit0Ggn8NXyYpe0OfDkE
	 g8YHu4Z/nyhs+uLkB7En8JG7r4rVhy3LVMs/zPMsFkwsyloWfKKDe1up8uaeEMlMWCwUS
	 rSAjHtqc+YMh6FwopIgBu79mrQMakJbZP3u86R/0mvTB4fKx+aAaBZGZF8vAOcg/ufuUc
	 nof942Yfs/myda4tlQp4uKWvAsvDoT/jZDc+lLWQiSnjOQ1PG/VpqqvhaJ8+JKB8WQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
	b=FMYNKS3ah+7sQ0oI91ajup5qSW8fjscbwit4mXUshqpoJ0zzhjF+A4bHUHOtdS+6Bbh8
	 bnOQyIFpm9/Mlkpgxjs7c7ghP0XUeA/LunHhECcvisP6c7WgkiBNaJb9+yLPdJJ9XuFwO
	 MC+nC8VOD/jSk/Zqj6/KOL+768R8g3FaqUXmsHlAqGF3sTIB4Re6hN18mq7roTABAbuJR
	 8j5FuwgGMm82nIc4baO7hkFGP55/sGMjQRUFcAe5w4IryYCNhs8bDqAsXHbQ+8kH2FXEi
	 2RdCi93+VsSbTf1N9gvuci4TUwnzqzwidnUC1kbl3/j1VhHTBvkFKGo9ORDkXRRM4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KMQLsu/d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mi7TfXCn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA9606A326
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 13:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BA9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMQLsu/d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mi7TfXCn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAbei3014540
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 13:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=; b=KMQLsu/dZ+9p+xSa
	RFz1+xEPMEHgJy+HNNzDUcWqwXvco0yHJXy1nCngbWDJo0QZeKwDGdvpBEX0Z7fX
	4CQLX4pRb/8S90Z1wag9ZwZPlbbpWsPJVsjKNivF1g7aJuP3ySaIQn7ZLigzmoNC
	hL9HVMok4zlU0HDNwN2C0ed8m6NAzdsuCVqeMEArqGlnmZpwgBdjx+vTO2hRXr3N
	bqWa4/4u1IzzhhnRwK/ZjFoLjzxU9PxmNVVVFbR57xWMAzZkfnBiYhuQlaObuX3b
	biaPJ3OBPTBKhwsul0hOS9mzC379i0yNuIL72FklOYCE4puOog7ln6A+dHs+mvRD
	x7FSuA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 13:38:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bea8fed6so2529605241.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626709; x=1794231509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
        b=Mi7TfXCnwNgz6/urgUY6Pxfug0qftuVxqHF3pJnlxvZJPZMtf049dekM9/DdFqKSOw
         CaU6nuXzZEn/WDuOXfF8+xnIgY+izpqYLLNaFIUqNVHh7q6POLPPwaBfgOdLLz7gyg9f
         AngnM3b/bFhSfQF/h8xsKr36YvPbysGBiKax7mN3y4sIOi7IrNpP4b3i0HzIvpDlpeSy
         emsXgctD9TMDYFgao1JGwZvEKvlFF/YIuRZdseOqTVbccBGylKy6J9bCF1v084KVaNyG
         cstKDpkKTupMRCZL+IWwvFilEsZMFqcqCuRulhra4LA/QnrpIdZxllJ3YJD1UjmF3ftf
         ahRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626709; x=1794231509;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/f2A5wNOFNtrqG9jwc/qXpyGtWH8hqeuDCg3F2LvLAU=;
        b=Zt4lKEgWArjLKqat4hkfYAKyUNk+oV1I2Xa35ajO9giBbuDY3XNpszsOlDn888rJe8
         bmBClmVut5Jpj/sSispoWfFQ3mNkd2PZWB5CirNh5WlpJoCGkpKPFYSGoVpgw63MtFH5
         LqA6bscqbbO+wqAuK3HEZtB/eLAMYb8zi+r4KobJwjK8ObhvPoYUb0shl4FezvcfLb+f
         7PtO2zp3t6cpgqJ57usfHnurl/69G8mKtdD67jpooIw3neQGDLRdA+YGsiZ2/ZwwQr2k
         /1JXHYk8U+Hxki8NDDV9/IBUGYakKFB106klOwPMKppeNHUwlDLfIOvrP3+IABCSCVfG
         yxyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2mfYtJnBUm5vHStpf+udaSva8FgF1Tg53V/SnB2iALwwDu07njnf6KIxV0QM86S3sq+KQozsqTDyu@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rtgr+se0ZdOz46E67SlOWDGpR06AehkzGjCeaRjbcO1ZhhLg8
	UvVJRRIH+d5KpoRjrBQgEHqiM1QVFD49V2ofdY24mnBvya45/nVRfD3m2V370ym7TOIZCiqVnEh
	BBtL7RkfaQlEdaGUx90kgIAkcgLUtCNqMTcVv7AEA01lfvE8WUZT0JE5KiCU3xSDF
X-Gm-Gg: AYBFou2wWXJVcjLziteDKpGj/DtOJVnI6qH3FvZQiuMbJ4YpvnY08tAPv4G5pIQjHDI
	RvaNBTyF7+iS3JexBoY1mFyUU1nYhXuX27qlkpJHj4RFoSimHL+xTnevKO+X8KsgJDjOrm04EgH
	Lmd1X4j1GFxcIsPNoNDMeZ+oXhAr18N/wYe9yD4DSgOKucRK1SShmcGvPuq5XjjLRdxmfhtVXtk
	fJETnTCW1kYSSN7nN//EHsDLzWxMl+/b5Po/pdITTVdqYAhGZj6XrBNr9uq+JshYd07754ydnVD
	vMvWxQ/BPnyCeUk7GNFhm0KaNtGWBx3wLuGCFxIMg8HnUlZjy9Qha20j87V37sEwyzboptvRlO0
	mVGgy/qil8yg4rCwiWeukTlAnZTSrNAIMkUU/HNg/NaKo+eGG4WWdIGStUOKUhxSEoTTjAvn33c
	FI
X-Received: by 2002:a05:6102:f88:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d07262e924mr3971069137.12.1793626709033;
        Mon, 02 Nov 2026 05:38:29 -0800 (PST)
X-Received: by 2002:a05:6102:f88:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d07262e924mr3971063137.12.1793626708667;
        Mon, 02 Nov 2026 05:38:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm1194928f8f.5.2026.11.02.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:38:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mpc8xxx: Fix potential use-after-free of IRQ domain
Date: Mon,  2 Nov 2026 14:38:25 +0100
Message-ID: <179362670032.76770.9373132482307036196.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a4fec7fe970d6fc9135b488f57ba7e145b809359.1793377433.git.liguangshuo@mail.sdu.edu.cn>
References: <a4fec7fe970d6fc9135b488f57ba7e145b809359.1793377433.git.liguangshuo@mail.sdu.edu.cn>
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
X-Proofpoint-ORIG-GUID: JqhC_z72UPu-QDbjEMsVF8mv_l9LWtWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX1i92TTCOo16u
 v6mAYbmiEVO0NZ2kSHKwhvPCB9DvENJ+1my6nq60ddHbssf3RuQOVLaFXIszehuBSkmMmKxyQj0
 mpTpKzolGBdE9tW8VUN2QhaPT7ew5/8/pnnVgoHwFv/LokkNXNxdsa2G1Dp1HXOl8SO/okUBy1i
 vLTAf747Jrx/dSroMy9Sr5JIE9ID4U97DTwhdVTZ5OXx8I2uZTiacW/lo2XH6cNt2cG05zLnttp
 Au4S4Bnm/+Wb349RFJ7c+fBzH1ItdeyLpUJ8CVupf6kTpkurfpXnTeTjb1DfvGhOAwejcNT2o8r
 q2l+vOdMMxOClBVsh0krHWGVVMXnDMGvcWpPgASU4UtgSrwzate3UeoY1gM8Mt1JgsTUIoZ/kHc
 zT/jk45pOLWqFXkkmBixTb3c5vyZbf1HTdIihuOFPjaH68TcMiwKFS8+BDEQzSbmCUwog4ORVXG
 cYSLj9WHhZaQ205OjnQ==
X-Proofpoint-GUID: JqhC_z72UPu-QDbjEMsVF8mv_l9LWtWM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX8rqH8v98Q32R
 6HgikJgdkpvcVliqL+QRzA5SW3ZJbjG2XZYCCaCk5KmYuSipB+KQ29dKLOLc6yfrBQ0+fkBgwS4
 1V+3ageEKPg5FiqUPjjXOjynWq9C/Pg=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae89256 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iSS-Be4OmSBwA7muS1YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054


On Sat, 31 Oct 2026 21:05:41 +0800, Guangshuo Li wrote:
> GPIO chip cleanup can call the to_irq callback while releasing requested
> GPIOs. Removing the IRQ domain first leaves that callback using a freed
> domain, both on removal and after an IRQ request failure.
> 
> Register domain cleanup before GPIO chip registration so devres removes
> the chip before freeing the domain.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpc8xxx: Fix potential use-after-free of IRQ domain
      https://git.kernel.org/brgl/c/ede1a6a551d3728165b31b494bfaae73b328354e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
