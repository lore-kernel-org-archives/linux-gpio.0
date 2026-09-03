Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF9A493656
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433065; cv=none; b=rQHVh/appKNzlxhxm6bdLhYtQbaexd6ybg04a6cOerPdFU7EwGA4eyRZbE3OZVcMIH7a/Gmm9ar06VsiSrbjFkc5qH9mwf90FjCNO/il0t6cbxBXqbZohuGmh8Yeg2ypw6nuPWltS/1wzQMUGmQdymCt+K8uruGh/ir87s41AnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433065; c=relaxed/simple;
	bh=QEo9QxrcNRKVWIrskvYI0BS2e9up5gkgj2oc9zsqXFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ff/5n2gJcA+QH1K7h2KfDZz7b3dOtG4iDAmkJMYdVMgVeJ0zBl0cBcbWKI74tIYMU3QRG0SJd5l2ZZvq9KO9cp1CP3u94zkpl7R2QUUODsOmGUzNBcxYkN/VslapM+MUNmNmwceuAfH3ijqhsxHNahp9MUF48d2cFByoaG6P4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRdpJMIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev9q5Lin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRdpJMIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev9q5Lin"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHCuY162798
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 10:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=; b=SRdpJMIiq9NDmrdv
	UAWcFDzUt9xsWYnKUJBQih4QlR5E/gTEnhcGm3caq99WQZrQfjKC8gIORrj/7c2w
	ef9TqPTSXkvHfFVvSoOValzb/SEQbSiuSWMLO9nwCHOh+mmoooW8F6fO93Ut13JP
	HlA2nXYEACjWPT8HSIzcJu93IHMuDpz+/Vdf5fgnzzOgU/ayi0NinCCNLWYF1ZS+
	5RYtUlNt1eeGFBDEaMLvyCICVJul0NEQb6wz+I+fYqpuNRrUn1dyPuvbV0Gy8FFQ
	w9HXAjqH4pS8y+xB5HlapeQoKl2h+DVezAApTWD/60X2z5vjNv9r6eP4nrYj4FCj
	ppkyZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx06dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 10:57:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ff0dbeaabso2357431cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433061; x=1789037861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=ev9q5Linpzw98CU67L8KYBAUjx7+czZ7IzgT6M+yKQ7BKpFe8chW7ct97jOESMmdr8
         VUB4v+8fEb46Ayy003+YCI/NXQ3b4FxLnlgEF/MzkSX61+Ez61lSXfakO3iXlPl2sQqR
         WqVgwNfbTIkp2oRXZ5+oeuxZJiKsRsT7oYoIxe1DEw6ix7OSd4P1vnSfCdnH9gZbLDxi
         LoAoRRw2qdrqxkxbq4pgiPgkHb9QxYxNMIeaCVDVlcYTHVdTYqXGWXhhvz95XPsiNDdK
         rxPVewuxqdMNN6tliQ+HSy1GYfNh96lq2qcGlfTanjweG++8B1p3+5Wa90sxlu4R5kwc
         4Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433061; x=1789037861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=HJ++PmGw5D3cug0YauGdAQ21lmtKFLeYaAybEmimq50DAiunIbrbgzCuRA2Oyw4MTQ
         IQCC0yxwvdoccwCZpFOdHLKJUpOF+15xwQIZcef4pHP2ZaTfweDo1l3U/evOvuPdP68f
         Hf5VkHnN14zt3A84kgNyg3z+awCkY897MsP/qZCnF7q6MZmYBfsrY3KrNxfqBLANumJ0
         wP/2oPDB+N7exYiErKZYLOXyGLjcv25UdlK/SZ8+jlwrQ76GefYSJUgq1Fa5+I3gkBjA
         n8CZaqwzEy5IZQgQxSkxdr/HO6sUux9fNpx5ic0c3bw2wzZUsSacQMzFCLN1xVg5AZ8K
         9h5Q==
X-Forwarded-Encrypted: i=1; AKwUvBztDBCpkSxyfCOIcEH5c7rLqKu5LyxEtjB3ER9XJ3mJrA+vBVyRkWrjJIHnKiodf02p0+Ug2noac9mn@vger.kernel.org
X-Gm-Message-State: AFuF++lUV2JxZpa/9mgXUBXZEICUkJ5TZZRsTEFzstgTIkacaTKbdL6b
	uT+Gv4hRieHpKyVeLJr2YFLo3dK619aDxm8vVW2Lvlh2BCkVV3AkCtdus3S3iJrAWoDeoQuz5Q5
	tsiA1PwIhXF+uCHalaytKLE0GeVPeISs6Tg6NbkNMnwxGSox2PtHSID5UJbUTDTx5
X-Gm-Gg: AYBFou2Hf4N5vPM8K4x5qTQc3XFW9R8PgOVGPZ0Yr4PUL/gxmbcIGUXj9/pubaik0b6
	XLPZxjfhB4EjGAPszQ+Z+gPCVvCUPzXhCssrUBrVJQSWBn9kU0y3t4oI0C8aI3BNHAesi0YeFMQ
	k+6ispKXOx0Tce+RoRWJV/W/sqhcBRktrSqOHwOt2aiKTxb0fs1Ox7CwE55NEg8WguioBulq0m2
	6TV3hG71b3R9+TiOzZva2ZeP6HtVfxwp727kqa1Y3IvgDIGHREu9NCdDy5oo5t+nspO1lO2Y7SF
	xHPYdQ6JYYN285W2N7DscDz0tZYyU0mEMGJVSpFLlRlRuB9kJukQglLiT28Dg8pStljjaQVEHe2
	T06FuNzqOVyBcPBK1Hp3RRw==
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86035031cf.1.1788433061490;
        Thu, 03 Sep 2026 03:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86031871cf.1.1788433056291;
        Thu, 03 Sep 2026 03:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8bc496sm2173512a12.11.2026.09.03.03.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:57:35 -0700 (PDT)
Message-ID: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:57:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PkwinbZZ9rkJ7LT-gLDc8sDdsSA65u3O
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9952a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PkwinbZZ9rkJ7LT-gLDc8sDdsSA65u3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfXymn6UETEd8mL
 JZLhDpOKCSATtqk1gKG2Zxa0d31ujNAEqVAaXjNXYmsMzq9a3GTgYl0jWCNyalSBRPKuSU5jgzX
 SXO/YVp1WD/5EE9jITOF4AkffQAWqDMDp4FCfdzDe7JNvrOg3EJi1TMM9vtHEs6hpz99+aPbvnJ
 iZtwqA59u63NKEP91aW2Ala3krw4E0wgmOwwOs9jr4pEexRVjB2iTW4jt742zmxmOOit+6thP7z
 YQza/XFkXFN3lRgvisDtAqL3pp5xVWVZnoy+64qL72HWOiygf16yvTyH5LXyTzenBQ/VRjUbaAR
 gls90PhFdwIcql96oohr9p4WaKAuAgcBF3xii/22k09XUNlTAra7DvW1ar3vsfi064IdnPPEC5l
 mJ17eBih8XAlX75T//1qF3dcVUBYyDxiTI5eMlG15Wd6ssDoMngpDYR96YVSp0uF2DYZ3wxxjw5
 twf4Tt53EvfRzvfwyZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfX4lH21SY4ldwv
 HO0lY4hUL6vNg+jE7g7Wc5B6ek4kNkii6GoxlJx6zfqS+SVBxbjHl02mkSTqhMsNWF9PQoICgbn
 XIq4i584hX8LvwBtXY6Q+M/UtPC7HTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030095

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xffffffff>;

that's just "ranges;"

[...]

> +		qup0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x009c0000 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;

likewise here, you don't need to precisely limit this.

Konrad
