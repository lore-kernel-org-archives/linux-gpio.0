Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440485;
	b=KGfKbWas5tRsj1ZZZyceBy0XKOzxEk7afZ77yeSWQdMwCMTN+mucv224GewrX6EXxsDp
	 1nScFFdjfvr118c+VPUl3x/svXgb+yl6AHxFd0laKxgt5ri18M7l2Bo05AbbJgEHos/16
	 tL6mp0eex41aoGR76JPBX9NLkkYAMGLRY+DLIPzJs3yZKTaoTSSmjTh8LQHeKGaVGchav
	 j8GMyBD2Dv6sZy25OlP3FsKffl8+W5kbo4DlF8yncqFrm863ZzYGraf0FVUuBlqnF0NJ9
	 Y3ZDx3zat7j4AJw1oytot4D+ALh17O9REOWbcgN22UErw4JpvMzHuuofsF9PNOLSPyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
	b=o+cjN6HlbzoNqyUSHthQY9o8iXEq1u78Iy2Qi/GhclBVjaqBR3J1MDKUOJ4BFu6qDa16
	 Lh2+mM9aZo5UyIBYwuw9+gT4IkwcIvz7SX0mSv47v4kGI9QFNDkh/RTtivdw3qqUGUE6i
	 gUombbBLCHQrWMjgrYHDOCptFI4KoTnQnLfLR0A/arm9D9knftut6E4urfMivEx3nnXgm
	 GjysVEykul87A+PEyW9rlh+VJH4SP/jgduDQDhaz31aY3qCe1y2zLTFFkmTzUaABr8im1
	 wgM/BaicXtmDuYzv779OOBIQC4XlzugEM1tTyD2ISTKl2VcpkwywU8/r0Rum8Ha8/Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQgXNE+q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSR7jNdx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07553606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07553606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQgXNE+q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSR7jNdx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL8JB694266
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=; b=RQgXNE+qC/2VTru9
	F52+bqz1hcdHng5YFEzD6FunAsLiPVOTJr4yD7UcXEAlnYr0csa6wJjb8rn98hXI
	mkj1oDxF9QrYPp+fobnupeFuVXLW72HMh5hwi5n8G8NtGViBHsX8dABcu/vUlAjE
	6YxxDwHSmZaMlUgocDocpjmoSzR08N0f5B5yeQmu8JSbWKepA9t9vM6Tn9zbV9Ml
	wSHXMxOPViIRARGkINXAe/3FLYVKknbKDua1cL+i8RT0gk6MH+4TpLp4zsKXU3fi
	TC3MRQG9CFGPIYLuk0NU8bcxoeh97lYgywPNSng9IZ9QZHMYdEt+1+xmFWo6cusj
	bj3ueA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rf70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:28:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2291738e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440482; x=1796045282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
        b=dSR7jNdxOUQ6jeqUp35h8TW4kAVV3DYTyKjnxCIVYcSKHVryKRdj3Y5bpN/T/Rmq0b
         +Vkh+d2CPoz8e9akpY9FYl8lMK7/Q+AWkkLb4avPM3ZvrulbD7k2I3HKqnfew4BtVBN+
         MFYFSFI33BppzZMyXOSNCnt7xXeW4xY8Dt6lvodIr1XFNsMOJTFFN5UTrKuQn+GXAEQj
         rqWnAni9UwZ9ta5wBBpFj5uSpMx1zjtNV/MrU7XnSTITV1CEUkX1nZCJl25IT37zMRzc
         gWxm/bUoT7qzsAYqtTd/HqN0ShTFvQxJGvs2s1z5RwMGmOW9/7NjxKfX+3Xc3UtBQBeh
         on2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440482; x=1796045282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
        b=VJLVVkPUlNWYXwyAcKTVwalS2Mj8nOmslzVNIoXNUnPhOXF9ZCbxZI8c4OT9kvr1Ft
         kxtiYIEVf0y28aukd4gyx4ahbs0Knsc7VY5epEXNCWXRemTXBln0k7qmi7IcKRy3+7HY
         /T8wakIThKiZRqVoDTXkf9d0gjvxow58u187MZK+T3L72PislzAjKm/Z93xAVsemtR5d
         KXxnIz/pop08MzdAi7C9XI0Rwwdgdfp7vxDGsjbNvpTCz7mxWpm9hpXAY3dtoi6uDN5V
         VWVXgET/7vI6KHnjB5NQFlm3+ToZS4mXoT+Sq0il9LfF1VyJfrt/Y8LVc3kkGRV/pihg
         a7iw==
X-Forwarded-Encrypted: i=1; AL+hErHOma4H865DitQPmZtkIvVYEqOyGXLePbagVm9yOrC26DCtVEUlSnsW0MO6Uw1PX2Ed8yq1Kq/gvl58@vger.kernel.org
X-Gm-Message-State: APuU4Z+dEnU7CiworlYaK9TL6Tdq5qqrunw3TiuXNstIeA4FdZeHhcIj
	+cVEKUeffZI+J3cJZmWMC6eIn8yeqDOP7DdZ1KRDA/Awq7u/f5MvbFBAXoIDVL5JEPFDVDbtq/1
	dINNTnTGlXlFIJDDlHms0cxkzr+j9iKpo2/oW5y0e8oBZOsDART/0ap/5dWOP1r6N
X-Gm-Gg: AZFdTZf+k8E+ggYXgOLSQIouPpapvHX05LSpVMI0aHwxoZd8lJ1AGcGyHTwIjDQvcMG
	c/nV6jGDlaARYCvtfVzmiGJ77SANKX8624Ou3lImPZ+KST0/wgfEKWd5wp7YvfceOLaaISAflz5
	DHp/MnnIoH/XtEUEn944QfsRBA+Ubm31jeAfLmFLcKnCsqYiBebxwehktXrC+ZPZIW5O+zX+sQN
	5MyaaLXVaSK2OTRSTiEzgKKHQr4kMmeHuRB0/lYzHO7iRVAcHruSYLdBhGv3gkLRdxdrnQ4oQUV
	5zYLOzWo2G3EjaHbzb1hiyr6IyCRWkPnEG1xdSMz4TRdh8ohSsv9sH2F6PqsuD9sUankhu+KaDt
	708+fan912AHt6HT1/NRo4GIUAjMI2MYbRPlwwEmXHgGOZ10vM4HOl+rs5n9WE8HDqamY2Qsjn6
	Z/
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr5658311e0c.10.1795440482135;
        Mon, 23 Nov 2026 05:28:02 -0800 (PST)
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr5658291e0c.10.1795440481691;
        Mon, 23 Nov 2026 05:28:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm401690135e9.7.2026.11.23.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:28:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Dean Sellers <dean@sellers.id.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: restore output registers before direction on resume
Date: Mon, 23 Nov 2026 14:27:59 +0100
Message-ID: <179544047516.57001.1642387166743976170.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118070321.2557621-1-dean@sellers.id.au>
References: <20261118070321.2557621-1-dean@sellers.id.au>
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
X-Proofpoint-GUID: ga5uU9EjsT24tCpoxg5MLTTrp5eGWuRB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX2vEaGmtYs2lr
 /NTb+YJozUPuBLi8gY6VTcznbaM4SU7vKY/kLXOR1NAOGCgR5439+APtQwJ5T+hVL17IBXDfCDs
 7WY2SEAAypGZdVME0OhohWedexA3BRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfXxgvCHaunkkXs
 TkhxQQH+kag3cprCzcTwIwgeK2N84gcHVt9uAbFkeDd9H7KGQM/9B1dKY6x+NStqulRB0bfQFri
 3QL6+bwU1mA06WU0UwtN1CDP4SbH3c0NMexFkZ9AlR8zjiN56G2Fq7A0PYNkEuL1PYjlOUWaSkL
 xYsSGuXyC/ebYt29RV8ksX7+/nwbTTa8ZG6oZ8EJQK9vPwj1MeDX7E+Of/JrBtMJiE6IGjx8/UH
 J7AzYYDnSjVdSgH2QLL2hYGcBQfFIwyFPv6D04vGZV4q1Hfag1eXY3ff8FY6J/RKpi162HEEUfJ
 DYr5S1JCck8CH5ur/cHrOyTIyrCm3aZ8iosErllS5obwAxrF6hrD4SHiddQsaQfMKYw2w+YI8+n
 Iy7FEdgNSNcRVTmMd7tVZpqqi6fT3/ddNQ2rbgDsB3Hq/BedKP3jp5Y3HrwRRnS+BteULZw41Lc
 zg1w3SK/d9roD/QFlSA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b043f63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VMBGBFbNl3An4jpmTXsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ga5uU9EjsT24tCpoxg5MLTTrp5eGWuRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053


On Wed, 18 Nov 2026 18:03:21 +1100, Dean Sellers wrote:
> pca953x_regcache_sync() restores the direction registers before the
> output registers. If the chip lost power across suspend, it comes back
> with every line an input and its output registers at their power-on
> value, which is all-high on most of these parts. Restoring direction
> first turns the configured lines back into outputs while the output
> registers still hold that value. Every line programmed low is then
> driven high for the duration of the direction write and the output write
> that follows. Where those lines drive a load, there is potential for a
> spurious output.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: restore output registers before direction on resume
      https://git.kernel.org/brgl/c/354e4d6f907ad7a60377bf817c700a674f063044

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
