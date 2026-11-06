Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954893;
	b=GX7vPicsFQcDVUL7g2/6HMc+raDV6TM5USW8K5rxnINyfACd3qNMvlKPli6idtuDrpNf
	 3PG5PjLGzKeEsGEKgBSbZ1Yi/ryYaGRvW4JdoXX/NeutFyxVGrahbPfhPSnROgUh4HJOz
	 kpHuVj2z+sWg8bpA0oHPLIZeAjKWboBEdX2pfKHPoZxGEDRJZfovhIopSVVraJcwYi+00
	 oBUrFdbbcYgW4ise+/DQTsaj5DKsudIoRDtpCvP/MNvsjTpk/4ed8SW7rj3W7+oK8bNaZ
	 uzKyFxqsnzGV88IOFpA+LDZdB5RF+P3kewwzS5ZeZ7havA+acJY5GnMp3NGqP0Vn3sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
	b=K51JKC7hfktJ/aG9Lnnj1DCrMRafExkn+N65J2BaJ0OiqfuPSLVPgJiEbbeZ2OH2y8p4
	 wsUWsRBJ2AYzQkt4z5M/xv01TLu/nZyV50bebyTFn3qAFErpHgIIzm/+GSC0TOgNPt/V6
	 fXpc+wEOq5/FMounWXqBIGmhTA+v11wzBI0PpOKcORVPx6SCDZrCAVOz0ZpvdEkL5QhWg
	 Oqok4Rd1REqZdzQIx/PwCKIDSldHmJs/RqQniCFmaJgAcv2wH2DqTCT2s3vvv5rul3zwq
	 5GdTbcj8xwMdUkfi1uev3cQ/DJupRXnQ8XVZbts0KmjH7fqE1UwSwg+c0RDPsehGsuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7BE606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 08:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7BE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RTYm2730724
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 08:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=; b=eZZK8WYjuuP2/fLZ
	rGYutrJAe8m1ZiwNMwRjzAiU0mbshZjNaUGXok+JEBFwbFkWjBOUNco7RSycCygI
	TLq2Lmjfu12mj7W/vCOqvmHrsZp0O62aRhNt50aXT2YNyn4L3Afj83pgWsbwH9u4
	epd+KcZtbyD2ge9AF8EiagjR4CUIms8yKR1X5oZvVTuS1A6/SgDZacM7B7B1I2DT
	iWHjvatYEOg8fgKmJb1tBeb1xJ1QU+jlTFdAyGFLxYLjogmj8OCTcD/DA4VzEaEp
	XiVZHd7LqZ2agUaT4kk/FTmYMOCTE7+I+ra7Xb+Uwd2G2bD2fy3n3gZMCVsJUImG
	MIRmRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9hwub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 08:48:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so10059885a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 00:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954891; x=1794559691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=KKUR54J3FKaZCxRNQp+3Gogi+fMo+EXtq4jWF7XAnSXRIqt/GESvjwCU3Ld/ewGv4z
         ipOOlV+LuGPFzbIkQJ3FMwiUdtssSemTZ4StMYhhZ59Nsa1ta74GB2KvA3jePh/W3qUc
         UhoTd+w226LIcSQQe463ntnwIAtE3CqNlAim2ZFwXibHRJT2y7uFUZ/AH7RG9F6OSPHo
         DUSQIRSNZfNHYCdiek9IynkiBpodX9c1dsqa9WHP/1hDuedkjYTzqukGMbKMhl5/wNjg
         U/dcClyIYHLOr4dVqoa6JUxLnSqIVQoCqtUJArx5lhHdFQDfXR9nE+PuwX5aWiCIM55G
         gLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954891; x=1794559691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=RmqYermCWqgyCMPDkhtN4B7kV52k6jKDcDOFRY9tkgeV+5W8VRbI/wLmWo2N0/O/Ku
         gHkz2DmefLZiuPaGvND626xlCUhafz07qBa9W9qO5+V+sIYhr49OfJrFvECnPPBnqUUa
         EeCm1GH9qe2TvLi7wqCRtgkNdigxJiOMI6VKqp2szIbNbJXF2p98yO6yXbfOgIwIphpK
         mEisVrmjit4dM+vCToNonY/IktUs3MkSKlp6YuOnAdty2fOVVyv4bgFgyyT7cU2aj3hM
         xHtWp9/YxbyvpZ+z+8WZ2US0rkPN/0rD5OOSofEoqOnpTarFnihoBnn1jwEaW6R8b2A3
         6UpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVAEBU3b1VGf6CQxhnnB3hZGTTJ06OaoutqCWRVr0Uot1aqcjoMruX5+quaR/ovqbeuFtbF4IgLUys@vger.kernel.org
X-Gm-Message-State: APuU4Z+zSn7ikJ/OEiO+e9Ny+NqY1upQoarsHubrQkKA9fD72OhDSBPX
	BXAODE9cxVozuVh2hWNo44h/sjX7GFGdTzLwpocdXOlUtVZobetRlAd6LBZdnc9uu332yFyGWUz
	Wn5fIVnlUB6TVlis5tExdCvI05Kc0CWWbEIZ/4LlUNOcbQmbpPLfwzwUtfA66+wO3
X-Gm-Gg: AYBFou1/WnBC23kxdsnYLfq3ZtpCnahdzyfsGKJUS70LV6olmsAWLIVvjDez6pYbyZ3
	2VmiDKDBTXisjY7Q4qKSeCkp9lTqvLFVx1FdAOGUpf1UOV1Bf2OxIe7evVNlwhhSeCyg5QVMVEq
	0RED+mhwHz2Kk47iNm4TASQVvbTxAmV5fzGqGZIESHaDpkw9YEn+mO6mxOQTIhurCsIepJsUdMA
	JjpcSWAolLLyAqgbkwT6OdQzbsn7DlKN0v2C4ka01hyBu4az5UBmSkQD37f2N3pqyzwbJrx4d/s
	s3J7fFwd2hSRUSP9zkZTmJQVsbc695y4VPKPiNX3iUviCS1PSsP2ZNNDlpVWBQOWC4WY8Q2up34
	4etjAja5tKMhLApTN3wgsAV7u+y8FC/pRTr/SxrXYcvYW+FBFaGyYGnVehU6VhhWm3bKp
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220666085a.5.1793954891255;
        Fri, 06 Nov 2026 00:48:11 -0800 (PST)
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220659785a.5.1793954890185;
        Fri, 06 Nov 2026 00:48:10 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566e050sm61977266b.32.2026.11.06.00.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:48:09 -0800 (PST)
Message-ID: <e53010ae-6347-45df-9574-a121aa4711d6@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:48:07 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jN0pPsvZXjO5zXOO9QyGsqDQ3LT_AMh8
X-Proofpoint-GUID: jN0pPsvZXjO5zXOO9QyGsqDQ3LT_AMh8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX2D7hTJHPhqOG
 KZ7wFB9GY/D4Twl+4gnhyU4NtcOwvhQeNRUWzRBbxAO2BFqKrKybY7SXpoeOzFAHGNJ/OSeQnV6
 4aheTmbxOfu2qt7eeW9cMoM/qOhu+eE=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed944c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcXE8KnCS75fSRLkHuYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX+3MGp7YXqWSD
 xnfM1FE7F4/fK2c61KJ+cSY8qnYZanlGS5KM+qiiYpS6/P9TLpqlNwXBuJSMGKen3vJ2ttJ+jfP
 o/9V9jj/Y+WhM1DKIvRg4QjoRJAEaW+F2puo7xdV/OIz4t5+cCdvPjMQtd1v69rXhpza1ByM8OP
 L/oe4zyxLNrkhYi3hy5NzhFgrUM6UQLVKX685jk0Gyy1hGRk2NWswwkjdCiFoTNj/G+6qx1wS7U
 Tmv/5uIcP7GklWziLm2KAmmYcctmeIQxpp1A+F2kpZqloDjF00+QpAd2eq8hYVa2Wa54qonOOgR
 O352AanZMLhd8uViws/lg76OGwmhR3Av+d+JIWfgg9scht6hhV/ISYsHXyHBVTPVB0hGj+EtCED
 V8hwnxqMOp5N5Rw19jMoqoCWMkBD3PAnaxI+2Nf3jUV7f0CSM34b3Ai00cYla1mn+IzdW1AMYi5
 lN/Ss7C04Fakd2/nBdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

On 11/5/26 5:18 PM, Bartosz Golaszewski wrote:
> qcom_scm_io_readl() performs an SCM call and may fail in which case, the
> stack variable val remains uninitialized and its contents are written to
> HW registers. Check the return value and bail-out on failure.
> 
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 32aa7b919e24a0e614078ddc70a248c746e4813b..0053d1d927dc134ee81377fe480befa2da87c7f5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (ret) {
> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +			return ret;
> +		}

Linus already pulled Lee's fix 

https://lore.kernel.org/linux-arm-msm/20261103213002.1673560-11-lee@kernel.org/

Konrad
