Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484654;
	b=K2fEb8SZk/fm4iWT1Vxit4DlfNlCvLEf3Hksdi+NCNvxL9p36X9oYPZp9zDSGcUwr7CZ
	 R3i/x7ZrTDwVjE9WB8K9XocPJsbsBTES37HS+07t34PSXveoLQhS8W7EKyv9Xl26Yna3O
	 axGS6rqLFIXGYlzaNaBp2f4iAQFC0p9/PujIsY7VZ8j1ASVGM7cwNqXisvw20W4y+w7aE
	 sxc8pZ7D3HFrRR8fweDvQX0dXNvxrPSeZKVgdLL+vssafP2F1pM0CqNNY6EzroLCbRRMo
	 Wm2Xtbd0vi9QAVWaRk373NS54K722Thl5pibPGaE8xftP3KdnugERrbh0C9+s7va9KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
	b=ipbeSXUn4piqxl2uW4Pg0QWBJ/VfyPv/522VCEbPQWkfJ/K9J+X1TS4o29sAw3VZ8k3i
	 +Zqo2L4TfWNdFZgebvOVWQR4QGhZIhlLE4A2+ATpPaST/25qes1/u6UpguulcEnRCe/x+
	 lj3/uAj4sugxb9UJ7SPE0GS7DLJW/bfNxMpYIsR50qqSYgQiHiNuw7SX7ksn8b/VypgLE
	 cUaGWWCCq8ddz78C9nF/Q5ioz1SlwZgJbHxK0Cy4ndFGm3Nq6WTZXnvDgM3qKOHqAgGUk
	 N+thN+RwBCuDRbDSlDO3FL38w4xsu8e6JqncTtgnmvH/ffVqs8rF/fspBulJrp2+uew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E8/oxoUs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9E606A330
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E9E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8/oxoUs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfKGH1953709
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=; b=E8/oxoUsZdrmfVrj
	4nLtKrhOG9FZ6nbTzxObxl3C52NPDUwzT3RfaG3E04iWVoEdRAY/kRLV3gDeErEN
	EdnDNNWUKtIn3rSFWi/DEtx8ft4NkBLHWf1tRkpoMnu7BIFRjjcFierZlUXwmJyk
	gf4DZWh/11dEiSkQnoEHU/53bTgxxLZcnC7E3qrzyIOGsqQ9F4EeV4uO3DwVZIA3
	DzQw3+jA8gzMwJZlJzBzEU0g732KilaA7gFmjrblYljRRA84fXaYZoF2rI8oJaKI
	3XI+02fyMmqvyffJesb5ff7L74yRdY2MKg+cf9B03rXLFCMiKk2jnmsXV0ScWIFp
	oLCJ/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx3086u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 11:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso47977085a.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484652; x=1795089452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=Bh7Xx15vagypsXdLyaNVsJtq3yx6e59n5foGSvP/6iWwcLk+bri6CcDfKJNTi1ixrg
         8LHE+NogN6fDOKyiehtWnaToFj4sgJj65I+Q0ZIkNhFpDEKtIJdwC/vqahsr/Yum2FPA
         R1K8qDN3GxzzXuG43KiuJHQDyt09kEr6ME1qUmx6Iw63Kv3I9+hb+jO27RoE6XQQvTrW
         K5kbQB+mjp+VJU4gKbKgIqHX0m5g5IgEHPTfQCt0UKTH01E03hGs0biyFQax2350gQ8o
         JTSVAHOQWuAKvE0fC8EPjQtk1PxszA5PqkS0NjFr9zQKy7JOVc3JQBFQmrA730NySihs
         F+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484652; x=1795089452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=FG0Uj7+phAyHtVtuSCaGJuABRz4BXzMcPis/4wgMsvV09OHOVZM8Ye0AB2Ux0fswkc
         travD9yszKlUelVkiG35DZ6nmLGfS89vy+RsfH77UMjJOZCtu9IRHSMDkuvZuLfkwdqu
         MwqRcDj8FAH6yFtllLQlgcx5lIX7OQ9I8ajHQbNlB8vyvYWIscLCMTWjEDH+VCwyLYtr
         7+d0ZyDNeE2KlbiI2KXKlrKXuvOhU9dipirzjVY9/QRZHCJknmZ3ygvPcipiu4RYbwub
         HEPxom36mqUL7yx/NeCLRjA3ylDVYbodWzt7VOEpUC6ggDsyj4Er+OwsphyRML6EuiWv
         0wRw==
X-Forwarded-Encrypted: i=1; AL+hErHpKOwhSs6Kh0zG1O2wcLXsn8jkiTXXuBcTtCmAxdXX/+xBwRQUSM0nUAARmj3ZvwVSFnYEBwMVBOnw@vger.kernel.org
X-Gm-Message-State: APuU4Z/uAGjwyEApuGu2so9q5eSoiRElgBExqIf6Jz6qgwiQxdKkebYJ
	XUNj9EhSol74QknPcP2fMUykSIMEEJkpjfc7buUrqiI8WzyMj3+vG+PArhqKyWlr4J/0eymtonR
	Iiqo+MEGThMHRj6a35QebnBU1LtAYnAgNe3TUV6H3aY70D38uDDsuglCDUmwn1RQS
X-Gm-Gg: AYBFou3by4mtCeE77ulFlkV3Txwq+fArI4fF/FCanB3KacrLPxGjsbA+yATngKr/+7l
	WoQlmriRkeWQV8yVcPfvOGJNbhgbBktNGswAozEei8P462c6mSyAw240hiCCjz3UtXNxvQJSPG+
	+fxfPMp42H1e5W2Sre96XVjoHogspeD4NzAJFQdzGOaZbXn4G/AcXLCnWj5Kk6tOr01QYCTGS11
	dyw2L0bEirv4IBaT4qdx2KvJg6H36jilNlQuId8xL0OxjAx4fy3ZUhkVtsTyqj+ZuV+lOW819Of
	ZZZ+t2sLKGy1QzTtueRnmBHbSIJ98JNGqQbE0JDqk2310sCFJOgvsxCc4hLZl7TAr7MHXEX8DHD
	WCQ4jKgkjgA2WTKHZSK64p3xZ2s5CpzBuRTgERJNIaWa5OI9gAOnkINESxNl8ZCB7ZoGbmDo=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898136785a.6.1794484651656;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898134285a.6.1794484651068;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm3467729a12.0.2026.11.12.03.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:57:30 -0800 (PST)
Message-ID: <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:57:27 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend on
 system sleep
To: gopi.kanala@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a9ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GwXthRHL4ZZd3--2RZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX38NrpG0FioVI
 2JOntYnSvKacldziWzMsWIQKAYfAOhyYyJ69IZD1Aux5nIrGgI0ujHWLY3sGP8570zO3f6shS+N
 DRcmhs0Jqwqeq+HC4HSFhP0YnsFQGj1NVNGI8c5E/KMmTWsMK+tTYWmA2QAhZjPiQEzl3sVKWCd
 KanOH4zORIBGCyLNfi76iWrE923XNLyON5GWRPSP4dcy8YjnoGXycIM8jUBSYEb+vSR+CFqCj8m
 cRv8B0BY2DgVC7wJ8qDpIA1yi9vyd+dnje1VJYC7iFAqMdo7U499pTAi8IH2efWOh9vfLbkw5PS
 GE00Fr0M6y3rzgbDaR8qGx8/jBvJZ9mFNCF1JxbCKeG8C6PfItwG80+jO8fdGxr2aIgs9DDUBnJ
 QVv66P0cKpt/QHkTWJ+7pEQA7G1frvrNunywYTmVnFnQMKT7Jka11LME5dXuet4A/fn0hBAQg4R
 NwKt7FmfXSqs+m8iD9Q==
X-Proofpoint-ORIG-GUID: naCIjYHJHYo8QUsSzFiFcpuuGtCdVXmd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzj3wCwK3uwsG
 7F54JKDhH+y6RA2/VOOKa7Kegj0nyBnlJtlhpD0K8Lig0OWmHLR+3Nq4zvcD1qOjd3QEFhb6poB
 ztxZmyL9oOCeT5UzjrXQxfnDLGADAxc=
X-Proofpoint-GUID: naCIjYHJHYo8QUsSzFiFcpuuGtCdVXmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

On 11/12/26 11:51 AM, Gopi Chandra Sekhar Reddy Kanala via B4 Relay wrote:
> From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> 
> The LPASS LPI pin controller votes for the LPASS HW_MACRO and HW_DCODEC
> clocks through pm_clk and only implements runtime PM callbacks. Its
> consumers, such as the SoundWire controllers, keep it runtime active
> through their device links. If a consumer is active when system suspend
> starts, or is resumed during it, the runtime PM usage count the PM core
> holds from the prepare phase keeps the pin controller from runtime
> suspending, and both clock votes are held for the whole suspend. On
> Glymur CRD this keeps CX and DDR from collapsing in s2idle.
> 
> Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
> system sleep callbacks so the clocks are always released at system
> suspend. Consumers are suspended before their suppliers, so the pin
> controller goes down after them and comes back before them.
> 
> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> ---
> Tested on Glymur CRD with next-20261110. When s2idle is entered right
> after playback, the LPI clock votes are now released during suspend,
> after the SoundWire controllers, and restored before them on resume.
> Playback works after resume.
> ---

Should this extend to all other pinctrl-xxx-lpass-lpi drivers?

Konrad

>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> index bc7889c993d0..e33d4360c094 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> @@ -220,6 +220,7 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
>  static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>  	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>  };
>  
> 
> ---
> base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
> change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe
> 
> Best regards,
