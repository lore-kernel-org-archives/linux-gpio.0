Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9473D9DD4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396948; cv=none; b=V53fcxP4Wnr8gvT6NJnq+aXABuNZAvBWGd6jjgGm8dai+JSfReoem50L+ChZ3eBUEBp4s6mdfkhgB0iE3CltDoB7mjs1C3MBoCRF4vGr8+2Pqu+GSMMuHOXA8xXg6Kr+MdwUQyXDFGoVvehLHmCTGn4rOqBSQ6Jl17MUm7phVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396948; c=relaxed/simple;
	bh=kYlPJuAuIKr5qyWDVfbS3K51caxRUyA4HeA7cellua8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4RAKKeq0W6BzdCz3IQV4G3/3mWoLF+Yms2HKtrwLBV7CyBctLRSzd1uEcHpX0+q+oy85dEVK/QjsJYlS72Yw9guCdyD0vB4Bu59j6y9hXw0lpd6R3SXHUc0pmtJqMpoDnGssG8G9MN1vbiv/zUVpeCiQjib+anC8+scycEFiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m51zfZxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYOZX9Xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m51zfZxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYOZX9Xz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4iu1P1405347
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=; b=m51zfZxG6tsszrz7
	5+GVSh7lRNYenON9mj/Cu50y0dYSUhsQLPY9IBZ4HC6hKHC6dySawbLFVZQqbRps
	THoMxUczMSeM3Gnt8836HH0l2gi+7L6+zaw56XFJFswrnFY0A7tinCwiasQq+DYm
	2f7AI0OnNaF2Mx90/XiDteQBJd/LleaQQZthHTslrYrAcG2ky2CfdAB7PiMucl9f
	4Ev3FGjj97He8hzcrl9Zm1yo126ysY5qi2PxoKLGoyIcKW11extuBPdnXUNkAYWb
	FsuV36I+OiQXTg4pMzFehWDYz2K1ZdldY9frtMKxlUdneRlkhIK5b7MSO9C1U44n
	lWXBqg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr8ut7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:02:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91becce058aso34112516d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396944; x=1793001744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=;
        b=KYOZX9Xz52bNVG1I5wOypRyEyhx247XuvvDFuazByz1NzGdUKEScMFSIkgeiE17skp
         jgAZQwmTESN2b8D0gTwl5/0YNbEJkNfwDRRWLO6uYol5PaSV2OZc/N+qGd3Ug/K6Ze1c
         AFeULePvcv0hVJwNlk3khB8d1sFnyRlc/EDZp4+ZmMtD3AYokN5jdRG/ZqnJDD64a5nJ
         ibjJ4mSg1AG3sVXGClXzHia13AOUjqQnVV0vC7f8oQMGafDQZUtNpngbJAOaXKjH4TlW
         Yy2hnB0CwWZRKmB1A3TMYFXYYN4SWNhO7RUq8WzJmUic/BWRJw9s0fFoFO2CMf9ngba9
         0QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396944; x=1793001744;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=;
        b=cIFSa/oCCBxpuRo2fpj+6OglbkhVz3MLuyQUbSnU5JkMeIbkvY63D3/KsYV1Sm+WSw
         Ge099qib3Sti1+aUx15s36shnu9jsibXxluUTkfra5R9XEDfWna2wrh4ylq0nSIvLTsU
         jFpAIYoPpwKcXhIcimeMpfGS9hgsXR1Mkbq4ZCwjJ/YXoatA6eTfoao1ABxNqc1lCEk9
         QzxdlMlotatnvFnkotQt7N4uFN5WzqvjUBMBdvvwg9ZKGvJGO72gYxUuomatGZZ+FqNP
         m4MjI4iZQXWEv1xVSj6gtDigpK6/szlX33S5tXSXW3uk6lJrwYgA0mOUwwEW4hjR1UYh
         el8w==
X-Forwarded-Encrypted: i=1; AKwUvBzy+gey3r3dnQ4JPqCf44tLy/M9SYmLeAfKi3A29dTCTCbZ7ssxsJGYeD+ys33hwfCN1nYQ61Cb26vu@vger.kernel.org
X-Gm-Message-State: AFq9FYLim+wMeHdLIZQiGBvbsDi1r/UuZydbsgnVYSvj33Um5SCXsKA6
	+CDDt8d6D5vH5XyAHylOC5c93MtY9I4OOam//yLM6KJND9E04t8rdSawOd1wHdZT+4DxdT7qUKi
	N3zgx+2ZJJmDqxDPnpvVq8DUUtqSZ/1EJeUNO93sul10xp6YwvYDfFlGmLnICPB48
X-Gm-Gg: AYBFou39w6nbBEdDrPPmXP3ykQgZXG80XVlijrvdaKmvhq86jo0yhP6C6fDra74xq94
	pX4Aq9Px1cyoC/BGs0idMCSbc5EeinqyBfVv9oImpOtV4nA/ehDfkWIe3qEeBLP9L6JLmL/ihK3
	vqXAVshqt4hqAbOVRxVHBCg8FQy+ZHlMhekCMaWB2reAcyw+mB6DmLLdWki+R552TZBMuXU/9zo
	ZoI1t0FZwgtO9jUwGuD6soZ2Tmdz6FM0v0bgvpLBYJKwdLz5i7rMgCZgTw8PvgF9rIHrHw7rGXM
	AQwK41SL0eC/iW2IdJC+2U3/itdU+crGoqeaZnXHvuQ/f8NU9q3PKVFjg/K87lX0UAg5NAEvW1z
	KqPSXAAzXzQ5tK4W4TGcFSmC15ns=
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr994241785a.72.1792396944191;
        Mon, 19 Oct 2026 01:02:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr994239885a.72.1792396943788;
        Mon, 19 Oct 2026 01:02:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm251269315e9.14.2026.10.19.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:02:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kent Gibson <warthog618@gmail.com>, Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is released
Date: Mon, 19 Oct 2026 10:02:19 +0200
Message-ID: <179239693683.5934.5426638278693207577.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX4OPqWrOuaTse
 DW/Lrc3H0D/BRZo15TZW9M1I+jq8E9NPjsE1/hVZhgq33bKhUfbvB6OQMb0doWvU/CGipcsAzTU
 zIFGsF13sh7vyf40wFirvP4TV/F3bOjwvcUddSEJ8MpLYHBUnFXCExnCXXlbBFYzAx+OBOkIcoO
 GTHtPVkSGK30NJS5e3Mm2P7wkOnm+Io28QztPpzXRwJ6zYQtHLNXsE/foJXGlJBGt9RDX5DnXTW
 /RrJrXj+wESCj0ty9kcwYvo9N+0raqvL0zCt9JjqMsmTMVOqk3irqK1hAcFUX073WsAD3lemMUL
 P2YJFr2iW+Dc6jpIpdDG/eUYCbVJ784agRrukUmZYK1RRf59C4429gEfsK70m/Nn+SOW7MT3cKz
 bkO2pxwCs9648Tond6qy2DCl22uDT6QxnvBB+6vh2Lf17C3Gh9zaGH25XXkWnueZPuGzQM42k73
 DD9hzZFEWjCDCjSHZTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX1MRxx1T/3TkF
 y2ufJs9Mqj2kJTMQZN803sUWl2DA/CHEqAgqcH7inhq22w2yUHuy0CDc3CCYymYl1FYvhceB+oA
 b89Fi9W+9C2vCMQDQbTMVxoiKpy3tRU=
X-Proofpoint-GUID: kugyV476IZsAFsYsqToS8P2iFkcVcwHT
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5ce91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=oiBmWXjJytMpFWU2:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NdVV1Al409Mjye1PRQwA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: kugyV476IZsAFsYsqToS8P2iFkcVcwHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Mon, 12 Oct 2026 16:49:45 +0300, Adrian Ambrozewicz wrote:
> gpiod_free_commit() clears the flags that a request sets on a line, but
> not GPIOD_FLAG_EVENT_CLOCK_REALTIME and GPIOD_FLAG_EVENT_CLOCK_HTE,
> which gpio_v2_line_config_flags_to_desc_flags() sets from the uAPI v2
> line config. Once a line requested with
> GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME or
> GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE is released, GPIO_V2_GET_LINEINFO_IOCTL
> and the line info changed events, the "released" one included, keep
> reporting that event clock for the free line:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: clear the event clock flags when a line is released
      https://git.kernel.org/brgl/c/d35f61581ee67f8d4d58c325bac813cea528b6b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
