Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613027;
	b=S5dfx9KPMldRfQmXTg6w5MMK8RjvBkQQWapM5OlkyXCJwibuaNey55d6HyOgUqoaqSJP
	 U9tWS8U2HlevBhSAT3udrtW1L2pAAQ0OtNW4OUneoMi/oVQFa+TdMRV8OxAwRUASH51YS
	 SIVupTQNo7Gif+FFrejHlGQiI9ovdKFv63xFETvtNbql7I7fujXNBM5qaH4wD5tiYr4Gx
	 oCX92YLgTshWYMx8/bpEBj5n10IIFFQ4/DtFn/w2xss82IpdYS7pCdD5v4xrfcZ566RGU
	 rSbLNYROVnReP7c6mrp2U6rUuZlcnRCgO56uxMSje2g58czfS2uYNLhMYiAYIS3xmSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
	b=wn7GPY5KNypteT2psX0YQKmWAy4Ne4uH7cTCkTVZAAjZZVcUDaF/2//bxS/NyR6njtRU
	 TDdbiiuD6QlkzKM/GqKy5ZOcvrXvhYSWCcNcOUNwvIHzLM3fgWfkgHuJnxL81e8y3kuzS
	 xOMdU7B1uQrLtkGXv0WhypgYPT5WW0LUlFdamE5AhT4r5O0G/vGrc+oBKzzQ6MQOX0Fzz
	 /TJoyOJKwm6BDGpGaO5sDlsuL2hskhaiB2FB70p25NNx4EhzBDELys/bbcEoS4mXTvtSf
	 0FBwbJThA8wSL1X+V0byst1LzXz9jDigFjEnbbYQWhohMlNkEabmgnM+8JBnKQH1N7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeIjzfxP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNWLRG3E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB3606A337
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDB3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeIjzfxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNWLRG3E
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mT6E4034198
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=; b=UeIjzfxPQSU5Mrvy
	XTX3ZedT1gudutbBoFGqtfnM22kog3U9MaelqjlOHQqrG+gdpoL0tsJp4SFvrPLi
	oBab+Hcyz70CNYP4Jub/V7Tg9VqjRAhQruMxDYh5QqzJcwIgBe01vf+shWbapGci
	DYRCs6QwYfOu/tilS+Z1xCjOfHnXhvbCWeiSBwo7eL6Ew11C+NQpyaeEy3zwk/Kv
	FqCQSQuBmB4ss35oKp0DjbgxwEiCM0mbRZe70N0iaI5QIozEV92VQNMKI2e4ODoj
	dsfAkKDsGQ0SJTddDgZ7UJLJMU08uz7MObJpdsAan5t0hWN/W+ww+rs9OzsoWQXc
	9/uiWQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjy5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:23:44 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so1262727e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613023; x=1796217823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
        b=PNWLRG3EWWslP9n6PZXtB/6AJrFUVINoRPmQJa2nkLJywR2wTPDqO5D7IrWTmWcfhl
         EviLxy5Sfao2h1UMdAAXsDyi7W17cK/GhOxW1WUj8A3vpTQyEn4BAykp0XfvC8ndoQJt
         uRo4dQGAbcaEcRCjYOwkY6ZLXITF2w/xPKYoly2ZSy86odfMmNlg6dFz4i3QIKWR/ely
         FR7z80zDmTmfC+lMuxhdZ9VtcDpg6FwkGJ8C+lRaZar17gJOWRw8sQIOqOsu60QmethV
         /iIO54n3gjcOvHEsR6fdspRGp+4VN7UJ2Tvw6x5zW5Szz4bLBW1gWU6cFM4bCH80725v
         4zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613023; x=1796217823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
        b=fdCBjIMiwlAU7yfNvRxciJ97ssaUQPwBw/U3rS58ySYKqex2bduv/nhmeTZsIRzTLW
         xqRIqmTQxOOmyi7sNfds+XiZGhaN218VesI8Cz6FnuhodDk5ziOftP9sshRpaMhbQFJ4
         7b0CaD8BQF6jJoDpYeuMlec+GKFgwxE/3QTXRgLe/qdgdFqkz8qdIVjNnL6VveFw61pA
         pDmz/dxbjYrTfxalb/D7lUt+K1GrvvDSK1FTHQclQZMMeg+ngyx/FyQ2lLvvJP3DrCve
         zIDNnL6y9MVILUl4OuHIZE8dTQEe0t0Xm35TaM8FkDaiCFwX+bWZT+k3BevaKv1TxUZJ
         t/8A==
X-Forwarded-Encrypted: i=1; AL+hErGRfgQxqTccOmAAj5weExzjEIFtyqgLFkd8M4MxgcIzSisACsPaxq9uvddosKR8tasVuKApetbFU8gD@vger.kernel.org
X-Gm-Message-State: APuU4Z9J37xMB4GA5qOxMDjPZRnjKOOJuvcfG32Tdx/mNe2hETdaYXZs
	vk/N8E0J1xQl4Gzg0Awql3wVAOdpoKtdCfvKFDcALMoyTjbnkggvuW/IpVoEBpk7QKbDxa3a+bc
	NfaptJO99PyR8j7TsjBmeZDCK8JX+mIwOUhy073LxYh4/7anuqKpCVwUdska9d4T6J+EuqUKO
X-Gm-Gg: AZFdTZdIubCLADwdHx4JfKB9tAN9Ua/dClM6GCqou+4G++VeEXGn6NAFe3dhkvLeTR+
	ZfQajnQPzvfCNvpmjvegWdl7JrmiIG8QMQ6GE3fcm+oNAuqUF0741h9UTh3SbVlz2dJId6UzGJo
	pBUmRmwGRp57OMM0bHsWzrpespCfDGJo9DttQADMn2j2CwiTvfUSmMtNaNGxktLxJLsrNSH+ZKb
	xTe7hWSQ2Lv66UiBFFX7rCCbfw1IPxmH5VQfT+WF6Pq0jUmCIqns2GA41BExfvPSivs+Wr1igLW
	BAZ5F1tTwm6qSU4SQwLfvcRd0b+cgnhee6bnM44wyC4C8h8sZnaD9dbXLmq+nTAhJ/hzTDvqrlP
	Z9q572o0MNFEOlC8Hzxlvdof+sgQmcTX20I+dPq9lQRSnlK9ECWoahfjZb7VcuN+86DNCrpVW5c
	Ki6Cm3EBJb+JULt/QUrcwAa5pzYbIHdyHpEq+WuufB23mSRGY/6FCCgGqZn6N58Q==
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr9459971e0c.10.1795613023534;
        Wed, 25 Nov 2026 05:23:43 -0800 (PST)
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr9459896e0c.10.1795613022653;
        Wed, 25 Nov 2026 05:23:42 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm506211355e9.15.2026.11.25.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:23:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix inverted trace values in gpiod_get_array_value()
Date: Wed, 25 Nov 2026 14:23:39 +0100
Message-ID: <179561301701.43809.14124670705710652305.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120130208.89621-1-jan@jschaer.ch>
References: <20261120130208.89621-1-jan@jschaer.ch>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX6fT5KqjW04xo
 2ELQxGgK1g7Agop7sHH8HERtcQ5g+Regitri6PsfKgRa0mgPalnkxWTxnyiwJ16iX/CRU6B3sTL
 3OZO5KpzpQn/DLengIiNGosjYiW8yxw=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06e160 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4nZhoAphiK6mMl3Pq-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX1YIyiKVj0qPd
 SjOX34ECBHuKxAj7po+rah4zmGQTulrdXrbBqm22Xt1Q2RUJiMcKd+XyIRZ0NaDO0PNCXqryuyq
 0doVJFXETZmYEQsxTTpuhopWhMXwACgvs0qYF9Q3dLliQo0LTSiiWoO+/jyY8ktKPKJtqEpdIhq
 XnGNg5qlItMvwviAn+BIIvnTBeJeld0WOAG3zkTGYjih0JenszXn+q80aRvUtCYZTA/qvzWYq5+
 VZn14N5gbw+Q2g3rYLxg9O4Rhl2bHpMF4HFy6ejxOkpMnlZ6U/qgCeT4id/T6CQdraJJmP0oVMG
 mS3yVw1Hol1pjyidbG8AzPZbRblg8d5sR7/AaDtXAphE9IP/BKKOHKTXKP3Bi/dexepIgyX25ml
 GyoFfEQIuGYnS9mIcHCKJV+k5j9rgPOHsPLbRibrgt6vc4Nn5jqH1AXai4AFOo5TLYuNGucc00o
 wuJYDknvqpUNhgn+hlQ==
X-Proofpoint-ORIG-GUID: XK6SkVMhqsNSaHVtW5UDn5dBjOMR4Smg
X-Proofpoint-GUID: XK6SkVMhqsNSaHVtW5UDn5dBjOMR4Smg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053


On Fri, 20 Nov 2026 14:02:08 +0100, Jan Schär wrote:
> Almost all trace_gpio_value() calls report the raw value.
> gpiod_get_array_value_complex() is the only exception; it reports
> the logical value in traces unless the caller requests raw values.
> This inconsistency makes GPIO traces confusing.
> 
> Move the trace call earlier, where the value is still raw.
> Now, all GPIO traces consistently report raw values.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix inverted trace values in gpiod_get_array_value()
      https://git.kernel.org/brgl/c/601acadb79b62ee52edbd29ec69d8f677dc32dcd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
