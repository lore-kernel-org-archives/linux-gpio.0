Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442950;
	b=2r7iN2NqeQjelrYuBCbw92O+HSN20FYEE8dn/6NKma2xYr0/kPmq/BEErhhfZ3bUS8mF
	 UE5MbREDiM7xiYr92POeO99UZz2llp4IX0aMeH0TAwMl+fb+HO0ywvWqtT/ufVW2cexvX
	 8l9uKUssnu1GaAWbp0jmQqoT04T9kgiiqQjVLEc8LHtlZ4WrwmeWGT2hZwf1GVPKXlcwh
	 DEfLPn+T/G088PtKnTfVFfg7Lvlauwhh5NR2ihSlN2X/EfIWXTSPpZLKXfZKICsZmJcTo
	 Alvwn1SkXMvfN7MTrVQ9VukguhdVZLKX//3jtmXsb+1UN3nQJ9QygJSWe2l8E0yBcYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
	b=gwbYmKGq3D0MQKbPgAhKwDfltmqqr29aMfKeLrn1QpBE5fs/jGZLGQapIxsfbJzGyhDu
	 vnnig8dLxjVPUIRiE2IwsRknZxPExIIBEriKSm7Nvw/gdwII3DiVBSWeuXJEYuFx9At34
	 0h9UGcfBRTE+VPG2dVUYw+28Kcy4jV1Ml879GPP74IdDcCZ/8gcPWj5CxGlL7I1FTZf/y
	 hhMtM62n6DJGfNT5eZfrI8Oh4OOh0s6zb75aZf2FI6UTsT1qzSkhjt7R0UVtt5SGS+57t
	 vwHmLntDfAj/r1eEUTokgoklmU1RZeD0EswkHs8roLs8CkIm6n+JN+B4swO1GBJg/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLgpdGUJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFzz6mAc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BFE606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLgpdGUJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFzz6mAc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL11v3072383
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=; b=LLgpdGUJ1SlXSJg4
	iAjHuvN3tMNuAcVJq86sDrJrdsqkSutslZIpmoxy27btfMPoVMSrSTpu12of/lIz
	53ZtA6kWIF/7TZo/7GdzbNfTvQCYtKagk1lMp4OjiB8j2e7f/qSBZO4IcSXAQTvN
	znpw3SrnTX8eJlFkZDA3hDl13H4DLM890NCeLnt81Si4TBNVZau8f/WiKynlelWJ
	6VjuLy7RIvmP3YEZOAGCdm6t5TUplTs+/XV3m/F6W+w5jWBcoT4x6MQDEVtf8vAA
	ChRu7uBtDabzU/tgiP9q3VBfj3S+X9m9jMQlp7XBiQRhtOv01aUlJH+IsPcx8ggm
	G41zGg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sbph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:08 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3b7d66416so42075867b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442948; x=1796047748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
        b=KFzz6mAc6oJd0WjUxSfoCbtaL5aYGWhd+3jYKePJfWujSXJB3N++iNL7pJwCtPbJLe
         GPAi2Uh7yATU7typn1Xz+bVJS+vKuUiBTbZ0yUtKybjEguWQu4AeXMnxbZ8/EJf5OOW/
         aqB8TGcnGUuVOtNmWu/ofmv3dYDZTDSJ9PFQVW+nx/gerECdz/qCYPiBCRcOcZrXBj03
         5ptLY2sin0WuHFVglRcm2BcEo0+KTtny6S9O1spdqseJC9AloSTvrZ+ljBklXiAAYmfB
         VB2SszRoNkF8N/9QBmiRCupSqE9PfgDlEG2dtD+eCD7k/pw33gvBFyFoykexoJuOLmG9
         gO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442948; x=1796047748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
        b=Lnm4jnhpa8BT6uIfsrRiWY826HBjsCQuCS8Hwnq1ZY4FAI6vmc4m6exGGNAwIu5fo/
         fTc1VJ7Suev8UqxZgYFvuB33Q0r41IpDTWYNRmq68zL/QhdswFGO7tnmyYPnt4Q/9aK4
         jwCvkUfohHtgy+M/5/MJ1ZCj8hqWiAwXCn/R8WY2VzBSVI7DRi3K4daJnkoDrp6TDsbm
         VsyEHlAmj7OP2CuWjNs1AgsgPgV7nTOK9spsGxDTER3nEFvk2Mjp10fP5r90Av7l6hpF
         toIwtTlyKbFQbLioLY8srzw/2tIosUpuYPDi9RjLvA8la8Ra49f8XVWxRAV2xuqbD0CQ
         SM9A==
X-Forwarded-Encrypted: i=1; AL+hErGLcjT01pvxpbv2qQIa+yN8FHAnhpQGJVgxiG7z/5zFK2Aqp35dWD1rm6GNQA6qlgjks68N6eSJybYP@vger.kernel.org
X-Gm-Message-State: APuU4Z8EOclgv2wt0Ra94alw9N7NM9K1M1tjoGtcvvF90WpocfKBznYO
	Tw0iLHEV8xLHck6IaJs0yIOSpy4KRbwdW88Px1vfSDmQrLA+ugivylUogFMcco2f4suTqpFq8lu
	0DHUgBQPz5mLWzfCvgZvovc0c7YkAxU/zZhcIn2/JcA5OkA3VBrIeuX9z6C8DUq9D
X-Gm-Gg: AZFdTZcss9WwLSMm44fIcPuaSQ/TBoXoZ/17r7XV62eJpC9TNuvN0rY6Q2G+esMLwVZ
	+TpzyPoJsEGz2wsBYZMnrovUGHL+drGXLkiHh70vXdbJ8cHO2N6Q3r/3wtsWZGi3SyI6d+fNpu5
	f0laRDLx1vRtVqq3z+HjYvgDS+SwZrk0dYZmp2H2cYFfV9kR3PIije2eEQWEqokVoJ1ikHvKk81
	36fFIaRUyWDE5b/UxmC0iDQO2BA2duWKI1zgmQXrXOMRirSlIOCPOzoKDmGOAWJr6V3thFhmcVv
	juGuas5PTTa9Eq9ZHUgz7/LGovv/yHRj/QYJ7IRxmZdIUYj+rE6lc7pR9xPDU4Q3WmMsFawOs3p
	W04mmp3uBiAbQLkGEDnqLEGqoWsFfGzD48/YtbDP08Dch3NGyjxtRSh2/KwyGKr58nCTBm4e0Vz
	VO
X-Received: by 2002:a05:690c:9b0c:b0:873:5c6b:a305 with SMTP id 00721157ae682-8b5204dab2emr44238387b3.51.1795442947624;
        Mon, 23 Nov 2026 06:09:07 -0800 (PST)
X-Received: by 2002:a05:690c:9b0c:b0:873:5c6b:a305 with SMTP id 00721157ae682-8b5204dab2emr44238237b3.51.1795442947231;
        Mon, 23 Nov 2026 06:09:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm23866920f8f.11.2026.11.23.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, gabravier@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio-hammer: Accept the maximum number of line offsets
Date: Mon, 23 Nov 2026 15:09:01 +0100
Message-ID: <179544293817.66058.4113101033657757077.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120061827.98066-1-zhujun2@cmss.chinamobile.com>
References: <20261120061827.98066-1-zhujun2@cmss.chinamobile.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044904 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CxNR_xoaQCOUwlmFdjAA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX3tdiNYsqiDRe
 PTxbkIH7u/KeLdOIjt527omwc28hgklDAUu+qzZK1zDHpDRtQmTyVGPF1olKPUQFE6xJbv6q98c
 wfrv8Ccqztg/v4qMjHvZiXcAPrxz0pZ09xR1eerPwpjIHuJsmWZ2AQUozT4lQ58OCdQW8uDRmLs
 AVUf/3PHAYaGyP5MKF37BcOhorfN0go49XpfoxprhLGzZWbSi6hBdA4ce6wGE7cnZwqtk4F5Mfd
 XKLLP2Q7WcaZ4G8VXpgiynO7yYC/ZrAA3/EcvK3rIWVOLg823+jpxmCmsdwJ/ef/N+k9uuomDJw
 gJImi6D9PAwR/DezHcrW9rrV8pUKd2E9xkX+lQsFrpntP872AuK1BId7bD2NOflg79RGTYIBr9e
 j3azA0mGM1AK9KTvp+IGGWCPPEEar7ZkofNrGlMw9zLy75L5X73TBC+CgU3+fJas/dHUjygTX0i
 +TVraMNDPXPYfQoDjDw==
X-Proofpoint-GUID: 8vwu2wj7RqF-ksV9ByFOKVugUp15W7gt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX6nn6Wc2J/h0Z
 vJWGsBHi5eR3qFx/2zlVIo7fLmPZZk6/r28CJNCh+9YhEkHCsVsLvc1dqODPE59mfqxumyGlvyu
 NBfhynwuYDAMtLYB0ogFb8zP9cEcMNw=
X-Proofpoint-ORIG-GUID: 8vwu2wj7RqF-ksV9ByFOKVugUp15W7gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230056


On Fri, 20 Nov 2026 14:18:27 +0800, Zhu Jun wrote:
> The offset count is incremented for every -o option, but the final
> check rejects the maximum itself and reports one extra offset. Only
> reject counts above the maximum and report the actual count.
> 
> 

Applied, thanks!

[1/1] tools: gpio-hammer: Accept the maximum number of line offsets
      https://git.kernel.org/brgl/c/0b3f1876d6db7fad0391ce714b315269b0dd5758

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
