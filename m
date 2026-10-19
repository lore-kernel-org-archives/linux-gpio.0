Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38B3D9DD4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396652; cv=none; b=B8+i1pHJMC0IswWsRdL5rvM9CnCUk8ixeVi/Za2yDaDXQ3qCrM0+H4BoGzP4cFuS0GNwQGQ3Ka2/xFfMxfoN/xyU+10cQDng9JIowq1SLpLr4ZLnBpWp0duiCFIAwDNwbHpmQkPvWmFjwsdJ0JhSa3wQpeHHYa3zBIIh2fmtMG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396652; c=relaxed/simple;
	bh=u6Ds4ERwD4miSjn/mQSOGAbHAzapGlw42DsLAnt5SwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBxU7ohDeNqAg+nRkLL47Wse1fwo6FYUqhXNB6FRYtQq9JDnXuZeIYH+TP/+6vNwvMnKWHbZ0SHNsQzXc3x+jWOon0o/rLiV6gKCHfraVSuSO1FNbD/ac7/BVkt6m/9tP45MjYnUFeq3MbfKE/Oq0rUn7UvFxXmvD/6hBDHEvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fN/hrEPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIEq881L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fN/hrEPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIEq881L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4iu0f1405347
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=; b=fN/hrEPRMEN6Tfce
	lE0pUjPijZU928u/hLVXYEnbWOgZuRXf2jNXySdQ2tD4FE18Pqw2wuWL+vSHDfuL
	KIm+WhgYUkPgjXlZIzYFulEc6F7YsShAvw9OrclDpoSzPnxAnyvjmHjGBfJ15ARN
	48WHNfDmTeoLAkf3dvUmno+vRy9ComlqkfkBwrp8P9MXSF9L4p4XzG4bq3okeh/C
	k1zJiRaISB7Fwl/pGK838mm80u5+XSTRq9snRs6ydz5QdZfUy14ELjj4VOatSFov
	TefaTv13E940KtyXb0wPOWqe8cG5q2E/qmdHczFhgLNhC8a0y+AMiEkx/Oazu2Rt
	w4UIIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr8u2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso535753385a.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 00:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396649; x=1793001449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=OIEq881LgNllasCyvBeJnF0huyFf//sWLV2gqCWNdj4fdQZfpIkr2AtFxtaLoZIEmd
         oAX7PBgZoEj2kyE78yv9Afr5tB7IwTKYQBG4/QIqjmowVw1V8m+UTTiHfJDf8lDtfZBc
         lezGlCBmFWl1vaHuRw5l2K5DSRexTzd+CrNxsMwyR/L5ACMk5INNYY9biUwTzYot7/oC
         fLbnW/7UneysrMLHbyNUh9MW8N/3TY0bEdYJ/mSF8cMnhtK5se+bDbiQCddRPGAj7hPK
         9QqfPmkZo+CipMdpb6HirQ0zfKOGwrZBhFJtCAqarthGpBph9+l9k8whEPY7RGqP2/Ng
         L9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396649; x=1793001449;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=JYHGMbMPBJqX1bRM3bBElayx+u4chgF9h3Uvo9av3OygrFyuNxD9HxL73NUsamtdW6
         sZEkigxapG5tITh2NRdkiONXK4d4lINl3hOv0ZfJCvqwcekiXTXhW3IEn3iI8L1iAYKa
         4KUrGaNiQGMAslwn50XYy0ozGaZqB+PjIrhMwIHFJgKjGhmuY+EgfqaRQbi1yLdBfGgR
         qgWXbqhtu+wbbG2bu9+18+YUqjx45x/xbUlhMiBT7674yfw5YCIbI2qagoXJAQB7ZK6B
         4llA9WFY7fAyiBdJWDukumValbsXOrXheMHXCZnxbbJlWogkluT9Pc0KAuRcQNBDDd0m
         Lbsg==
X-Forwarded-Encrypted: i=1; AKwUvBySZa+I9W8hxVeW1kWzhg9d01sGYH7tQKb8JXyHiffS/ayDfhrV3TaLjMvu5egcpvhcGOYeWp7H5Ecm@vger.kernel.org
X-Gm-Message-State: AFq9FYLDAjTxoxZC9No6C7qfWWUJS/qatHfAK1URc3BWG8NN7D0ePf9W
	ZQrwGt4KAqgpXf/wTUcoU6geBxdfJ+tvZLihHlIQsHPLWYpkMukNLa4FP2lg2Cv2wiSKbnCPRcO
	88eJ/XsVHC+Wiqw9IZ823WhB9N6NPYhuzPy+geToMsMe6wSEUPb8iM9u/oqOSVxIY
X-Gm-Gg: AYBFou2R8YJzAyQTWmrFBk2/gtg/o65ruvqF07gQoTqyntUv5TknoqwNvx33wmgQfOc
	hn4/2nSTyLF9ucMBUlr5qTksjgA6Z9hOkHA49gbZGdmojOZLVGH7Z/Ua+TbBg/V1qDrTka7jKB6
	LBxqLiufn3XUqF8rZ8itysyh42eIibJ5veu/NGqUSnpKDAdhdgcvSifbMkDtAFVnmBJpedj9lsB
	lr+bGkKsir2onRP1+3m01RW2PwWLWCbBw5bwZa58+M1jA1NlhqZB3vosG6LOxx+qm2IDuBdTHdi
	ceX7bJx/ToNBY7R6x2X5LTrb3uP1Us6sAFn+uspLdNnIqf25TomiTF8uO6t+iAAIDeW2sRO/eVk
	NNL2sMjsHwJxGAZD9b1CywIbdZ8E=
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703872185a.22.1792396649109;
        Mon, 19 Oct 2026 00:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703869485a.22.1792396648551;
        Mon, 19 Oct 2026 00:57:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm253558125e9.7.2026.10.19.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:57:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Mon, 19 Oct 2026 09:57:25 +0200
Message-ID: <179239664152.5295.18206280425730298577.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016154209.23193-1-jayarajdmit@gmail.com>
References: <20261016154209.23193-1-jayarajdmit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXw9ZkhzPS/ZMg
 xyJkCjlTQXRqQfi4sfHLDdWR+YxGyfvkWRRhFlYjN8QI8s/+2Z5VBc2xqzH1vJyrTyF2ggcN8A5
 nEMDdLfEzsvzMe5Ke9wFlNdrN5UsqQ/MWN0m6boztHH5WrR/0rPUu8IF66iJOo8eQWucL74ByO6
 /3Nyl+LzALZTjzrGAokuihwtR9pq1mNRjNPG5+cSWN9YbXQuJlbyoyfuU87Fv6fbRrNdoe3700r
 GikhHtPzRgvI+y54Z/Z9rz1ERGl4AKbZiysOnULooAzUyz5pc68752HifVmtTsBcCjikUtB5yZ7
 j5+g5NU0zglkTWHAPfJArDvPkC2s4gpx0fDENKgrHqe2e4JzFQHwHnwGja549mLwg/CsIOYJ2JN
 iGrOD/y2r2LzrgujjRs9YoL4D91yftA4bFKqh2hbuIf1Kr+rG2xmySg4/ygWJ+FKM8sULfmzhuF
 SJmU3XczhGS7a5AAppA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX2IBFZVkB/L0C
 QrgbGOUb8IVlJFwAvjOKZ8j9MkRCP5rjyIt1+8csUTyX9xjzQyMR4otLDimpEsvsaxzAJ3hizaV
 NZ4me48svWh+xCaNQmB42RXTJidaR8I=
X-Proofpoint-GUID: 6DIR7QIpLQZbCIwQZMcIqQVS6lErfgLL
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5cd69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HUrnIdepTNFFqM0LFW8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6DIR7QIpLQZbCIwQZMcIqQVS6lErfgLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Fri, 16 Oct 2026 21:12:09 +0530, Jayaraj Devaraj wrote:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
> 
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
> 
> [...]

Applied, thanks!

[1/1] gpio: lpc32xx: check devm_gpiochip_add_data() return value
      https://git.kernel.org/brgl/c/c117172a46c5169b28293003a109c0cc7b7588d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
