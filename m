Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032081;
	b=dUCydue6go8BzKnmxa2vkXhmb7l0kqba8TLlF6CzOYpKwJDeifHHsEMhLdsX7X8A/WQq
	 BC62tvNaiWTubsUqOxLP/2+xeRS7dULvZ+F4QBMNGbSttlbKFP30jrmfLOux8ae38WUcm
	 TLWb0YaE2tQp66ECp8tDcDSgp3A1tccvQn0GiD349byfI2b6qqORLiqaO7i59l3812T6L
	 5ayyevq6dxGFaC5DvhME6tkgsa6wy3TPDuwn1w993k2tvRvfEO5LVuQwr9c+yNa34iwdf
	 szFmKlsRS5RorHTZoSnGn/HkvkQzWvmwSnhMpFfXG6nObGAw+aTr5lI23DjR5aPeJnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
	b=CcCFYqV+eGhkS5L5H0xnGDl6DijYf/Ahfu6l9Kt0aiNthbajafpwLInTOL47o+9vF3Z9
	 wqwGuR++aP3uSFPOSvMU/cKmGukPFD1Fwlnt3aJ2ArPXAcjVXNU2LhzWUW4Ip48bVGGD+
	 erg2D+ACHJClXD7inR/QxRcXUAnENA0I/ZvQQQ5UEFSuQQ9OHMuG7l5EK3+5FoQ/Q8S+Q
	 ZjNreg8/OnZC/WjNU2fEO+yIdYYOD2XSOZaX7RTp/AVuoOCLYDj/7fPV3tIR5ueXlvte6
	 cNvT0LMfIRyxlfDyYLhDOtyOinR2pk+04JYFU7IcLp3MRAbe0cido2UFPxyth2zcH5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD062606A320
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD062606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvf8s4167994
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgbFgdGwx0LxvaVp9RgzD0rA
	2Eaf0b4Fh1Y0S4eeYow=; b=Icvcr8v8v7hK8qcfYwrBYrcqCMVNXeTz3YpTKEXg
	mdmdJ5SuXbVcw945UvK6fUFy7RYibLBAbrK9JVEJ/fBsyVazlw4CvovBwSBDax5O
	JFmOcSwc4pt41RSCoZg1HvxRc1DExZgWUj6rf7TyerDYnGku69EpU5YAb6BbYBHl
	Unv+vZJOfYr5sPnBUerBWR0/68KBwCeb6iec/tGteUwt+VAQlg36QDA90tpD431j
	t36hoZZwXXNbjJsr+hg9erH4C/+HvLN0VMZSDlXwNuDpKa6TWnICxKknknZ1X29L
	j+yCYLrKXmPub9xBgoI8c581p1fNBGyfyyLZjkwCWEt9cA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf1fqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:27:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so14622685a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032079; x=1793636879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=j6gLnBcla2HE5aRaz6IunowyyoGLQREkoQaaGRXLUmzgEmASZ3EIX9yDjYlRi2aJCt
         iaoPRJnVL8yHvAuXgk2VE1Y9KZ/R4QNFMaqTZhvJocKBhKo5xBHIwJcomERoxFuEKN2m
         sQbXBCWTBalS8JM/Jq+aRBdVt+QW0FKqAQL58tKo1EEfoKgiZ6Tl7HczpZ+KPRxbIgs3
         30pnAnMf3xxN6N1xIP557rsB0zrICK3iGqSioMzighwpAppjobXnb5Lu6ktIaInE7cmx
         xjjLt6JznYJ3mKKl7B6WbQch4NDP7DI44wRwuU7p0EQcjv9TIlTvnNCyddQBpuJlG74W
         2N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032079; x=1793636879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=DDDXcZV67JB7kzhhMvTp+W4LnBagHeYHNXWpeJDg7HpupJoofTTxdr1REvuqz3rBoU
         qCs/pU2pLj1gKO0WZ6WzLU/u1MWzUBpQDw00wcTl4KaOhtegHmSHHmBXD0BQtEx9I1RT
         Oaj0VUD6WdZZccfE52U2+6gqZ6y5k69gwkw3AD/EBdfWN6JocQUXmv+3d6Zkln7khdim
         158BiVQ7MDYjnwIGmP+7iRYf3yXEtU9afFO1jHIj3oOc1fbbGfXt8XEDcfVyS2T9FQPQ
         zTw3/C2p7Z7HH9RrlHBfwkX+2r/NfnWo0BKDlD66LJ4oB7gn7lM4kMCzwk0mlhUUNC0R
         jR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3EthZmkUNv1oQ3Q1Ow0lYpYU+FsjFFKtoV0nErRF4CoRLtugZmR4gs+ORoqSawD1KcSsEmAIVMn3G@vger.kernel.org
X-Gm-Message-State: AFq9FYJhAudUw10Eub/S92nXn1Js7o0xgInPeyR8fDymSmpenlAVEkJe
	49S9jSKFuzQ/WzWaiIaWteAVmZrNvPpOBvdtGPKoFzI/tculoYWngyIRO9P54VsWPbZuZp+FZjM
	2dTCHlPaC/ipp8PNB7GBUB0D+jTYubD/lLtnceamXHBU3dnTGcdOea/wnLH38b0kI
X-Gm-Gg: AYBFou3bkEpWqKOAsTKty8RTUug5jKH+2rp+2soepk3miWdh68SYMOdfXhsyHVvPR+D
	o9E3SVw1C8MjTu9HYe5io65R8epjaBYK3LUfmf4e4d3I+QbL4DSsAlN4aBA1CRSZk7DDvT4CE06
	vhloOCbBKKIqbNRvl1OqiKB96c+z285sdIUY/+ZNEG/4Kh6khQ3k50Rwrvi/MZxenzG2pF5gcaY
	XPjIh8ZD6uL2kuZuGjBPhQyGsWjlvsBRESjaTqm3KfVWvtdpOxXCXprC2COoQpX27qCHksrHmbB
	KOcVslqHwCRTjRTzU1NvVH8lOeP0VsPvUgEfZV5+tPJBV1M0B3iIN/Fd8hFFL3dwWhmP/CsJdbS
	ShlJB5r8VpXkFbgmy
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32405885a.5.1793032078891;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32399785a.5.1793032078257;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm18160539f8f.24.2026.10.26.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:27:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:27:55 +0200
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
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
Message-ID: <oxkqlvbjnlji4zyx7frurfjzf2ryfkbjjirwkewtp5trj7q5nf@pg6pogt5z6pi>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX2MZtup9S5mee
 CROLKuOb+XojnferSTD0EoLHyOghjz6J6EwMZTQmLCMAG4elWB5wi5hJqp0HSqIkt6626E1ivUH
 nC+imRb5M+5IXhyQjN1ufUpGw1bCZ+A=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf7f8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oTvOlQyMf-P45GjRKUkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sYsj458YH6_m_Cj0wpt-YRyDs4ZBFpcG
X-Proofpoint-ORIG-GUID: sYsj458YH6_m_Cj0wpt-YRyDs4ZBFpcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX0owDjFxWJEw7
 kNndEu3kkIoc6ed4fGKhdekWXU0IJCBiOUKKKQOJTSnJEklB2m6YocBWrzGsp7/9CuVbsFiVC6S
 vsAmdFhrCaRgm31a3j3lwDJjKAlL3Nb1Ue5ImGfLUIk9+QL6qZN5eoaFlRCpfrcVzgzZniz98RO
 jUQoBHkJGYjTl6rQwgxsLYRUy0OWVSO6HSewThka6kGVxZ9gC6GWtzKRRh07uAHc9oa08DLahqF
 UvgAl+kdb8PNqMUvjt/DobTE8gOgRDhGhZniPCTInyUncmqIGInw8B+soJ7IXXA7/ZnzY9Tqw9g
 neUhAHhHrOUGYiQidA5zU1GFLw5AbVJD9nV0yA2flsVM3Wf35dBWdzeTaBPpun0/PeJWCUi04kE
 zJoQgRDHoaejV4Z0P//M2ojLyPGaCXCnhQhz0xaxPE7eTSDvKnirI+VAYAYXHfWGo9lWvFiikk7
 /38Ijj5o/3NRVWHs5cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260065

On 26-10-26 16:59:37, Taniya Das wrote:
> Add the GP M/N clock controller and its pin configuration for SC7280.
> The controller uses the PDM XO4 and AHB clocks from GCC and routes its
> output to gpio60.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
>  
> +		gp_mn: clock-controller@88d3000 {
> +			compatible = "qcom,sc7280-gp-mnd";
> +			reg = <0x0 0x088d3000 0x0 0x1000>;
> +			clocks = <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names = "pdm_clk", "ahb_clk";
> +			#clock-cells = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&gp_mn_active>;

pinctrl-0
pinctrl-names

Same for all other patches.

> +			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates = <4800000>;
> +			status = "disabled";
> +		};
> +
>  		qspi: spi@88dc000 {
>  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg = <0 0x088dc000 0 0x1000>;
> @@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
>  				function = "mi2s0_sck";
>  			};
>  
> +			gp_mn_active: gp-mn-active-state {
> +				pins = "gpio60";
> +				function = "gp_mn";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>  			mi2s0_data0: mi2s0-data0-state {
>  				pins = "gpio98";
>  				function = "mi2s0_data0";
> 
> -- 
> 2.34.1
> 
