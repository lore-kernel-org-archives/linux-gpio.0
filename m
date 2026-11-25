Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603842;
	b=IsCyzMwN0TSPEGiiNvRBfTXayUw9XVEE8W4tjkmt/mjzDNagBD+6N+Vi3fOUxpSc4hCI
	 q/JVi20KX0JT2l1KuTR1bkxMVCTn8CofxxBMpvLsabTnevtt9/nIZj8H6Oh5BIaAcNmEE
	 E/hpXd7C5YYeuWBh6QylVjml4odhX65gw1rhPtDJu3rD7ao0EL2a21YfRIBTDKcG0KNBb
	 5I96YS0+YxlyDhL8LbnnHi60epibwnltN1b7LbZ5VGilIXFU4/5mw1/zcpszWtdmYWpIr
	 WS7HrSdKAh38bdP64ow88yvgK2TdGGqZlUh0/C8YWt0StgzY5hxWVQ1NdK2bpPSWKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
	b=qkIgDRon4vW/krA3m//YTm82O0zmjLjjTO0oQe4jG3jEGx5qc43q0/UsL1x+o30KufRs
	 oS+CmzgNzUgOU8wQJx+pYc6Lvou/VH3mP7iuZFv9XZjsxjX9UhQEBmkGpm7BfrN/UcH2x
	 lBxZfsoAqBSHGLNob4XWeHi5LwWlAl8oL6br/G7T3+98jAPr3hCEwwJ8DFYX02Wt7VyzT
	 Am8Xy0U2n6aAh6YsRY8nrvrV18oY1aMD45cVzFPegURBKPVswRPCjgQpRdLuNFBf+efDq
	 eUFSkRsq+WQMrxsw06MQMGlcT4XH0lQAj6xjWsszoNMpOmO8AJr8U6PKReF7eRlztHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cs4hDSWh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F977606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F977606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cs4hDSWh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCZs4130803
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=; b=NvewqBbtFskKavjM
	uKNcqk1XCmGCgo1JU7Ag1oqkOAK+IHlslEo3KpW9GwEp0jR0gQ356zTk/PRhD0ig
	QjZyShjo00Bx7fx2yhQjKUEq/6xRcYx12EMfaOuGBnmCV5zo5UxpOqWV2KMrTCmp
	gLWYN21XGuZvYH9kz/L5wwgvOVlgYE4rYjcJGvYhOZDumCC1UF7x4gPv+6Tkg+Hx
	CFrFxyfi9xvSseZ8qxkZtpJReS2oIzGkHUPcysMO72kixvzlNIo0HUtZ4ddF4O84
	zrhGqcxck5/+3L9aQ6ecBjmLcmIuLcXTLAAB9caxCMuYvJvjGZJHbIDqTnkgxdtv
	hq9A0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrf7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16937971cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603840; x=1796208640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=Cs4hDSWh2OLfIMz8cahrdAMHXEMDyTSaK+Lq5Unu1b4VQwXqeBW+ai5km7nEFcduDI
         CapM55KZrKePNgwwqg4p5C7611UYVEgVx7MZiUF2lWR/nGxRPFoigWr+iyU3DJNNvJEX
         FJLQU28SxBiaNsZ5lIfpGvvYa5M5dLpryzUyncngAEqMWwb1fb0OWx1IXGkRLCHm4TDb
         0tZdrzyy8FI0rgGOAaUqCLxpBL07O5IL/wS/M7F2tjQVJItXY2ktnqthTFMQZEL3KXyU
         eYlA/Jl4hKTqkjhYQH0EM8obDVCSaTvh+BETv/wYT79xxZ/0GKOkqmKASGnSCdLodHX9
         WclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603840; x=1796208640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=Dx2WhLCbPyU+EuSe0LV6jII9F+ylomdoyQVMMDRLJM8fPqNJkOzME58G/5skILVWVs
         L3c+ybxk782D36qX9HN0/rq3mOuzz6aMt8F1Ydwx8hEg7W+F0VlRQOurwlYJEBLxeoXY
         sSLv6Jqu7GlKv7xNYvJA3A+uHeRFbry1xNq6BE6T+vHbgBfFb7SvC3KBquttCOpvpdn0
         36mTE/7xCFbj/LOICw4/X8EAsfONgkPAZ1vTdqs4YxKYBaby80uovrUm386fUlJiRm3V
         ej3JYi/IGYDrixsivyzv/D5u9duIPoTuGQJQ0JkZcbw+tF6WvZZ2VmCA+GRPAUn0sgma
         rEWw==
X-Forwarded-Encrypted: i=1; AL+hErEpVFUHpq4YZrOstLbzjvx9A+hvO54p+ftFT9iSJ39tqF2OjjctGsbsYsXxEOo2eaEPesV2FZHhikZx@vger.kernel.org
X-Gm-Message-State: APuU4Z9TWucuuTnWeVpInB341XcztWscMojWPvXDdX/KTjU+0FsRjlWx
	H3zXYxb2ykMGGimM5c03kwVUCr1f3KUObAkpO1bsXIpopEzHy+x+2xrIszGdyMln2CKy+ENUp7v
	D/2cAZtTs/rXonfwYsDOw8Vz1HQs2hyOl2pBNNxalJPKt/6W3HkrVcZJ7EIOzFkbW
X-Gm-Gg: AZFdTZetnC57ZY6f5vkyS3W3/W/VMDfa/YdIXcNm4YV7QUkis1KIVx8G9IfehzoHY0E
	jI9Ibcvqf3U36aWkOSPPiSZiCASEBmP8rxoNhmmLiy8TJYCJarUXaM4uJT/c9G0GJmU9z5VKbl7
	3wla0hxCT2fKka5z/csvquCK4JtAm0p6UccKRog8t1Kbmce2igSxsShUAxRhGEQJXRIrBJ7a+k0
	wRdQqHHM+bnX1VqMEBVL9M1KeoUijcIlioE8g1p6Ccd7vIGGRCKVTJC4sLNconHJcw7/oRm5P0a
	RCNzkA4Ph05AvQ9emCMapmyhvGlx6VgjdYLVdOYbzx/NrvzvzsMYxsWfR5y1iwa8iVlc+yiPtrB
	QkPQBLzow3rBULza+DRrYQXgaih/+0T0E1pBUt/FRNpWJbWx1gIGr3xg6RHX93SJsuzsfhxk=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079521cf.5.1795603840524;
        Wed, 25 Nov 2026 02:50:40 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079171cf.5.1795603839996;
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Message-ID: <115a7167-d9cb-4a5f-934a-2da3974f1ade@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:37 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06bd81 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AIZUApCXal3OlWm8CXsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tu6V0-bBKs5aQrFIf2y_V8wxirAGjwm4
X-Proofpoint-ORIG-GUID: tu6V0-bBKs5aQrFIf2y_V8wxirAGjwm4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX1glvN2TOMgfU
 PEJ9gcoizD2RbORvrw9jQ097d7mQgl8loWRPXy7wv+cdAn694AOlAe9F/sxnx7COAac8oKGn7e1
 ZXBSwRdcOZmJC+EqBdVMhw9/mx57zV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX8Wq1exxaGpUc
 omV2MQGqaeNDPLdxdSXTGsLb8SvGCiNFy4xoQW3yPC51nz9W0uj2ShDuNaKjKnIBWrhbVPz0Nwt
 MqOiLIhxNpAhMXx9ZxMPyt7rVa+SjrIm3LqS+iRQvHlh6UpJeF6CIipIELOW9beuSOnygh7JOND
 5pW9RAFPWnLTprR96qZx9oYWnr3KtcB0qgdN8ogVeNlnis1hyE370Sw5U7QdYD2/jMDcRrWwYsx
 /l7jVTf4eNoA969g4hrXFNvnPPYTi5/sH2p2hWysHoaSeln6+arWaIu36H5TfNB2Ru7qfZiblIN
 Y7WgXDFgrXBE/ccdmG4HpnuvszW8bMnvopDdV5VewSAgij5nVzOz1hdaTRINvv4ZyZNAIL6UMbm
 j3HJFG7MV/VPw6NvN+bf0/p7eVUGniyJw81mveXtYtbX8kdGg1CUKm0bOGqNce+eb9fl1Ai0iak
 JfxCxQxF+8xZSHut8tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the kaanapali driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
