Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873781;
	b=o/x2Tywz/aUl9bjTExu9pVr+h/jrGMuwuhPkNZ5v5V4qe/vzADa3SIqp+P0M3Y1utlxE
	 Qqzt+DNN9W92S9pevg90TMEeRFCrvJZga/+x/ZCKy6bmn4eZT+x8HOWahXnfLkQsLIZ6P
	 eNlb7bGYSL2DVjHADOVjMiZU+nt5XIIVJ4I3pPSXSd5j3I0UiPKbFVwvSGxam0Lq56NUe
	 v31X8lrfHy9tiend/5urHmL2OZ3ncdfMPqt8z3DXqM8vVAtWbi8ro83ZPLxEcEV+XRfAU
	 Iy3308NXl90+1iZz2iewR1getdeoR3x/aVmZ9oc7bKjNCQXAMgPr1RtN3lPHZ7qWicw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
	b=3mtl+1oGQdx48vICUJrpMKOKhI+26lk/5CYvxqR/AwnA6SobpNNtaMOq6OoB/7eL4zSa
	 gzKdUHOnwdqhHXL+ss5uIFuXZBB1Mzrc2x7zuyFxKZZVfDIEQdyGgqukB4M1xAljeNFBR
	 d+m7Qjk6hl7YtOr1d3sIwql5cHG47vgUwtCU9iHwRuIhjmhiGbLv2Mole13ixFhq0JrSf
	 iAOIDcoRu9cStKgsHSu5HhhntISoAXKeJPZ5P7PlNFuhh36YA67nmilCPDnaerkpIxljQ
	 hf86Z9YIaTrWkq8Dne4mOcyCzcu8yVn3iUfs7Lp5xmqpIpLA1/fyXOI6wmLU4AxcEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dm/rrgvG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A7606A330
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8A7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm/rrgvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59ta783044031
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=; b=Dm/rrgvGMH4DSLSF
	Nlir3zx3307J6xCw3fCd9n1NIa/n+sLVK18mfBvjQQ12WDY1TY8woRYsmKtFANu8
	7MRIZ4Tz65xAnOlFyf+eArVvFLG5fkuTUe4jRioo5pT653Gka47VkWXjzJ+cr9n/
	6cX/wN991s4mWBns3uQmTzajy4nkPOHEFbngA49gNM7HiLmf6kmbm4tlvWVRFeq5
	isxxeI+cppMuKbblwHKSfp+/d6XVRIXD5BPs1UL0Uy8KOVadfVvpqJEggA+H1XFV
	2IFhLuH8yFyPdQ4boXhOd0hJxgIQtb5AxMxhmhOFXJ7C7gwKkP3RfNZ2KAPdj9SP
	4H+jkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suyb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 10:16:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2169171eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873780; x=1794478580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=SsO7qFz2tz9dgth4FHcGwJ4CNlsPXqS4tYpy6Tuv2eqnxGQNNF6OBsr998YZgzh6LJ
         lYSasC8Xvz4N7AVjogVkLqCDgx9wJzFX1qKdK6V7yIiTgCBF08moxUNRz75zlDoujFoj
         eeI4ImQBgFG3TAK0++UYg9IvBh6rEH9zWqtv2e+e0d0acv1ZZ8znk+WV2yBTB6xkehiR
         PLwkAcFWdPGdqxN9op7BWnSg0OVB0UcL8/GoNuQDv12aROtobiRkx/5eivnZEeouWmFS
         6r/3b6kluqHripQcao1Ww0+5LSyYxFScEHYiiICSWSfrWYS/h6iD7XgcQDhDJHIOQhyr
         7v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873780; x=1794478580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=GBxba8wqQln9SjGew1NBdbNPsGy6KwrXFTagyMeSQ4ZE/2tHNu6XY5M7MENSCREcMB
         vZgL0aF3ezVaal81P7A2HHeWLweEkWL5jP/21NLRPMIVp17qj/kD1+I7yYzXKi5k/VdD
         2MH+6FKLAiQimWem/u33TfPUr1GYk43qIHnxHGP7tbPXPxq3ioeQBh0B64x5XxQ65nss
         kdvtrlNh1ao9acRVbcC98y84vtO1lcLvFG87lLuI8DfIUHhZyv8Xh5rBRDWJzMc3Xprj
         8F3ehDu2tIO+zWyA4nBJJGbdfgu7UI0xPNCVpEu5XMUwef6O+AfcxGvJ8PLqVKDcKXu7
         8vlg==
X-Forwarded-Encrypted: i=1; AKwUvBzOqfTZvV/Hh7TzC2iPh6cy24Z8C9bwMWAax+SgNvoIvFbASgY50y8MpXarmAnTNwdcwdA4W9OAk7JT@vger.kernel.org
X-Gm-Message-State: APuU4Z/KfxTO8/zM4j5KEXyEymCeubzSlQnZ5o4dxx1K+mWTyXTJF6aT
	nnQ8ke927CCJfFpfvxJL1HBpD7vWeQauEEz991XZBdBhknK5IuE+YAlY8JkEsHiYqdy4BkHdvmg
	EFe7AgaX/OzZRdC6/8wAa8wuRnAurPaTjO2DCQwKoOH1pVv/6eUcLkqRQbSA+8bJC
X-Gm-Gg: AYBFou3tovuZIzoNPopq/8gR4Z9F5IWfe0E8ZwVo8mYG1M4Sfbd/6Aw12EgYcyD/6hY
	KOIvqHzrD1AGEkO36IJKoyKOr23S0HvT9HA6W68ggYWCpPaLeU74ysQqCcYg3sGBXQay6f0C+cV
	WX9txiirl+wWGw74Jvg4/xJNIuy5WqMbrYE48716XdYnyYzc44bSlF52qGTIla0PoVQf+EmqZLG
	p4kQtQ5haf/Eyoy9Duc++yB9o4JAduv2TmLO2v+3zNJDArMwabUfZ38lYKqLVsgQRZZCvFo0BKC
	HxNZXJYBKxJEUEXPO7rRbgXqy1qLT+yPc8XBfxu0JTQdRhewmyf/wb5r3l2/ObH0H7KvyQ7VEFj
	ErXGODwSbqHYHCknApoCdSr+2VkSJWVPqt93FSZCoUJ/X7k1hu/lDV0OuWj/sMYU7X2Y9Muq5rm
	+0
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5355040eec.13.1793873779436;
        Thu, 05 Nov 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5354978eec.13.1793873778588;
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17792403eec.16.2026.11.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Message-ID: <e07bf018-9a3b-4b2c-aa2d-32bb3a8db60d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:46:09 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C2xR68J8igAiqI1sm6QwTmy3T4OT3PbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX6pwDDFgJnIga
 /QuAEZCqs6Z/YiXqMDYg/e2f6a25Mg1hJ2DHE2JXmjc9sKNrZB/CV4Zdaqie1kFOnOscqXyADSE
 XHCf3sJ5IMbmhuGUftjfslu8Pcz4RcY6/ELzbJudfAdP7cXjdyZnIJUHqvEBCYJfciT2DhAiKIC
 uAeucEaRo6aiCp1bYNWNpmNzmDwdnePFCbIA4g1j9jqOgBVos9R//HdKM4OygrZl1BS0yTs64lA
 C4FRmMkDzjaizdoF+TiBXND63d03lwlxS2mokNhunOGC7U2AtrJU5Erf4KdyAdbggBYOKHKcS9R
 6uVcXj+Uqpizw0r8CQvy03h083XGCft13W5MmwntbiusCQriUCtPOzGpO3Hz/YhW85teQ97Cnup
 +KqrQOYZm8iCmmMXkxWuyhjgoR3ZKbtMlTzaE1Jm6Xw/jR8YRwINkyDZ8HRzDALorfkDGJB3wqC
 t3IK9044E/RgJNnLj2w==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec5774 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=D307_pyVuiG9t-qGCPMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: C2xR68J8igAiqI1sm6QwTmy3T4OT3PbC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX3moed6xtIdj4
 6LMGCqO6WxjuE19X9T1aIt4szcQ+ePEqu5OaJRniB5zUbdV18jM79uTRoYvH0Vt/aNydv10Ew47
 +0hB3thdXctcZ82NSof1BZlnNnolsJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050040



On 11/2/2026 9:24 PM, Dmitry Baryshkov wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
> What was the first chip where these registers appeared? Was it present
> on SDM845?


It is available, but we didn't enable or tested the block on SDM845.

-- 
Thanks,
Taniya Das

