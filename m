Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632122;
	b=w/Edp7ppZ5Pa/oUjjbqHeCucwE8osmVgYsG0xLSQF8kMpt3Yj+/GwGbyoHy0zCsj6kei
	 mAo+yfu3cY+Y2RXMMVue5Yrs/90g77gscCfMkqIVTmAXdGerjsLO9ROktR8TmcxqJbXSD
	 9wHSbQp6Wu11lJuwBzstFNn+Ee+K3xVM2m/LTM2ujQB75m3J1XGfxbVX5dVSdLytNgP7k
	 AaWJo2y/Uo2tJwQBWBcBovqgKOQ8rWLOremZpnRZ2HNkfyH7JGcFKI5hS8wNX/mbd7gqd
	 3DmqcRDR9KZWCj7yh9sxGmffGx+XpAOUXP3TK8vG+3rCgTecQAU66QZwXPrwZDyNRuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
	b=ZrpwVlobY8jEG2635U99wuHIhdbY7Tg54s+d31ka0WLoMpgRSrs6lo2DDHlqL7bfeFPc
	 c8v+dPa4036Qdts6a7l/WBQoLdAFm2MYXHrXsTNM+NQwTDFPUSGHMKHwhHocHwUE6fiGd
	 I3lewYYwjWB4wyQ0mWDsnFV8b3VW1Pa7FhDQpAkw78WUPkLb3GaMNf5l1fobSyiVok4du
	 n9pqgEdKj7lEgsp5UjB0RoKkK2ufgx3pYoZS9DoVzgJzGVRA4zsMa9vfz+FvvWAwAzGI6
	 CQWrmCu5IEO7tEN8Ps8x7GCMeths1Sb0Ty4yvnT1eu8d9WUQrjsWQpf6b/ZuTjHoVMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DC608B7C3
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 15:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106DC608B7C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpBJv3512196
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 15:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=; b=edyVx3Rl/Gix/vp8
	fVxiwC8I5X3BwPxqEiE5qvO+NETSFY+0Ml2dTzswfYhKFjNYhxNmH1C/I8azYcy1
	ffEcu+eW6YjBGz1rC8vRPiXo1BHAcXRiS4I6dmjN52QwzAfpp4gnmGYQhY4f7RoQ
	2NEh6Oo7mzMD7aLUcT1gZr97osp7UsI7quWnE+frI62Z6cmG2Izv3/AMWWe6MgIN
	wnhZoykblMkEnP/rZKodILXFBezTdof0LkQ8JpMc9PGN9N78Cy/qBaNMOCGUaFkR
	5BxulQQmJL9p8OtiEbsirLW48LUyFc/vh02J0GJ98Kup6qkvlJfSvdbz9FMQLw9B
	tcYVag==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrhedu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 15:08:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabe7151daso105726e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632119; x=1794236919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=X22ALmRmrQr/oD55jXdHNh0Az2uG+9BA4LWAkZe5KMi6g4ZK+ZE+KiMHDOAqsVuaIr
         8//EE69oar9gO0Zw4uZol777w7EwPXh+hhlwM+UPN09AvuKNtsEZ9Ddnj9b2Lz9kx6Zt
         JbeQYIB+8wS3I7IRyIl1EesbgdUKOxw5ApcbLFPkO7I0T0fIWVrapV4TIHExiaqD8a8L
         AU9r1UhUlEgK6eJAooHYk0zAOCVqX+aXreLaaTSqPFPnnOfTJZulgzbd4HTe4WmI866e
         PoKszrqRaIe9g9tekEFzlsk9JnXlmS30ou/qpDI54YE/dD59GaQKlcFxUEXOHFKjlCi6
         osbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632119; x=1794236919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=l4jR5TPn+JhcB2v9xi2KEtjHFh3iVSuEJH4RPiVUXZoN8vijhv71aybCWDfM4Af/jH
         oGrN4qcgZokYGynSi2NIMPBi0QIeNriJnvwPgWgiAw3fCjGPZJ6OBr/YeFFzHIOrlfGL
         Wl7PpLsu7bxt/qV7BWFKU7KF1VFC1xWbcWCJScbGh4DP1AMegqcScZGKZftoFMGVuHnv
         u+XmqdkubyUq+w7nvWfpi7THVJNYrtJRPhhTVsbSBa/zgj/eNaKZgpAn+Fr5kZ2DpU+R
         oXNW+/BmJWwy5cuAaMla8FNRclt/uLR84FWN3927fo1JnwYQJZ151lmcgQD9EmvP8gPE
         HY3A==
X-Forwarded-Encrypted: i=1; AKwUvBz+a1LNKLOcrD+dEZODWgwQaOjCCfM8GIFZqlBopQg44sQHSKPbU7LqgJ6/u1f2NvPR6fNVPxDh7FGz@vger.kernel.org
X-Gm-Message-State: APuU4Z8aRqyVH20RxsS+iaTkpLzGaQMCI8TCmUU1Y8pvq6gnoH7eJAnd
	fYikWz74iJdOFCWtXkCLtj3V8/18if6EOkgo5msxaNHU4AyjczjulXcYSXVfi98U1jOxMdvNuIe
	F7fFIN9IocllDngYbtn868BbAKTUXNPSDEo/sRT+jryi5MtOhSGeCQiQmz9e6YdZ0
X-Gm-Gg: AYBFou1ci0vHhgT4btGyBVCuoKA4lRBvr7pr077CEvILAzosBPiw2XmHxMllC6kx8he
	j6DsPVlGSDoK2xpchZEUSccCkn105/DccngOiFPJtw0QmfP0rgVyprCrKIhWEASjdf8WX3s3ywv
	5Ze4cZ0/Ht4M2ti5HZO6++w7BGF7YRV6OB3rDPxxBvVdfzz9FflrteKBCcZNB2Ecut1cMzKv/4I
	/15yAsVQC1vZTs1BQ9Gf/IBG4NYgDhoj7fK9Ki+kQB0oRKpJlSwyBmgZEFSItog5EGYhKVU7TLV
	c0MrfOfjj1yQkXMb7SV8A/lO3e+MygjZH/+N52aWYHveWdsBCaYNDPuR3NBGYRfGFlZ+4+v5dVt
	pzZs0Xs0wQfGkENNLCeaz/HQtpzPflPrBbjj6p32jBKNqC2VRfzNiMfL2lhJqs6hoIYG/cg==
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127825137.3.1793632119245;
        Mon, 02 Nov 2026 07:08:39 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127770137.3.1793632118576;
        Mon, 02 Nov 2026 07:08:38 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm444634a12.33.2026.11.02.07.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:08:37 -0800 (PST)
Message-ID: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:08:33 +0100
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
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8a778 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fjKjonZ3CYBpfGIA-1YA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 0_Hja07hd19YSMeb61bdOzkV2fXyMOyj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXznAczKErYkjz
 0JNXdthZrKPqTdNoRRdNCdlg8tDW/Qaezr76KmC6AMwP4f7KlXqu/VMsnuzjCkcg6UWyCM49sTk
 /APqZRsfvZ0ww6jT8R4Ne+jWsgnLysY=
X-Proofpoint-ORIG-GUID: 0_Hja07hd19YSMeb61bdOzkV2fXyMOyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX/gH9ZvIf1Khx
 XGgBnRJVFkZ0dxFkXX1uwl+XKWU653OiJCLsJxL7RMF6jX+dhRvE3MsuaguDO4RiKPXOoy8VZ5U
 1SihJcqlmDkkcJE/9ksOh1+oFpqlMQWVUI9D3uEF5wU7qM0xVAoT7UvEuvD0O0JgdSo03JwFOzz
 GUMO2dexE3F7l01B66+qb3QnSupFvaR23z+cY0PcMEJJ/bYqIoQCtcoufS8Z5VN3txl67Aw1gQm
 oVQdjf5hlhukwhTjmbocEj4/LouEGzsor75Bts1UetqKiGSqlTMhqH01or2W+oHmKcJIWsjOkq+
 LnU+INUxgvolE13hMXt2A2Ve8Oy/927dL6kt+NfF2Kty8VUUWuGeoaZCMbd0c9pnwgslBMa222z
 O8vwvWwuuTcQ793NYe4XiN8hlDKcXcJwpilo6rH52RLfZJq7Kwc7MGaBqfH00d/rpS7KKdLX8/X
 oyQrQdlhmbwGrJenJhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060

On 10/29/26 11:57 AM, Taniya Das wrote:
> 
> 
> On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
>> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---

[...]

>>> +  assigned-clocks:
>>> +    maxItems: 1
>>> +    description: Parent clock phandle used to set the input frequency.
>>> +
>>> +  assigned-clock-rates:
>>> +    maxItems: 1
>>> +    description: |
>>> +      Rate for the parent clock in Hz.
>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>
>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>> Parent clock is outside of scope of this binding.
>>
> 
> Sure I will remove, but the parent clock input is a requirement of the
> Hardware and the output of this module entirely depends on the above
> ranges of frequencies mentioned and that is the reason to keep the rates
> specifically. I will capture it in the description and hope that should
> be fine.

So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
you added is defined as a 4-wide divider - do we need to limit that
divider's range, or would div=0b1111=xo/15 also work?

Konrad
