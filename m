Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444147;
	b=DXMYGGddy9jDS6Rj+4wOoJxwjmbpY3SOqV/yl1wcdRzlmlOp6+YKPSB3QCX7FIKVofWz
	 JlnqSk/AM1gQ0WmZzWoR7iPtG1S34UZNI5oZQ4FRk8rlkCNNxENq/+9Xk4uyqq/urPL88
	 aL8SopokymEHTRc1gfTJ1GSkXpRoJmMFZp+24e+LHNzAdifPjDR4wBdaiR/CD9B1syAZ6
	 0bg0u469wLd4l5n4MfqafhxhbluguKVmqlfLOU7D2nuNhRsnqG6D7cMFIMC+U5BFzDYO3
	 JeGAdvzGiBqabr0yW0JX5+XpqwPYI/aWWz7nioSRpRZ6beSSjSOJq0zWfUme0Z08bvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
	b=tEtbCiJvHyBKAKEA/v/Oc5Q5osVJjtEzUhCi/wkZgl5sCZPaVIzIO0Neuv8O4iBztwNL
	 TMgyD5wnH0mlNk3NsZBVzuKw6qKJJUbmvp7hTAZ3ggh2Vd729+jgfrVXSgBJ7ZXLnAudv
	 l3EY5AhgEpwyHu+dNV793/vbncO7JDNum0WkKVY+1TKtjc2tijtDDibcy8H/jxwbwH+zk
	 qqDl4WvN2tvt1Mfxdiu1ib5Z9kBbYs0B5e9Izag8ttrM9DEERGEa4LcodspuVAKLCtyso
	 b2fSF2MBinMZt14ZQmZclK3iOCEblGcN+kwLIUKPN4ek/FdLvNv3A4W8n9M5KPwKTfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cf/y3161";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5C606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D5C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cf/y3161
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK2Kx4106502
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6PH5lkRkGT+Ul9o6wulr3IQ
	1M8M0Yi10I0lGZq7dOs=; b=LLqCeMemUnZvxJ9jz9bTlm9WQlNXFQfobSZTvgWt
	LbG/3eBpBOOjSGsRIyVM08Wk4PRtYLCaqJOXXM9R15MjMweKe23KgWmok3u8qgvC
	v8T8y9gxJdP5wH4rm7zywGaoHMHOxCI4cPfABHLqgRODBbqGJHq4Psq+WTbZ2ww7
	P8tlFz6SfN7ZSLO9kIVf60W/LkbYv5l2DL+/OfvvPVjQSwsFFpOAwW6Irmgcd8xx
	5YAalNB8AF3wcIBLsw0/3M9oj76XaQWt/98PqJftAGVcKmUwi1yaEHuMCWDySoPD
	5mIhpJL3ZWtabzMYv7dKxxW1FR2lSvoyR88r88gKB2KrYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr780mnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b4bf686ceso1613886d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792444145; x=1793048945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=Cf/y3161rc75ycHM8jZhUfngFIhh/cKURTba31c+uHOEjyH7Z8PyowoOWKAziBrLWj
         f6jmdhPJ/zbp4NIo2eXkdnEdfDYRscfpr0rjo7iMS3LV1XSzvJU2TOWXOhJ2zCFPDD4x
         L7suxapKKjkbA6Vvm6CPVmBPdbKPoLLNoRKBdu2hBPmhR2wAC5t7EFqHv0xjzG8qAMNt
         enup0QCLmwVmU4UfKqWq6TpcI9rvT8+UPF38HgPZQ1V8+FsF6DUOB7QeM0i6JGGQLzBg
         ZPgcAQhIJ66PKrCsAI16NmV7shD4oFO1264HjEpTa7xIjDbqwlepnxRuXuHKLchtcVSK
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444145; x=1793048945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=EqWg3d4ZIGMiQmZqgdoqpL2HRR7+UFqwE9H7E4Lw0KNcDBuDnLepNIv4cNJ2vyAgER
         ALnvFuMFjBAHamRRps7Fzm5FViIr6pgaf4DdmZ1fp24d3+16b47PyB+pJ1OfH3f4vIcR
         9kyaGORO9OaFU15WXwnWRzQWQE/tsRPKO2U1VpJdFkVYpO3pnGkXyz258kXv+G8q9x+p
         7ujVN/0B8u+4L6VbwZ3nEIhDD8l3paK6ghMwsqOu+DnpRgen+OkTzQLpeJmbIOI3P9oV
         qlhiTY8bRyKE9o7sU5Szd9+xBrGIcbLFLRel4KUJBPoW7BYmT4g2wIdDD/LCSxuAUL4j
         AJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwN4rqJxVtcpGOS2E7rhowMdiyi9cpHu5LUU1oCoatcOrkjEA3vFY/wZCJnYmZ0OxmbB4diuP7vfDgr@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWPgHTfeidtPOICIFhL0XYFVh9+smFPMA9EE9SiDdPLLXZG/I
	/uu6Tr8lUccCrqFPAMoUNfp/qZZLGdtm2bHlLG76VewAM4qjfbNu+5FYSRB3gOCkFoLbYRhGnhS
	s9T06QNMo6VZtGQ6iKcjMsHWS9E47c5run8xiaCn2JBaspNXxgtWGOhsJU7m3e6Tl
X-Gm-Gg: AYBFou0rmeouBn9iuorya60AIVANp7tGs3bAcgZIO5GfKlMbOapsfxtEZi5By0vhqj9
	mVaznqDxR3zwOlrtDmF1hBlJIw/QdZoEG9+qz34Fg4+Eds0V7m7s9ShSCSZCeHGol0XJJLCS2Yn
	h3IxbSdd/SnjuIYpRElzbCTUfVulpdOorDryBI6uK0fZLtR3HgRbnqBvoAozRZrBodVZtM+mm2m
	k1T8os77pxirJHpJrsrqsFaix/E8jpXO54wDxWnIlEzqUz2n+bROTw4KBU+e4OXkrj4hMipBrxF
	HmkV7NfNjYFoHmjl+tP5hQIKlkTJyfJELgfjbH+gTdYgL1ezhJrGof4ftCMFZ6nWffs4sdT8DGq
	cv6pF6zAV4DpxgqvGa3LcBVBckBSxvIirUcIajSbqrUQ863JU4rIm6tqpUbLvfVkb7WVocpzT7K
	TyW3fWNjD1s8Bs
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444698185a.51.1792444145423;
        Mon, 19 Oct 2026 14:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444696785a.51.1792444144985;
        Mon, 19 Oct 2026 14:09:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2280308e87.42.2026.10.19.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:09:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <pzt2y3ruacpl3eky5l6kfud66pdqd3dlnifnb5e27cvipqel4s@dx2rvvje2hcz>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
 <sashiko-outbox-177755@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-177755@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX21z30FbyVOqE
 Tv4JughdSPGFq488jkYojRBjrwjrvfSzvegQB8GR3BvVkJ7MHW6HCYeHnhNzrlzYGI1Q6xZZauu
 yJQhXZNcogiKrJAQnHBTbkwBhsA9OZoyC5jGxsBaxuXsXXKGMwI+DLx45Or5oU2eCQfE91Gl5+5
 MpBlSQ0oyanBOUjqwaAwdwUJ7zu8WxqwaAExOmsBjS1dp5y/4qQBwXocN0VBJQgSwdUc8bb0eav
 TnXtOpbghRplBS4MggJhtUAYJ6ww00QkgqYraWDGfE9FZjq05xjqjHPBygYGY5jVOmlfI37NM2D
 zOUIAV2KG+cBcCS6kvj/kemL8noWn5cC0mSLE7IQ3H156ahU3zLmyhgAiC9+GlSWUhsAwkGvugm
 I3zK0X6CmSJuHeoloX3CrSA4LKIcCJmGWc6H0JWyqICiqHuTk6dN1Mopg+tyPqOtdUCMuXEl51L
 l9+p4wIBr19mLasnPfQ==
X-Proofpoint-GUID: i7yI5sqwuPbhdHbbPK4_PJch3URCaEg7
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad686f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YIeo-Y4wl5u7AN86ee4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX9YHVEIj2xHrz
 Y0MAa4Uvj9cqRYT5UznAm6eDTJqnCQypyhdsSWSmGxI7a7164gbnyIewG9D17frHWSLtGVaRz+f
 vahQJUr7Lt9IxL8ZORPP0YXs4s/y/NQ=
X-Proofpoint-ORIG-GUID: i7yI5sqwuPbhdHbbPK4_PJch3URCaEg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190084

On Mon, Oct 19, 2026 at 03:33:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing output-disable in adv7533_int_default

Yes, I'll fix this later. The current patch worked with the older
pinctrl tree.

> --
> 
> commit 18e53f95f5fe825b6b2171c0f9241c69a999af55
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin
> 
> This commit adds a default pinctrl state for the ADV7535 HDMI bridge on the
> Inforce IFC6560 board to configure PM660L GPIO11 as a digital input with
> internal bias disabled.
> 

-- 
With best wishes
Dmitry
