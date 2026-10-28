Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202031;
	b=0CVDcpvdwha8ZmqssfySpEAKw2k0fmG+XVxRPjoOtdEBb1UZC2X7a+7jxYCy9qhk9WQ7
	 vYiA5ecYLGQA8klopIqFyj1+A3H3locjXPwYHFhH6uztVx1BPUliqSYAxsG5r3B4MVG1W
	 8ATyZsIBUNvwRv0zNtbIOkBRi9VMy+ETT387+ktLOzxihWX4nY15TV94GML5ok7Y9x5je
	 75rP78A0p/NYg0FF+uRtrPoEF1/8WZ/F2WtnHOnya6ZGb3zVEdntTZ1oiJRlgFPpxxJuA
	 3bhQkprFSAE0POA/qWQuxORZDNhWTvMWNH4/kUVUXIouLYojJtg1ywNoFEfM+J9Yqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
	b=alpX3hBvB7ya8GzbFwtHxu8U4Iy+ea7mcTFzHAwjOCAiBO5YmVmJXJVB9PvDSYBw78tm
	 lvcFOkind9PGx8AJSTX3AfMQ+KoMbFI5t5F1WliVnHlcI8stWmTKKAKU8xp8PSiNeZq3v
	 uV2Efrv/fvFbODqiiV6kOZfzWoFbfKFDu647xVurf9ndDJk+cxdfaGYCWJT8kUwYLy7ta
	 RSRyBRRn38uklD5XFQjg9t36Vg1hPlAQ6o4h8tCVwIg3grxHWMEpw494OBl6yfXkVZ8du
	 hQJIYeGFGQjdViXs94mq4LUOSAwAdhAPtnP4VvwoT0lvE/jY/0FjhPhpcik902z8qKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPhm4vnW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36080606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 15:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36080606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPhm4vnW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA1Ya966381
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 15:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZeWqgO+2lHgeB2G3uZ2RGo9
	7UeDvnaxq8shefBQPMQ=; b=b4gG80mwz9eOkArK4wem2b/toBhwdMRvOpAazlgi
	QaGwu0u7Z+CSUeIm8cDdiaaaV6VPEWgJxDRpRzAyAmTESsDswyDXDYUdkgWFpKMN
	ol89qlux3BGZGJZaY7AvrxsST86HegLkTcj6z9xbhhevMKdSPQGIByzkP+jkBj0w
	jf1Ptq9UU6sm0/nXAuWg0egt7G9f1xDrnf64iWTmA8ikHndHH+5RZonOUPOuClp5
	k2/cbTn/BpNvlDOygac1DXQsbksoTqpXRWUSAAVJb3eilEOpaGQJdw29PQwUCt3E
	TDGLOPe3B6h9EpVUWVdOBoKUcya3aTTz1yUpU0PGDIKjXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgn9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 15:40:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so204393385a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202029; x=1793806829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=CPhm4vnWJjv3e/xPLpsMfC4LvnQpmKaxbpc6vKzoxB6n3c6W9XwXOYRB7nBwZ1U6Cz
         s8eex03KHt4CVx4UdQCI+sv7801I1mhesLqcCpSH3KoSXzHoh3mExbmNC9d9zQNqPG+z
         C4ka9NGaPNMs5aKo47fVh9EBjhNJ7oIhWHHfMBQ+KKzlycUSlnFnNP6bd1oGWZI9ALpi
         futkA3NUmvCAZ0JcQNTAi26apGBiYyo7mRVGOct1CGHZhZZAA+0Hmo3JWqa5Rk+g5Yc1
         bNnGi/SmlcD+A0lXjGhuhMRccwY+Pzr54+J32JLcjR1sZgeSW9okOu/bKHtB+h9L4rxB
         E3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202029; x=1793806829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=GwPV4KB3n9594BwhbcxbK1nyBct57aJZJo1MYAOYV9AfzSWvc9/ryxksBawp0Ufx93
         ruG5GPDR5K7HuTittSJgEyBBRSTJyJXyYo54qLuaosM8Kzh9dWBH5AhVzePpeYGwrRR1
         CUZX9EQiCIqF0IjLWLyIHUrzyOYjzVVKV29BtOLesA/GSiKkTJDdiQpS7AKPedYoT6ZA
         W2xnNne4ZVxPPUhDvotZuV2kklqJ9cLdP4jyUtMXnbD1axXTTDvIaMku7brryJ0WmEUB
         6tKGVkOOXv5mQfZnOjhgYTm6wUYELfClZ/NzGW9KSzrs/WT1lyMw3BBYdWTTZhHcAFn0
         qG2w==
X-Forwarded-Encrypted: i=1; AKwUvBy+rovg2VdD2eWx0RHqhhVfr1NZemvuqNwVvXEP3GqDAaEqEIO2LRp74MSoVjj800/6oC8TcGjm8/+H@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gZI9mUd5MWY+rZ+B9G4FQZnvDfOIy539MENOp63uFxXQmyTy
	Jhp9cVTu9w5mCBMiukN31ckVScACI0ltkvVmDkq4rnAyi1FCWmvs7uOD3jvOejJ2Wjr8azophUS
	eWCJxwMWuth7mmLHgeiSw4x26fjL2vMLyrHe/Ixwt/CkVA8+anwauMEVxxjJDhFO9Lq+1day6
X-Gm-Gg: AYBFou3APPYMwe29RzW9zyq2PVNNQa3+gcHOHNe808Bi9VqF1G6xvGL8K0R68A1pR3j
	FVp0vOmqzrUoM4vbIeC79maGJTYppj8v0feApDwPG475a/9IX3AgUK2cLP+3wGZ8TnkeNXYrSq8
	fTPSjAAyNX3bZf330PhKG6ExTKBq0v8v8228iCz71V32BhV4Lb5TkNnTTFLPFittX1hE9nP56wy
	u6OkInL6rx4jOHdDnmzhKQMCtWmA7dk11umKzNnbAa6gJMwmzBQT8ZgbDHi/XpmR6UoeJ8nUKQC
	R+DLikoFFsv4VH36MKlcWDOhqgk24Idrr8v/wQCktj6qictP3jYlsaxXEHMt4d2ukxAYvQGOPrI
	ZCUIJV+N5MdWELqTt2G+/0HdB3srhtAqy4TX5eJSpiHjWoRU4Hvx+HJGQe2iHr0cQhA==
X-Received: by 2002:a05:620a:258f:b0:93e:6f43:b2c1 with SMTP id af79cd13be357-94408a692b3mr424090085a.16.1793202028742;
        Wed, 28 Oct 2026 08:40:28 -0700 (PDT)
X-Received: by 2002:a05:6122:e208:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec4ccfee2dmr1553631e0c.18.1793201562412;
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm26641291f8f.37.2026.10.28.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
Message-ID: <iw26iktbkxacfgbt6btvh6nd7u7b3wvogh5c6sgdt47ve24qpi@wsc7vilt3bge>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX5iCHfnNB0GOV
 F8KmjUZrr19+goasMqc5z719y70LBpCjHQcueAGZ5qnYxN0OywxmNXiB2kUjB6kUBpE3kWDMiLf
 8tjBfIipt/8khOmj6Nip5RRHZr/oo/u9jBo69BwEFye1Hhbsg+Gds5276B2xfgeF7amrGaK1r5m
 dnLZd/YLPf6SIeoBJ00AAgQ+5zuBNnLqycT+yxNe2oH2AnMGAtDzvrz+93t0iZe7uNAUTsk62sV
 JbphBiBi547srNQ54PKq91ecDAjDk53ZMUDOd64bYyMoPYgS7knGILmYPr7iSZVcz14r3QnQ+CU
 Vg0uGeulGRDfrv3ycoeF7+9wj8pSecJwid2hl87k+/2xKRRIib16A/8Cs6yZpRYkEXyxAU4olCA
 olTX2opYz7k/bi67ikt2S6tzr0hPSZKzIzTngqp3FjVdHn4+TFMn5PJiMu7jmsKWsM4hqiKCMgr
 KkNz6pK3KAK9j1N8mCg==
X-Proofpoint-GUID: eGUwJVF_SpgnGRISFlLL_pgN0mYV0hzw
X-Proofpoint-ORIG-GUID: eGUwJVF_SpgnGRISFlLL_pgN0mYV0hzw
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2176e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y5GSmcL30hd6fLb0oHwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX+W91RcEEMtzL
 Hkz9pZWZrV5E/GxWWGy1xmpPFcUDBuXU/+wVt1Eb9nNYxb2X+SgBjJdDpPXLxFhd3ovWzCp1mK2
 VIZGUl9B5KviZkbnKNpi7SYUceLaiLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-26 16:59:34, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
