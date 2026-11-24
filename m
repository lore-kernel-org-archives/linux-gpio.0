Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502078;
	b=I2G0OJpBIXZPMQAtSow5FK/TYo3B+TuMNo55ocO0+O55gzdMZuA7jUaGAxXmp5zZITjM
	 OXZQyKcgxLVYLJxPixcddD6l4NQmqN+47Nm5KoIJrhXNrBAWHlMVzv9grLLeq96vWvy0P
	 rmYRKmjbBtYPsQjeLkCXTPVC+jZnqmSjW3xa3rhGEXQva5ja+TpHm6joJ1r+cO/fFPDmZ
	 kKz7Eu75QHQxpMRytqynhCty8TeQE90dLd/fYtQfrcEWDkpLLg98sRiJ2NANr6qffJ/F4
	 LmLAVdi+x4dxSlRzwNAeqo1hPAd4RHXfqa1TKyI6WyS+OFRcL1hAhECruYP8u4dA0jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
	b=HFd7iZCmyBI5krX40Bvw3VlW5alyjlMHDaYGkkmUq93UZ5K0yjZJuzvpv9k5btuIeT0e
	 Vo3Gl2FHF4aQoeDfjwbZE74o6KKI9tet8Mo3pRVgwQToW5OfzRL1QzbN9mO2CBeXNUALa
	 XJkKt5bQWzfE9f/psyl4YyAsqyCJm3bHPcjiww6fOVinQ5ork56nR1Zar4a173xBXW9hl
	 Qth2upvKhOJ27GSJtnTSATc1Ul2eG0955PeWLDIjp9H3K6M2rsbb8gKUHyJhgJ7Dc0gHA
	 Xk9z5qoVumked9eO2e4D5zEAHltXKLde80qIdnJ1SS8ddJv2xR5CZYVsy5dkiXQHa8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bU8AV/gL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C87606A33B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C87606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bU8AV/gL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5lwD12848219
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=; b=bU8AV/gLvIZUDnNl
	c4CjPO2uIJtRiXJyfv5g3Q6EL2MLLv4IljP47fXUKnBWemRyn0DKL37raB5tDs8V
	Z+87q/uFrtox7vkUl3K4dmbv9WERxoQPvG+tiUYkO/6/THduz8gHh7dFteAeIuBa
	IN90+KxWpGn52YOdzfjICtdKAzcoqzIG/WV/AWcrqaH8MZGw4ABe3g7V5TlOIxs0
	orGJ7nlzFa/yReRa6bZkgRtjrQqH5s7H11bWBEWtbMErS85X6UnXFkr0xvz9C8co
	SsuD6WPkCM0vTFaz1RDP/9+EkDQ+uRfTNw8ILHn8LCHVrdt+yH8Ow6l1f8qRYPfz
	g+iI4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh850g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:34:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8c5408e418bso2996165b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 22:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502076; x=1796106876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=b7xG9M+pprNtmQA1tDIEYq3rHqtlgfuvY7shGOwkX+Jf1Q7sFWZG/s/SAYdwV2UjuB
         DAIjMvVnRmK0IAWLnOvvS7636IIYmJMFJZxe9rOuw+/OXzfy6U8Hb6KfDnW55qH9Qkba
         FYPs5IL3x40CnEQfjzebmqsyDMx8t7dJQCOFJqBlQBqO/DUX2bjg39UaQe/HxS2brYtb
         DpWr7HU53NiKPtSSKHXgtvyOvThrxz9+olFg0xE3JZEBFoOFfaidcRi817m5fBTdHZFU
         zoZbW8gzYDSXqCjsmjpwz8XPFT9JkJtTVgAmUU03L5PCyo0Zg66Rj3293Bg5MDD7FAon
         ikNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502076; x=1796106876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=kHs8Arq22RzTPfrWUOdA9uFsyjnz08rG23w4BptLE9uY+gGY8lF3Wz7U5FHQvkR8/9
         P4pUMUJVv/UdcSweY3DlN0a13wFDUf6B00a02134EStOUNRIrmk4SCel7d6H3FoQHSaI
         FNO7h3UvWy8STmjR01lIondIc3Uado83lJ+zFnmMmmf4QrHl2SEJhxwDPZm75veARmVQ
         7+uK5fadg79puLI1pA6slyZuyJJUlv7AkV3EOTe6vScAklMvtMSOF2156G5cnvqhwXYD
         A84iyNxAJsPa1qf5SYmDHrK5NSBfaIJSCkewBGwxvJzv6P+NtL8GgXuYu6NJtwIl9gij
         nUOg==
X-Forwarded-Encrypted: i=1; AL+hErEZ9T3QjdBXyVWJsVMdOxecMVpftAgQRQpBcoCazNgoWyAjYanQk/6AmcJZcM/PPBDkrGh/EN3KWPWY@vger.kernel.org
X-Gm-Message-State: APuU4Z908Wq7yIJw5FyH6bGzfFci33DL54cGaeMnepQqirNDQjusiCDD
	//ZhHE+q3qISEQoDBAIFoB1kBmbUTqoh4AXtqQArHbqju5/e7puFG2WSFKK5786cUMWqEKVPqpV
	Vip1CIjSyyWm/N5HfgZWK202+SeOzxch+Ghc7fuT45IRS3A66BBo4rlcNTwQtFXak
X-Gm-Gg: AZFdTZdtO7OvlAaXuSp2OVivVsLqmjtCGGHAqNT3FLDRcX8yUJDItgGRcD4h51LKU0l
	utDSNrHMEAnJ3581Gg7F2VoxbRkY+flYL3U81CwUbJYlw1lcCP7wC6jh4VEdkIRbEzX8N0l7UJ/
	wpfOf0OlYTajNmsCvnhqHG/iyOX3s3ZnOSB5/NcdpbOyupmp0V+8TvKOKPRjV95l+mhRQS4I5YT
	kYiAw6Wt3IkD+0LorN+rRfl7euTtiFevyxgf1IRdrHrF5whKAzO8P0o8uKETA7zJLjJTJfcGHoH
	AHHH0PPjeadTTgS7eFkIp8Rm0yYSAMLKuLlZmCUt8vEDuvw/gdap5aM0l9jZcuTQCeNBUmkEkfJ
	3/hvbbrwwVvoL/vl3n0TLgJT3/gwTlNZs9X/srjGMyT5qniYzI7jiSbb9UXIdW49X+nImdkeOhb
	TD
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005108b3a.15.1795502076086;
        Mon, 23 Nov 2026 22:34:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005091b3a.15.1795502075648;
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm6723898b3a.28.2026.11.23.22.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Message-ID: <fe9ca68f-8f3f-4989-b366-38c0cc6c9ea3@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:04:27 +0530
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
Subject: Re: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
 function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b052ffc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ir49MwnX2Lnn_q3bKQIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX5HYYQ+7ZRcCo
 vW+lwM8u28aDNtAtS4paxvIqetDud3KJbbfcE0oNQR0a9RCXZn9AML77HWtQnbP4KdQOCx03inf
 W5GVE3Gxtc04EZmhEJ8T4ZuUOgzX6j8=
X-Proofpoint-GUID: kO6g7Y7uHQ2OfS1fWiYaGRgpFlEY26hA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX4y1T1qICwzO3
 eh2wh4VnBoo6UJAyuA25bTFYdJskdQyJEraa1/QfpaUYn4uoALat5LO9VPxOlObcuoGJG83ZNRi
 m3esYTmF6bufpylCA9gNYNd5qXB9DRD8RUKJy4V9wsEWMXbwHJyhE8Ikr8IE0fvt+SjYpC+Eu73
 31KRUnWHpHCaBWoDG060Ho7GTkDbUWpQBJDfmERbrh3Lf/qn1hY+bRjCOahP8W3KnMTmV02aZxf
 4IEq1xQNeJbPjJ95rpku/BCWVGATUJF17GkOTbFP9ZqfagawKk9r+++XKQJ0oBspyt0EWpPzbqZ
 VG9GVuAO0aY32AsY/HzsNrhKkO79epFLgJl3L2ecv74n5AtNZMX41MGA9LDTwMhfS+FR15CZ9gf
 mKCTzMEbcNdKPr+ZlRINVeQ69oXYIPER+2RT6AbXqxXKSlsTujvw4F3gSGMVwU8fTTy4Dxwc85+
 ODAapcLYDNUWzMF4BFA==
X-Proofpoint-ORIG-GUID: kO6g7Y7uHQ2OfS1fWiYaGRgpFlEY26hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function to the Shikra TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio87.
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> @@ -73,7 +73,7 @@ $defs:
>                   cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
>                   dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
>                   emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
> -                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
> +                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
>                   i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
>                   mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
>                   nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
