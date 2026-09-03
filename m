Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1461436361
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433540; cv=none; b=XLYS351pQemq/P1FcZiIH1yLYSohhuwvfT1edqSojpTVSZjss/kHDeUr5FOkIvix9DsRpYTe8ZtsWzBlvaTYNPGtTnQ3TMSwoLFJH1TAQ+2kXNAgdmefujvmrVc30c9tipxlDJPQL4b885MhmUINzQ1MaeWONIKKP27u9LEF1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433540; c=relaxed/simple;
	bh=/qJDC6cugKVjmjaFiZdIAgE0dBgEMsPvwp+P8zVZKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrniibh+j4tmsr4y5OyBt3LIefA8Gi1/MKXLh8o3pYC4pLa0od+w6ZzqS99PH6NI8ULqsAZ7d9Raeeo/go9Fu0gvvvppQBh4dHLau3h1LFl0/Z8JoKqYDeybjW1KqLxejQAa+hbbWg7pZtQB3LkuhL1P3WnTYiySjeS6iFDk5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxaK/D9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj8VZpcw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxaK/D9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj8VZpcw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH2RG3720090
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 11:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHJgfTmB9a74tsOwrBzPpi9Z
	i24vB+4V/J7Jo+ncd8Y=; b=VxaK/D9d9ZLeFG4GKdKBa6I16OaErg5xO9KDaE+3
	XajvEu45mVJHmY0vHWUyec6/Xhg1O/jEUAmgHrJayuZBQUhocwNRpKuSBY0wJf5r
	cTYLMm0gC0TlWzdrGfk7oHqMA2aLWJwk4vVt16VcIAoAHWyxaK6cLkD2sswkVFSX
	aJ7ksiwGrd/FBcjgTyspUadfbViy/bCIMmSgL12azaioy71H/7zd8Ra47wwaAy4o
	54Z9PTGxc/PrekOdo6/1zPrRnWVyTkfH2foGispkM6hy2xohDt2XbhwF1CN8Pw2N
	YJOoDmBcXZSa6/1RGPhmnoYRoj7c+nMBq3Sh7tCxJrqPdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjssu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 11:05:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390ca1a9abso358734185a.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 04:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433537; x=1789038337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=hj8VZpcwvvCIrlmROri438TeN8cxjNvvHN4ku189eea3HWl5wNCj5L6J4uABlXFu62
         6m2BNrgdMsTOOaaLny+/19G34hC3k6QdPrnv/pXyTga98wjs+I0NKZe/27ivY8CgPJq2
         ZISH7k8zxm7gG7i1rnkoiUCAfU0Qsi7oPR7vg36F86DtE98rDrXGBubqRossZKZrUldP
         UA4QjgBhG86lyXO5euRiBtlHHb+JXg6z19H/RCFGtzNMSGbjFAdb71ntRgjqaa3OFxhg
         ujwz6CNM5A3/5Clraew0UzUQbcwJ9W8yDPujw24Jf2TxDVcgcLzyTBZj1EqyVrEimCug
         fvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433537; x=1789038337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=m+wTJqESUUBL8tOk83JPyUap+j7ezzaUv1arzExhEK2CC0y2SzFZ79NAoQ+oIHBrLy
         UwEuzqgNEDmLZQqouC5myzNVMivQM3C0zuzUmxUzRW5sKK+t172b2IiYmXOUEC9K4mjy
         Z5FVvVrHbeebLTfqxeI1IpoPWJ6RlnMK3J0jcnx6EAFwT8VUveNdwY9q3/PcVLTBjtHd
         5z9wl2sI9m6yhU9XUFS4rmRYBj56OB3kUJV821Jf9n3io2mpK6+HAjRf/bv0mt47qcS8
         e4RmYaOSV35AEgOMkqkv0uV4n1QtxJAfdMhHfeiO6O5uPghXy36wb4+Algzsfhx40V9p
         hA1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGAdMLqFnCPzSXOua5bAW+GUSPjSo1pDnmfG17o62C9ZpcTWb8rQyK28usnnZOealbAEvEhamx9GW2@vger.kernel.org
X-Gm-Message-State: AFuF++nBa8sgZqIvP4tvCtnx678bEgA5dRNTrU4tU2BC0UMwZNU8RqVb
	0FW2dBPBrra4NCdNfwCiXMxOSUInl9cQ85clYN7e3bCqrV0GHLI84xtUWPlFQxSY+iA8GXjJFLW
	b6WMfIT7nDrwzgIEMOjVnQpx74WRXFixUWTfo7GFjpFWbrvsFhiXPFgH8iVLkG5No
X-Gm-Gg: AYBFou2ZbrJ/ngEWR/JnxeGntqWi3WC0rGtT2KRFiBRWmolJix+UxeWxNIHKPLiLuBI
	8IDWCK9cpBrGInXMItuqrP+aZEAUIuvyTKq8ibZmiWNtnk57mx4KqqYSyDJoc1aCN4pqTwrN//7
	97636d2HYxfwkqoli0Xe8mWsbW9mNq//uSjOwUd8sF46vrMJQrgmH7ZCGGkvNyrOMjL5VhByZMi
	epGclPzh+VNxXccEu0Jyn8UUeoi0osINhPtDGme4N2eXrI4CYck/jKqduJ2uywc4JVbqrTrp7rI
	Ik1xDMBoRfH8zSkWW2K0LvOBEijf0v8eQSXuuhS90QO/63ZCib216pMKdQuPDOzKf/AWJjS/wt5
	qQfBtEYAqkICt8w==
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350755385a.29.1788433532142;
        Thu, 03 Sep 2026 04:05:32 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350745985a.29.1788433531584;
        Thu, 03 Sep 2026 04:05:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm74620175e9.12.2026.09.03.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:05:30 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:05:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <33t3reowiellyer7bc6ipp3n5jhchf5ozbj5imkctp7mcibkq4@w3jbhjet4w6z>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX+tkXVJpD/YoP
 T3nerglLInKc26raOXvnWwWyjxr41fqKWcN7XSsbYkWb4aXVe1BhPnyefSiA1rVSJZAvI2g5fTC
 w7vjt+66vXt5HdyL15I8BqCUamWXFXQ9ZxcF8+hHM07lDrpygADDFA2T14hay9J2vCuRlSyYupD
 4euI2VQsfxCWRUi24D3oCHHENgTu2xVDcBy+j9FRkg7ohHlkc8QvWl8L2DlNQkMMqmLUdy/9nS1
 93eZKbcGCkPz5i/eDJ2Zsyenj+iAsZ8Kh4q+/xgKx3Rk7JitMN4T3aqY13CJHijNQrXyMzqIAkA
 gRHaptU91fvvr9SID2MWPvpqwE+ECG3k/xJJcjwJsXWgBIqgYlhMjAOm6qp64RDgTdYNG7WdBuS
 aDoTrZVKCYKBgKza7HnfFNGK+GjDqBmKP1HGtxNiInnQ05k4VUWcBTP0f2KvyjHVA77Or868o1m
 NkvXj7w2OpBK7G9RUEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX1ZalJ0xQJSpj
 7srLlZRyorpNgF8McPhfcLMI/fIyawJ98AyG0fm4nOojbryu9gXfVOuRLOgQFyIoYauZeJEvtV7
 aM3Dji7Ysk4BuQaUbuEsP/CEL8SfPfc=
X-Proofpoint-GUID: xAIiujs50hw-aUftgUm_bHXjHVdmQrpj
X-Proofpoint-ORIG-GUID: xAIiujs50hw-aUftgUm_bHXjHVdmQrpj
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a995482 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 26-09-01 12:27:57, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
