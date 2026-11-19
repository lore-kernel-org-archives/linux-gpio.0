Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084431;
	b=xeaAsCucSWmUE2KaOL99LLnIFLeN85kLg2xJDAlG9SnU79qqK9CnHlL5359lMAJq4crM
	 SdsyglDKi6fbRir4swAUr98zulNWDTl4tjzf0aZozMElqX5njLgIkFm8tNl8NdF6htokm
	 TTOcPEnNYdj3UTlymCxrAi8Cdglo4dBKlBqAC6ulZtHXkokvAU2rt3QV6I0jmly7fLnOR
	 hxK7HE0lIOb+XaWURpv2BiN9Am/zlyJwc+Zhr6nq3s9Sa/IQv2DI1F4k99WZ2hjS+j7E4
	 +wVAMiKIVHDEKVTdTS3Dm8d0U4m/O3dEPe7t98+yuZav79wKiNfbJDriKFlbXbIPtYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
	b=xCtUi3S0nQvEG2ht3TbSBUI04ze1zn82ah1B96ULlaQNxXvGo4W1h35+tn/VAU0dneWD
	 cZtWGDCB1r3ikGWC+KWuHhzMb1gdsRQidcgNmN86vfL860f6PEA0FvsZexgwkn/hlXw4d
	 FNTsLEJxgURwfECg1Ui9QIEhCtZlWyGAt2T03BfzsYW5gaccoSpuMd3O3GvtPN2inoQyc
	 MiE2pnZJzQaUzxVpPX9Cv+GweqCqK8BVnd8XTpCdkDD+SlldGadfAM5W5q21FcYv8J7J4
	 n3ggNPcOcQQxePRjUTvwG0ncbPXQ7gSBwvHOqMxOZGnp5zSE3vcH9VSLnz0V7jIikgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLuR3he1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRT0f1t1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0A606A325
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A0A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLuR3he1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRT0f1t1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7Zk4U3718061
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=; b=TLuR3he1ZZ3ZjY5V
	FM4KRNbjaZnRyvGc0UQLSAu8I18Miye/m4MVs5zDYG1tHqnV9tdwcSCt5zBEJgFp
	BvXsh3NNFCmtXegKLa6ZwXJnXeX7rF0SXbfxlKcpsSecyQZKt+UVmf1JuwPtmkUZ
	lt35uOB69mpEk3RLy191ZIu0MmLt1n3VAaTYeAfzTOfQ6j0PE5IH3xC1PFfa3d8v
	KUcLzybiubGderaM9+TvudKpedcIdzB+1mb6Db1GxLdZ5rPxv2weRw6MNdnPhEFz
	JaIFu8qDeQJhBFBpRo8611YhGTViLOBpjQ70QrhrBbPzIsm6O6k+0efWdP2/+H2Q
	zcnBiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rtbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:33:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-542fc619afaso26905771cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 02:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084429; x=1795689229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
        b=MRT0f1t1DZppPM5NtRI+sKNYABDZJA5A6qbwTtA4wXMuCayy6ns10YcqDR1lBOb1b0
         dkNLZndJau31GwoYnsnh/sF8lmd90Bp52n/mT3qKpfdJK3JXf2x0pX1FnpPa27EFbnKI
         mFMmy9awh1wfI+K1EEnqkP956FtiFrJS3I2VAk2xN2vyXosmDvzbIKKbcxZrnmX3fK01
         xIY6x+ZI3VyA13M+808ZNdfB5eabeL8oH5uwCzGZak+cT1AoRNI4zRI/76Enyyonqlhe
         YY1ijrZCU1t0d9vugoGbgCWC4KGIJLEOTUfqlisP82LpxMQbwn7pKB1M313UBFnmzRSI
         KfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084429; x=1795689229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
        b=LW/WnkHlPNPAZEckjnN4hwublanHYkYmvE+u1lpLiPoi4g/HKxInBU3IdE0G2+5WUA
         BrS9M6IDb8YiP6a4QJPTA7m/ialt0UXXI3ef61UXQmE1SVNQjVQs7DlTPLk+l+5Z+lds
         ASnslB5cx9Q5QTrjm6+ENG8T9YIfvz12XwbHCOhLxNFNq08YMagDqwP4aL8qcgHO95Vd
         +i0d7qQbGlR1/3m7jB91QDaDYDQfD8ykm2bABLtpHJ+ZH9qXxXufZCxhbTv3J1hjeCRj
         x/t5SEADz1HHr6UL2OYHILgmekyLAoB8VbmxkBgtkiFco41A4jguNYE/0TZ6qHCYSFlV
         HMdw==
X-Forwarded-Encrypted: i=1; AL+hErF18Wu7zGp84Kj8UBSuje20dDXY2M4pDqLkffzyAGkfPqeM3cuOoF68CF7yvdez3nBA0ZOC4os9VJEJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/c5EE94SZ6dYdfUz9YDpYerfQaJhBQVuz+LjK6wW+wvDUrL8sb
	mcVGxN9Dae/0KJFlMVoYUnyR3Vwr14smEMo9gSMhi8Zt0Dk3ARh11R2plOUDXkDHSlZNfWM/b3i
	Dqv6gV/13qZ+eLjOtB0QnuxoX3/nrxE8GnuTw3jgfZCs9VCgOPEaadCmo7AL+vziv
X-Gm-Gg: AYBFou0G13coTgbX+PrMIHBUEDjG/9Js0+W8PRNkmEAqDiB86FjpGFKMtw/xe/63azS
	NjJ7RdDBd7zraFkrmmi4SDFlyU6WHRo0Zzrk8rSvtCDuQwiFdOTnXFXBO0a57UJhkB94sFtEQN5
	xZhX7Ae8KZcEgN8Qc6E2Akz8EHUpQOFfu0ncc8376SoJIcXw2dhCQ0PwFduCSUBgPDGJGn3o+v3
	w2KiIVtLKaHv4J7WZJcv5aTIkoVvm748qO4HIXA4EP4U7CTQe8tCYikuQyjKwV0el2Rdn5QbEGJ
	YxMxv/Ccd2TCBs7XqOEhg5ow74YgDn+j6i8nrEBkOQ6uIlH++ughN8TFgA1Ygx4CBkMWIsmrwMD
	2D/N15ZgxFqpinOXuoV7g+EtjKorGhki0brXz+hHnlhx2uRCV/8533gYHXuP3UI0Py+BK1a9FE9
	k=
X-Received: by 2002:a05:622a:17c8:b0:536:622d:6932 with SMTP id d75a77b69052e-55d5a58f8e9mr86938821cf.23.1795084428701;
        Thu, 19 Nov 2026 02:33:48 -0800 (PST)
X-Received: by 2002:a05:622a:17c8:b0:536:622d:6932 with SMTP id d75a77b69052e-55d5a58f8e9mr86938591cf.23.1795084428199;
        Thu, 19 Nov 2026 02:33:48 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm31004775e9.6.2026.11.19.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:33:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Hyunjung Ko <hj351016@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mary Strodl <mstrodl@csh.rit.edu>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
Date: Thu, 19 Nov 2026 11:33:45 +0100
Message-ID: <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117104110.240112-1-hj351016@gmail.com>
References: <20261117104110.240112-1-hj351016@gmail.com>
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
X-Proofpoint-GUID: pPU7ugeEoN-DNMSrwvkG0FA_MkJ5sTBk
X-Proofpoint-ORIG-GUID: pPU7ugeEoN-DNMSrwvkG0FA_MkJ5sTBk
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afed08d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eCiaqhuiOIoeic38RQAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX6gXYxf6jKlHM
 nFyhXlucCMZvWq/EdwjkzmlCyE7lgV/jvkJDSvBt35c0BxlBMhVQN4hk6joqld+WFbmFMggmBCb
 tKB/y+jA7SjI1nFQBGfsWtDbJ2QUodc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX11qBksHtdYeJ
 sBxtJybQEWSn95bvz02d1/hFtwO6xYU4TK51+nGSgjlxKaRxcDl18uDbGzCHlQ79QQeb49gIEj8
 wtpVxNfJzZIde9CQEootjPkznj+eyzrU5oskx2o+tmeUTzu+EIcsYh+/ZMBdfP/7wYFDLh2eGTK
 8pKGeGobu67IwRfeBOSrDXnED0lGyTz0WtDzXZbFBCe4+hfq+Oh8r9OQrOQcli6ljQn/BTzKXfv
 ppcFCuiPI2etq6wvmQK5XGQj3ig2IzWl1Z2pZ0lllehQIkV0YAcyAIP7//acY/PAYjUOzV/j2Dr
 o0x2gT3RScOkTK/HuLwiQigbprf6HnGiTPrkRy2FC4lgWl+95gulkmOF5Z+ykVQ1fYr8kULwf4o
 326GNRqguytf6V0aDu33ysxXVTphFjiJ+TF2oU/dZ+AqQBFqtmkRCHtYVwS0nqDDdg3Eps6gTbL
 8gjffZdDRLyOJvC2DuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190041


On Tue, 17 Nov 2026 19:41:10 +0900, Hyunjung Ko wrote:
> mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
> len_actual - 2 bytes to the caller. A device that declares a bulk-in
> endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
> the copy length becomes -1 and memcpy() runs far past the one byte
> buffer on the caller's stack and past bulk_in_buf:
> 
>   memcpy: detected buffer overflow: 18446744073709551615 byte write of buffer size 1
>   WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
>   Call Trace:
>    __fortify_panic+0xd/0x10
>    gpio_mpsse_get_multiple+0x767/0x780
>    gpio_mpsse_gpio_get+0xa2/0xf0
>    gpiod_get_raw_value_commit+0xf8/0x1f0
>    gpiod_get_value_cansleep+0x1e/0xa0
>    value_show+0x42/0x90
> 
> [...]

Applied, thanks!

[1/1] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
      https://git.kernel.org/brgl/c/f94f85f82e042c89a1e64ed3ff1d591a2bccfa7b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
