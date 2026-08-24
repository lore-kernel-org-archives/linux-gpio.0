Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D339478B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557265; cv=none; b=fhNLkoFOTD1k5CfqfeVmlI9fpIdiHTpn7uTxkBDWqGsQFKfiKWw/kPYcgWUU6EKRrt24ZMGyS634LeVqEYM1pagIUTXvkfZ8kIynwTzEOFQrpqNW1i2gNkT3SF8XNgtuaWQ7vHOKxyrMU6o+zl8G1+bdwWFBfWPNX/SBtCh78Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557265; c=relaxed/simple;
	bh=7BYh+G7YBii9wdLvZ+tmlYcpEQFULmxAXTs13S8xs7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLbeB1CWL/Lo+gXUt4vZ6CtSfjgNETCtro9QA72DKUt3X/5f024LPHPR+DyTmBBuzbrM4J3hGZjUJsf52BWeNETFHcTg6DyU/U7yCKm1XEtpiGf49WvIEf3V2uftn8B+MKamQz7bWlTu28M4VBR2ErEmwaLGZhFtncbSV492p9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi8LoCT7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgbRxfiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi8LoCT7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgbRxfiO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9OS1937603
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27aV82B2iwHpqeN6UcRflHNO
	30IeqGoP2gG6U77lA7U=; b=Qi8LoCT7QC+bCW8Y2IWJiN22jB6q9JMo+jE/HwLZ
	1NYR05hrm6/W1X4knaq/TtgBHPHYQYo2wtHFucITlI8bi88cn1da77bNqvxtiNe7
	gShKs3D8nA1kf80Aq0jRgM6HE4CJw3PN19jyVdDGamiulJPYzN961GiuqI5vFUuQ
	QNmBLKaFOeTUsk2vd6aXG9Mm/Qw7/l42zmxIzeNfj26JkM21P/JXzbd34CVu/6oj
	y/4K+Puzwcpf5a1E+fGY/Q8FD3N39JuAK6Yr1KuC3aAm4cTBj83gZtB8zQLMg5Fg
	iy6v6TT12KeEB26h7ucCfb6whHwP8q9AbimerF7Wa2KCwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qx12n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:41:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so40855441cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557263; x=1788162063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=IgbRxfiOHztY0d4ZAqC4l20er3YPbJ1dXCPkzJpwSIHGLUNZyRjLwZ9D5IkB67mdjj
         Wj7ttgwzcoyKiZha5isPPq+ZOUK+LBSu0qlwRQvoUyigHuWBzy/27Gfvy+qQ3faABLTV
         QnAy7aDbCklyYZ7l9WitKbYxg41S4f6xUwfZgPFwZX0JIAPizFqOwB2b6aM2c4l4N9/0
         E/iNLiQtViCkWFlmJqGAmtVYK4y8RR/BaYyAqwNfxw35FvZHC9klLjRxIe0cpBelvfdf
         8azKrwCm7HwG9/mQckRRhzLjGc5FnN07K/1Muwy+/qa1EzziKigCCR4hmdHMLtEGwTqp
         ubEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557263; x=1788162063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=p5+bgYyRh3w1BSdniHLV4hpz352YuAzJKP2CANwI6cvANEl4/E/t2FYO3jU66otBrM
         bmGxz3E//HyWMwjgNTFwzvVOGMpt5vASSKnkxZmfQo4yIXlE2/di6Dc9ZjIdyE+FOIq8
         8ONtFxJiugIpCvOvA+hsphzNfHyfEkBwCN3JnyAdyBKaEbALSBfZSr/uWefv+YwLZ6Ce
         JrBbo0ns+kHJIjhFk12yQd6IFSBdq0CtmOu7sm/EUqTJJK3skU8IyGmtWVMUHqM/1wkY
         IcMyY6IZY19gX+kQav0pHQkSsH9yiMbh998BXo0npR7apQAvAs+ugSP3Scr+6G8s5XpU
         uTUA==
X-Forwarded-Encrypted: i=1; AHgh+RqMoW+0yCQnMjf8ZwQVO6uqU6f9QQ4Zr7QG0AhHJ4BPB/kvvylV4NsZMJoUquVQ7GSh2EwDBrn9mMFf@vger.kernel.org
X-Gm-Message-State: AFuF++mgL7SAa4hSkef7RH/gSH8pJOQGscHZ1uMuqJoTwST3HTnx1cA0
	sQ+y9bI02HI5b/YBCBW7XDJg09ErsxjG1308rX/GPjf++LxOf4z+oHavoSteeiaKeAY5qo+l5G1
	wkJ89zZqSebhxkV3aL059V1BkH1HWagCeFTfZqZlNuwScUrj0q8RUkINDNeu7soFE
X-Gm-Gg: AR+sD13U9H7uoRSe85ibCxAqtGgqrJTOFELT38ZXY8AE6h7OwCWWHLM6XpTl1HAZ3ib
	b/SB+DElIjn1LigZRo5GdvAlBizzm3Q+mhioDQxnLrIr17niqpXrc/VHFgxFne3aKYE/MeUiYBN
	T2NeeCXlRmZmHGROF78n4IlZGKVzyJhRtmPf88eY9rqsjIsvNbppJqzxqa+0vHuCUeF7JWa+DoL
	ZTrvV7IYs71q8sqTXMmqXZAPV3prVlFylryuPdecHBmavUKRvpKBM9DK41hoyO11LpgJ5BhXhFc
	UnjLxJvLYPhzRgFmhkJNgDSoa0Kp2c9GCJ3fSK3f01y1SB4M+EkuHD6/3bQtVwUxz5Cvntjtw4D
	ui/tkaR7AckdCGQM=
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786501cf.19.1787557262883;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786031cf.19.1787557262330;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1717117466b.28.2026.08.24.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:41:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:40:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Message-ID: <jvtygc6q3hts3vynb6jaivlmryrhzkifxiyiaxoghukkfbt7qi@ch4k4adkpdci>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfX9D/ueHlPl4QH
 bsVt5a2zNmdEBcojbPbvhToWUvUrLZLghhMsQU6/Yr3O//vQ0xBxVVsWz07EZNp2rzGJ+TTKB5h
 XfO7jNoSe4VgII4xtghf+IvV+5JqpEBtfCWVgb3pyduhrEIZnrSbDEyhb0wqhZNBGldDCRVkaHt
 ssUkPxcqcIvCS28V0xQqfSkDxL+0N0F069DoprMjK5PgmnMjX4zmGzSXyc9L9WH2pomEqiKKckz
 dOQW6XTu10eCgytvUL4CiZlWLbMZWQTD7RENUkoJzDpYomho2ymbsv7AUUMYa4VuXcwCoINq5we
 PorDV7Oamo6EPqbW/nYy2tpV5dIPwez5GEJcMm/L4+OtGxax/ChLVIs0YwBau5Hw8+zRLadzj07
 W5tJhRAnUtlSdd0wH3sIel3VSkSfM8CtHFHFnllWagztVxjiproI85szOoocyy2EMQ4RtMMrwoR
 xQQAN6JwdZP/CGLca1g==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf58f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: d1qMHPo8jg8KJMl7x4YdtZhLdNhk2ofr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfX5uh4FbbBftp7
 QE/qapPDXwe6GMLL//tNeE6dXnDKeJljYjFnjhVSmzH4sV/TE+H10QeVV22rG6MxrZ1MnVBOJ+m
 atO85wPx2PuRzWbUZgfk2qWjZDl69vQ=
X-Proofpoint-GUID: d1qMHPo8jg8KJMl7x4YdtZhLdNhk2ofr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240066

On 26-08-21 21:39:04, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
