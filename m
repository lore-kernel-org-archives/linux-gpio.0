Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261739;
	b=h8tmpguxO67mUBGzX/C0EbOgFS1dsiSF1130LOXNWzQetHEIAe2ncAiu/01qgZRkb5RM
	 2ltE8czASD7qqQgWetOK1gPfoild/6hrnkHKMaW5lXVZcJ4Ch/csh5wWjr7sfyweD0kSP
	 vJ6ga80F7JyrUIh9NE2U1ji4UCiyUGUexpoy+gMrhl+bt9zZxmT617tbW2twBi7pOc8Ki
	 ulIEdSPOZ0KJDPGesUadT1zv52imUiEtuXPM4MyhNsfYPQCXnqTtXDJa8W52YwnzByiWx
	 6GCvlODU9CamIsws46+Vg2ynPzzB/SVZPekQNod7sz7npC2B/LXsLknzGB6Kk6dfrpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
	b=JqVNycunNCIVaza4RL9W8/7V+zSf8Yx7wTkhvGLr0DcjFh6QXWBd0o0Ca5gQEBCkymI6
	 zmlUQvrIcOkLlXF1WWykckE6WDDuu/9RgYGQ0oYxCVTNU40Y/OeWt09/U+aSKMGz8LyQk
	 23RZQiOQ+1x3ySCXiyzJ7dlUROP4l8M9b6K7cEA035pce4azJCv/7bT8Sfj3riA6Fwail
	 StdEY0RgKFaCEe6vPsXufJcJqPhDWionxsqQsEGLB/3PHzYq0GywXVM6DsiZuf95HaM3b
	 RdBgBbVQNbtTOqevtapYhAeiJo5vVqYekSXaw5TQue02pCgHFS1UGw9hjTLq9/I2YQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0017606A324
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0017606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HH2H3829663
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=; b=Ni51Ydx+CDpqf+Rz
	ur3Ui4ghmpDtxdRogFb9VeGwX3g6B4OUCvBJRzwpPq3ayxksQoofX/d+Q7HP/dn3
	epQDJZZYEpAKPJ9p/NdBZLbtt+6T77Rx843WiSnV6JVau5SePRAqiGy9kMtTAihl
	8Dis2v39BxC/Qxo5flms6gNprWw9RdP4Ab3Ig8BXCvSgMyVAd43sZ/YK1b3oJz3p
	kzTrsAM4rOQAV/FzJe/5EO9hAkj1UkqxXqO0VMuamegIMZH6J7C96Ru71QUlZc+j
	o7RElPMcE9Pvd/l0+xPaArwyJNevPUaoannm2KAQZBSyx+eYvowlrHe6KDDoJN6+
	aEqbqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp9njy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:15:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42423785a.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261737; x=1793866537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=PkyhNcYy/3eZwUiKKPY4DINNI+7O8PhgWzTx2eO+RPRgOE4iYcoXjZj+eZ8uW5d+zO
         yrDShLjGlnccCN7iJRuXTE6x4d6wqiPm9RW/pWs+7mzKq92tBUO1CsHI7aTZEoxs7stp
         DAlrXW+8Tvf5Yk1EuVFDJIPQQdEIB+TzJ7MmUHohnattdqOuLjaczGEhwrBQ2ZL6Bch3
         m2svPhgQv79xUkLytJHaeh7wMQipk//QREZKUSQZaFn0n/WvPFQV+OqxP8/0dgoevHHe
         Rrjw4LTTFNTko/IZLSDuj4TZNL8DzBzOXpLxwlmrtlU4FG1XaWiIsYBTIapqZ2W2KQA7
         iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261737; x=1793866537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=150dsYAnMFNfIgHeL+z0/EYQeN/9T/ZkvF/+D51uNAwx40kcN0oEnjiJH23ajOrJHL
         cmTVNVeSDlB1xXInW8+Tn5Ibmdn51xhz+SbOUMoozJdFfOxfre+VhycqwOVKj6DVzy4a
         TzRG1yGThOswn8k8YU3NRWK2ySL2qsKhDlCwKYUXQALlhuahnmQ8Bk+bKFrZpwvOd5bz
         Skven8ruL1dIddLXvvZ3ceqpU2pcUqX2Vya5rlBuQv0fmdyn1UkswbbJY6Rh7vqCSPRH
         ORYtR5QK5uMLBPq+8MsnPTpH95VpGXHvPrMn5Jqg0gTmhnp2JQOuy+kbfeaP3j34dsIL
         /IOg==
X-Forwarded-Encrypted: i=1; AKwUvBxfodPZP+dwt335ZVRbbc8OY9Ro+CgCYlSCbrq6F/3RUVu6x6qEvBDYKXm7V9LaitIsj4tRwHuGmM70@vger.kernel.org
X-Gm-Message-State: AFq9FYLXb8/c4ZkgBQXuetjIiL1VfeEBAQXTWgMb7NeneBotNYZdFD1f
	aXPoI6uAIattOxwp0fxo1JEkuEbOhBdtwJjAn2PBQU4480Fw7iQH26ZgO6g1LHLhZovSrFUFset
	hJrkfsBsNK8W9AJkPPq2wLmypmGdwTQIH2Mm9EbL8iFPsTTsHPLs3ZIaXLoUBbK5M
X-Gm-Gg: AYBFou1txkvDl+c7S+5xbDLrOwLwgSaixq/MSL01jbqufgsYHx1HA8CMYp15S3hQW2z
	jqDF7uXaAGY1iDa4gPL7MV4035EenNVivjiYYrfgdJiliOIFc8BSQAL20N+HAAA8RPOn9qO5f35
	BbqIF/CLEwJZMKGruXpeJ1IDxbc8fjn5dW0salKhY0GJtf43GO3xctGyzpbFztj/F80ztfwlo8V
	DqFvRLFFu+KfnlgpnG2AJwjT9gLUNh6Cl7thNrx26Ny3IqmkNBSIEyGLdnrR4qBDhvI0bQGwZZn
	0TFDi41HokXLGzNXf3XBDYWSYcw8GGbMvd9Enqj81rhDYWotlKuTEVOPAbyHFWpxt6pG8yq4aCB
	qD9gejGuDQ74MFtCM4xJBrh9zNZmPtlXCdmBShTRvpXNxvmHjXhhalxozliyaS3gRGQz/tv4=
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690395285a.5.1793261737062;
        Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690391385a.5.1793261736641;
        Thu, 29 Oct 2026 01:15:36 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b495ac4a78sm2434202a12.4.2026.10.29.01.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:15:35 -0700 (PDT)
Message-ID: <e67f8b50-f3b0-4a19-bbe3-d1f240ba9b2f@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:15:33 +0100
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
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX0p/8Bagn/xtQ
 dMBdvDoMLjcd/mz57n57N6wdVtkOeWxpb6ZXSJduEoPPVfQf5ThFLFC8v8pLHg4+HZV8vcnpw1I
 RJQRvFsIfeMDcrctSb0lX7fWmQUBBcTZq5Meq6zkSJ8Lb2TcD8fq5dyDfc9XBniS6mQlvjLwcRt
 xhcrKETzPM5ZR7j5gRe3viJdM2t6Nmi5mgtmhf4f5WMcvRXYbbHvsFnQzJ7jBvrGVzRUX56dKc+
 WwMVbMqKeFeCjrnEceeDvWwNZEvZQQpYk35EVS9NChCnuWicYUbv6NgIX7aHk8WRiqG1bRc4Fpr
 sa9YCQ2RLddqFfl6GuwGiaWeXJfBSzdxOtEKYlNXhca/LUmaLlvJPzRH9y8rIc6A6jeTRZ23vu7
 IL4pewQtNGySz2XSdA+mR+vCrVPMfOY7eBERtTjwiQgJUhMxOSfm1L0Jzgs7aGU0OvCphApxc4e
 b5u/dfpjeodGk4UJR4Q==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae300a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UmW6FQozgp94pkqAIjUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXzQP+HK4kX89E
 N1pOWHD47yaKfFCWw/qkkE+M9UamnsBxlnsYmbcOoDzbcgUJIJU1j2d0Lg0Rqqsj+vP0xeroyQD
 t18fsm3M8rq15SYfVtBvIMh8kYCLUsw=
X-Proofpoint-GUID: WLYBuVm_hI0M-lbR5X4h7hi2Mq8fdP2k
X-Proofpoint-ORIG-GUID: WLYBuVm_hI0M-lbR5X4h7hi2Mq8fdP2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/26/26 12:29 PM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
