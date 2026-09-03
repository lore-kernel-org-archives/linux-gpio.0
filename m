Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2334A5ED7
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440461; cv=none; b=lJJK4J7aL0JJSJ1VtPCkC59iPJnJQCrBrfnHfpP7cQ3P13pGAu+p8Y2oqdz5kBne08EsKQ0fM3Tp9ftik1L42Hj6hhA1dlxqHjWuKSn6vuBjC1vcjPA+YFMu/ajZ4DXH7v0cQWeS/8MohpHRtcVC9ogl1lW6kAXjPjoQZpXKHVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440461; c=relaxed/simple;
	bh=dngGBJhK/9kgo9vJC75xcjb2iG1GFJUHs0W7aqvJjec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeOdGPhAECOVbvDEGPngZ6TusXTNcDb9gYNQVef2lLKbC+kfsbO63EnzcB+Yf60ZGf+TCAkuzDcgPrhjRURDpPmXUNUI8e+DlRNEaDRk96Trw6kXHPX7ZOtQO9kQvAL1kckx9+iQjNLN79CFIRBL/MdNwpIGxiKK81eakiuEz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq1tFcTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRsTB1y3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq1tFcTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRsTB1y3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683B0JUu752909
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 13:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7olCBj1l9bJRK2LK0lRET0Ob
	LnDUTxPSDB9xFroQwFg=; b=hq1tFcTKBfXI6zFiBjx9sVfm2ksuP3V83Be1RSC+
	nfwDsHHuWeZ8964uwhzm9U/rfbr+3+smtImgchO2Kya/eafmPRUsuuNyyZaWFVwt
	ejozT7B6RB96tFKLBN8u3U/EgbSQZMwyhgBaoxaq3faqPsT5O25SEOMqnz4tIH/a
	1n2kY0RThDT2y50KgR9b1krOOHmuklBxE+/p7WNoQoc3+R02vsKulDNEHqehavJ4
	T90pJbt6qi91wC3OmWrMccV0mF5MXJZGY3Y2+QKG+9tch8RYwSZGCw/1e82XO5ke
	8rYuJBfyRw9KzOwlczkO1r2OyxzuQv0SHt/6i93SR9DBSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hudq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 13:00:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso371191285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440448; x=1789045248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=SRsTB1y3EUYX43pm8yPrSvfWEPWVVAdgkB5tNBJESLiqsOPNIDj6BOBGjzCXqpS6oH
         Vx1+y0nv1fDtQJyCi3lTaEDUbp5qjzGKz0/BVd+pk1lcRGEfgfNUB5hEMLw1Y0qL9EuI
         9O5I+kckEu8ZZoI1HBERyGXnnZmvheTIlQ1UYkCzdaa/0JOYk7J8WS2yJuK58vy8ozid
         Q+qxn/Rx6akwNhW8auGZVhEcahy2SBTo442mqLHn2w33qIcMqOJsIVTHCAPx4+4CML/Y
         2+2WVan/+v0HXac+oQBC0wuaOKC0AwInAZMUolqOjr+Q5br+aZyDvqJggDak+j+CXDKQ
         8uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440448; x=1789045248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=k7VftjNWHeipVYNu2GQ+PfKkMfJmnHTfRijInBiRzUx67ab3i61t10yshRkG062Gaw
         iP4jjLUlkP2GQTZ5R/caydMVomZwMrtKX3nXoKWIA1CrkfYS0ZlvVQbCeCNO8C/9eAWj
         my3VSdCrw9nu/hBduzvjmHPdNIkULz/C2RsOODFQUpmqkPSCurEU6TAgVGWsz9kZ3vyg
         kkVGIPahJdF0qIxyyWsGhWNqihEG6fuWn2oScYmO6ZHoiyaZ+IFLlScLcN6FwpcZnRTD
         +yC0CSNkzHGmzev6sn5Y6J4xPeJ1Ist55lr3GPltGivuPwMcW5wtJsu1EEXS8iPApZNV
         wscQ==
X-Forwarded-Encrypted: i=1; AKwUvBxb064K0T8mn4tOnZzvrS8cASGUTYC7pFsnN1+QksZrMR94+IXEOwRlr3ZxyX2bLQzF228nDIoZDii5@vger.kernel.org
X-Gm-Message-State: AFuF++kK+m0KF9RZP+4WCiD5EoPU4HeHAdFM08SqDQgUaIPpGCSi1pCe
	XhLX30813D9RAUREyAbFkvE5ISUO+OE5k6su9bPfCNZEFcZ8GoCM+82RF8503vPAa/+31/343S1
	e/NR8pFqt7qdPpwwYaSwVm/W8TEG+eWbtf48kPYT4cDVlLHyfNXJEjjz8yK+Qby//
X-Gm-Gg: AYBFou1HCBxmsXP8Q+tnCYtq/Al6+zl7sdQd6gudCCa1w+BHn3IDC6puecI2nMNZKJ8
	C6X8trFBFt3DjEZEvEi0OkETUhNRtKd3tabTcAHjLlP/iOt7HUtW2c53aaGNBN2ECY2RO3b/fVF
	RkgC2rWFSsX4ZBG02kxCBueBDXuwFDSRWzeSdWm85VJZ4lA/1R/uRIvFWnFKeZ3QyIm+aJrolSE
	qZoHtP0mxc7yEEpTjkI4cNwBWeN4m5jOnAOBVf9kBOf2lbA7xAUgbLkJ2wQrjviNRoImcKahXrw
	A/lo7pGlN2iXLfkOLZCz+a12SqY6V0wy90F0AjLYSAdFmlJbmyGJ8Jp4OKPGcCq+1E0lEnbpfOX
	wGwtx7liFbiJi3A==
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670081285a.49.1788440447937;
        Thu, 03 Sep 2026 06:00:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670040785a.49.1788440445779;
        Thu, 03 Sep 2026 06:00:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ee9cf7sm14617219f8f.25.2026.09.03.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:00:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:00:42 +0300
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
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <jtfr4spaxfofaygwyajtc3y4y2pfppxlmsv5bti7qikh7up23m@555urwkjq4mm>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a996f85 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IrxD9znzw5C2jVfG02jY65AW8GvBgHzr
X-Proofpoint-ORIG-GUID: IrxD9znzw5C2jVfG02jY65AW8GvBgHzr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX/ClVcY8l8On6
 tGOWwAm5cA4s1b2TrdKzHe4SRSak7aP+S15SpHxQwzQkChfRcas2mHW2AY/FdxAW2ZUEw9tVeZx
 mfLLNShQ1lP/fefYDQMJbIh9YJvtT0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX6aWLBV+S4Xs1
 lgZao5A1fWw+Lto2pmfmNxU18S8yTay3bVthbWFYLEr1Z0X7bjXZ0+Gq9gALBYpIkshYAQq0e9I
 LZf+mzc66vZvP4cdZrswgQk4un/JvJtjYYHiX/oMdDPsBB66/CnynQwOgOLK+1vpPmYIXAsy9j2
 zBGG51ioz9IFKV6z6miJKbEm+5rr/ZepEE8xJeco4l5797jY2H7h3yVhjkDPam2ctTc/UU9WMtH
 vssjIVwxkOwJJFRixSc/N7nt4Yvfqk9b20h8MPSaF2na0d4xuBcygkNhju1OdD6C3SEUzOxzoIn
 xweoSKM6YiychsIDyNHgAqnkUJx7JFRhMmG05vvFjhDNPsJjs1UJ1uwhsHX20GIwG/vNj31EfEq
 vCRc2Oj5D+p9kO1Y7iUxURMwIy8AF6OUYaCpa2ekS1l9z8YPJphYxSaO8jOI4RGJzNENqiA3ZKp
 hNVlRvM6VugXQ4vjG1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-09-03 09:53:01, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
